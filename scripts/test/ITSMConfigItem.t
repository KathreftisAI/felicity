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

use vars qw($Self);

# get needed objects
my $DBObject             = $Kernel::OM->Get('Kernel::System::DB');
my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');
my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
my $LinkObject           = $Kernel::OM->Get('Kernel::System::LinkObject');
my $UserObject           = $Kernel::OM->Get('Kernel::System::User');

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

# define needed variable
my $RandomID = $Helper->GetRandomID();

# ------------------------------------------------------------ #
# make preparations
# ------------------------------------------------------------ #

# perform ConfigItemCount to fill the empty fields
$ConfigItemObject->ConfigItemCount();

# create needed users
my @UserIDs;
{

    # disable email checks to create new user
    my $CheckEmailAddressesOrg = $ConfigObject->Get('CheckEmailAddresses') || 1;
    $ConfigObject->Set(
        Key   => 'CheckEmailAddresses',
        Value => 0,
    );

    for my $Counter ( 1 .. 3 ) {

        # create new users for the tests
        my $UserID = $UserObject->UserAdd(
            UserFirstname => 'ITSMConfigItem' . $Counter,
            UserLastname  => 'UnitTest',
            UserLogin     => 'UnitTest-ITSMConfigItem-' . $Counter . $RandomID,
            UserEmail     => 'UnitTest-ITSMConfigItem-' . $Counter . '@localhost',
            ValidID       => 1,
            ChangeUserID  => 1,
        );

        push @UserIDs, $UserID;
    }

    # restore original email check param
    $ConfigObject->Set(
        Key   => 'CheckEmailAddresses',
        Value => $CheckEmailAddressesOrg,
    );
}

my $GeneralCatalogClass = 'UnitTest' . $RandomID;

# add a general catalog test list
for my $Name (qw(Test1 Test2 Test3 Test4)) {

    # add a new item
    my $ItemID = $GeneralCatalogObject->ItemAdd(
        Class   => $GeneralCatalogClass,
        Name    => $Name,
        ValidID => 1,
        UserID  => 1,
    );

    # check item id
    if ( !$ItemID ) {

        $Self->True(
            0,
            "Can't add new general catalog item.",
        );
    }
}

# define the first test definition (all provided data types)
my @ConfigItemDefinitions;
$ConfigItemDefinitions[0] = " [
    {
        Key        => 'Customer1',
        Name       => 'Customer 1',
        Searchable => 1,
        Input      => {
            Type => 'Customer',
        },
    },
    {
        Key        => 'Date1',
        Name       => 'Date 1',
        Searchable => 1,
        Input      => {
            Type => 'Date',
        },
    },
    {
        Key        => 'DateTime1',
        Name       => 'Date Time 1',
        Searchable => 1,
        Input      => {
            Type => 'DateTime',
        },
    },
    {
        Key   => 'Dummy1',
        Name  => 'Dummy 1',
        Input => {
            Type => 'Dummy',
        },
    },
    {
        Key        => 'GeneralCatalog1',
        Name       => 'GeneralCatalog 1',
        Searchable => 1,
        Input      => {
            Type  => 'GeneralCatalog',
            Class => '$GeneralCatalogClass',
        },
    },
    {
        Key        => 'Integer1',
        Name       => 'Integer 1',
        Searchable => 1,
        Input      => {
            Type => 'Integer',
        },
    },
    {
        Key        => 'Text1',
        Name       => 'Text 1',
        Searchable => 1,
        Input      => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 50,
        },
    },
    {
        Key        => 'TextArea1',
        Name       => 'TextArea 1',
        Searchable => 1,
        Input      => {
            Type => 'TextArea',
        },
    },
] ";

# define the second test definition (sub data types)
$ConfigItemDefinitions[1] = " [
    {
        Key        => 'Main1',
        Name       => 'Main 1',
        Searchable => 1,
        Input      => {
            Type      => 'Text',
            Size      => 50,
            MaxLength => 50,
        },
        CountMax => 10,
        Sub => [
            {
                Key        => 'Main1Sub1',
                Name       => 'Main 1 Sub 1',
                Searchable => 1,
                Input      => {
                    Type      => 'Text',
                    Size      => 50,
                    MaxLength => 50,
                },
                CountMax => 10,
                Sub => [
                    {
                        Key        => 'Main1Sub1SubSub1',
                        Name       => 'Main 1 Sub 1 SubSub 1',
                        Searchable => 1,
                        Input      => {
                            Type      => 'Text',
                            Size      => 50,
                            MaxLength => 50,
                        },
                        CountMax => 10,
                    },
                    {
                        Key        => 'Main1Sub1SubSub2',
                        Name       => 'Main 1 Sub 1 SubSub 2',
                        Searchable => 1,
                        Input      => {
                            Type => 'TextArea',
                        },
                        CountMax => 10,
                    },
                ],
            },
            {
                Key        => 'Main1Sub2',
                Name       => 'Main 1 Sub 2',
                Searchable => 1,
                Input      => {
                    Type => 'TextArea',
                },
                CountMax => 10,
            },
        ],
    },
    {
        Key        => 'Main2',
        Name       => 'Main 2',
        Searchable => 1,
        Input      => {
            Type => 'TextArea',
        },
        CountMax => 10,
        Sub => [
            {
                Key        => 'Main2Sub1',
                Name       => 'Main 2 Sub 1',
                Searchable => 1,
                Input      => {
                    Type      => 'Text',
                    Size      => 50,
                    MaxLength => 50,
                },
                CountMax => 10,
            },
            {
                Key        => 'Main2Sub2',
                Name       => 'Main 2 Sub 2',
                Searchable => 1,
                Input      => {
                    Type => 'TextArea',
                },
                CountMax => 10,
            },
        ],
    },
] ";

# define the third test definition (especially for search tests with XMLData)
$ConfigItemDefinitions[2] = " [
    {
        Key        => 'Customer1',
        Name       => 'Customer 1',
        Searchable => 1,
        Input      => {
            Type => 'Customer',
        },
    },
    {
        Key        => 'Date1',
        Name       => 'Date 1',
        Searchable => 1,
        Input      => {
            Type => 'Date',
        },
    },
    {
        Key        => 'DateTime1',
        Name       => 'Date Time 1',
        Searchable => 1,
        Input      => {
            Type => 'DateTime',
        },
    },
] ";

# define the fourth test definition (only for search tests)
$ConfigItemDefinitions[3] = " [
    {
        Key        => 'Customer1',
        Name       => 'Customer 1',
        Searchable => 1,
        Input      => {
            Type => 'Customer',
        },
    },
] ";

# add the test classes
my @ConfigItemClassIDs;
my @ConfigItemClasses;
my @ConfigItemDefinitionIDs;
for my $Definition (@ConfigItemDefinitions) {

    # generate a random name
    my $ClassName = 'UnitTest' . $Helper->GetRandomID();

    # add an unittest config item class
    my $ClassID = $GeneralCatalogObject->ItemAdd(
        Class   => 'ITSM::ConfigItem::Class',
        Name    => $ClassName,
        ValidID => 1,
        UserID  => 1,
    );

    # check class id
    if ( !$ClassID ) {

        $Self->True(
            0,
            "Can't add new config item class.",
        );
    }

    push @ConfigItemClassIDs, $ClassID;
    push @ConfigItemClasses,  $ClassName;

    # add a definition to the class
    my $DefinitionID = $ConfigItemObject->DefinitionAdd(
        ClassID    => $ClassID,
        Definition => $Definition,
        UserID     => 1,
    );

    # check definition id
    if ( !$DefinitionID ) {

        $Self->True(
            0,
            "Can't add new config item definition.",
        );
    }

    push @ConfigItemDefinitionIDs, $DefinitionID;
}

