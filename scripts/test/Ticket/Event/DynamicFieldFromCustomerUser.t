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
my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
my $TicketObject       = $Kernel::OM->Get('Kernel::System::Ticket');
my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase  => 1,
        UseTmpArticleDir => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

my $RandomID = $Helper->GetRandomID();

# don't check email address validity
$ConfigObject->Set(
    Key   => 'CheckEmailAddresses',
    Value => 0,
);
$ConfigObject->Set(
    Key   => 'DynamicFieldFromCustomerUser::Mapping',
    Value => {
        UserLogin     => 'CustomerLogin' . $RandomID,
        UserFirstname => 'CustomerFirstname' . $RandomID,
        UserLastname  => 'CustomerLastname' . $RandomID,
    },
);
$ConfigObject->Set(
    Key   => 'Ticket::EventModulePost###950-DynamicFieldFromCustomerUser',
    Value => {
        Module => 'Kernel::System::Ticket::Event::DynamicFieldFromCustomerUser',
        Event  => '(TicketCreate|TicketCustomerUpdate)',
    },
);

# create the required dynamic fields
my @DynamicFields = (
    {
        Name       => 'CustomerLogin' . $RandomID,
        Label      => 'CustomerLogin',
        FieldOrder => 9991,
    },
    {
        Name       => 'CustomerFirstname' . $RandomID,
        Label      => 'CustomerFirstname',
        FieldOrder => 9992,
    },
    {
        Name       => 'CustomerLastname' . $RandomID,
        Label      => 'CustomerLastname',
        FieldOrder => 9993,
    },
);

my @AddedDynamicFieldNames;
for my $DynamicFieldConfig (@DynamicFields) {

    my $ID = $DynamicFieldObject->DynamicFieldAdd(
        %{$DynamicFieldConfig},
        Config => {
            DefaultValue => '',
        },
        FieldType     => 'Text',
        ObjectType    => 'Ticket',
        InternalField => 0,
        Reorder       => 0,
        ValidID       => 1,
        UserID        => 1,
    );

    # sanity test
    $Self->IsNot(
        $ID,
        undef,
        "DynamicFieldAdd() for '$DynamicFieldConfig->{Label}' Field ID should be defined",
    );

    # remember the DynamicFieldName
    push @AddedDynamicFieldNames, $DynamicFieldConfig->{Name};
}

# create a customer user
my $TestUserLogin = $Helper->TestCustomerUserCreate();

# get customer user data
my %TestUserData = $CustomerUserObject->CustomerUserDataGet(
    User => $TestUserLogin,
);

# set customer Firstname and Lastname
$TestUserData{UserFirstname} = 'UserFirstName' . $RandomID;
$TestUserData{UserLastname}  = 'UserLastName' . $RandomID;

# update the user manually because First and LastNames are important
$CustomerUserObject->CustomerUserUpdate(
    %TestUserData,
    Source  => 'CustomerUser',
    ID      => $TestUserLogin,
    ValidID => 1,
    UserID  => 1,
);

# create a new ticket with the test user information
my $TicketID = $TicketObject->TicketCreate(
    Title        => 'Some Ticket Title',
    Queue        => 'Raw',
    Lock         => 'unlock',
    Priority     => '3 normal',
    State        => 'new',
    CustomerID   => $TestUserData{CustomerID},
    CustomerUser => $TestUserLogin,
    OwnerID      => 1,
    UserID       => 1,
);

# at this point the information should be already stored in the dynamic fields
# get ticket data (with DynamicFields)
my %Ticket = $TicketObject->TicketGet(
    TicketID      => $TicketID,
    DynamicFields => 1,
    UserID        => 1,
    Silent        => 0,
);

# test actual results with expected ones
for my $DynamicFieldName (@AddedDynamicFieldNames) {
    $Self->IsNot(
        $Ticket{ 'DynamicField_' . $DynamicFieldName },
        undef,
        "DynamicField $DynamicFieldName for Ticket ID:'$TicketID' should not be undef",
    );
}

$Self->Is(
    $Ticket{ 'DynamicField_CustomerLogin' . $RandomID },
    $TestUserLogin,
    "DynamicField 'CustomerLogin$RandomID' for Ticket ID:'$TicketID' match TestUser Login",
);
$Self->Is(
    $Ticket{ 'DynamicField_CustomerFirstname' . $RandomID },
    $TestUserData{UserFirstname},
    "DynamicField 'CustomerFirstname$RandomID' for Ticket ID:'$TicketID' match TestUser Firstname",
);
$Self->Is(
    $Ticket{ 'DynamicField_CustomerLastname' . $RandomID },
    $TestUserData{UserLastname},
    "DynamicField 'CustomerLastname$RandomID' for Ticket ID:'$TicketID' match TestUser Lastname",
);

# cleanup is done by RestoreDatabase.

1;
