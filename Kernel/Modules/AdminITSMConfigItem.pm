# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminITSMConfigItem;

use strict;
use warnings;

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

    # get needed objecs
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
    my $LayoutObject         = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get class list
    my $ClassList = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );
    return $LayoutObject->ErrorScreen() if !$ClassList;
    return $LayoutObject->ErrorScreen() if ref $ClassList ne 'HASH';
    return $LayoutObject->ErrorScreen() if !%{$ClassList};

    # get needed objects
    my $ParamObject      = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
    my $UserObject       = $Kernel::OM->Get('Kernel::System::User');

    # ------------------------------------------------------------ #
    # definition list
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'DefinitionList' ) {

        # get class id
        my $ClassID = $ParamObject->GetParam( Param => 'ClassID' );

        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" ) if !$ClassID;

        # generate ClassOptionStrg
        my $ClassOptionStrg = $LayoutObject->BuildSelection(
            Data         => $ClassList,
            Name         => 'ClassID',
            PossibleNone => 1,
            Translation  => 0,
            SelectedID   => $ClassID,
            Class        => 'Modernize',
        );

        # output overview
        $LayoutObject->Block(
            Name => 'Overview',
            Data => {
                ClassOptionStrg => $ClassOptionStrg,
            },
        );

        # output overview result
        $LayoutObject->Block(
            Name => 'DefinitionList',
            Data => {
                Name => $ClassList->{$ClassID},
            },
        );

        # get definition list
        my $DefinitionList = $ConfigItemObject->DefinitionList(
            ClassID => $ClassID,
        );

        for my $Definition ( reverse @{$DefinitionList} ) {

            # get user data
            my $FullName = $UserObject->UserName(
                UserID => $Definition->{CreateBy},
            );

            # output definition
            $LayoutObject->Block(
                Name => 'DefinitionListRow',
                Data => {
                    %{$Definition},
                    Class        => $ClassList->{$ClassID},
                    CreateByUser => $FullName,
                },
            );
        }

        # ActionOverview
        $LayoutObject->Block(
            Name => 'ActionOverview',
        );

        # output header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # generate output
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminITSMConfigItem',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # definition view
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'DefinitionView' ) {

        # get definition id
        my $DefinitionID = $ParamObject->GetParam( Param => 'DefinitionID' );

        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" ) if !$DefinitionID;

        # get definition
        my $Definition = $ConfigItemObject->DefinitionGet(
            DefinitionID => $DefinitionID,
        );
        $Definition->{DefinitionString} = $LayoutObject->Ascii2Html(
            Text           => $Definition->{Definition},
            HTMLResultMode => 1,
        );

        # generate ClassOptionStrg
        my $ClassOptionStrg = $LayoutObject->BuildSelection(
            Data         => $ClassList,
            Name         => 'ClassID',
            PossibleNone => 1,
            Translation  => 0,
            SelectedID   => $Definition->{ClassID},
            Class        => 'Modernize',
        );

        # output overview
        $LayoutObject->Block(
            Name => 'Overview',
            Data => {
                ClassOptionStrg => $ClassOptionStrg,
            },
        );

        # get user data
        my $UserName = $UserObject->UserName(
            UserID => $Definition->{CreateBy},
        );

        # output overview result
        $LayoutObject->Block(
            Name => 'DefinitionView',
            Data => {
                %{$Definition},
                CreateByUser => $UserName,
            },
        );

        # ActionOverview
        $LayoutObject->Block(
            Name => 'ActionOverview',
        );

        # output header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # generate output
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminITSMConfigItem',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # definition change
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'DefinitionChange' ) {

        # get class id
        my $ClassID = $ParamObject->GetParam( Param => 'ClassID' );

        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" ) if !$ClassID;

        # get class list
        my $ClassList = $GeneralCatalogObject->ItemList(
            Class => 'ITSM::ConfigItem::Class',
        );

        # get definition
        my $Definition = $ConfigItemObject->DefinitionGet(
            ClassID => $ClassID,
        );

        # generate ClassOptionStrg
        my $ClassOptionStrg = $LayoutObject->BuildSelection(
            Data         => $ClassList,
            Name         => 'ClassID',
            PossibleNone => 1,
            Translation  => 0,
            SelectedID   => $ClassID,
            Class        => 'Modernize',
        );

        # output overview
        $LayoutObject->Block(
            Name => 'Overview',
            Data => {
                ClassOptionStrg => $ClassOptionStrg,
            },
        );

        # output overview result
        $LayoutObject->Block(
            Name => 'DefinitionChange',
            Data => {
                %{$Definition},
                ClassID => $ClassID,
                Class   => $ClassList->{$ClassID},
                Rows =>
                    $Kernel::OM->Get('Kernel::Config')->Get("ITSMConfigItem::Frontend::$Self->{Action}")->{EditorRows}
                    || 30,
            },
        );

        # ActionOverview
        $LayoutObject->Block(
            Name => 'ActionOverview',
        );

        # output header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # generate output
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminITSMConfigItem',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # definition save
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'DefinitionSave' ) {
        my %Definition;

        # get params
        for my $FormParam (qw(ClassID Definition)) {
            $Definition{$FormParam} = $ParamObject->GetParam( Param => $FormParam ) || '';
        }
        for my $FormParam (qw(ClassID Definition)) {
            if ( !$Definition{$FormParam} ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Need $FormParam!"
                );
                return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
            }
        }

        # add to database
        my $DefinitionID = $ConfigItemObject->DefinitionAdd(
            %Definition,
            UserID => $Self->{UserID},
        );

        return $LayoutObject->ErrorScreen() if !$DefinitionID;
        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
    }

    # ------------------------------------------------------------ #
    # config item class overview
    # ------------------------------------------------------------ #
    else {

        # generate ClassOptionStrg
        my $ClassOptionStrg = $LayoutObject->BuildSelection(
            Data         => $ClassList,
            Name         => 'ClassID',
            PossibleNone => 1,
            Translation  => 0,
            Class        => 'Modernize',
        );

        # output overview
        $LayoutObject->Block(
            Name => 'Overview',
            Data => {
                ClassOptionStrg => $ClassOptionStrg,
            },
        );

        # output overview result
        $LayoutObject->Block(
            Name => 'OverviewList',
        );

        for my $ClassID ( sort { $ClassList->{$a} cmp $ClassList->{$b} } keys %{$ClassList} ) {

            $LayoutObject->Block(
                Name => 'OverviewListRow',
                Data => {
                    ClassID => $ClassID,
                    Name    => $ClassList->{$ClassID},
                },
            );
        }

        # output header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # generate output
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminITSMConfigItem',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();

        return $Output;
    }
}

1;