# test DefinitionList for those simple cases
my $Counter = 0;
for my $ClassID (@ConfigItemClassIDs) {
    my $DefinitionListRef = $ConfigItemObject->DefinitionList(
        ClassID => $ClassID,
    );

    # expect a single definition per config item class
    $Self->Is(
        scalar @{$DefinitionListRef},
        1,
        "DefinitionList() for class id $ClassID: got a single result",
    );

    # expect the remembered definition id in the first definition
    $Self->Is(
        $DefinitionListRef->[0]->{DefinitionID},
        $ConfigItemDefinitionIDs[$Counter],
        "DefinitionList() for class id $ClassID: got expected definition id",
    );

    $Counter++;
}

# create some random numbers
my @ConfigItemNumbers;
for ( 1 .. 100 ) {
    push @ConfigItemNumbers, $Helper->GetRandomNumber();
}

# get class list
my $ClassList = $GeneralCatalogObject->ItemList(
    Class => 'ITSM::ConfigItem::Class',
);
my %ClassListReverse = reverse %{$ClassList};

# get deployment state list
my $DeplStateList = $GeneralCatalogObject->ItemList(
    Class => 'ITSM::ConfigItem::DeploymentState',
);
my %DeplStateListReverse = reverse %{$DeplStateList};

# get incident state list
my $InciStateList = $GeneralCatalogObject->ItemList(
    Class => 'ITSM::Core::IncidentState',
);
my %InciStateListReverse = reverse %{$InciStateList};

# get general catalog test list
my $GeneralCatalogList = $GeneralCatalogObject->ItemList(
    Class => $GeneralCatalogClass,
);
my %GeneralCatalogListReverse = reverse %{$GeneralCatalogList};

# ------------------------------------------------------------ #
# define general config item tests
# ------------------------------------------------------------ #

