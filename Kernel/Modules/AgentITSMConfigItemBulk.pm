# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
package Kernel::Modules::AgentITSMConfigItemBulk;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get needed objects
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check if bulk feature is enabled
    if ( !$ConfigObject->Get('ITSMConfigItem::Frontend::BulkFeature') ) {
        return $LayoutObject->ErrorScreen(
            Message => 'Bulk feature is not enabled!',
        );
    }

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get involved config items, filtering empty ConfigItemIDs
    my @ConfigItemIDs = grep {$_}
        $ParamObject->GetArray( Param => 'ConfigItemID' );

    # check needed stuff
    if ( !@ConfigItemIDs ) {
        return $LayoutObject->ErrorScreen(
            Message => 'No ConfigItemID is given!',
            Comment => 'You need at least one selected Configuration Item!',
        );
    }
    my $Output .= $LayoutObject->Header(
        Type => 'Small',
    );

    # declare the variables for all the parameters
    my %Error;

    my %GetParam;

    # get config item object
    my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

    # get all parameters and check for errors
    if ( $Self->{Subaction} eq 'Do' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        # get all parameters
        for my $Key (
            qw( LinkTogether LinkTogetherAnother LinkType LinkTogetherLinkType DeplStateID
            InciStateID )
            )
        {
            $GetParam{$Key} = $ParamObject->GetParam( Param => $Key ) || '';
        }

        if ( $GetParam{'LinkTogetherAnother'} ) {
            $Kernel::OM->Get('Kernel::System::CheckItem')->StringClean(
                StringRef => \$GetParam{'LinkTogetherAnother'},
                TrimLeft  => 1,
                TrimRight => 1,
            );
            my $ConfigItemID = $ConfigItemObject->ConfigItemLookup(
                ConfigItemNumber => $GetParam{'LinkTogetherAnother'},
            );
            if ( !$ConfigItemID ) {
                $Error{'LinkTogetherAnotherInvalid'} = 'ServerError';
            }
        }
    }

    # process config item
    my @ConfigItemIDSelected;
    my $ActionFlag = 0;
    my $Counter    = 1;

    # get link object
    my $LinkObject = $Kernel::OM->Get('Kernel::System::LinkObject');

    CONFIGITEM_ID:
    for my $ConfigItemID (@ConfigItemIDs) {
        my $ConfigItem = $ConfigItemObject->ConfigItemGet(
            ConfigItemID => $ConfigItemID,
        );

        my $Config = $ConfigObject->Get("ITSMConfigItem::Frontend::AgentITSMConfigItemEdit");

        # check permissions
        my $Access = $ConfigItemObject->Permission(
            Scope  => 'Item',
            ItemID => $ConfigItemID,
            UserID => $Self->{UserID},
            Type   => $Config->{Permission},
        );

        if ( !$Access ) {

            # error screen, don't show config item
            $Output .= $LayoutObject->Notify(
                Data => $ConfigItem->{Number}
                    . ': $Text{"You don\'t have write access to this configuration item."}',
            );
            next CONFIGITEM_ID;
        }

        # remember selected config item ids
        push @ConfigItemIDSelected, $ConfigItemID;

        # do some actions on CIs
        if ( ( $Self->{Subaction} eq 'Do' ) && ( !%Error ) ) {

            # challenge token check for write action
            $LayoutObject->ChallengeTokenCheck();

            # bulk action version ddd
            if ( $GetParam{DeplStateID} || $GetParam{InciStateID} ) {

                # get current version of the config item
                my $CurrentVersion = $ConfigItemObject->VersionGet(
                    ConfigItemID => $ConfigItemID,
                    XMLDataGet   => 1,
                );

                my $NewDeplStateID = $CurrentVersion->{DeplStateID};
                my $NewInciStateID = $CurrentVersion->{InciStateID};

                if ( IsNumber( $GetParam{DeplStateID} ) ) {
                    $NewDeplStateID = $GetParam{DeplStateID};
                }
                if ( IsNumber( $GetParam{InciStateID} ) ) {
                    $NewInciStateID = $GetParam{InciStateID};
                }

                my $VersionID = $ConfigItemObject->VersionAdd(
                    ConfigItemID => $ConfigItemID,
                    Name         => $CurrentVersion->{Name},
                    DefinitionID => $CurrentVersion->{DefinitionID},
                    DeplStateID  => $NewDeplStateID,
                    InciStateID  => $NewInciStateID,
                    XMLData      => $CurrentVersion->{XMLData},
                    UserID       => $Self->{UserID},
                );
            }

            # bulk action links
            # link all config items to another config item
            if ( $GetParam{'LinkTogetherAnother'} ) {
                my $MainConfigItemID = $ConfigItemObject->ConfigItemLookup(
                    ConfigItemNumber => $GetParam{'LinkTogetherAnother'},
                );

                # split the type identifier
                my @Type = split q{::}, $GetParam{LinkType};

                if ( $Type[0] && $Type[1] && ( $Type[1] eq 'Source' || $Type[1] eq 'Target' ) ) {

                    my $SourceKey = $ConfigItemID;
                    my $TargetKey = $MainConfigItemID;

                    if ( $Type[1] eq 'Target' ) {
                        $SourceKey = $MainConfigItemID;
                        $TargetKey = $ConfigItemID
                    }

                    for my $ConfigItemIDPartner (@ConfigItemIDs) {
                        if ( $MainConfigItemID ne $ConfigItemIDPartner ) {
                            $LinkObject->LinkAdd(
                                SourceObject => 'ITSMConfigItem',
                                SourceKey    => $SourceKey,
                                TargetObject => 'ITSMConfigItem',
                                TargetKey    => $TargetKey,
                                Type         => $Type[0],
                                State        => 'Valid',
                                UserID       => $Self->{UserID},
                            );
                        }
                    }
                }
            }

            # link together
            if ( $GetParam{'LinkTogether'} ) {

                # split the type identifier
                my @Type = split q{::}, $GetParam{LinkTogetherLinkType};

                if ( $Type[0] && $Type[1] && ( $Type[1] eq 'Source' || $Type[1] eq 'Target' ) ) {
                    for my $ConfigItemIDPartner (@ConfigItemIDs) {

                        my $SourceKey = $ConfigItemID;
                        my $TargetKey = $ConfigItemIDPartner;

                        if ( $Type[1] eq 'Target' ) {
                            $SourceKey = $ConfigItemIDPartner;
                            $TargetKey = $ConfigItemID
                        }

                        if ( $ConfigItemID ne $ConfigItemIDPartner ) {
                            $LinkObject->LinkAdd(
                                SourceObject => 'ITSMConfigItem',
                                SourceKey    => $SourceKey,
                                TargetObject => 'ITSMConfigItem',
                                TargetKey    => $TargetKey,
                                Type         => $Type[0],
                                State        => 'Valid',
                                UserID       => $Self->{UserID},
                            );
                        }
                    }
                }
            }
            $ActionFlag = 1;
        }
        $Counter++;
    }

    # redirect
    if ($ActionFlag) {
        return $LayoutObject->PopupClose(
            URL => ( $Self->{LastScreenOverview} || 'Action=AgentDashboard' ),
        );
    }

    $Output .= $Self->_Mask(
        %Param,
        %GetParam,
        ConfigItemIDs => \@ConfigItemIDSelected,
        Errors        => \%Error,
    );
    $Output .= $LayoutObject->Footer(
        Type => 'Small',
    );
    return $Output;
}

