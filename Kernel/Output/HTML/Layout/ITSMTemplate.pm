# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::Layout::ITSMTemplate;

use strict;
use warnings;

use Kernel::Language qw(Translatable);
use POSIX qw(ceil);

our $ObjectManagerDisabled = 1;

=over 4

=item ITSMTemplateListShow()

Returns a list of templates as sortable list with pagination.

This function is similar to L<Kernel::Output::HTML::Layout::ITSMChange::ITMChangeListShow()>
in F<Kernel/Output/HTML/LayoutITSMChange.pm>.

    my $Output = $LayoutObject->ITSMTemplateListShow(
        TemplateIDs  => $TemplateIDsRef,                  # total list of template ids, that can be listed
        Total      => scalar @{ $TemplateIDsRef },        # total number of list items, templates in this case
        Filter     => 'All',
        Filters    => \%NavBarFilter,
        FilterLink => $LinkFilter,
        TitleName  => 'Overview: Template',
        TitleValue => $Self->{Filter},
        Env        => $Self,
        LinkPage   => $LinkPage,
        LinkSort   => $LinkSort,
    );

=cut

sub ITSMTemplateListShow {
    my ( $Self, %Param ) = @_;

    # take object ref to local, remove it from %Param (prevent memory leak)
    my $Env = delete $Param{Env};

    # for now there is only the 'Small' view
    my $View = 'Small';

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get backend from config
    my $Backends = $Kernel::OM->Get('Kernel::Config')->Get('ITSMChange::Frontend::TemplateOverview');
    if ( !$Backends ) {
        return $LayoutObject->FatalError(
            Message => $LayoutObject->{LanguageObject}->Translate(
                'Need config option %s!',
                'ITSMChange::Frontend::TemplateOverview',
            ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # check for hash-ref
    if ( ref $Backends ne 'HASH' ) {
        return $LayoutObject->FatalError(
            Message => $LayoutObject->{LanguageObject}->Translate(
                'Config option %s needs to be a HASH ref!',
                'ITSMChange::Frontend::TemplateOverview',
            ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # check for config key
    if ( !$Backends->{$View} ) {
        return $LayoutObject->FatalError(
            Message => $LayoutObject->{LanguageObject}->Translate( 'No config option found for the view "%s"!', $View ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # nav bar
    my $StartHit = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'StartHit' ) || 1;

    # check start option, if higher then elements available, set
    # it to the last overview page (Thanks to Stefan Schmidt!)
    my $PageShown = $Backends->{$View}->{PageShown};
    if ( $StartHit > $Param{Total} ) {
        my $Pages = int( ( $Param{Total} / $PageShown ) + 0.99999 );
        $StartHit = ( ( $Pages - 1 ) * $PageShown ) + 1;
    }

    # set page limit and build page nav
    my $Limit = $Param{Limit} || 20_000;
    my %PageNav = $LayoutObject->PageNavBar(
        Limit     => $Limit,
        StartHit  => $StartHit,
        PageShown => $PageShown,
        AllHits   => $Param{Total} || 0,
        Action    => 'Action=' . $LayoutObject->{Action},
        Link      => $Param{LinkPage},
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

    # loop over configured backends, when there is more than a single backend
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
    }

    # check if nav bar is available
    if ( $Param{NavBar} ) {
        if ( $Param{NavBar}->{MainName} ) {
            $LayoutObject->Block(
                Name => 'OverviewNavBarMain',
                Data => $Param{NavBar},
            );
        }
    }

    # build html content
    my $OutputNavBar = $LayoutObject->Output(
        TemplateFile => 'AgentITSMTemplateOverviewNavBar',
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

=begin Internal:

=end Internal:

=back

=cut

1;