my $ConfigItemTests = [

    # ConfigItemAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                UserID => 1,
            },
        },
    },

    # ConfigItemAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                ClassID => $ConfigItemClassIDs[0],
            },
        },
    },

    # invalid class id is given (check return false)
    {
        SourceData => {
            ConfigItemAdd => {
                ClassID => $ConfigItemClassIDs[-1] + 1,
                UserID  => 1,
            },
        },
    },

    # all required config item values are given (check returned config item values)
    {
        SourceData => {
            ConfigItemAdd => {
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
        },
        ReferenceData => {
            ConfigItemGet => {
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # all required config item values are given (check number attribute)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[0],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => $UserIDs[1],
            },
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[0],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => $UserIDs[1],
                ChangeBy         => $UserIDs[1],
            },
        },
    },

    # config item with this number already exists (check return false)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[0],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
        },
    },

    # VersionAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[1],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[1],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # VersionAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[2],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name        => 'UnitTest - Class 1 ConfigItem 2 Version 1',
                    DeplStateID => $DeplStateListReverse{Production},
                    InciStateID => $InciStateListReverse{Operational},
                    UserID      => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[2],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # VersionAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[3],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 3 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[3],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # VersionAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[4],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 4 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[4],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # VersionAdd doesn't contains all data (check required attributes)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[5],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => $UserIDs[1],
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 5 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[5],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => $UserIDs[1],
                ChangeBy         => $UserIDs[1],
            },
        },
    },

    # invalid deployment state id is given (check returned values)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[6],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 6 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => 9999999,
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[6],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # invalid incident state id is given (check returned values)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[7],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 7 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => 9999999,
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[7],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                LastVersionID    => undef,
                CurDeplStateID   => undef,
                CurDeplState     => undef,
                CurDeplStateType => undef,
                CurInciStateID   => undef,
                CurInciState     => undef,
                CurInciStateType => undef,
                CreateBy         => 1,
                ChangeBy         => 1,
            },
        },
    },

    # all required values are given (check returned values)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[8],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 8 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[8],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                CurDeplStateID   => $DeplStateListReverse{Production},
                CurDeplState     => 'Production',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Operational},
                CurInciState     => 'Operational',
                CurInciStateType => 'operational',
                CreateBy         => 1,
                ChangeBy         => 1,
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[8],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Class 1 ConfigItem 8 Version 1',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Production},
                    CurDeplState     => 'Production',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Operational},
                    CurInciState     => 'Operational',
                    CurInciStateType => 'operational',
                    XMLData          => [],
                    CreateBy         => 1,
                },
            ],
        },
    },

    # all required values are given (general check with two versions)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[9],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 9 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 9 Version 2',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => $UserIDs[1],
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[9],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                CurDeplStateID   => $DeplStateListReverse{Production},
                CurDeplState     => 'Production',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Operational},
                CurInciState     => 'Operational',
                CurInciStateType => 'operational',
                CreateBy         => 1,
                ChangeBy         => $UserIDs[1],
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[9],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Class 1 ConfigItem 9 Version 1',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Production},
                    CurDeplState     => 'Production',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Operational},
                    CurInciState     => 'Operational',
                    CurInciStateType => 'operational',
                    XMLData          => [],
                    CreateBy         => 1,
                },
                {
                    Number           => $ConfigItemNumbers[9],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Class 1 ConfigItem 9 Version 2',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Production},
                    CurDeplState     => 'Production',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Operational},
                    CurInciState     => 'Operational',
                    CurInciStateType => 'operational',
                    XMLData          => [],
                    CreateBy         => $UserIDs[1],
                },
            ],
        },
    },

    # all required values are given (check the calculation of deployment and incident state)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[10],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 10 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Planned},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
                {
                    Name         => 'UnitTest - Class 1 ConfigItem 10 Version 2',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Maintenance},
                    InciStateID  => $InciStateListReverse{Incident},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[10],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                CurDeplStateID   => $DeplStateListReverse{Maintenance},
                CurDeplState     => 'Maintenance',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Incident},
                CurInciState     => 'Incident',
                CurInciStateType => 'incident',
                CreateBy         => 1,
                ChangeBy         => 1,
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[10],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Class 1 ConfigItem 10 Version 1',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Planned},
                    DeplState        => 'Planned',
                    DeplStateType    => 'preproductive',
                    CurDeplStateID   => $DeplStateListReverse{Maintenance},
                    CurDeplState     => 'Maintenance',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => 1,
                },
                {
                    Number           => $ConfigItemNumbers[10],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Class 1 ConfigItem 10 Version 2',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Maintenance},
                    DeplState        => 'Maintenance',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Maintenance},
                    CurDeplState     => 'Maintenance',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Incident},
                    InciState        => 'Incident',
                    InciStateType    => 'incident',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => 1,
                },
            ],
        },
    },

    # add config item only for later search tests
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[50],
                ClassID => $ConfigItemClassIDs[2],
                UserID  => $UserIDs[2],
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 3 ConfigItem 1 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[2],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Incident},
                    UserID       => $UserIDs[2],
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[50],
                ClassID          => $ConfigItemClassIDs[2],
                Class            => $ClassList->{ $ConfigItemClassIDs[2] },
                CurDeplStateID   => $DeplStateListReverse{Production},
                CurDeplState     => 'Production',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Incident},
                CurInciState     => 'Incident',
                CurInciStateType => 'incident',
                CreateBy         => $UserIDs[2],
                ChangeBy         => $UserIDs[2],
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[50],
                    ClassID          => $ConfigItemClassIDs[2],
                    Class            => $ClassList->{ $ConfigItemClassIDs[2] },
                    Name             => 'UnitTest - Class 3 ConfigItem 1 Version 1',
                    DefinitionID     => $ConfigItemDefinitionIDs[2],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Production},
                    CurDeplState     => 'Production',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Incident},
                    InciState        => 'Incident',
                    InciStateType    => 'incident',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => $UserIDs[2],
                },
            ],
        },
    },

    # add config item only for later search tests
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[51],
                ClassID => $ConfigItemClassIDs[2],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 3 ConfigItem 2 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[2],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
                {
                    Name         => 'UnitTest - Class 3 ConfigItem 2 Version 2',
                    DefinitionID => $ConfigItemDefinitionIDs[2],
                    DeplStateID  => $DeplStateListReverse{Maintenance},
                    InciStateID  => $InciStateListReverse{Incident},
                    UserID       => $UserIDs[1],
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[51],
                ClassID          => $ConfigItemClassIDs[2],
                Class            => $ClassList->{ $ConfigItemClassIDs[2] },
                CurDeplStateID   => $DeplStateListReverse{Maintenance},
                CurDeplState     => 'Maintenance',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Incident},
                CurInciState     => 'Incident',
                CurInciStateType => 'incident',
                CreateBy         => 1,
                ChangeBy         => $UserIDs[1],
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[51],
                    ClassID          => $ConfigItemClassIDs[2],
                    Class            => $ClassList->{ $ConfigItemClassIDs[2] },
                    Name             => 'UnitTest - Class 3 ConfigItem 2 Version 1',
                    DefinitionID     => $ConfigItemDefinitionIDs[2],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Maintenance},
                    CurDeplState     => 'Maintenance',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => 1,
                },
                {
                    Number           => $ConfigItemNumbers[51],
                    ClassID          => $ConfigItemClassIDs[2],
                    Class            => $ClassList->{ $ConfigItemClassIDs[2] },
                    Name             => 'UnitTest - Class 3 ConfigItem 2 Version 2',
                    DefinitionID     => $ConfigItemDefinitionIDs[2],
                    DeplStateID      => $DeplStateListReverse{Maintenance},
                    DeplState        => 'Maintenance',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Maintenance},
                    CurDeplState     => 'Maintenance',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Incident},
                    InciState        => 'Incident',
                    InciStateType    => 'incident',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => $UserIDs[1],
                },
            ],
        },
    },

    # add config item only for later search tests, including XMLData
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[52],
                ClassID => $ConfigItemClassIDs[2],
                UserID  => $UserIDs[2],
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 3 ConfigItem 3 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[2],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Incident},
                    UserID       => $UserIDs[2],
                    XMLData      => [
                        undef,
                        {
                            Version => [
                                undef,
                                {
                                    Customer1 => [
                                        undef,
                                        {
                                            Content => 'dummy_customer_for_unitest',
                                        },
                                    ],
                                    Date1 => [
                                        undef,
                                        {
                                            Content => '2010-02-12',
                                        },
                                    ],
                                    DateTime1 => [
                                        undef,
                                        {
                                            Content => '2010-02-12 09:14',
                                        },
                                    ],
                                },
                            ],
                        },
                    ],
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[52],
                ClassID          => $ConfigItemClassIDs[2],
                Class            => $ClassList->{ $ConfigItemClassIDs[2] },
                CurDeplStateID   => $DeplStateListReverse{Production},
                CurDeplState     => 'Production',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Incident},
                CurInciState     => 'Incident',
                CurInciStateType => 'incident',
                CreateBy         => $UserIDs[2],
                ChangeBy         => $UserIDs[2],
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[52],
                    ClassID          => $ConfigItemClassIDs[2],
                    Class            => $ClassList->{ $ConfigItemClassIDs[2] },
                    Name             => 'UnitTest - Class 3 ConfigItem 3 Version 1',
                    DefinitionID     => $ConfigItemDefinitionIDs[2],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Production},
                    CurDeplState     => 'Production',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Incident},
                    InciState        => 'Incident',
                    InciStateType    => 'incident',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [
                        undef,
                        {
                            'TagKey'  => '[1]',
                            'Version' => [
                                undef,
                                {
                                    'Customer1' => [
                                        undef,
                                        {
                                            'Content' => 'dummy_customer_for_unitest',
                                            'TagKey'  => '[1]{\'Version\'}[1]{\'Customer1\'}[1]',
                                        },
                                    ],
                                    'Date1' => [
                                        undef,
                                        {
                                            'Content' => '2010-02-12',
                                            'TagKey'  => '[1]{\'Version\'}[1]{\'Date1\'}[1]',
                                        },
                                    ],
                                    'DateTime1' => [
                                        undef,
                                        {
                                            'Content' => '2010-02-12 09:14',
                                            'TagKey'  => '[1]{\'Version\'}[1]{\'DateTime1\'}[1]',
                                        },
                                    ],
                                    'TagKey' => '[1]{\'Version\'}[1]',
                                },
                            ],
                        },
                    ],
                    CreateBy => $UserIDs[2],
                },
            ],
        },
    },

    # add config item only for later search tests
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[60],
                ClassID => $ConfigItemClassIDs[3],
                UserID  => $UserIDs[1],
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Class 4 ConfigItem 1 Version 1',
                    DefinitionID => $ConfigItemDefinitionIDs[2],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => $UserIDs[1],
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[60],
                ClassID          => $ConfigItemClassIDs[3],
                Class            => $ClassList->{ $ConfigItemClassIDs[3] },
                CurDeplStateID   => $DeplStateListReverse{Production},
                CurDeplState     => 'Production',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Operational},
                CurInciState     => 'Operational',
                CurInciStateType => 'operational',
                CreateBy         => $UserIDs[1],
                ChangeBy         => $UserIDs[1],
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[60],
                    ClassID          => $ConfigItemClassIDs[3],
                    Class            => $ClassList->{ $ConfigItemClassIDs[3] },
                    Name             => 'UnitTest - Class 4 ConfigItem 1 Version 1',
                    DefinitionID     => $ConfigItemDefinitionIDs[2],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Production},
                    CurDeplState     => 'Production',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Operational},
                    CurInciState     => 'Operational',
                    CurInciStateType => 'operational',
                    XMLData          => [],
                    CreateBy         => $UserIDs[1],
                },
            ],
        },
    },

    # added to check history functions
    # all required values are given (check the calculation of deployment and incident state)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[70],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - HistoryTest',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Planned},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
                {
                    Name         => 'UnitTest - HistoryTest Version 2',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Maintenance},
                    InciStateID  => $InciStateListReverse{Incident},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[70],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                CurDeplStateID   => $DeplStateListReverse{Maintenance},
                CurDeplState     => 'Maintenance',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Incident},
                CurInciState     => 'Incident',
                CurInciStateType => 'incident',
                CreateBy         => 1,
                ChangeBy         => 1,
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[70],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - HistoryTest',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Planned},
                    DeplState        => 'Planned',
                    DeplStateType    => 'preproductive',
                    CurDeplStateID   => $DeplStateListReverse{Maintenance},
                    CurDeplState     => 'Maintenance',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => 1,
                },
                {
                    Number           => $ConfigItemNumbers[70],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - HistoryTest Version 2',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Maintenance},
                    DeplState        => 'Maintenance',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Maintenance},
                    CurDeplState     => 'Maintenance',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Incident},
                    InciState        => 'Incident',
                    InciStateType    => 'incident',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => 1,
                },
            ],
            HistoryGet => [
                {
                    HistoryType   => 'ConfigItemCreate',
                    HistoryTypeID => 1,
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'VersionCreate',
                    HistoryTypeID => 6,
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'DefinitionUpdate',
                    HistoryTypeID => 8,
                    Comment       => $ConfigItemDefinitionIDs[0],
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'NameUpdate',
                    HistoryTypeID => 5,
                    Comment       => 'UnitTest - HistoryTest%%',
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'IncidentStateUpdate',
                    HistoryTypeID => 9,
                    Comment       => $InciStateListReverse{Operational} . '%%',
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'DeploymentStateUpdate',
                    HistoryTypeID => 10,
                    Comment       => $DeplStateListReverse{Planned} . '%%',
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'VersionCreate',
                    HistoryTypeID => 6,
                    CreateBy      => 1,
                },
                {
                    HistoryType   => 'NameUpdate',
                    HistoryTypeID => 5,
                    Comment =>
                        'UnitTest - HistoryTest Version 2%%UnitTest - HistoryTest',
                    CreateBy => 1,
                },
                {
                    HistoryType   => 'IncidentStateUpdate',
                    HistoryTypeID => 9,
                    Comment       => $InciStateListReverse{Incident} . '%%'
                        . $InciStateListReverse{Operational},
                    CreateBy => 1,
                },
                {
                    HistoryType   => 'DeploymentStateUpdate',
                    HistoryTypeID => 10,
                    Comment       => $DeplStateListReverse{Maintenance} . '%%'
                        . $DeplStateListReverse{Planned},
                    CreateBy => 1,
                },
            ],
        },
    },

    # added for Bug4196
    # all required values are given (check the calculation of deployment and incident state)
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[71],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Bugfix4196',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Planned},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
                {
                    Name         => 'UnitTest - Bugfix4196 V2',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Maintenance},
                    InciStateID  => $InciStateListReverse{Incident},
                    UserID       => 1,
                },
                {
                    Name         => 'UnitTest - Bugfix4196 V2',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Maintenance},
                    InciStateID  => $InciStateListReverse{Incident},
                    UserID       => 1,
                },
                {
                    Name         => 'UnitTest - Bugfix4196 V2',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Maintenance},
                    InciStateID  => $InciStateListReverse{Incident},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[71],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                CurDeplStateID   => $DeplStateListReverse{Maintenance},
                CurDeplState     => 'Maintenance',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Incident},
                CurInciState     => 'Incident',
                CurInciStateType => 'incident',
                CreateBy         => 1,
                ChangeBy         => 1,
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[71],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Bugfix4196',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Planned},
                    DeplState        => 'Planned',
                    DeplStateType    => 'preproductive',
                    CurDeplStateID   => $DeplStateListReverse{Maintenance},
                    CurDeplState     => 'Maintenance',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => 1,
                },
                {
                    Number           => $ConfigItemNumbers[71],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Bugfix4196 V2',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Maintenance},
                    DeplState        => 'Maintenance',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Maintenance},
                    CurDeplState     => 'Maintenance',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Incident},
                    InciState        => 'Incident',
                    InciStateType    => 'incident',
                    CurInciStateID   => $InciStateListReverse{Incident},
                    CurInciState     => 'Incident',
                    CurInciStateType => 'incident',
                    XMLData          => [],
                    CreateBy         => 1,
                },
            ],
        },
    },

    # added for Bug 4377 - CI-A
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[72],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Bugfix4377 - CI-A',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[72],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                CurDeplStateID   => $DeplStateListReverse{Production},
                CurDeplState     => 'Production',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Operational},
                CurInciState     => 'Operational',
                CurInciStateType => 'operational',
                CreateBy         => 1,
                ChangeBy         => 1,
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[72],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Bugfix4377 - CI-A',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Production},
                    CurDeplState     => 'Production',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Operational},
                    CurInciState     => 'Operational',
                    CurInciStateType => 'operational',
                    XMLData          => [],
                    CreateBy         => 1,
                },
            ],
        },
    },

    # added for Bug 4377 - CI-B
    {
        SourceData => {
            ConfigItemAdd => {
                Number  => $ConfigItemNumbers[73],
                ClassID => $ConfigItemClassIDs[0],
                UserID  => 1,
            },
            VersionAdd => [
                {
                    Name         => 'UnitTest - Bugfix4377 - CI-B',
                    DefinitionID => $ConfigItemDefinitionIDs[0],
                    DeplStateID  => $DeplStateListReverse{Production},
                    InciStateID  => $InciStateListReverse{Operational},
                    UserID       => 1,
                },
            ],
        },
        ReferenceData => {
            ConfigItemGet => {
                Number           => $ConfigItemNumbers[73],
                ClassID          => $ConfigItemClassIDs[0],
                Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                CurDeplStateID   => $DeplStateListReverse{Production},
                CurDeplState     => 'Production',
                CurDeplStateType => 'productive',
                CurInciStateID   => $InciStateListReverse{Operational},
                CurInciState     => 'Operational',
                CurInciStateType => 'operational',
                CreateBy         => 1,
                ChangeBy         => 1,
            },
            VersionGet => [
                {
                    Number           => $ConfigItemNumbers[73],
                    ClassID          => $ConfigItemClassIDs[0],
                    Class            => $ClassList->{ $ConfigItemClassIDs[0] },
                    Name             => 'UnitTest - Bugfix4377 - CI-B',
                    DefinitionID     => $ConfigItemDefinitionIDs[0],
                    DeplStateID      => $DeplStateListReverse{Production},
                    DeplState        => 'Production',
                    DeplStateType    => 'productive',
                    CurDeplStateID   => $DeplStateListReverse{Production},
                    CurDeplState     => 'Production',
                    CurDeplStateType => 'productive',
                    InciStateID      => $InciStateListReverse{Operational},
                    InciState        => 'Operational',
                    InciStateType    => 'operational',
                    CurInciStateID   => $InciStateListReverse{Operational},
                    CurInciState     => 'Operational',
                    CurInciStateType => 'operational',
                    XMLData          => [],
                    CreateBy         => 1,
                },
            ],
        },
    },

];

