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

use Kernel::System::EmailParser;
use Kernel::Output::HTML::ArticleCheck::PGP;

# get needed objects
my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase            => 1,
        UseTmpArticleDir           => 1,
        RestoreSystemConfiguration => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

my $RandomID = $Helper->GetRandomNumber();

# use Test email backend
my $Success = $ConfigObject->Set(
    Key   => 'SendmailModule',
    Value => 'Kernel::System::Email::Test',
);

$Self->True(
    $Success,
    "Set Email Test backend with true",
);

$Success = $ConfigObject->Set(
    Key   => 'CustomerNotifyJustToRealCustomer',
    Value => '0',
);

# set user id
my $UserID = 1;

# get dynamic field object
my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

# create a dynamic field
my $FieldID = $DynamicFieldObject->DynamicFieldAdd(
    Name       => "DFT1$RandomID",
    Label      => 'Description',
    FieldOrder => 9991,
    FieldType  => 'Text',
    ObjectType => 'Ticket',
    Config     => {
        DefaultValue => 'Default',
    },
    ValidID => 1,
    Reorder => 0,
    UserID  => $UserID,
);

my $TestEmailObject = $Kernel::OM->Get('Kernel::System::Email::Test');

$Success = $TestEmailObject->CleanUp();
$Self->True(
    $Success,
    'Initial cleanup',
);

$Self->IsDeeply(
    $TestEmailObject->EmailsGet(),
    [],
    'Test backend empty after initial cleanup',
);

# set PGP config
$ConfigObject->Set(
    Key   => 'PGP',
    Value => 1,
);
$ConfigObject->Set(
    Key   => 'PGP::Options',
    Value => '--batch --no-tty --yes',
);
$ConfigObject->Set(
    Key   => 'PGP::Key::Password',
    Value => {
        '04A17B7A' => 'somepass',
        '114D1CB6' => 'somepass',
    },
);

$ConfigObject->Set(
    Key   => 'NotificationSenderEmail',
    Value => 'unittest@example.com',
);

# check if gpg is located there
if ( !-e $ConfigObject->Get('PGP::Bin') ) {

    # maybe it's a mac with macport
    if ( -e '/opt/local/bin/gpg' ) {
        $ConfigObject->Set(
            Key   => 'PGP::Bin',
            Value => '/opt/local/bin/gpg'
        );
    }
}

# create local crypt object
my $PGPObject = $Kernel::OM->Get('Kernel::System::Crypt::PGP');

if ( !$PGPObject ) {
    print STDERR "NOTICE: No PGP support!\n";
    return;
}

# make some preparations
my %Search = (
    1 => 'unittest@example.com',
    3 => 'unittest3@example.com',
);

my %Check = (
    1 => {
        Type             => 'pub',
        Identifier       => 'UnitTest <unittest@example.com>',
        Bit              => '1024',
        Key              => '38677C3B',
        KeyPrivate       => '04A17B7A',
        Created          => '2007-08-21',
        Expires          => 'never',
        Fingerprint      => '4124 DFBD CF52 D129 AB3E  3C44 1404 FBCB 3867 7C3B',
        FingerprintShort => '4124DFBDCF52D129AB3E3C441404FBCB38677C3B',
    },
    3 => {
        Type             => 'pub',
        Identifier       => 'unit test <unittest3@example.com>',
        Bit              => '4096',
        Key              => 'E023689E',
        KeyPrivate       => '114D1CB6',
        Created          => '2015-12-16',
        Expires          => 'never',
        Fingerprint      => '8C99 1F7D CFD0 5245 8DD7  F2E3 EC9A 3128 E023 689E',
        FingerprintShort => '8C991F7DCFD052458DD7F2E3EC9A3128E023689E',
    },
);

