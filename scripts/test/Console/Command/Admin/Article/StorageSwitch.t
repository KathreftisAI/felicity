# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

# get needed objects
my $CommandObject = $Kernel::OM->Get('Kernel::System::Console::Command::Admin::Article::StorageSwitch');
my $TicketObject  = $Kernel::OM->Get('Kernel::System::Ticket');

my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

# make sure ticket is created in ArticleStorageDB
$HelperObject->ConfigSettingChange(
    Valid => 1,
    Key   => 'Ticket::StorageModule',
    Value => 'Kernel::System::Ticket::ArticleStorageDB',
);

# create isolated time environment during test
$HelperObject->FixedTimeSet(
    $Kernel::OM->Get('Kernel::System::Time')->TimeStamp2SystemTime( String => '2000-10-20 00:00:00' ),
);

# create test ticket with attachments
my $TicketID = $TicketObject->TicketCreate(
    Title        => 'Some Ticket_Title',
    Queue        => 'Raw',
    Lock         => 'unlock',
    Priority     => '3 normal',
    State        => 'closed successful',
    CustomerNo   => '123465',
    CustomerUser => 'customer@example.com',
    OwnerID      => 1,
    UserID       => 1,
);
$Self->True(
    $TicketID,
    'TicketCreate()',
);

my $ArticleID = $TicketObject->ArticleCreate(
    TicketID       => $TicketID,
    ArticleType    => 'note-internal',
    SenderType     => 'agent',
    From           => 'Some Agent <email@example.com>',
    To             => 'Some Customer <customer-a@example.com>',
    Subject        => 'some short description',
    Body           => 'the message text',
    ContentType    => 'text/plain; charset=ISO-8859-15',
    HistoryType    => 'OwnerUpdate',
    HistoryComment => 'Some free text!',
    UserID         => 1,
    Attachment     => [
        {
            Content     => 'empty',
            ContentType => 'text/csv',
            Filename    => 'Test 1.txt',
        },
        {
            Content     => 'empty',
            ContentType => 'text/csv',
            Filename    => 'Test_1.txt',
        },
        {
            Content     => 'empty',
            ContentType => 'text/csv',
            Filename    => 'Test-1.txt',
        },
        {
            Content     => 'empty',
            ContentType => 'text/csv',
            Filename    => 'Test_1-1.txt',
        },
    ],
    NoAgentNotify => 1,
);
$Self->True(
    $ArticleID,
    'ArticleCreate()',
);

for my $Backend (qw(FS DB)) {

    # try to execute command without any options
    my $ExitCode = $CommandObject->Execute();
    $Self->Is(
        $ExitCode,
        1,
        "$Backend No options",
    );

    # provide options
    $ExitCode = $CommandObject->Execute(
        '--target',
        'ArticleStorage' . $Backend,
        '--tickets-closed-before-date',
        '2000-10-21 00:00:00'
    );
    $Self->Is(
        $ExitCode,
        0,
        "$Backend with option: --target ArticleStorage$Backend --tickets-closed-before-date 2000-10-21 00:00:00",
    );
}

# delete test ticket
$TicketObject->TicketDelete(
    TicketID => $TicketID,
    UserID   => 1,
);
$Self->True(
    $TicketID,
    'TicketDelete()',
);

1;