# ------------------------------------------------------------ #
# run general config item tests
# ------------------------------------------------------------ #

my $TestCount = 1;
my @ConfigItemIDs;

TEST:
for my $Test ( @{$ConfigItemTests} ) {

    # check SourceData attribute
    if ( !$Test->{SourceData} || ref $Test->{SourceData} ne 'HASH' ) {

        $Self->True(
            0,
            "Test $TestCount: No SourceData found for this test.",
        );

        next TEST;
    }

    # extract source data
    my $SourceData = $Test->{SourceData};

    # add a new config item
    my $ConfigItemID;
    if ( $SourceData->{ConfigItemAdd} ) {

        # add the new config item
        $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
            %{ $SourceData->{ConfigItemAdd} },
        );

        if ($ConfigItemID) {
            push @ConfigItemIDs, $ConfigItemID;
        }
    }

    # check the config item
    if ( $Test->{ReferenceData} && $Test->{ReferenceData}->{ConfigItemGet} ) {

        $Self->True(
            $ConfigItemID,
            "Test $TestCount: ConfigItemAdd() - Add new config item. Insert success.",
        );

        next TEST if !$ConfigItemID;
    }
    else {

        $Self->False(
            $ConfigItemID,
            "Test $TestCount: ConfigItemAdd() - Add new config item. Return false.",
        );
    }

    # add all defined versions
    my @VersionIDs;
    my %VersionIDsSeen;
    if ( $SourceData->{VersionAdd} ) {

        for my $Version ( @{ $SourceData->{VersionAdd} } ) {

            if ($ConfigItemID) {
                $Version->{ConfigItemID} = $ConfigItemID;
            }

            # add a new version
            my $VersionID = $ConfigItemObject->VersionAdd(
                %{$Version},
            );

            if ($VersionID) {
                push @VersionIDs, $VersionID if !$VersionIDsSeen{$VersionID}++;
            }
        }
    }

    # check the config item
    my $ConfigItemData;
    if ( $Test->{ReferenceData} && $Test->{ReferenceData}->{ConfigItemGet} ) {

        # get the config item data
        $ConfigItemData = $ConfigItemObject->ConfigItemGet(
            ConfigItemID => $ConfigItemID,
        );

        if ( !$ConfigItemData ) {

            $Self->True(
                0,
                "Test $TestCount: ConfigItemGet() - get config item data."
            );
        }

        # check all config item attributes
        my $Counter = 0;
        for my $Attribute ( sort keys %{ $Test->{ReferenceData}->{ConfigItemGet} } ) {

            # set content if values are undef
            if ( !defined $ConfigItemData->{$Attribute} ) {
                $ConfigItemData->{$Attribute} = 'UNDEF-unittest';
            }
            if ( !defined $Test->{ReferenceData}->{ConfigItemGet}->{$Attribute} ) {
                $Test->{ReferenceData}->{ConfigItemGet}->{$Attribute} = 'UNDEF-unittest';
            }

            # check attributes
            $Self->Is(
                $ConfigItemData->{$Attribute},
                $Test->{ReferenceData}->{ConfigItemGet}->{$Attribute},
                "Test $TestCount: ConfigItemGet() - $Attribute",
            );

            $Counter++;
        }
    }

    # check the versions
    if (
        $Test->{ReferenceData}
        && $Test->{ReferenceData}->{VersionGet}
        && @{ $Test->{ReferenceData}->{VersionGet} }
        )
    {

        $Self->Is(
            scalar @VersionIDs,
            scalar @{ $Test->{ReferenceData}->{VersionGet} },
            "Test $TestCount: VersionAdd() - correct number of versions",
        );

        next TEST if !$ConfigItemID;
    }
    else {

        $Self->False(
            scalar @VersionIDs,
            "Test $TestCount: VersionAdd() - no versions exits",
        );
    }

    next TEST if !$Test->{ReferenceData};
    next TEST if !$Test->{ReferenceData}->{VersionGet};

    my $Counter           = 0;
    my $LastVersionIDMust = 'UNDEF-unittest';
    VERSIONID:
    for my $VersionID (@VersionIDs) {

        # get this version
        my $VersionData = $ConfigItemObject->VersionGet(
            VersionID  => $VersionID,
            XMLDataGet => 1,
        );

        if ( !$VersionData ) {

            $Self->True(
                0,
                "Test $TestCount: VersionGet() - get version data."
            );

            next VERSIONID;
        }

        # save last version id
        $LastVersionIDMust = $VersionData->{VersionID};

        # check all version attributes
        for my $Attribute ( sort keys %{ $Test->{ReferenceData}->{VersionGet}->[$Counter] } ) {

            # extract the needed attributes
            my $VersionAttribute   = $VersionData->{$Attribute};
            my $ReferenceAttribute = $Test->{ReferenceData}->{VersionGet}->[$Counter]->{$Attribute};

            # set content if values are undef
            if ( !defined $VersionAttribute ) {
                $VersionAttribute = 'UNDEF-unittest';
            }
            if ( !defined $ReferenceAttribute ) {
                $ReferenceAttribute = 'UNDEF-unittest';
            }

            # check attributes
            $Self->IsDeeply(
                $VersionAttribute,
                $ReferenceAttribute,
                "Test $TestCount: VersionGet() - $Attribute",
            );
        }

        $Counter++;
    }

    # prepare last version id
    my $LastVersionIDActual = 'UNDEF-unittest';
    if ( $ConfigItemData->{LastVersionID} ) {
        $LastVersionIDActual = $ConfigItemData->{LastVersionID};
    }

    # check last version id
    $Self->Is(
        $ConfigItemData->{LastVersionID},
        $LastVersionIDMust,
        "Test $TestCount: last version id identical",
    );

    # check history entries
    if (
        $Test->{ReferenceData}
        && $Test->{ReferenceData}->{HistoryGet}
        && @{ $Test->{ReferenceData}->{HistoryGet} }
        )
    {
        my $CompleteHistory = $ConfigItemObject->HistoryGet(
            ConfigItemID => $ConfigItemID,
        );

        # check nr of history entries
        $Self->Is(
            scalar @{ $Test->{ReferenceData}->{HistoryGet} },
            scalar @{$CompleteHistory},
            "Test $TestCount: nr of history entries",
        );

        CHECKNR: for my $CheckNr ( 0 .. $#{$CompleteHistory} ) {
            my $Check = $Test->{ReferenceData}->{HistoryGet}->[$CheckNr];
            my $Data  = $CompleteHistory->[$CheckNr];

            next CHECKNR if !( $Check && $Data );

            for my $Key ( sort keys %{$Check} ) {

                # check history data
                $Self->Is(
                    $Check->{$Key},
                    $Data->{$Key},
                    "Test $TestCount: $Key",
                );
            }
        }
    }
}
continue {
    $TestCount++;
}

