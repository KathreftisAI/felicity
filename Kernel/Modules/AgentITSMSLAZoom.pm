# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMSLAZoom;

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

    # get params
    my $SLAID = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => "SLAID" );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    if ( !$SLAID ) {
        return $LayoutObject->ErrorScreen(
            Message => "No SLAID is given!",
            Comment => 'Please contact the admin.',
        );
    }

    # get sla
    my %SLA = $Kernel::OM->Get('Kernel::System::SLA')->SLAGet(
        SLAID  => $SLAID,
        UserID => $Self->{UserID},
    );
    if ( !$SLA{SLAID} ) {
        return $LayoutObject->ErrorScreen(
            Message => "SLAID $SLAID not found in database!",
            Comment => 'Please contact the admin.',
        );
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get calendar name
    if ( $SLA{Calendar} ) {
        $SLA{CalendarName} = "Calendar $SLA{Calendar} - "
            . $ConfigObject->Get( "TimeZone::Calendar" . $SLA{Calendar} . "Name" );
    }
    else {
        $SLA{CalendarName} = 'Calendar Default';
    }

    # run config item menu modules
    if ( ref $ConfigObject->Get('ITSMSLA::Frontend::MenuModule') eq 'HASH' ) {
        my %Menus   = %{ $ConfigObject->Get('ITSMSLA::Frontend::MenuModule') };
        my $Counter = 0;
        for my $Menu ( sort keys %Menus ) {

            # load module
            if ( $Kernel::OM->Get('Kernel::System::Main')->Require( $Menus{$Menu}->{Module} ) ) {
                my $Object = $Menus{$Menu}->{Module}->new(
                    %{$Self},
                    SLAID => $Self->{SLAID},
                );

                # set classes
                if ( $Menus{$Menu}->{Target} ) {
                    if ( $Menus{$Menu}->{Target} eq 'PopUp' ) {
                        $Menus{$Menu}->{MenuClass} = 'AsPopup';
                    }
                    elsif ( $Menus{$Menu}->{Target} eq 'Back' ) {
                        $Menus{$Menu}->{MenuClass} = 'HistoryBack';
                    }
                }

                # run module
                $Counter = $Object->Run(
                    %Param,
                    SLA     => \%SLA,
                    Counter => $Counter,
                    Config  => $Menus{$Menu},
                );
            }
            else {
                return $LayoutObject->FatalError();
            }
        }
    }

    if ( $SLA{ServiceIDs} && ref $SLA{ServiceIDs} eq 'ARRAY' && @{ $SLA{ServiceIDs} } ) {

        # output row
        $LayoutObject->Block(
            Name => 'Service',
        );

        # create service list
        my %ServiceList;
        for my $ServiceID ( @{ $SLA{ServiceIDs} } ) {

            # get service data
            my %Service = $Kernel::OM->Get('Kernel::System::Service')->ServiceGet(
                ServiceID     => $ServiceID,
                IncidentState => 1,
                UserID        => $Self->{UserID},
            );

            # add service to hash
            $ServiceList{$ServiceID} = \%Service;
        }

        # set incident signal
        my %InciSignals = (
            operational => 'greenled',
            warning     => 'yellowled',
            incident    => 'redled',
        );

        my $CssClass = '';
        for my $ServiceID (
            sort { $ServiceList{$a}->{Name} cmp $ServiceList{$b}->{Name} }
            keys %ServiceList
            )
        {

            # set output object
            $CssClass = $CssClass eq 'searchpassive' ? 'searchactive' : 'searchpassive';

            # output row
            $LayoutObject->Block(
                Name => 'ServiceRow',
                Data => {
                    %{ $ServiceList{$ServiceID} },
                    CurInciSignal => $InciSignals{ $ServiceList{$ServiceID}->{CurInciStateType} },
                    CssClass      => $CssClass,
                },
            );
        }
    }

    # get user object
    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # get create user data
    $SLA{CreateByName} = $UserObject->UserName(
        UserID => $SLA{CreateBy},
    );

    # get change user data
    $SLA{ChangeByName} = $UserObject->UserName(
        UserID => $SLA{ChangeBy},
    );

    # output header
    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();

    # generate output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMSLAZoom',
        Data         => {
            %Param,
            %SLA,
        },
    );
    $Output .= $LayoutObject->Footer();

    return $Output;
}

1;
