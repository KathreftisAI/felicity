# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Maint::Ticket::IncidentToProblem;

use strict;
use warnings;
use Data::Dumper;
use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = ();

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description(
        'Create Problem ticket based on multiple incident tickets.');

    # $Self->AddOption(
    #     Name        => 'option',
    #     Description => "Describe this option.",
    #     Required    => 1,
    #     HasValue    => 1,
    #     ValueRegex  => qr/.*/smx,
    # );
    # $Self->AddArgument(
    #     Name        => 'argument',
    #     Description => "Describe this argument.",
    #     Required    => 1,
    #     ValueRegex  => qr/.*/smx,
    # );

    return;
}

# sub PreRun {
#     my ( $Self, %Param ) = @_;
#
#     # Perform any custom validations here. Command execution can be stopped with die().
#
#     # my $TargetDirectory = $Self->GetOption('target-directory');
#     # if ($TargetDirectory && !-d $TargetDirectory) {
#     #     die "Directory $TargetDirectory does not exist.\n";
#     # }
#
#     return;
# }

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print(
        "<yellow>Checking incident tickets to create problem  tickets....</yellow>\n"
    );

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $TicketSearch
        = $ConfigObject->Get("IncidentToProblem::Config::TicketSearch");
    my $TicketCreate
        = $ConfigObject->Get("IncidentToProblem::Config::TicketCreate");

    # search tickets
    my @TicketIDs = $TicketObject->TicketSearch(
        TicketCreateTimeNewerMinutes =>
            $TicketSearch->{TicketCreatedWithInMinutes},
        Subject      => "%" . $TicketSearch->{SubjectContains} . "%",
        Limit        => 100_000,
        CreatedTypes => [ $TicketSearch->{TicketType} ],
        Result       => 'ARRAY',
        UserID       => 1,
    );

    my $TicketCount = scalar @TicketIDs;

    #Loop through ticket id and create a map with Host as key
    my %hostToTicket;
    for my $TicketID (@TicketIDs) {
        my %Ticket = $TicketObject->TicketGet(
            TicketID      => $TicketID,
            DynamicFields => 0
        );

        # $Ticket{'Title'} =~ /\bAlert:\s+(\w+)/;
        $Ticket{'Title'} =~ $TicketSearch->{TitleRegExp};
        my ($host) = $1;

        my $LinkListWithData
            = $Kernel::OM->Get('Kernel::System::LinkObject')
            ->LinkListWithData(
            Object => 'Ticket',
            Key    => $TicketID,
            State  => 'Valid',
            UserID => 1,
            );
        my $key;
        my $type;
        if ( %{$LinkListWithData} ) {
            $key = keys %{ $LinkListWithData->{Ticket}{ParentChild}{Target} };
            if ($key) {
                $type = $LinkListWithData->{Ticket}{ParentChild}{Target}{$key}
                    {Type};
            }
            if ( !$type =~ /Problem/ ) {
                push @{ $hostToTicket{$host} }, $TicketID;
            }
        }

        # else {
        push @{ $hostToTicket{$host} }, $TicketID;

        # }
    }

    for my $hostname ( keys %hostToTicket ) {

        #Search for problem ticket if exists;
        my $title = $hostname . " is down";

        # print Dumper $title;
        my @TicketIDs = $TicketObject->TicketSearch(
            Title     => "%" . $title . "%",
            Result    => 'ARRAY',
            UserID    => 1,
            StateType => 'Open',
            TypeIDs   => [7],
            OrderBy   => 'Down',
            SortBy    => 'Age',

            # Limit   => 1,
        );

        my $TicketID;

        if (@TicketIDs) {
            $TicketID = shift @TicketIDs;
        }

        #Count No. of tickets.
        #if greater than configured count create problem ticket.

        if ( !$TicketID
            && @{ $hostToTicket{$hostname} } >= $TicketCreate->{NoofTickets} )
        {
            $TicketID = $TicketObject->TicketCreate(
                Title   => $hostname . " is down",
                QueueID => 1,

                # Subject  => $hostname . " is down",
                Lock     => 'unlock',
                TypeID   => 7,
                UserID   => 1,
                OwnerID  => 1,
                State    => 'new',
                Priority => 'P1'
            );
        }

        if ( $TicketID ) {

            foreach my $Ticket ( @{ $hostToTicket{$hostname} } ) {

                $Kernel::OM->Get('Kernel::System::LinkObject')->LinkAdd(
                    SourceObject => 'Ticket',
                    SourceKey    => $TicketID,
                    TargetObject => 'Ticket',
                    StateID      => 1,
                    TargetKey    => $Ticket,
                    Type         => 'ParentChild',
                    State        => 'Valid',
                    UserID       => 1,
                );
            }
        }
    }

    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

# sub PostRun {
#     my ( $Self, %Param ) = @_;
#
#     # This will be called after Run() (even in case of exceptions). Perform any cleanups here.
#
#     return;
# }

1;