# ------------------------------------------------------------ #
# test for bugfix 4377
# ------------------------------------------------------------ #

{

    my $CI1 = $ConfigItemObject->ConfigItemLookup(
        ConfigItemNumber => $ConfigItemNumbers[72],
    );

    my $CI2 = $ConfigItemObject->ConfigItemLookup(
        ConfigItemNumber => $ConfigItemNumbers[73],
    );

    # link the CI with a CI
    my $LinkResult = $LinkObject->LinkAdd(
        SourceObject => 'ITSMConfigItem',
        SourceKey    => $CI1,
        TargetObject => 'ITSMConfigItem',
        TargetKey    => $CI2,
        Type         => 'DependsOn',
        State        => 'Valid',
        UserID       => 1,
    );

    # update incident state of CI1
    my $VersionID = $ConfigItemObject->VersionAdd(
        ConfigItemID => $CI1,
        Name         => 'UnitTest - Bugfix4377 - CI-A',
        DefinitionID => $ConfigItemDefinitionIDs[0],
        DeplStateID  => $DeplStateListReverse{Production},
        InciStateID  => $InciStateListReverse{Incident},
        UserID       => 1,
    );

    # check if version could be added
    $Self->True(
        $VersionID,
        "Test $TestCount: VersionAdd() for $CI1 - Set to 'Incident'",
    );

    # get the latest version for CI1
    my $VersionRef = $ConfigItemObject->VersionGet(
        ConfigItemID => $CI1,
    );

    # check if incident state of CI1 is 'Incident'
    $Self->Is(
        $VersionRef->{CurInciState},
        'Incident',
        "Test $TestCount: Current incident state of CI $CI1",
    );

    # get the latest version for CI2
    $VersionRef = $ConfigItemObject->VersionGet(
        ConfigItemID => $CI2,
    );

    # check if incident state of CI2 is 'Warning'
    $Self->Is(
        $VersionRef->{CurInciState},
        'Warning',
        "Test $TestCount: Current incident state of CI $CI2",
    );

    # update incident state of CI2 to 'Incident'
    $VersionID = $ConfigItemObject->VersionAdd(
        ConfigItemID => $CI2,
        Name         => 'UnitTest - Bugfix4377 - CI-B',
        DefinitionID => $ConfigItemDefinitionIDs[0],
        DeplStateID  => $DeplStateListReverse{Production},
        InciStateID  => $InciStateListReverse{Incident},
        UserID       => 1,
    );

    # check if version could be added
    $Self->True(
        $VersionID,
        "Test $TestCount: VersionAdd() for CI $CI2 - Set to 'Incident'",
    );

    # get the latest version for CI2
    $VersionRef = $ConfigItemObject->VersionGet(
        ConfigItemID => $CI2,
    );

    # check if incident state of CI2 is 'Incident'
    $Self->Is(
        $VersionRef->{CurInciState},
        'Incident',
        "Test $TestCount: Current incident state of CI $CI2",
    );

    # update incident state of CI1 to 'Operational'
    $VersionID = $ConfigItemObject->VersionAdd(
        ConfigItemID => $CI1,
        Name         => 'UnitTest - Bugfix4377 - CI-A',
        DefinitionID => $ConfigItemDefinitionIDs[0],
        DeplStateID  => $DeplStateListReverse{Production},
        InciStateID  => $InciStateListReverse{Operational},
        UserID       => 1,
    );

    # check if version could be added
    $Self->True(
        $VersionID,
        "Test $TestCount: VersionAdd() for CI $CI1 - Set to 'Operational'",
    );

    # get the latest version for CI1
    $VersionRef = $ConfigItemObject->VersionGet(
        ConfigItemID => $CI1,
    );

    # check if incident state of CI1 is 'Warning' (because of linked CI2 in state 'incident')
    $Self->Is(
        $VersionRef->{CurInciState},
        'Warning',
        "Test $TestCount: Current incident state of CI $CI1",
    );

    # update incident state of CI2 to 'Operational'
    $VersionID = $ConfigItemObject->VersionAdd(
        ConfigItemID => $CI2,
        Name         => 'UnitTest - Bugfix4377 - CI-B',
        DefinitionID => $ConfigItemDefinitionIDs[0],
        DeplStateID  => $DeplStateListReverse{Production},
        InciStateID  => $InciStateListReverse{Operational},
        UserID       => 1,
    );

    # check if version could be added
    $Self->True(
        $VersionID,
        "Test $TestCount: VersionAdd() for CI $CI2 - Set to 'Operational'",
    );

    # get the latest version for CI1
    $VersionRef = $ConfigItemObject->VersionGet(
        ConfigItemID => $CI1,
    );

    # check if incident state of CI1 is 'Operational'
    $Self->Is(
        $VersionRef->{CurInciState},
        'Operational',
        "Test $TestCount: Current incident state of CI $CI1",
    );

    # get the latest version for CI2
    $VersionRef = $ConfigItemObject->VersionGet(
        ConfigItemID => $CI2,
    );

    # check if incident state of CI2 is 'Warning'
    $Self->Is(
        $VersionRef->{CurInciState},
        'Operational',
        "Test $TestCount: Current incident state of CI $CI2",
    );

    # increase the test counter
    $TestCount++;
}