for my $Item ( sort keys %Check ) {

    # add PGP keys and perform sanity check
    my @Keys;

    # get keys
    my $KeyString = $MainObject->FileRead(
        Directory => $ConfigObject->Get('Home') . "/scripts/test/sample/Crypt/",
        Filename  => "PGPPrivateKey-$Item.asc",
    );
    my $Message = $PGPObject->KeyAdd(
        Key => ${$KeyString},
    );
    $Self->True(
        $Message || '',
        "Key:$Item - KeyAdd()",
    );

    @Keys = $PGPObject->KeySearch(
        Search => $Search{$Item},
    );

    $Self->True(
        $Keys[0] || '',
        "Key:$Item - KeySearch()",
    );
    for my $ID (qw(Type Identifier Bit Key KeyPrivate Created Expires Fingerprint FingerprintShort))
    {
        $Self->Is(
            $Keys[0]->{$ID} || '',
            $Check{$Item}->{$ID},
            "Key:$Item - KeySearch() - $ID",
        );
    }

    my $PublicKeyString = $PGPObject->PublicKeyGet(
        Key => $Keys[0]->{Key},
    );
    $Self->True(
        $PublicKeyString || '',
        "Key:1 - PublicKeyGet()",
    );

    my $PrivateKeyString = $PGPObject->SecretKeyGet(
        Key => $Keys[0]->{KeyPrivate},
    );
    $Self->True(
        $PrivateKeyString || '',
        "Key:1 - SecretKeyGet()",
    );
}

# add system address
my $SystemAddressID = $Kernel::OM->Get('Kernel::System::SystemAddress')->SystemAddressAdd(
    Name     => 'unittest3@example.com',
    Realname => 'unit test',
    ValidID  => 1,
    QueueID  => 1,
    Comment  => 'Some Comment',
    UserID   => 1,
);
$Self->True(
    $SystemAddressID,
    'SystemAddressAdd()',
);

my $QueueObject = $Kernel::OM->Get('Kernel::System::Queue');

# set the escalation into the future
my %Queue = $QueueObject->QueueGet(
    ID     => 1,
    UserID => $UserID,
);
my $QueueUpdate = $QueueObject->QueueUpdate(
    %Queue,
    SystemAddressID => $SystemAddressID,
    DefaultSignKey  => 'PGP::Detached::114D1CB6',
    UserID          => $UserID,
);
$Self->True( $QueueUpdate, "QueueUpdate() $Queue{Name}" );

# get ticket object
my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

# create ticket
my $TicketID = $TicketObject->TicketCreate(
    Title        => 'Ticket One Title',
    QueueID      => 1,
    Lock         => 'unlock',
    Priority     => '3 normal',
    State        => 'new',
    CustomerID   => 'example.com',
    CustomerUser => 'customerOne@example.com',
    OwnerID      => $UserID,
    UserID       => $UserID,
);

# sanity check
$Self->True(
    $TicketID,
    "TicketCreate() successful for Ticket ID $TicketID",
);

my $ArticleID = $TicketObject->ArticleCreate(
    TicketID       => $TicketID,
    ArticleType    => 'webrequest',
    SenderType     => 'customer',
    From           => 'customerOne@example.com',
    To             => 'Some Agent A <agent-a@example.com>',
    Subject        => 'some short description',
    Body           => 'the message text',
    Charset        => 'utf8',
    MimeType       => 'text/plain',
    HistoryType    => 'OwnerUpdate',
    HistoryComment => 'Some free text!',
    UserID         => $UserID,
);

# sanity check
$Self->True(
    $ArticleID,
    "ArticleCreate() successful for Article ID $ArticleID",
);

# create ticket
my $TicketID2 = $TicketObject->TicketCreate(
    Title        => 'Ticket Two Title',
    QueueID      => 2,
    Lock         => 'unlock',
    Priority     => '3 normal',
    State        => 'new',
    CustomerID   => 'example.com',
    CustomerUser => 'customerOne@example.com',
    OwnerID      => $UserID,
    UserID       => $UserID,
);

