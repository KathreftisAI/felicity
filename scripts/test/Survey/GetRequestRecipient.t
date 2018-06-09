# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

## no critic (Modules::RequireExplicitPackage)
use strict;
use warnings;
use utf8;

use vars qw($Self);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

# Get Ticket object.
my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

# Create some tickets.
my $TicketID1 = $TicketObject->TicketCreate(
    Title        => 'Some Ticket Title',
    Queue        => 'Raw',
    Lock         => 'unlock',
    Priority     => '3 normal',
    State        => 'new',
    CustomerID   => '123465',
    CustomerUser => 'customer@example.com',
    OwnerID      => 1,
    UserID       => 1,
);
$Self->IsNot(
    $TicketID1,
    undef,
    "TicketCreate() for TicketID $TicketID1",
);

my $TicketID2 = $TicketObject->TicketCreate(
    Title        => 'Some Ticket Title',
    Queue        => 'Raw',
    Lock         => 'unlock',
    Priority     => '3 normal',
    State        => 'new',
    CustomerID   => '123465',
    CustomerUser => 'customer@example.com',
    OwnerID      => 1,
    UserID       => 1,
);
$Self->IsNot(
    $TicketID2,
    undef,
    "TicketCreate() for TicketID $TicketID2",
);

my $TicketID3 = $TicketObject->TicketCreate(
    Title    => 'Some Ticket Title',
    Queue    => 'Raw',
    Lock     => 'unlock',
    Priority => '3 normal',
    State    => 'new',
    OwnerID  => 1,
    UserID   => 1,
);
$Self->IsNot(
    $TicketID3,
    undef,
    "TicketCreate() for TicketID $TicketID3",
);

# Create articles for the tickets.
my $ArticleID1 = $TicketObject->ArticleCreate(
    TicketID       => $TicketID1,
    ArticleType    => 'phone',
    SenderType     => 'customer',
    From           => 'Some Customer <email@example.com>',
    To             => 'Some Agent <agent@example.com>',
    Subject        => 'some short description',
    Body           => 'the message text',
    ContentType    => 'text/plain; charset=ISO-8859-15',
    HistoryType    => 'AddNote',
    HistoryComment => 'Some free text!',
    UserID         => 1,
);
$Self->IsNot(
    $TicketID3,
    undef,
    "ArticleCreate() for ArticleID $ArticleID1",
);

my $ArticleID2 = $TicketObject->ArticleCreate(
    TicketID       => $TicketID2,
    ArticleType    => 'note-external',
    SenderType     => 'agent',
    From           => 'Some Agent <agent@example.com>',
    To             => 'Some Customer <email@example.com>',
    Subject        => 'some short description',
    Body           => 'the message text',
    ContentType    => 'text/plain; charset=ISO-8859-15',
    HistoryType    => 'AddNote',
    HistoryComment => 'Some free text!',
    UserID         => 1,
);
$Self->IsNot(
    $TicketID3,
    undef,
    "ArticleCreate() for ArticleID $ArticleID2",
);

my @Tests = (
    {
        Name    => 'No Params',
        Param   => {},
        Success => 0,
    },
    {
        Name  => 'Wrong UserEMail',
        Param => {
            UserEmail => 'User',
        },
        Success => 0,
    },
    {
        Name  => 'Wrong TicketID',
        Param => {
            TicketID => $TicketID3,
        },
        Success => 0,
    },
    {
        Name  => 'UserEmail',
        Param => {
            UserEmail => 'User <user@example.com>',
        },
        Success         => 1,
        ExpectedResults => 'user@example.com',
    },
    {
        Name  => 'UserEmail Multiple',
        Param => {
            UserEmail => 'User <user@example.com>, User2 <user2@example.com>',
        },
        Success         => 1,
        ExpectedResults => 'user2@example.com',
    },
    {
        Name  => 'TicketID Last article customer',
        Param => {
            TicketID => $TicketID1,
        },
        Success         => 1,
        ExpectedResults => 'email@example.com',
    },
    {
        Name  => 'TicketID Last article agent',
        Param => {
            TicketID => $TicketID2,
        },
        Success         => 1,
        ExpectedResults => 'email@example.com',
    },
    {
        Name  => 'UserEmail (BlackList)',
        Param => {
            UserEmail => 'User <user@example.com>',
        },
        BlackList => ['user@example.com'],
        Success   => 0,
    },
    {
        Name  => 'UserEmail Multiple (BlackList)',
        Param => {
            UserEmail => 'User <user@example.com>, User2 <user2@example.com>',
        },
        BlackList => ['user2@example.com'],
        Success   => 0,
    },
    {
        Name  => 'TicketID Last article customer (BlackList)',
        Param => {
            TicketID => $TicketID1,
        },
        BlackList => ['email@example.com'],
        Success   => 0,
    },
    {
        Name  => 'TicketID Last article agent (BlackList)',
        Param => {
            TicketID => $TicketID2,
        },
        BlackList => ['email@example.com'],
        Success   => 0,
    },

    {
        Name  => 'uc UserEmail (BlackList)',
        Param => {
            UserEmail => 'User <User@example.com>',
        },
        BlackList => ['user@example.com'],
        Success   => 0,
    },
    {
        Name  => 'uc UserEmail Multiple (BlackList)',
        Param => {
            UserEmail => 'User <user@example.com>, User2 <User2@example.com>',
        },
        BlackList => ['user2@example.com'],
        Success   => 0,
    },
    {
        Name  => 'UserEmail (uc BlackList)',
        Param => {
            UserEmail => 'User <user@example.com>',
        },
        BlackList => ['User@example.com'],
        Success   => 0,
    },
    {
        Name  => 'UserEmail Multiple (uc BlackList)',
        Param => {
            UserEmail => 'User <user@example.com>, User2 <user2@example.com>',
        },
        BlackList => ['User2@example.com'],
        Success   => 0,
    },
    {
        Name  => 'TicketID Last article customer (uc BlackList)',
        Param => {
            TicketID => $TicketID1,
        },
        BlackList => ['Email@example.com'],
        Success   => 0,
    },
    {
        Name  => 'TicketID Last article agent (uc BlackList)',
        Param => {
            TicketID => $TicketID2,
        },
        BlackList => ['Email@example.com'],
        Success   => 0,
    },
    {
        Name  => 'uc UserEmail (uc BlackList)',
        Param => {
            UserEmail => 'User <User@example.com>',
        },
        BlackList => ['User@example.com'],
        Success   => 0,
    },
    {
        Name  => 'uc UserEmail Multiple (uc BlackList)',
        Param => {
            UserEmail => 'User <user@example.com>, User2 <User2@example.com>',
        },
        BlackList => ['User2@example.com'],
        Success   => 0,
    },
);

# Create needed objects.
my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
my $SurveyObject = $Kernel::OM->Get('Kernel::System::Survey');

TEST:
for my $Test (@Tests) {

    # Set blacklist.
    $ConfigObject->Set(
        Key   => 'Survey::NotificationRecipientBlacklist',
        Value => $Test->{BlackList} // [],
    );

    # Execute actual test.
    my $Recipient = $SurveyObject->_GetRequestRecipient( %{ $Test->{Param} } );

    if ( !$Test->{Success} ) {
        $Self->Is(
            $Recipient,
            undef,
            "$Test->{Name} - _GetRequestRecipient()",
        );

        next TEST;
    }
    $Self->Is(
        $Recipient,
        $Test->{ExpectedResults},
        "$Test->{Name} - _GetRequestRecipient()",
    );

}

1;