# ------------------------------------------------------------ #
# test for bugfix 10356
# ------------------------------------------------------------ #

{

    my $CI1 = $ConfigItemObject->ConfigItemLookup(
        ConfigItemNumber => $ConfigItemNumbers[72],
    );

    # add a version, set incident state to incident
    my $VersionID = $ConfigItemObject->VersionAdd(
        ConfigItemID => $CI1,
        Name         => 'UnitTest - Bugfix10356',
        DefinitionID => $ConfigItemDefinitionIDs[0],
        DeplStateID  => $DeplStateListReverse{Production},
        InciStateID  => $InciStateListReverse{Incident},
        UserID       => 1,
    );

    # check if version could be added
    $Self->True(
        $VersionID,
        "Test $TestCount: VersionAdd() for $CI1 - Set to 'Incident'",
    );

    # get the latest version for CI1
    my $VersionRef = $ConfigItemObject->VersionGet(
        ConfigItemID => $CI1,
    );

    # check if incident state of CI1 is 'Incident'
    $Self->Is(
        $VersionRef->{CurInciState},
        'Incident',
        "Test $TestCount: Current incident state of CI $CI1",
    );

    # delete the last version
    my $VersionDeleteSuccess = $ConfigItemObject->VersionDelete(
        VersionID => $VersionRef->{VersionID},
        UserID    => 1,
    );

    # check if version could be deleted
    $Self->True(
        $VersionDeleteSuccess,
        "Test $TestCount: VersionDelete() for $CI1'",
    );

    # get the history
    my $HistoryRef = $ConfigItemObject->HistoryGet(
        ConfigItemID => $CI1,
    );

    my $LastHistoryEntry = pop @{$HistoryRef};

    # check if last history entry has the correct history type
    $Self->Is(
        $LastHistoryEntry->{HistoryType},
        'VersionDelete',
        "Test $TestCount: HistoryType of last version of CI $CI1",
    );

    # increase the test counter
    $TestCount++;
}

# ------------------------------------------------------------ #
# define general config item search tests
# ------------------------------------------------------------ #