# sanity check
$Self->True(
    $TicketID2,
    "TicketCreate() successful for Ticket ID $TicketID2",
);

my $NotificationEventObject      = $Kernel::OM->Get('Kernel::System::NotificationEvent');
my $EventNotificationEventObject = $Kernel::OM->Get('Kernel::System::Ticket::Event::NotificationEvent');

# get article types email-notification-int ID
my $ArticleTypeIntID = $TicketObject->ArticleTypeLookup(
    ArticleType => 'email-notification-int',
);

my @Tests = (
    {
        Name => 'PGP - No security settings',
        Data => {
            Events         => [ 'TicketDynamicFieldUpdate_DFT1' . $RandomID . 'Update' ],
            RecipientEmail => ['unittest@example.com'],
        },
        Success => 1,
    },

    {
        Name => 'PGP - not signing method',
        Data => {
            Events                => [ 'TicketDynamicFieldUpdate_DFT1' . $RandomID . 'Update' ],
            RecipientEmail        => ['unittest@example.com'],
            EmailSecuritySettings => ['1'],
            EmailSigningCrypting  => [],
        },
        VerifySignature => 0,
        Success         => 1,
    },
    {
        Name => 'PGP - send unsigned',
        Data => {
            Events                  => [ 'TicketDynamicFieldUpdate_DFT1' . $RandomID . 'Update' ],
            RecipientEmail          => ['unittest2@example.com'],
            EmailSecuritySettings   => ['1'],
            EmailSigningCrypting    => ['PGPSign'],
            EmailMissingSigningKeys => ['Send unsigned'],
        },
        UseSecondTicket => 0,
        VerifySignature => 0,
        Success         => 1,
    },
    {
        Name => 'PGP - send unsigned',
        Data => {
            Events                  => [ 'TicketDynamicFieldUpdate_DFT1' . $RandomID . 'Update' ],
            RecipientEmail          => ['unittest2@example.com'],
            EmailSecuritySettings   => ['1'],
            EmailSigningCrypting    => ['PGPSign'],
            EmailMissingSigningKeys => ['Send unsigned'],
        },
        UseSecondTicket => 1,
        VerifySignature => 0,
        Success         => 1,
    },

    {
        Name => 'PGP - send signed',
        Data => {
            Events                => [ 'TicketDynamicFieldUpdate_DFT1' . $RandomID . 'Update' ],
            RecipientEmail        => [ 'unittest@example.com', 'unittest2@example.com' ],
            EmailSecuritySettings => ['1'],
            EmailSigningCrypting  => ['PGPSign'],
        },
        VerifySignature => 1,
        Success         => 1,
    },
    {
        Name => 'PGP - send crypted',
        Data => {
            Events                => [ 'TicketDynamicFieldUpdate_DFT1' . $RandomID . 'Update' ],
            RecipientEmail        => ['unittest@example.com'],
            EmailSecuritySettings => ['1'],
            EmailSigningCrypting  => ['PGPCrypt'],
        },
        VerifyDecryption => 1,
        Success          => 1,
    },
    {
        Name => 'PGP - send uncrypted',
        Data => {
            Events                   => [ 'TicketDynamicFieldUpdate_DFT1' . $RandomID . 'Update' ],
            RecipientEmail           => ['unittest2@example.com'],
            EmailSecuritySettings    => ['1'],
            EmailSigningCrypting     => ['PGPCrypt'],
            EmailMissingCryptingKeys => ['Send'],
        },
        VerifyDecryption => 0,
        Success          => 1,
    },
    {
        Name => 'PGP - skip delivery',
        Data => {
            Events                   => [ 'TicketDynamicFieldUpdate_DFT1' . $RandomID . 'Update' ],
            RecipientEmail           => ['unittes2@example.com'],
            EmailSecuritySettings    => ['1'],
            EmailSigningCrypting     => ['PGPSignCrypt'],
            EmailMissingCryptingKeys => ['Skip'],
        },
        UseSecondTicket  => 1,
        VerifyDecryption => 0,
        Success          => 0,
    },
);