sub _Mask {
    my ( $Self, %Param ) = @_;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # prepare errors!
    if ( $Param{Errors} ) {
        for my $KeyError ( sort keys %{ $Param{Errors} } ) {
            $Param{$KeyError} = $LayoutObject->Ascii2Html( Text => $Param{Errors}->{$KeyError} );
        }
    }

    $LayoutObject->Block(
        Name => 'BulkAction',
        Data => \%Param,
    );

    # remember config item ids
    if ( $Param{ConfigItemIDs} ) {
        for my $ConfigItemID ( @{ $Param{ConfigItemIDs} } ) {
            $LayoutObject->Block(
                Name => 'UsedConfigItemID',
                Data => {
                    ConfigItemID => $ConfigItemID,
                },
            );
        }
    }

    # get needed objects
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
    my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');

    $Self->{Config} = $ConfigObject->Get("ITSMConfigItem::Frontend::$Self->{Action}");

    # deployment state
    if ( $Self->{Config}->{DeplState} ) {
        my $DeplStateList = $GeneralCatalogObject->ItemList(
            Class => 'ITSM::ConfigItem::DeploymentState',
        );

        # generate DeplStateStrg
        $Param{DeplStateStrg} = $LayoutObject->BuildSelection(
            Data         => $DeplStateList,
            Name         => 'DeplStateID',
            PossibleNone => 1,
            SelectedID   => $Param{DeplStateID},
            Sort         => 'AlphanumericValue',
        );
        $LayoutObject->Block(
            Name => 'DeplState',
            Data => {%Param},
        );
    }

    # incident state
    if ( $Self->{Config}->{InciState} ) {

        # get incident state list
        my $InciStateList = $GeneralCatalogObject->ItemList(
            Class       => 'ITSM::Core::IncidentState',
            Preferences => {
                Functionality => [ 'operational', 'incident' ],
            },
        );

        # generate InciStateStrg
        $Param{InciStateStrg} = $LayoutObject->BuildSelection(
            Data         => $InciStateList,
            Name         => 'InciStateID',
            PossibleNone => 1,
            SelectedID   => $Param{InciStateID},
            Sort         => 'AlphanumericValue',
        );
        $LayoutObject->Block(
            Name => 'InciState',
            Data => {%Param},
        );
    }

    # get link object
    my $LinkObject = $Kernel::OM->Get('Kernel::System::LinkObject');

    # link types list
    # get possible types list
    my %PossibleTypesList = $LinkObject->PossibleTypesList(
        Object1 => 'ITSMConfigItem',
        Object2 => 'ITSMConfigItem',
        UserID  => $Self->{UserID},
    );

    # define blank line entry
    my %BlankLine = (
        Key      => '-',
        Value    => '-------------------------',
        Disabled => 1,
    );

    # create the selectable type list
    my $Counter = 0;
    my @SelectableTypesList;
    my @LinkTogetherTypeList;
    POSSIBLETYPE:
    for my $PossibleType ( sort { lc $a cmp lc $b } keys %PossibleTypesList ) {

        # lookup type id
        my $TypeID = $LinkObject->TypeLookup(
            Name   => $PossibleType,
            UserID => $Self->{UserID},
        );

        # get type
        my %Type = $LinkObject->TypeGet(
            TypeID => $TypeID,
            UserID => $Self->{UserID},
        );

        # type list for link together can contain only
        # link types which are not directed (not pointed)
        if ( !$Type{Pointed} ) {

            # create the source name
            my %SourceName;
            $SourceName{Key}   = $PossibleType . '::Source';
            $SourceName{Value} = $Type{SourceName};

            push @LinkTogetherTypeList, \%SourceName;
        }

        # create the source name
        my %SourceName;
        $SourceName{Key}   = $PossibleType . '::Source';
        $SourceName{Value} = $Type{SourceName};

        push @SelectableTypesList, \%SourceName;

        next POSSIBLETYPE if !$Type{Pointed};

        # create the target name
        my %TargetName;
        $TargetName{Key}   = $PossibleType . '::Target';
        $TargetName{Value} = $Type{TargetName};

        push @SelectableTypesList, \%TargetName;
    }
    continue {

        # add blank line
        push @SelectableTypesList, \%BlankLine;

        $Counter++;
    }

    # removed last (empty) entry
    pop @SelectableTypesList;

    # add blank lines on top and bottom of the list if more then two linktypes
    if ( $Counter > 2 ) {
        unshift @SelectableTypesList, \%BlankLine;
        push @SelectableTypesList, \%BlankLine;
    }

    # generate LinkTypeStrg
    $Param{LinkTypeStrg} = $LayoutObject->BuildSelection(
        Data         => \@SelectableTypesList,
        Name         => 'LinkType',
        PossibleNone => 0,
        SelectedID   => $Param{TypeIdentifier} || 'AlternativeTo::Source',
        Sort         => 'AlphanumericValue',
    );
    $Param{LinkTogetherLinkTypeStrg} = $LayoutObject->BuildSelection(
        Data         => \@LinkTogetherTypeList,
        Name         => 'LinkTogetherLinkType',
        PossibleNone => 0,
        SelectedID   => $Param{TypeIdentifier} || 'AlternativeTo::Source',
        Sort         => 'AlphanumericValue',
    );

    $Param{LinkTogetherYesNoOption} = $LayoutObject->BuildSelection(
        Data       => $ConfigObject->Get('YesNoOptions'),
        Name       => 'LinkTogether',
        SelectedID => $Param{LinkTogether} || 0,
    );

    # get output back
    return $LayoutObject->Output(
        TemplateFile => 'AgentITSMConfigItemBulk',
        Data         => \%Param
    );
}

1;
