# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::Layout::ITSMConfigItem;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::Output::HTML::Layout::ITSMConfigItem - all ConfigItem-related HTML functions

=head1 SYNOPSIS

All ITSM Configuration Management-related HTML functions

=head1 PUBLIC INTERFACE

=over 4

=item ITSMConfigItemOutputStringCreate()

returns an output string

    my $String = $LayoutObject->ITSMConfigItemOutputStringCreate(
        Value => 11,       # (optional)
        Item  => $ItemRef,
        Print => 1,        # (optional, default 0)
    );

=cut

sub ITSMConfigItemOutputStringCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    # load backend
    my $BackendObject = $Self->_ITSMLoadLayoutBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return '' if !$BackendObject;

    # generate output string
    my $String = $BackendObject->OutputStringCreate(%Param);

    return $String;
}

=item ITSMConfigItemFormDataGet()

returns the values from the html form as hash reference

    my $FormDataRef = $LayoutObject->ITSMConfigItemFormDataGet(
        Key          => 'Item::1::Node::3',
        Item         => $ItemRef,
        ConfigItemID => 123,
    );

=cut

sub ITSMConfigItemFormDataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item ConfigItemID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # load backend
    my $BackendObject = $Self->_ITSMLoadLayoutBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return {} if !$BackendObject;

    # get form data
    my $FormData = $BackendObject->FormDataGet(%Param);

    return $FormData;
}

=item ITSMConfigItemInputCreate()

returns a input field html string

    my $String = $LayoutObject->ITSMConfigItemInputCreate(
        Key => 'Item::1::Node::3',
        Value => 11,                # (optional)
        Item => $ItemRef,
    );

=cut

sub ITSMConfigItemInputCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # load backend
    my $BackendObject = $Self->_ITSMLoadLayoutBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return '' if !$BackendObject;

    # lookup item value
    my $String = $BackendObject->InputCreate(%Param);

    return $String;
}

=item ITSMConfigItemSearchFormDataGet()

returns the values from the search html form

    my $ArrayRef = $LayoutObject->ITSMConfigItemSearchFormDataGet(
        Key => 'Item::1::Node::3',
        Item => $ItemRef,
    );

=cut

sub ITSMConfigItemSearchFormDataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # load backend
    my $BackendObject = $Self->_ITSMLoadLayoutBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return [] if !$BackendObject;

    # get form data
    my $Values = $BackendObject->SearchFormDataGet(%Param);

    return $Values;
}

=item ITSMConfigItemSearchInputCreate()

returns a search input field html string

    my $String = $LayoutObject->ITSMConfigItemSearchInputCreate(
        Key => 'Item::1::Node::3',
        Item => $ItemRef,
    );

=cut

sub ITSMConfigItemSearchInputCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # load backend
    my $BackendObject = $Self->_ITSMLoadLayoutBackend(
        Type => $Param{Item}->{Input}->{Type},
    );

    return '' if !$BackendObject;

    # lookup item value
    my $String = $BackendObject->SearchInputCreate(%Param);

    return $String;
}

=item _ITSMLoadLayoutBackend()

load a input type backend module

    $BackendObject = $LayoutObject->_ITSMLoadLayoutBackend(
        Type => 'GeneralCatalog',
    );

=cut

sub _ITSMLoadLayoutBackend {
    my ( $Self, %Param ) = @_;

    # get log object
    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    if ( !$Param{Type} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need Type!',
        );
        return;
    }

    my $GenericModule = "Kernel::Output::HTML::ITSMConfigItem::Layout$Param{Type}";

    # load the backend module
    if ( !$Kernel::OM->Get('Kernel::System::Main')->Require($GenericModule) ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Can't load backend module $Param{Type}!"
        );
        return;
    }

    # create new instance
    my $BackendObject = $GenericModule->new(
        %{$Self},
        %Param,
        LayoutObject => $Self,
    );

    if ( !$BackendObject ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Can't create a new instance of backend module $Param{Type}!",
        );
        return;
    }

    return $BackendObject;
}

=item ITSMConfigItemListShow()

Returns a list of configuration items as sortable list with pagination.

