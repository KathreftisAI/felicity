# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMConfigItem::OverviewSmall;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::HTMLUtils',
    'Kernel::System::ITSMConfigItem',
    'Kernel::System::Log',
    'Kernel::System::Main',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get log object
    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    # check needed stuff
    for my $Needed (qw(PageShown StartHit)) {
        if ( !$Param{$Needed} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # need ConfigItemIDs
    if ( !$Param{ConfigItemIDs} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need the ConfigItemIDs!',
        );
        return;
    }

    # define incident signals, needed for services
    my %InciSignals = (
        operational => 'greenled',
        warning     => 'yellowled',
        incident    => 'redled',
    );

    # to store the color for the deployment states
    my %DeplSignals;

    # get general catalog object
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

    # get list of deployment states
    my $DeploymentStatesList = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    # set deployment style colors
    my $StyleClasses = '';

    ITEMID:
    for my $ItemID ( sort keys %{$DeploymentStatesList} ) {

        # get deployment state preferences
        my %Preferences = $GeneralCatalogObject->GeneralCatalogPreferencesGet(
            ItemID => $ItemID,
        );

        # check if a color is defined in preferences
        next ITEMID if !$Preferences{Color};

        # get deployment state
        my $DeplState = $DeploymentStatesList->{$ItemID};

        # remove any non ascii word characters
        $DeplState =~ s{ [^a-zA-Z0-9] }{_}msxg;

        # store the original deployment state as key
        # and the ss safe coverted deployment state as value
        $DeplSignals{ $DeploymentStatesList->{$ItemID} } = $DeplState;

        # covert to lower case
        my $DeplStateColor = lc $Preferences{Color};

        # add to style classes string
        $StyleClasses .= "
            .Flag span.$DeplState {
                background-color: #$DeplStateColor;
            }
        ";
    }

    # wrap into style tags
    if ($StyleClasses) {
        $StyleClasses = "<style>$StyleClasses</style>";
    }

    # store either ConfigItem IDs Locally
    my @ConfigItemIDs = @{ $Param{ConfigItemIDs} };

    # get needed objects
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check if bulk feature is enabled
    my $BulkFeature = 0;
    if ( $ConfigObject->Get('ITSMConfigItem::Frontend::BulkFeature') ) {
        my @Groups;
        if ( $ConfigObject->Get('ITSMConfigItem::Frontend::BulkFeatureGroup') ) {
            @Groups = @{ $ConfigObject->Get('ITSMConfigItem::Frontend::BulkFeatureGroup') };
        }
        if ( !@Groups ) {
            $BulkFeature = 1;
        }
        else {
            GROUP:
            for my $Group (@Groups) {
                next GROUP if !$LayoutObject->{"UserIsGroup[$Group]"};
                if ( $LayoutObject->{"UserIsGroup[$Group]"} eq 'Yes' ) {
                    $BulkFeature = 1;
                    last GROUP;
                }
            }
        }
    }

    # get config item pre menu modules
    my @ActionItems;
    if ( ref $ConfigObject->Get('ITSMConfigItem::Frontend::PreMenuModule') eq 'HASH' ) {
        my %Menus = %{ $ConfigObject->Get('ITSMConfigItem::Frontend::PreMenuModule') };

        MENU:
        for my $MenuKey ( sort keys %Menus ) {

            # load module
            if ( $Kernel::OM->Get('Kernel::System::Main')->Require( $Menus{$MenuKey}->{Module} ) ) {
                my $Object = $Menus{$MenuKey}->{Module}->new(
                    %{$Self},
                );

                # check if the menu is available
                next MENU if ref $Menus{$MenuKey} ne 'HASH';

                # set classes
                if ( $Menus{$MenuKey}->{Target} ) {

                    if ( $Menus{$MenuKey}->{Target} eq 'PopUp' ) {
                        $Menus{$MenuKey}->{MenuClass} = 'AsPopup';
                        $Menus{$MenuKey}->{PopupType} = 'ITSMConfigItemAction';
                    }
                    else {
                        $Menus{$MenuKey}->{MenuClass} = '';
                        $Menus{$MenuKey}->{PopupType} = '';
                    }
                }

                # grant access by default
                my $Access = 1;

                my $Action = $Menus{$MenuKey}->{Action};

                # can not execute the module due to a ConfigItem is required, then just check the
                # permissions as in the MenuModuleGeneric
                my $GroupsRo = $ConfigObject->Get('Frontend::Module')->{$Action}->{GroupRo} || [];
                my $GroupsRw = $ConfigObject->Get('Frontend::Module')->{$Action}->{Group}   || [];

                # check permission
                if ( $Action && ( @{$GroupsRo} || @{$GroupsRw} ) ) {

                    # deny access by default, when there are groups to check
                    $Access = 0;

                    # check read only groups
                    ROGROUP:
                    for my $RoGroup ( @{$GroupsRo} ) {

                        next ROGROUP if !$LayoutObject->{"UserIsGroupRo[$RoGroup]"};
                        next ROGROUP if $LayoutObject->{"UserIsGroupRo[$RoGroup]"} ne 'Yes';

                        # set access
                        $Access = 1;
                        last ROGROUP;
                    }

                    # check read write groups
                    RWGROUP:
                    for my $RwGroup ( @{$GroupsRw} ) {

                        next RWGROUP if !$LayoutObject->{"UserIsGroup[$RwGroup]"};
                        next RWGROUP if $LayoutObject->{"UserIsGroup[$RwGroup]"} ne 'Yes';

                        # set access
                        $Access = 1;
                        last RWGROUP;
                    }
                }

                # return if there is no access to the module
                next MENU if !$Access;

                # translate Name and Description
                my $Description = $LayoutObject->{LanguageObject}->Translate( $Menus{$MenuKey}->{Description} );
                my $Name        = $LayoutObject->{LanguageObject}->Translate( $Menus{$MenuKey}->{Description} );

                # generarte a web safe link
                my $Link = $LayoutObject->{Baselink} . $Menus{$MenuKey}->{Link};

                # sanity check
                if ( !defined $Menus{$MenuKey}->{MenuClass} ) {
                    $Menus{$MenuKey}->{MenuClass} = '';
                }

                # generate HTML for the menu item
                my $MenuHTML = << "END";
<li>
    <a href="$Link" class="$Menus{$MenuKey}->{MenuClass}" title="$Description">$Name</a>
</li>
END

                $MenuHTML =~ s/\n+//g;
                $MenuHTML =~ s/\s+/ /g;
                $MenuHTML =~ s/<\!--.+?-->//g;

                $Menus{$MenuKey}->{ID} = $Menus{$MenuKey}->{Name};
                $Menus{$MenuKey}->{ID} =~ s/(\s|&|;)//ig;

                push @ActionItems, {
                    HTML        => $MenuHTML,
                    ID          => $Menus{$MenuKey}->{ID},
                    Link        => $Link,
                    Target      => $Menus{$MenuKey}->{Target},
                    PopupType   => $Menus{$MenuKey}->{PopupType},
                    Description => $Description,
                };
            }
        }
    }

    # check ShowColumns parameter
    my @ShowColumns;
    my @XMLShowColumns;
    if ( $Param{ShowColumns} && ref $Param{ShowColumns} eq 'ARRAY' ) {
        @ShowColumns = @{ $Param{ShowColumns} };
    }

    # get config item object
    my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

    # build column header blocks
    if (@ShowColumns) {

        # show the bulk action button checkboxes if feature is enabled
        if ($BulkFeature) {
            push @ShowColumns, 'BulkAction';
        }

        for my $Column (@ShowColumns) {

            # create needed veriables
            my $CSS = 'OverviewHeader';
            my $OrderBy;

            # remove ID if necesary
            if ( $Param{SortBy} ) {
                $Param{SortBy} = ( $Param{SortBy} eq 'InciStateID' )
                    ? 'CurInciState'
                    : ( $Param{SortBy} eq 'DeplStateID' ) ? 'CurDeplState'
                    : ( $Param{SortBy} eq 'ClassID' )     ? 'Class'
                    : ( $Param{SortBy} eq 'ChangeTime' )  ? 'LastChanged'
                    :                                       $Param{SortBy};
            }

            # set the correct Set CSS class and order by link
            if ( $Param{SortBy} && ( $Param{SortBy} eq $Column ) ) {
                if ( $Param{OrderBy} && ( $Param{OrderBy} eq 'Up' ) ) {
                    $OrderBy = 'Down';
                    $CSS .= ' SortDescendingLarge';
                }
                else {
                    $OrderBy = 'Up';
                    $CSS .= ' SortAscendingLarge';
                }
            }
            else {
                $OrderBy = 'Up';
            }

            $LayoutObject->Block(
                Name => 'Record' . $Column . 'Header',
                Data => {
                    %Param,
                    CSS     => $CSS,
                    OrderBy => $OrderBy,
                },
            );
        }

        # get the XML column headers only if the filter is not set to 'all'
        # and if there are CIs to show
        if ( $Param{Filter} && $Param{Filter} ne 'All' && @ConfigItemIDs ) {

            # get the version data of the first config item, including all the XML data
            # to get the column header names
            my $ConfigItem = $ConfigItemObject->VersionGet(
                ConfigItemID => $ConfigItemIDs[0],
                XMLDataGet   => 1,
            );

            # convert the XML data into a hash
            my $ExtendedVersionData = $Self->_XMLData2Hash(
                XMLDefinition => $ConfigItem->{XMLDefinition},
                XMLData       => $ConfigItem->{XMLData}->[1]->{Version}->[1],
            );

            # get the xml columns (they contain ::)
            @XMLShowColumns = grep /::/, @ShowColumns;

            COLUMN:
            for my $Column (@XMLShowColumns) {

                # check if column exists in CI-Data
                next COLUMN if !$ExtendedVersionData->{$Column}->{Name};

                # show the xml attribute header
                $LayoutObject->Block(
                    Name => 'RecordXMLAttributeHeader',
                    Data => {
                        %Param,
                        XMLAttributeHeader => $ExtendedVersionData->{$Column}->{Name},
                    },
                );
            }
        }
    }

    my $Output  = '';
    my $Counter = 0;

    # show config items if there are some
    if (@ConfigItemIDs) {

        # to store all data
        my %Data;

        CONFIGITEMID:
        for my $ConfigItemID (@ConfigItemIDs) {
            $Counter++;
            if (
                $Counter >= $Param{StartHit}
                && $Counter < ( $Param{PageShown} + $Param{StartHit} )
                )
            {

                # check for access rights
                my $HasAccess = $ConfigItemObject->Permission(
                    Scope  => 'Item',
                    ItemID => $ConfigItemID,
                    UserID => $Self->{UserID},
                    Type   => $Self->{Config}->{Permission},
                );

                next CONFIGITEMID if !$HasAccess;

                # get config item data
                my $ConfigItem = $ConfigItemObject->VersionGet(
                    ConfigItemID => $ConfigItemID,
                    XMLDataGet   => 1,
                );

                next CONFIGITEMID if !$ConfigItem;

                # convert the XML data into a hash
                my $ExtendedVersionData = $Self->_XMLData2Hash(
                    XMLDefinition => $ConfigItem->{XMLDefinition},
                    XMLData       => $ConfigItem->{XMLData}->[1]->{Version}->[1],
                );

                # store config item data,
                %Data = %{$ConfigItem};

                # build record block
                $LayoutObject->Block(
                    Name => 'Record',
                    Data => {
                        %Param,
                        %Data,
                    },
                );

                # build column record blocks
                if (@ShowColumns) {

                    COLUMN:
                    for my $Column (@ShowColumns) {
                        $LayoutObject->Block(
                            Name => 'Record' . $Column,
                            Data => {
                                %Param,
                                %Data,
                                CurInciSignal => $InciSignals{ $Data{CurInciStateType} },
                                CurDeplSignal => $DeplSignals{ $Data{CurDeplState} },
                            },
                        );

                        # show links if available
                        $LayoutObject->Block(
                            Name => 'Record' . $Column . 'LinkStart',
                            Data => {
                                %Param,
                                %Data,
                            },
                        );
                        $LayoutObject->Block(
                            Name => 'Record' . $Column . 'LinkEnd',
                            Data => {
                                %Param,
                                %Data,
                            },
                        );
                    }

                    COLUMN:
                    for my $Column (@XMLShowColumns) {

                        # check if column exists in CI-Data
                        next COLUMN if !$ExtendedVersionData->{$Column}->{Name};

                        # convert to ascii text in case the value contains html
                        my $Value = $Kernel::OM->Get('Kernel::System::HTMLUtils')
                            ->ToAscii( String => $ExtendedVersionData->{$Column}->{Value} )
                            || '';

                        # convert all whitespace and newlines to single spaces
                        $Value =~ s{ \s+ }{ }gxms;

                        # show the xml attribute data
                        $LayoutObject->Block(
                            Name => 'RecordXMLAttribute',
                            Data => {
                                %Param,
                                XMLAttributeData => $Value,
                            },
                        );
                    }
                }

                # make a deep copy of the action items to avoid changing the definition
                my $ClonedActionItems = Storable::dclone( \@ActionItems );

                # substitute TT variables
                for my $ActionItem ( @{$ClonedActionItems} ) {
                    $ActionItem->{HTML} =~ s{ \Q[% Data.ConfigItemID | html %]\E }{$ConfigItemID}xmsg;
                    $ActionItem->{HTML} =~ s{ \Q[% Data.VersionID | html %]\E }{$ConfigItem->{VersionID}}xmsg;
                    $ActionItem->{Link} =~ s{ \Q[% Data.ConfigItemID | html %]\E }{$ConfigItemID}xmsg;
                    $ActionItem->{Link} =~ s{ \Q[% Data.VersionID | html %]\E }{$ConfigItem->{VersionID}}xmsg;
                }

                my $JSON = $LayoutObject->JSONEncode(
                    Data => $ClonedActionItems,
                );

                $LayoutObject->Block(
                    Name => 'DocumentReadyActionRowAdd',
                    Data => {
                        ConfigItemID => $ConfigItemID,
                        Data         => $JSON,
                    },
                );
            }
        }
    }

    # if there are no config items to show, a no data found message is displayed in the table
    else {
        $LayoutObject->Block(
            Name => 'NoDataFoundMsg',
            Data => {
                TotalColumns => scalar @ShowColumns,
            },
        );
    }

    # use template
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMConfigItemOverviewSmall',
        Data         => {
            %Param,
            Type         => $Self->{ViewType},
            ColumnCount  => scalar @ShowColumns,
            StyleClasses => $StyleClasses,
        },
    );

    return $Output;
}

