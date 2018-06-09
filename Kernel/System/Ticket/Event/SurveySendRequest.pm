# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Ticket::Event::SurveySendRequest;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Survey',
    'Kernel::System::Ticket',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Event Config)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }
    if ( !$Param{Data}->{TicketID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need TicketID!",
        );

        return;
    }

    # loop Protection, RequestSend calls HistoryAdd
    # so we can't listen on HistoryAdd Events in order to
    # prevent deep recursion
    return 1 if $Param{Event} eq 'HistoryAdd';

    # get ticket object
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # get ticket data
    my %Ticket = $TicketObject->TicketGet(
        TicketID => $Param{Data}{TicketID},
    );

    return 1 if $Ticket{StateType} ne 'closed';

    # send also survey request on ticket creation (on first article)
    if ( $Param{Event} eq 'ArticleCreate' ) {

        my @ArticleIndex = $TicketObject->ArticleIndex(
            TicketID => $Param{Data}{TicketID},
        );

        return 1 if scalar @ArticleIndex != 1;
    }

    # send request
    $Kernel::OM->Get('Kernel::System::Survey')->RequestSend(
        TicketID => $Param{Data}->{TicketID},
    );

    return 1;
}

1;