This function is similar to L<Kernel::Output::HTML::LayoutTicket::TicketListShow()>
in F<Kernel/Output/HTML/LayoutTicket.pm>.

    my $Output = $LayoutObject->ITSMConfigItemListShow(
        ConfigItemIDs => $ConfigItemIDsRef,                  # total list of config item ids, that can be listed
        Total         => scalar @{ $ConfigItemIDsRef },      # total number of list items, config items in this case
        View          => $Self->{View},                      # optional, the default value is 'Small'
        Filter        => 'All',
        Filters       => \%NavBarFilter,
        FilterLink    => $LinkFilter,
        TitleName     => 'Overview: Config Item: Computer',
        TitleValue    => $Self->{Filter},
        Env           => $Self,
        LinkPage      => $LinkPage,
        LinkSort      => $LinkSort,
        Frontend      => 'Agent',                           # optional (Agent|Customer), default: Agent, indicates from which frontend this function was called
    );

=cut

sub ITSMConfigItemListShow {
    my ( $Self, %Param ) = @_;

    # take object ref to local, remove it from %Param (prevent memory leak)
    my $Env = delete $Param{Env};

    # lookup latest used view mode
    if ( !$Param{View} && $Self->{ 'UserITSMConfigItemOverview' . $Env->{Action} } ) {
        $Param{View} = $Self->{ 'UserITSMConfigItemOverview' . $Env->{Action} };
    }

    # set frontend
    my $Frontend = $Param{Frontend} || 'Agent';

    # set defaut view mode to 'small'
    my $View = $Param{View} || 'Small';

    # store latest view mode
    $Kernel::OM->Get('Kernel::System::AuthSession')->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'UserITSMConfigItemOverview' . $Env->{Action},
        Value     => $View,
    );

    # get needed objects
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get backend from config
    my $Backends = $ConfigObject->Get('ITSMConfigItem::Frontend::Overview');
    if ( !$Backends ) {
        return $LayoutObject->FatalError(
            Message => 'Need config option ITSMConfigItem::Frontend::Overview',
        );
    }

    # check for hash-ref
    if ( ref $Backends ne 'HASH' ) {
        return $LayoutObject->FatalError(
            Message => 'Config option ITSMConfigItem::Frontend::Overview needs to be a HASH ref!',
        );
    }

    # check for config key
    if ( !$Backends->{$View} ) {
        return $LayoutObject->FatalError(
            Message => "No config option found for the view '$View'!",
        );
    }

    # nav bar
    my $StartHit = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam(
        Param => 'StartHit',
    ) || 1;

    # get personal page shown count
    my $PageShownPreferencesKey = 'UserConfigItemOverview' . $View . 'PageShown';
    my $PageShown               = $Self->{$PageShownPreferencesKey} || 10;
    my $Group                   = 'ConfigItemOverview' . $View . 'PageShown';

    # check start option, if higher then elements available, set
    # it to the last overview page (Thanks to Stefan Schmidt!)
    if ( $StartHit > $Param{Total} ) {
        my $Pages = int( ( $Param{Total} / $PageShown ) + 0.99999 );
        $StartHit = ( ( $Pages - 1 ) * $PageShown ) + 1;
    }

    # get data selection
    my %Data;
    my $Config = $ConfigObject->Get('PreferencesGroups');
    if ( $Config && $Config->{$Group} && $Config->{$Group}->{Data} ) {
        %Data = %{ $Config->{$Group}->{Data} };
    }

    # set page limit and build page nav
    my $Limit = $Param{Limit} || 20_000;
    my %PageNav = $LayoutObject->PageNavBar(
        Limit     => $Limit,
        StartHit  => $StartHit,
        PageShown => $PageShown,
        AllHits   => $Param{Total} || 0,
        Action    => 'Action=' . $Env->{Action},
        Link      => $Param{LinkPage},
    );

    # build shown ticket a page
    $Param{RequestedURL}    = "Action=$Self->{Action}";
    $Param{Group}           = $Group;
    $Param{PreferencesKey}  = $PageShownPreferencesKey;
    $Param{PageShownString} = $Self->BuildSelection(
        Name        => $PageShownPreferencesKey,
        SelectedID  => $PageShown,
        Data        => \%Data,
        Translation => 0,
    );

    # build navbar content
    $LayoutObject->Block(
        Name => 'OverviewNavBar',
        Data => \%Param,
    );

    # back link
    if ( $Param{LinkBack} ) {
        $LayoutObject->Block(
            Name => 'OverviewNavBarPageBack',
            Data => \%Param,
        );
    }

    # get filters
    if ( $Param{Filters} ) {

        # get given filters
        my @NavBarFilters;
        for my $Prio ( sort keys %{ $Param{Filters} } ) {
            push @NavBarFilters, $Param{Filters}->{$Prio};
        }

        # build filter content
        $LayoutObject->Block(
            Name => 'OverviewNavBarFilter',
            Data => {
                %Param,
            },
        );

        # loop over filters
        my $Count = 0;
        for my $Filter (@NavBarFilters) {

            # increment filter count and build filter item
            $Count++;
            $LayoutObject->Block(
                Name => 'OverviewNavBarFilterItem',
                Data => {
                    %Param,
                    %{$Filter},
                },
            );

            # filter is selected
            if ( $Filter->{Filter} eq $Param{Filter} ) {
                $LayoutObject->Block(
                    Name => 'OverviewNavBarFilterItemSelected',
                    Data => {
                        %Param,
                        %{$Filter},
                    },
                );

            }
            else {
                $LayoutObject->Block(
                    Name => 'OverviewNavBarFilterItemSelectedNot',
                    Data => {
                        %Param,
                        %{$Filter},
                    },
                );

            }
        }
    }

    # loop over configured backends
    for my $Backend ( sort keys %{$Backends} ) {

        # build navbar view mode
        $LayoutObject->Block(
            Name => 'OverviewNavBarViewMode',
            Data => {
                %Param,
                %{ $Backends->{$Backend} },
                Filter => $Param{Filter},
                View   => $Backend,
            },
        );

        # current view is configured in backend
        if ( $View eq $Backend ) {
            $LayoutObject->Block(
                Name => 'OverviewNavBarViewModeSelected',
                Data => {
                    %Param,
                    %{ $Backends->{$Backend} },
                    Filter => $Param{Filter},
                    View   => $Backend,
                },
            );
        }
        else {
            $LayoutObject->Block(
                Name => 'OverviewNavBarViewModeNotSelected',
                Data => {
                    %Param,
                    %{ $Backends->{$Backend} },
                    Filter => $Param{Filter},
                    View   => $Backend,
                },
            );
        }
    }

    # check if page nav is available
    if (%PageNav) {
        $LayoutObject->Block(
            Name => 'OverviewNavBarPageNavBar',
            Data => \%PageNav,
        );

        # don't show context settings in AJAX case (e. g. in customer ticket history),
        #   because the submit with page reload will not work there
        if ( !$Param{AJAX} ) {
            $LayoutObject->Block(
                Name => 'ContextSettings',
                Data => {
                    %PageNav,
                    %Param,
                },
            );
        }
    }

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

    # show the bulk action button if feature is enabled
    if ($BulkFeature) {
        $LayoutObject->Block(
            Name => 'BulkAction',
            Data => {
                %PageNav,
                %Param,
            },
        );
    }

    # build html content
    my $OutputNavBar = $LayoutObject->Output(
        TemplateFile => 'AgentITSMConfigItemOverviewNavBar',
        Data         => {%Param},
    );

    # create output
    my $OutputRaw = '';
    if ( !$Param{Output} ) {
        $LayoutObject->Print(
            Output => \$OutputNavBar,
        );
    }
    else {
        $OutputRaw .= $OutputNavBar;
    }

    # load module
    if ( !$Kernel::OM->Get('Kernel::System::Main')->Require( $Backends->{$View}->{Module} ) ) {
        return $LayoutObject->FatalError();
    }

    # check for backend object
    my $Object = $Backends->{$View}->{Module}->new( %{$Env} );
    return if !$Object;

    # run module
    my $Output = $Object->Run(
        %Param,
        Limit     => $Limit,
        StartHit  => $StartHit,
        PageShown => $PageShown,
        AllHits   => $Param{Total} || 0,
        Frontend  => $Frontend,
    );

    # create output
    if ( !$Param{Output} ) {
        $LayoutObject->Print(
            Output => \$Output,
        );
    }
    else {
        $OutputRaw .= $Output;
    }

    # create overview nav bar
    $LayoutObject->Block(
        Name => 'OverviewNavBar',
        Data => {%Param},
    );

    # return content if available
    return $OutputRaw;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