my @SearchTests = (

    # search ALL config items in the two test classes
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the number param
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            Number => $ConfigItemNumbers[50],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
        ],
    },

    # test the number param with wildcards
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            Number => '*' . $ConfigItemNumbers[50] . '*',
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
        ],
    },

    # test the number param with wildcards but with deactivated wildcard feature
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            Number         => '*' . $ConfigItemNumbers[50] . '*',
            UsingWildcards => 0,
        },
        ReferenceData => [],
    },

    # test the deployment state param in combination of the class id
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [ $DeplStateListReverse{Production} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the deployment state param in combination of the class id
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [ $DeplStateListReverse{Maintenance} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
        ],
    },

    # test the deployment state param in combination of the class id
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [
                $DeplStateListReverse{Production},
                $DeplStateListReverse{Maintenance},
            ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the incident state param in combination of the class id
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [ $InciStateListReverse{Operational} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[60],
        ],
    },

    # test the incident state param in combination of the class id
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [ $InciStateListReverse{Incident} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
        ],
    },

    # test the incident state param in combination of the class id
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [
                $InciStateListReverse{Incident},
                $InciStateListReverse{Operational},
            ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the order by param
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs         => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            OrderBy          => ['CreateBy'],
            OrderByDirection => ['Up'],
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[52],
        ],
    },

    # test the limit param
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit    => 100,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the limit param
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit    => 3,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
        ],
    },

    # test the limit param
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit    => 2,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
        ],
    },

    # test the limit param
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit    => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
        ],
    },

    # test the limit param
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit    => 0,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the create by param
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            CreateBy => [ $UserIDs[2] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[52],
        ],
    },

    # test the create by param in combination of the class id
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            CreateBy => [ $UserIDs[1],            $UserIDs[2] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the change by param
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ChangeBy => [ $UserIDs[2] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[52],
        ],
    },

    # test the change by param in combination of the class id
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            ChangeBy => [1],
        },
        ReferenceData => [],
    },

    # test the change by param in combination of the class id
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            ChangeBy => [ $UserIDs[1] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the change by param in combination of the class id
    {
        Function   => [ 'ConfigItemSearchExtended', 'ConfigItemSearch' ],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            ChangeBy => [ $UserIDs[2] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[52],
        ],
    },

    # search ALL config items in the two test classes using the version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the name param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name     => 'UnitTest - Class 3 ConfigItem 1 Version 1',
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
        ],
    },

    # test the name param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name     => 'UnitTest - Class 3 ConfigItem 3 Version 1',
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test the name param with an wildcard
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name     => 'UnitTest - * 1',
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the name param with an wildcard and a previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name                  => 'UnitTest - * 1',
            ClassIDs              => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the name param with wildcards
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name     => 'UnitTest - Class 3*',
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
        ],
    },

    # test the name param with wildcards but with deactivated wildcard feature
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name           => 'UnitTest - Class 3*',
            ClassIDs       => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            UsingWildcards => 0,
        },
        ReferenceData => [],
    },

    # test the last version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name     => 'UnitTest - Class 3 ConfigItem 2 Version 1',
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
        },
        ReferenceData => [],
    },

    # test the PreviousVersionSearch param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            Name                  => 'UnitTest - Class 3 ConfigItem 2 Version 1',
            ClassIDs              => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
        ],
    },

    # test the limit param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit    => 100,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the limit param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit    => 3,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
        ],
    },

    # test the limit param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit    => 2,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
        ],
    },

    # test the limit param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            Limit    => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
        ],
    },

    # test the deployment state param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [
                $DeplStateListReverse{Production},
                $DeplStateListReverse{Maintenance},
            ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the deployment state param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [ $DeplStateListReverse{Production} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the deployment state param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [ $DeplStateListReverse{Maintenance} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
        ],
    },

    # test the deployment state param with activated previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs => [
                $DeplStateListReverse{Production},
                $DeplStateListReverse{Maintenance},
            ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the deployment state param with activated previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs              => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs          => [ $DeplStateListReverse{Production} ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the deployment state param with activated previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs              => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            DeplStateIDs          => [ $DeplStateListReverse{Maintenance} ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
        ],
    },

    # test the incident state param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [
                $InciStateListReverse{Operational},
                $InciStateListReverse{Incident},
            ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the incident state param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [ $InciStateListReverse{Operational} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[60],
        ],
    },

    # test the incident state param
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [ $InciStateListReverse{Incident} ],
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
        ],
    },

    # test the incident state param with activated previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs     => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs => [
                $InciStateListReverse{Operational},
                $InciStateListReverse{Incident},
            ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
            $ConfigItemNumbers[60],
        ],
    },

    # test the incident state param with activated previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs              => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs          => [ $InciStateListReverse{Operational} ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[60],
        ],
    },

    # test the incident state param with activated previous version search
    {
        Function   => ['VersionSearch'],
        SearchData => {
            ClassIDs              => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            InciStateIDs          => [ $InciStateListReverse{Incident} ],
            PreviousVersionSearch => 1,
        },
        ReferenceData => [
            $ConfigItemNumbers[50],
            $ConfigItemNumbers[51],
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Customer1)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => [ $ConfigItemClassIDs[2], $ConfigItemClassIDs[3] ],
            ChangeBy => [ $UserIDs[2] ],
            What     => [
                {
                    "[1]{'Version'}[1]{'Customer1'}[1]{'Content'}" => 'dummy_customer_for_unitest',
                },
            ],

        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}" => '2010-02-12',
                },
            ],

        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (DateTime1)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'DateTime1'}[1]{'Content'}" => '2010-02-12 09:14',
                },
            ],

        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Customer1, Date1, DateTime1)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Customer1'}[1]{'Content'}" => 'dummy_customer_for_unitest',
                },
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}" => '2010-02-12',
                },
                {
                    "[1]{'Version'}[1]{'DateTime1'}[1]{'Content'}" => '2010-02-12 09:14',
                },
            ],

        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, <, false)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '<' => '2010-02-12',
                        }
                },
            ],

        },
        ReferenceData => [
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, <, true)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '<' => '2010-02-13',
                        }
                },
            ],

        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, <=, false)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '<=' => '2010-02-11',
                        }
                },
            ],

        },
        ReferenceData => [
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, <=, true)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '<=' => '2010-02-12',
                        }
                },
            ],

        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, <=, true)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '<=' => '2010-02-13',
                        }
                },
            ],

        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, =, false)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '=' => '2010-02-11',
                        }
                },
            ],
        },
        ReferenceData => [
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, =, true)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '=' => '2010-02-12',
                        }
                },
            ],
        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, !=, false)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '!=' => '2010-02-12',
                        }
                },
            ],
        },
        ReferenceData => [
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, !=, true)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '!=' => '2010-02-13',
                        }
                },
            ],
        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, >=, false)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '>=' => '2010-02-13',
                        }
                },
            ],
        },
        ReferenceData => [
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, >=, true)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '>=' => '2010-02-12',
                        }
                },
            ],

        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, >=, true)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '>=' => '2010-02-11',
                        }
                },
            ],
        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, >, false)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '>' => '2010-02-12',
                        }
                },
            ],
        },
        ReferenceData => [
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, >, true)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => {
                        '>' => '2010-02-11',
                        }
                },
            ],
        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, -between, false)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => { '-between' => [ '2010-01-01', '2010-01-31' ] }
                },
            ],
        },
        ReferenceData => [
        ],
    },

    # test ConfigItemSearchExtended() with 'What' (Date1, -between, true)
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            What     => [
                {
                    "[1]{'Version'}[1]{'Date1'}[1]{'Content'}"
                        => { '-between' => [ '2010-02-01', '2010-02-31' ] }
                },
            ],
        },
        ReferenceData => [
            $ConfigItemNumbers[52],
        ],
    },

    # test ConfigItemSearchExtended() with Name = 0 without any wildcards
    # should return no results
    # Bugfix# 8881
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            Name     => 0,
        },
        ReferenceData => [
        ],
    },

    # test ConfigItemSearchExtended() with Number = 0 without any wildcards
    # should return no results
    # Bugfix# 8881
    {
        Function   => ['ConfigItemSearchExtended'],
        SearchData => {
            ClassIDs => \@ConfigItemClassIDs,
            Number   => 0,
        },
        ReferenceData => [
        ],
    },
);

