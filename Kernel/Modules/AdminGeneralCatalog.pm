# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminGeneralCatalog;

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

    # get needed object
    my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');
    my $ParamObject          = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject         = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ValidObject          = $Kernel::OM->Get('Kernel::System::Valid');
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

    # ------------------------------------------------------------ #
    # catalog item list
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'ItemList' ) {
        my $Class = $ParamObject->GetParam( Param => "Class" ) || '';

        # check needed class
        if ( !$Class ) {
            return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
        }

        # output overview
        $LayoutObject->Block(
            Name => 'Overview',
            Data => {
                %Param,
            },
        );
        $LayoutObject->Block(
            Name => 'OverviewItem',
            Data => {
                %Param,
                Class => $Class,
            },
        );

        # get availability list
        my %ValidList = $ValidObject->ValidList();

        # get catalog item list
        my $ItemIDList = $GeneralCatalogObject->ItemList(
            Class => $Class,
            Valid => 0,
        );

        # check item list
        if ( !$ItemIDList || !%{$ItemIDList} ) {
            return $LayoutObject->ErrorScreen();
        }

        for my $ItemID ( sort { $ItemIDList->{$a} cmp $ItemIDList->{$b} } keys %{$ItemIDList} ) {

            # get item data
            my $ItemData = $GeneralCatalogObject->ItemGet(
                ItemID => $ItemID,
            );

            # output overview item list
            $LayoutObject->Block(
                Name => 'OverviewItemList',
                Data => {
                    %{$ItemData},
                    Valid => $ValidList{ $ItemData->{ValidID} },
                },
            );
        }

        # ActionOverview
        $LayoutObject->Block(
            Name => 'ActionAddItem',
            Data => {
                %Param,
                Class => $Class,
            },
        );

        # ActionOverview
        $LayoutObject->Block(
            Name => 'ActionOverview',
        );

        # output header and navbar
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # create output string
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminGeneralCatalog',
            Data         => \%Param,
        );

        # add footer
        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # catalog item edit
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'ItemEdit' ) {
        my %ItemData;

        # get params
        $ItemData{ItemID} = $ParamObject->GetParam( Param => "ItemID" );

        # add a new catalog item
        if ( $ItemData{ItemID} eq 'NEW' ) {

            # get class
            $ItemData{Class} = $ParamObject->GetParam( Param => "Class" );

            # redirect to overview
            if ( !$ItemData{Class} ) {
                return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
            }
        }

        # edit an existing catalog item
        else {

            # get item data
            my $ItemDataRef = $GeneralCatalogObject->ItemGet(
                ItemID => $ItemData{ItemID},
            );

            # check item data
            if ( !$ItemDataRef ) {
                return $LayoutObject->ErrorScreen();
            }

            %ItemData = %{$ItemDataRef};
        }

        # output overview
        $LayoutObject->Block(
            Name => 'Overview',
            Data => {
                %Param,
                Class => $ItemData{Class},
            },
        );

        # generate ValidOptionStrg
        my %ValidList        = $ValidObject->ValidList();
        my %ValidListReverse = reverse %ValidList;
        my $ValidOptionStrg  = $LayoutObject->BuildSelection(
            Name       => 'ValidID',
            Data       => \%ValidList,
            SelectedID => $ItemData{ValidID} || $ValidListReverse{valid},
            Class      => 'Modernize',
        );

        # output ItemEdit
        $LayoutObject->Block(
            Name => 'ItemEdit',
            Data => {
                %ItemData,
                ValidOptionStrg => $ValidOptionStrg,
            },
        );

        # show each preferences setting
        my %Preferences = ();
        if ( $ConfigObject->Get('GeneralCatalogPreferences') ) {
            %Preferences = %{ $ConfigObject->Get('GeneralCatalogPreferences') };
        }

        ITEM:
        for my $Item ( sort keys %Preferences ) {

            # skip items that don't belong to the class
            if ( $Preferences{$Item}->{Class} && $Preferences{$Item}->{Class} ne $ItemData{Class} )
            {
                next ITEM;
            }

            # find output module
            my $Module = $Preferences{$Item}->{Module}
                || 'Kernel::Output::HTML::GeneralCatalogPreferences::Generic';

            # load module
            if ( !$Kernel::OM->Get('Kernel::System::Main')->Require($Module) ) {
                return $LayoutObject->FatalError();
            }

            # create object for this preferences item
            my $Object = $Module->new(
                %{$Self},
                ConfigItem => $Preferences{$Item},
                Debug      => $Self->{Debug},
            );

            # show all parameters
            my @Params = $Object->Param( GeneralCatalogData => { %ItemData, %Param } );
            for my $ParamItem (@Params) {

                if (
                    ref( $ParamItem->{Data} ) eq 'HASH'
                    || ref( $Preferences{$Item}->{Data} ) eq 'HASH'
                    )
                {
                    $ParamItem->{'Option'} = $LayoutObject->BuildSelection(
                        %{ $Preferences{$Item} },
                        %{$ParamItem},
                        Class => 'Modernize',
                    );
                }

                $LayoutObject->Block(
                    Name => $ParamItem->{Block} || $Preferences{$Item}->{Block} || 'Option',
                    Data => {
                        %{ $Preferences{$Item} },
                        %{$ParamItem},
                    },
                );
            }
        }

        if ( $ItemData{Class} eq 'NEW' ) {

            # output ItemEditClassAdd
            $LayoutObject->Block(
                Name => 'ItemEditClassAdd',
                Data => {
                    Class => $ItemData{Class},
                },
            );
        }
        else {

            # output ItemEditClassExist
            $LayoutObject->Block(
                Name => 'ItemEditClassExist',
                Data => {
                    Class => $ItemData{Class},
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

        # create output string
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminGeneralCatalog',
            Data         => \%Param,
        );

        # add footer
        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # catalog item save
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'ItemSave' ) {
        my %ItemData;

        # get params
        for my $Param (qw(Class ItemID ValidID Comment)) {
            $ItemData{$Param} = $ParamObject->GetParam( Param => $Param ) || '';
        }

        # get name param, name must be not empty, but number zero (0) is allowed
        $ItemData{Name} = $ParamObject->GetParam( Param => 'Name' );

        # check class
        if ( $ItemData{Class} eq 'NEW' ) {
            return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
        }

        # save to database
        my $Success;
        my $ItemID = $ItemData{ItemID};
        if ( $ItemData{ItemID} eq 'NEW' ) {
            $Success = $GeneralCatalogObject->ItemAdd(
                %ItemData,
                UserID => $Self->{UserID},
            );
            $ItemID = $Success;
        }
        else {
            $Success = $GeneralCatalogObject->ItemUpdate(
                %ItemData,
                UserID => $Self->{UserID},
            );
        }

        # update preferences
        my $GCData      = $GeneralCatalogObject->ItemGet( ItemID => $ItemID );
        my %Preferences = ();
        my $Note        = '';

        if ( $ConfigObject->Get('GeneralCatalogPreferences') ) {
            %Preferences = %{ $ConfigObject->Get('GeneralCatalogPreferences') };
        }

        for my $Item ( sort keys %Preferences ) {
            my $Module = $Preferences{$Item}->{Module}
                || 'Kernel::Output::HTML::GeneralCatalogPreferences::Generic';

            # load module
            if ( !$Kernel::OM->Get('Kernel::System::Main')->Require($Module) ) {
                return $LayoutObject->FatalError();
            }

            my $Object = $Module->new(
                %{$Self},
                ConfigItem => $Preferences{$Item},
                Debug      => $Self->{Debug},
            );
            my @Params = $Object->Param( GeneralCatalogData => $GCData );
            if (@Params) {
                my %GetParam = ();
                for my $ParamItem (@Params) {
                    my @Array = $ParamObject->GetArray( Param => $ParamItem->{Name} );
                    $GetParam{ $ParamItem->{Name} } = \@Array;
                }
                if (
                    !$Object->Run(
                        GetParam => \%GetParam,
                        ItemID   => $GCData->{ItemID},
                    )
                    )
                {
                    $Note .= $LayoutObject->Notify( Info => $Object->Error() );
                }
            }
        }

        if ( !$Success ) {
            return $LayoutObject->ErrorScreen();
        }

        # redirect to overview class list
        return $LayoutObject->Redirect(
            OP => "Action=$Self->{Action};Subaction=ItemList;Class=$ItemData{Class}"
        );
    }

    # ------------------------------------------------------------ #
    # overview
    # ------------------------------------------------------------ #
    else {

        # output overview
        $LayoutObject->Block(
            Name => 'Overview',
            Data => {
                %Param,
            },
        );
        $LayoutObject->Block(
            Name => 'OverviewClass',
            Data => {
                %Param,
            },
        );

        # get catalog class list
        my $ClassList = $GeneralCatalogObject->ClassList();

        for my $Class ( @{$ClassList} ) {

            # output overview class list
            $LayoutObject->Block(
                Name => 'OverviewClassList',
                Data => {
                    Class => $Class,
                },
            );
        }

        # ActionAddClass
        $LayoutObject->Block(
            Name => 'ActionAddClass',
        );

        # output header and navbar
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # create output string
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminGeneralCatalog',
            Data         => \%Param,
        );

        # add footer
        $Output .= $LayoutObject->Footer();

        return $Output;
    }
}

1;