=over

=item _XMLData2Hash()

returns a hash reference with all xml data of a config item

Return

    $Data = {
        'HardDisk::2' => {
            Value => 'HD2',
            Name  => 'Hard Disk',
         },
        'CPU::1' => {
            Value => '',
            Name  => 'CPU',
        },
        'HardDisk::2::Capacity::1' => {
            Value => '780 GB',
            Name  => 'Capacity',
        },
    };

    my $Data = _XMLData2Hash(
        XMLDefinition => $Version->{XMLDefinition},
        XMLData       => $Version->{XMLData}->[1]->{Version}->[1],
        Data          => \%DataHashRef,                                 # optional
        Prefix        => 'HardDisk::1',                                 # optional
    );

=cut

sub _XMLData2Hash {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLData};
    return if !$Param{XMLDefinition};
    return if ref $Param{XMLData} ne 'HASH';
    return if ref $Param{XMLDefinition} ne 'ARRAY';

    # to store the return data
    my $Data = $Param{Data} || {};

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {
        COUNTER:
        for my $Counter ( 1 .. $Item->{CountMax} ) {

            # lookup value
            my $Value = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->XMLValueLookup(
                Item  => $Item,
                Value => $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content} || '',
            );

            # only if value is not empty
            if ($Value) {

                # create output string
                $Value = $Kernel::OM->Get('Kernel::Output::HTML::Layout')->ITSMConfigItemOutputStringCreate(
                    Value => $Value,
                    Item  => $Item,
                );
            }

            # add prefix
            my $Prefix = $Item->{Key} . '::' . $Counter;
            if ( $Param{Prefix} ) {
                $Prefix = $Param{Prefix} . '::' . $Prefix;
            }

            # store the item in hash
            $Data->{$Prefix} = {
                Name  => $Item->{Name},
                Value => $Value,
            };

            # start recursion, if "Sub" was found
            if ( $Item->{Sub} ) {
                $Data = $Self->_XMLData2Hash(
                    XMLDefinition => $Item->{Sub},
                    XMLData       => $Param{XMLData}->{ $Item->{Key} }->[$Counter],
                    Prefix        => $Prefix,
                    Data          => $Data,
                );
            }
        }
    }

    return $Data;
}

1;

=back
