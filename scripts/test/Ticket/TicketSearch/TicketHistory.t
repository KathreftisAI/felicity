# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

## no critic (Modules::RequireExplicitPackage)
use strict;
use warnings;
use utf8;

use vars (qw($Self));

# get ticket object
my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase  => 1,
        UseTmpArticleDir => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

my @TicketIDs;

# create 2 tickets
for ( 1 .. 2 ) {
    my $TicketID = $TicketObject->TicketCreate(
        Title      => 'My ticket created by Agent A',
        QueueID    => '1',
        Lock       => 'unlock',
        PriorityID => 1,
        StateID    => 1,
        OwnerID    => 1,
        UserID     => 1,
    );

    $Self->True(
        $TicketID,
        "TicketCreate() for test - $TicketID",
    );
    push @TicketIDs, $TicketID;
}

$Helper->FixedTimeSet();
$Helper->FixedTimeAddSeconds(60);

# update ticket 1
my $Success = $TicketObject->TicketLockSet(
    Lock     => 'lock',
    TicketID => $TicketIDs[0],
    UserID   => 1,
);
$Self->True(
    $Success,
    "TicketLockSet() for test - $TicketIDs[0]",
);

# close ticket 2
$Success = $TicketObject->TicketStateSet(
    State    => 'closed successful',
    TicketID => $TicketIDs[1],
    UserID   => 1,
);
$Self->True(
    $Success,
    "TicketStateSet() for test - $TicketIDs[1]",
);

$Helper->FixedTimeAddSeconds(60);

my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

# the following tests should provoke a join in ticket_history table and the resulting SQL should be valid
my @Tests = (
    {
        Name   => "CreatedTypeIDs",
        Config => {
            CreatedTypeIDs => [ '1', ],
        },
        ExpectedTicketIDs => [ $TicketIDs[0], $TicketIDs[1] ],
    },
    {
        Name   => "CreatedStateIDs",
        Config => {
            CreatedStateIDs => [ '1', ],
        },
        ExpectedTicketIDs => [ $TicketIDs[0], ],
    },
    {
        Name   => "CreatedUserIDs",
        Config => {
            CreatedUserIDs => [ '1', ],
        },
        ExpectedTicketIDs => [ $TicketIDs[0], $TicketIDs[1] ],
    },
    {
        Name   => "CreatedQueueIDs",
        Config => {
            CreatedQueueIDs => [ '1', ],
        },
        ExpectedTicketIDs => [ $TicketIDs[0], $TicketIDs[1] ],
    },
    {
        Name   => "CreatedPriorityIDs",
        Config => {
            CreatedPriorityIDs => [ '1', ],
        },
        ExpectedTicketIDs => [ $TicketIDs[0], $TicketIDs[1] ],
    },
    {
        Name   => "TicketChangeTimeOlderDate",
        Config => {
            TicketChangeTimeOlderDate => $TimeObject->CurrentTimestamp(),
        },
        ExpectedTicketIDs => [ $TicketIDs[0], $TicketIDs[1] ],
    },
    {
        Name   => "TicketCloseTimeOlderDate",
        Config => {
            TicketCloseTimeOlderDate => $TimeObject->CurrentTimestamp(),
        },
        ExpectedTicketIDs => [ $TicketIDs[1] ],
    },
    {
        Name   => "TicketCloseTimeNewerDate",
        Config => {
            TicketCloseTimeNewerDate => $TimeObject->SystemTime2TimeStamp(
                SystemTime => $TimeObject->SystemTime() - 61,
            ),
        },
        ExpectedTicketIDs => [ $TicketIDs[1] ],
    },
);

for my $Test (@Tests) {

    my @ReturnedTicketIDs = $TicketObject->TicketSearch(
        Result  => 'ARRAY',
        UserID  => 1,
        OrderBy => ['Up'],
        SortBy  => ['TicketNumber'],
        %{ $Test->{Config} },
    );

    my %ReturnedLookup = map { $_ => 1 } @ReturnedTicketIDs;

    for my $TicketID ( @{ $Test->{ExpectedTicketIDs} } ) {

        $Self->True(
            $ReturnedLookup{$TicketID},
            "$Test->{Name} TicketSearch() - Results contains ticket $TicketID",
        );
    }
}

# cleanup is done by RestoreDatabase.

1;