# ------------------------------------------------------------ #
# run general config item search tests
# ------------------------------------------------------------ #

# $SearchTestCount provides grouping of test cases
my $SearchTestCount = 1;

TEST:
for my $Test (@SearchTests) {

    # check SearchData attribute
    if ( !$Test->{SearchData} || ref $Test->{SearchData} ne 'HASH' ) {

        $Self->True(
            0,
            "SearchTest $SearchTestCount: No SearchData found for this test.",
        );

        next TEST;
    }

    if ( !$Test->{Function} || ref $Test->{Function} ne 'ARRAY' || !@{ $Test->{Function} } ) {
        $Test->{Function} = ['ConfigItemSearchExtended'];
    }

    for my $Function ( @{ $Test->{Function} } ) {

        # start search
        my $ConfigItemList = $ConfigItemObject->$Function(
            %{ $Test->{SearchData} },
        );

        # check the config item list
        if ( $Test->{ReferenceData} ) {

            $Self->True(
                $ConfigItemList && ref $ConfigItemList eq 'ARRAY',
                "SearchTest $SearchTestCount: $Function() - List is an array reference.",
            );

            next TEST if !$ConfigItemList;
        }
        else {

            $Self->False(
                $ConfigItemList,
                "SearchTest $SearchTestCount: $Function() - Return false.",
            );

            next TEST if !$ConfigItemList;
        }

        # check number of found config items
        $Self->Is(
            scalar @{$ConfigItemList},
            scalar @{ $Test->{ReferenceData} },
            "SearchTest $SearchTestCount: $Function() - correct number of found config items",
        );

        my @ReferenceList;
        for my $Number ( @{ $Test->{ReferenceData} } ) {

            # find id of the item
            $DBObject->Prepare(
                SQL => "SELECT id FROM configitem WHERE "
                    . "configitem_number = '$Number' "
                    . "ORDER BY id DESC",
                Limit => 1,
            );

            # fetch the result
            my $ConfigItemID;
            while ( my @Row = $DBObject->FetchrowArray() ) {
                $ConfigItemID = $Row[0];
            }

            push @ReferenceList, $ConfigItemID;
        }

        # check arrays
        $Self->IsDeeply(
            $ConfigItemList,
            \@ReferenceList,
            "SearchTest $SearchTestCount: $Function() - List",
        );
    }
}
continue {
    $SearchTestCount++;
}

# ------------------------------------------------------------ #
# testing support for attachments
# ------------------------------------------------------------ #

my $AttachmentTestConfigItemID = $ConfigItemIDs[0];

# verify that initially no attachment exists
my @AttachmentList = $ConfigItemObject->ConfigItemAttachmentList(
    ConfigItemID => $AttachmentTestConfigItemID,
);

$Self->Is(
    scalar @AttachmentList,
    0,
    'No attachments initially',
);

my @TestFileList = (
    {
        Filename    => 'first attachment',
        Content     => 'First attachment from ITSMConfigItem.t',
        ContentType => 'text/plain',
    },
    {
        Filename    => 'second attachment',
        Content     => 'Second attachment from ITSMConfigItem.t',
        ContentType => 'text/plain',
    },
);

my $FileCount;
for my $TestFile (@TestFileList) {

    $FileCount++;

    my $AddOk = $ConfigItemObject->ConfigItemAttachmentAdd(
        %{$TestFile},
        ConfigItemID => $AttachmentTestConfigItemID,
        UserID       => 1,
    );
    $Self->True(
        $AddOk,
        "Attachment $FileCount: attachment added",
    );

    my @AttachmentList = $ConfigItemObject->ConfigItemAttachmentList(
        ConfigItemID => $AttachmentTestConfigItemID,
        UserID       => 1,
    );
    $Self->Is(
        scalar @AttachmentList,
        $FileCount,
        "Attachment $FileCount: number of attachments after adding",
    );

    # check whether the last added attachment is in the list
    my %AttachmentLookup = map { $_ => 1 } @AttachmentList;
    $Self->True(
        $AttachmentLookup{ $TestFile->{Filename} },
        "Attachment $FileCount: filename from ConfigItemAttachmentList()",
    );

    # get the attachment
    my $Attachment = $ConfigItemObject->ConfigItemAttachmentGet(
        ConfigItemID => $AttachmentTestConfigItemID,
        Filename     => $TestFile->{Filename},
    );
    $Self->True(
        $Attachment,
        "Attachment $FileCount: ConfigItemAttachmentGet() returned true",
    );

    # check attachment file attributes
    for my $Attribute (qw(Filename Content ContentType)) {
        $Self->Is(
            $Attachment->{$Attribute},
            $TestFile->{$Attribute},
            "Attachment $FileCount: $Attribute from ConfigItemAttachmentGet",
        );
    }

    # check existence of attachment
    my $AttachmentExists = $ConfigItemObject->ConfigItemAttachmentExists(
        ConfigItemID => $AttachmentTestConfigItemID,
        Filename     => $TestFile->{Filename},
        UserID       => 1,
    );
    $Self->True(
        $AttachmentExists,
        "Attachment $FileCount: attachment exists",
    );

}

# now delete the attachments
$FileCount = 0;
my $MaxTestFiles = scalar @TestFileList;
for my $TestFile (@TestFileList) {

    $FileCount++;

    my $DeleteOk = $ConfigItemObject->ConfigItemAttachmentDelete(
        ConfigItemID => $AttachmentTestConfigItemID,
        Filename     => $TestFile->{Filename},
        UserID       => 1,
    );
    $Self->True(
        $DeleteOk,
        "Attachment $FileCount: attachment deleted",
    );

    my @AttachmentList = $ConfigItemObject->ConfigItemAttachmentList(
        ConfigItemID => $AttachmentTestConfigItemID,
        UserID       => 1,
    );

    $Self->Is(
        scalar @AttachmentList,
        $MaxTestFiles - $FileCount,
        "Attachment $FileCount: number of attachments after deletion",
    );

    my $AttachmentExists = $ConfigItemObject->ConfigItemAttachmentExists(
        Filename     => $TestFile->{Filename},
        ConfigItemID => $AttachmentTestConfigItemID,
        UserID       => 1,
    );
    $Self->False(
        $AttachmentExists,
        "Attachment $FileCount: attachment is gone",
    );
}

# check config item delete
my $DeleteTestCount = 1;
for my $ConfigItemID (@ConfigItemIDs) {
    my $DeleteOk = $ConfigItemObject->ConfigItemDelete(
        ConfigItemID => $ConfigItemID,
        UserID       => 1,
    );
    $Self->True(
        $DeleteOk,
        "DeleteTest $DeleteTestCount - ConfigItemDelete() (ConfigItemID=$ConfigItemID)"
    );

    # double check if config item is really deleted
    my $ConfigItemData = $ConfigItemObject->ConfigItemGet(
        ConfigItemID => $ConfigItemID,
        UserID       => 1,
        Cache        => 0,
    );
    $Self->False(
        $ConfigItemData->{ConfigItemID},
        "DeleteTest $DeleteTestCount - double check (ConfigItemID=$ConfigItemID)",
    );

    $DeleteTestCount++;
}

# cleanup is done by RestoreDatabase

1;