my $Count = 0;
my $NotificationID;

my $PostmasterUserID = $ConfigObject->Get('PostmasterUserID') || 1;

TEST:
for my $Test (@Tests) {

    # add transport setting
    $Test->{Data}->{Transports} = ['Email'];

    $NotificationID = $NotificationEventObject->NotificationAdd(
        Name    => "JobName$Count-$RandomID",
        Comment => 'An optional comment',
        Data    => $Test->{Data},
        Message => {
            en => {
                Subject     => 'JobName',
                Body        => 'JobName <OTRS_TICKET_TicketID> <OTRS_CONFIG_SendmailModule> <OTRS_OWNER_UserFirstname>',
                ContentType => 'text/plain',
            },
            de => {
                Subject     => 'JobName',
                Body        => 'JobName <OTRS_TICKET_TicketID> <OTRS_CONFIG_SendmailModule> <OTRS_OWNER_UserFirstname>',
                ContentType => 'text/plain',
            },
        },
        ValidID => 1,
        UserID  => $UserID,
    );

    # sanity check
    $Self->IsNot(
        $NotificationID,
        undef,
        "$Test->{Name} - NotificationAdd() should not be undef",
    );

    my $UseTicket = ( $Test->{UseSecondTicket} ? $TicketID2 : $TicketID );

    my $Result = $EventNotificationEventObject->Run(
        Event => 'TicketDynamicFieldUpdate_DFT1' . $RandomID . 'Update',
        Data  => {
            TicketID => $UseTicket,
        },
        Config => {},
        UserID => $UserID,
    );

    my $Emails = $TestEmailObject->EmailsGet();
    if ( $Test->{Success} ) {

        # sanity check
        $Self->True(
            scalar @{$Emails},
            "$Test->{Name} - Successful sending for Notification ID $NotificationID",
        );
    }
    else {
        # sanity check
        $Self->False(
            scalar @{$Emails},
            "$Test->{Name} - Unsuccessful sending for Notification ID $NotificationID",
        );
    }

    # get ticket articles
    my @ArticleIDs = $TicketObject->ArticleIndex(
        TicketID => $TicketID,
    );

    my $LastArticleID = pop @ArticleIDs;

    my %Article = $TicketObject->ArticleGet(
        TicketID  => $TicketID,
        ArticleID => $LastArticleID,
    );

    my $CheckObject = Kernel::Output::HTML::ArticleCheck::PGP->new(
        ArticleID => $LastArticleID,
        UserID    => $UserID,
    );

    my @CheckResult = $CheckObject->Check( Article => \%Article );

    if ( $Test->{VerifySignature} ) {
        my $SignatureVerified =
            grep {
            $_->{Successful} && $_->{Key} eq 'Signed' && $_->{SignatureFound} && $_->{Message}
            } @CheckResult;

        $Self->True(
            $SignatureVerified,
            "$Test->{Name} -  Signature verified",
        );
    }

    if ( $Test->{VerifyDecryption} ) {
        my $DecryptionVerified =
            grep { $_->{Successful} && $_->{Key} eq 'Crypted' } @CheckResult;

        $Self->True(
            $DecryptionVerified,
            "$Test->{Name} - Decryption verified",
        );
    }

}
continue {
    # delete notification event
    my $NotificationDelete = $NotificationEventObject->NotificationDelete(
        ID     => $NotificationID,
        UserID => $UserID,
    );

    # sanity check
    $Self->True(
        $NotificationDelete,
        "$Test->{Name} - NotificationDelete() successful for Notification ID $NotificationID",
    );

    $TestEmailObject->CleanUp();

    $Count++;
    undef $NotificationID;
}

# cleanup is done by RestoreDatabase.

1;
