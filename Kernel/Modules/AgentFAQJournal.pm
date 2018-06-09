# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentFAQJournal;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

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

    # get config for frontend
    my $Config = $Kernel::OM->Get('Kernel::Config')->Get("FAQ::Frontend::$Self->{Action}");

    # get journal limit data
    my $JournalLimit = $Config->{JournalLimit} || 500;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # permission check
    if ( !$Self->{AccessRo} ) {
        return $LayoutObject->NoPermission(
            Message    => Translatable('You need ro permission!'),
            WithHeader => 'yes',
        );
    }

    # get Journal entries
    my $Journal = $Kernel::OM->Get('Kernel::System::FAQ')->HistoryGet(
        UserID => $Self->{UserID},
    );

    # find out which columns should be shown
    my @ShowColumns;
    if ( $Config->{ShowColumns} ) {

        # get all possible columns from config
        my %PossibleColumn = %{ $Config->{ShowColumns} };

        # get the column names that should be shown
        COLUMNNAME:
        for my $Name ( sort keys %PossibleColumn ) {
            next COLUMNNAME if !$PossibleColumn{$Name};
            push @ShowColumns, $Name;
        }

        # enforce FAQ number column since is the link MasterAction hook
        if ( !$PossibleColumn{'Number'} ) {
            push @ShowColumns, 'Number';
        }
    }

    # output header
    my $Output = $LayoutObject->Header(
        Value => Translatable('FAQ Journal'),
    );
    $Output .= $LayoutObject->NavigationBar();

    # output Journal
    $Output .= $Self->_FAQJournalShow(
        Journal          => $Journal,
        Total            => scalar @{$Journal},
        TitleName        => $LayoutObject->{LanguageObject}->Translate('FAQ Journal'),
        Limit            => $JournalLimit,
        ShowColumns      => \@ShowColumns,
        JournalTitleSize => $Config->{TitleSize},
    );

    # build footer
    $Output .= $LayoutObject->Footer();

    return $Output;
}

sub _FAQJournalShow {
    my ( $Self, %Param ) = @_;

    # lookup latest used view mode
    if ( !$Param{View} && $Self->{ 'UserFAQJournalOverview' . $Self->{Action} } ) {
        $Param{View} = $Self->{ 'UserFAQJournalOverview' . $Self->{Action} };
    }

    # set frontend
    my $Frontend = 'Agent';

    # set default view mode to 'small'
    my $View = $Param{View} || 'Small';

    # get session object
    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

    # store latest view mode
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'UserFAQJournalOverview' . $Self->{Action},
        Value     => $View,
    );

    # get needed objects
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get backend from config
    my $Backends = $ConfigObject->Get('FAQ::Frontend::JournalOverview');
    if ( !$Backends ) {
        return $LayoutObject->FatalError(
            Message => Translatable('Need config option FAQ::Frontend::Overview'),
        );
    }

    # check for hash-ref
    if ( ref $Backends ne 'HASH' ) {
        return $LayoutObject->FatalError(
            Message => Translatable('Config option FAQ::Frontend::Overview needs to be a HASH ref!'),
        );
    }

    # check for config key
    if ( !$Backends->{$View} ) {
        return $LayoutObject->FatalError(
            Message => $LayoutObject->{LanguageObject}->Translate( 'No config option found for the view "%s"!', $View ),
        );
    }

    # navigation bar
    my $StartHit = int( $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'StartHit' ) || 1 );

    # get personal page shown count
    my $PageShownPreferencesKey = 'UserFAQJournalOverview' . $View . 'PageShown';
    my $PageShown               = $Self->{$PageShownPreferencesKey} || 10;
    my $Group                   = 'FAQJournalOverview' . $View . 'PageShown';

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

    # set page limit and build page navigation
    my $Limit = $Param{Limit} || 20_000;
    my %PageNav = $LayoutObject->PageNavBar(
        Limit     => $Limit,
        StartHit  => $StartHit,
        PageShown => $PageShown,
        AllHits   => $Param{Total} || 0,
        Action    => 'Action=' . $LayoutObject->{Action},
        Link      => $Param{LinkPage},
    );

    # build shown FAQ articles on a page
    $Param{RequestedURL}    = "Action=$Self->{Action}";
    $Param{Group}           = $Group;
    $Param{PreferencesKey}  = $PageShownPreferencesKey;
    $Param{PageShownString} = $LayoutObject->BuildSelection(
        Name       => $PageShownPreferencesKey,
        SelectedID => $PageShown,
        Data       => \%Data,
    );

    # store last overview screen (for back menu action)
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenOverview',
        Value     => $Param{RequestedURL},
    );
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenView',
        Value     => $Param{RequestedURL},
    );

    # build navigation bar content
    $LayoutObject->Block(
        Name => 'OverviewNavBar',
        Data => \%Param,
    );

    # loop over configured back-ends
    for my $Backend ( sort keys %{$Backends} ) {

        # build navigation bar view mode
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

    # check if page navigation is available
    if (%PageNav) {
        $LayoutObject->Block(
            Name => 'OverviewNavBarPageNavBar',
            Data => \%PageNav,
        );

        # don't show context settings in AJAX case (e. g. in customer FAQ history),
        # because the submit with page reload will not work there
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

    # build HTML content
    my $OutputNavBar = $LayoutObject->Output(
        TemplateFile => 'AgentFAQOverviewNavBar',
        Data         => {
            View => $View,
            %Param,
        },
    );

    # create output
    my $OutputRaw = $OutputNavBar;

    # load module
    if ( !$Kernel::OM->Get('Kernel::System::Main')->Require( $Backends->{$View}->{Module} ) ) {
        return $LayoutObject->FatalError();
    }

    # check for backend object
    my $Object = $Backends->{$View}->{Module}->new( %{$Self} );
    return if !$Object;

    # run module
    my $Output = $Object->Run(
        %Param,
        Limit     => $Limit,
        StartHit  => $StartHit,
        PageShown => $PageShown,
        AllHits   => $Param{Total} || 0,
        Frontend  => $Frontend,
        TitleSize => $Param{JournalTitleSize},
    );

    $OutputRaw .= $Output;

    # create overview navigation bar
    $LayoutObject->Block(
        Name => 'OverviewNavBar',
        Data => {%Param},
    );

    # return content if available
    return $OutputRaw;
}

1;
