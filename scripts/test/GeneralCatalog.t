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

# create local objects
my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');
my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
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

# create needed users
my @UserIDs;
{

    # disable email checks to create new user
    my $CheckEmailAddressesOrg = $ConfigObject->Get('CheckEmailAddresses') || 1;
    $ConfigObject->Set(
        Key   => 'CheckEmailAddresses',
        Value => 0,
    );

    for my $Counter ( 1 .. 2 ) {

        # create new users for the tests
        my $UserID = $UserObject->UserAdd(
            UserFirstname => 'GeneralCatalog' . $Counter,
            UserLastname  => 'UnitTest',
            UserLogin     => 'UnitTest-GeneralCatalog-' . $Counter . $RandomID,
            UserEmail     => 'UnitTest-GeneralCatalog-' . $Counter . '@localhost',
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

# create needed random classes
my @ClassRand;

for my $Counter ( 1 .. 3 ) {

    push @ClassRand, $Helper->GetRandomNumber();
}

# store original general catalog permission preferences setting
my $GeneralCatalogPreferencesPermissionsOrg;
if ( $ConfigObject->Get('GeneralCatalogPreferences') ) {
    $GeneralCatalogPreferencesPermissionsOrg = $ConfigObject->Get('GeneralCatalogPreferences')->{Permissions};
}

# enable general catalog permission preferences setting with a dummy true value
$ConfigObject->Set(
    Key   => 'GeneralCatalogPreferences###Permissions',
    Value => 1,
);

# ------------------------------------------------------------ #
# define general tests
# ------------------------------------------------------------ #

my $ItemData = [

    # this item is NOT complete and must not be added
    {
        Add => {
            Name    => 'TestItem1',
            ValidID => 1,
            UserID  => 1,
        },
    },

    # this item is NOT complete and must not be added
    {
        Add => {
            Class   => 'UnitTest::TestClass' . $ClassRand[0],
            ValidID => 1,
            UserID  => 1,
        },
    },

    # this item is NOT complete and must not be added
    {
        Add => {
            Class  => 'UnitTest::TestClass' . $ClassRand[0],
            Name   => 'TestItem2',
            UserID => 1,
        },
    },

    # this item is NOT complete and must not be added
    {
        Add => {
            Class   => 'UnitTest::TestClass' . $ClassRand[0],
            Name    => 'TestItem3',
            ValidID => 1,
        },
    },

    # this item must be inserted successfully
    {
        Add => {
            Class   => 'UnitTest::TestClass' . $ClassRand[0],
            Name    => 'TestItem4',
            ValidID => 1,
            UserID  => 1,
        },
        AddGet => {
            Class    => 'UnitTest::TestClass' . $ClassRand[0],
            Name     => 'TestItem4',
            ValidID  => 1,
            Comment  => '',
            CreateBy => 1,
            ChangeBy => 1,
        },
    },

    # the preferences of the item one add-test before must be set
    {
        PreferencesSet => {
            Hello => 'World',
            Color => 'Red',
        },
        PreferencesGet => {
            Hello => 'World',
            Color => 'Red',
        },
    },

    # this item have the same name as one test before and must not be added
    {
        Add => {
            Class   => 'UnitTest::TestClass' . $ClassRand[0],
            Name    => 'TestItem4',
            ValidID => 1,
            UserID  => 1,
        },
    },

    # this item must be inserted successfully
    {
        Add => {
            Class   => 'UnitTest::TestClass' . $ClassRand[0],
            Name    => 'TestItem5',
            ValidID => 1,
            UserID  => 1,
        },
        AddGet => {
            Class    => 'UnitTest::TestClass' . $ClassRand[0],
            Name     => 'TestItem5',
            ValidID  => 1,
            Comment  => '',
            CreateBy => 1,
            ChangeBy => 1,
        },
    },

    # the preferences of the item one add-test before must be set
    {
        PreferencesSet => {
            Hello => 'NewWorld',
            Color => 'Blue',
        },
        PreferencesGet => {
            Hello => 'NewWorld',
            Color => 'Blue',
        },
    },

    # the item one add-test before must be NOT updated (item update arguments NOT complete)
    {
        Update => {
            ValidID => $UserIDs[0],
            UserID  => $UserIDs[0],
        },
    },

    # the item one add-test before must be NOT updated (item update arguments NOT complete)
    {
        Update => {
            Name   => 'TestItem5UPDATE1',
            UserID => $UserIDs[0],
        },
    },

    # the item one add-test before must be NOT updated (item update arguments NOT complete)
    {
        Update => {
            ValidID => $UserIDs[0],
        },
    },

    # the item one add-test before must be updated (item update arguments are complete)
    {
        Update => {
            Name    => 'TestItem5UPDATE2',
            ValidID => $UserIDs[0],
            UserID  => $UserIDs[0],
        },
        UpdateGet => {
            Name     => 'TestItem5UPDATE2',
            ValidID  => $UserIDs[0],
            Comment  => '',
            CreateBy => 1,
            ChangeBy => $UserIDs[0],
        },
    },

    # the item one add-test before must be updated (item update arguments are complete)
    {
        Update => {
            Name    => 'TestItem5UPDATE3',
            ValidID => 1,
            UserID  => 1,
        },
        UpdateGet => {
            Name     => 'TestItem5UPDATE3',
            ValidID  => 1,
            Comment  => '',
            CreateBy => 1,
            ChangeBy => 1,
        },
    },

    # this template must be inserted successfully (check string cleaner function)
    {
        Add => {
            Class   => " \t \n \r Unit Test :: Test Class \t \n \r " . $ClassRand[0],
            Name    => " \t \n \r Test Item \t \n \r ",
            ValidID => 1,
            Comment => " \t \n \r Test Comment \t \n \r ",
            UserID  => 1,
        },
        AddGet => {
            Class    => 'UnitTest::TestClass' . $ClassRand[0],
            Name     => 'Test Item',
            ValidID  => 1,
            Comment  => 'Test Comment',
            CreateBy => 1,
            ChangeBy => 1,
        },
    },

    # the item one add-test before must be updated successfully (check string cleaner function)
    {
        Update => {
            Name    => " \t \n \r Test Item UPDATE1 \t \n \r ",
            ValidID => $UserIDs[0],
            Comment => " \t \n \r Test Comment UPDATE1 \t \n \r ",
            UserID  => $UserIDs[0],
        },
        UpdateGet => {
            Name     => 'Test Item UPDATE1',
            ValidID  => $UserIDs[0],
            Comment  => 'Test Comment UPDATE1',
            CreateBy => 1,
            ChangeBy => $UserIDs[0],
        },
    },

    # this item must be inserted successfully (unicode checks)
    {
        Add => {
            Class   => 'UnitTest::TestClass©' . $ClassRand[1],
            Name    => ' ϒ ϡ Test Item Ʃ Ϟ ',
            ValidID => 1,
            Comment => ' Ϡ Я Test Comment Ѭ Ѡ ',
            UserID  => 1,
        },
        AddGet => {
            Class    => 'UnitTest::TestClass©' . $ClassRand[1],
            Name     => 'ϒ ϡ Test Item Ʃ Ϟ',
            ValidID  => 1,
            Comment  => 'Ϡ Я Test Comment Ѭ Ѡ',
            CreateBy => 1,
            ChangeBy => 1,
        },
    },

    # the item one add-test before must be updated successfully (unicode checks)
    {
        Update => {
            Name    => 'Test Item Ʃ ɤ UPDATE1',
            ValidID => $UserIDs[1],
            Comment => ' Test Comment љ ђ UPDATE1 ',
            UserID  => $UserIDs[1],
        },
        UpdateGet => {
            Name     => 'Test Item Ʃ ɤ UPDATE1',
            ValidID  => $UserIDs[1],
            Comment  => 'Test Comment љ ђ UPDATE1',
            CreateBy => 1,
            ChangeBy => $UserIDs[1],
        },
    },

    # this item must be inserted successfully (a second item with Functionality 'test1')
    {
        Add => {
            Class   => 'UnitTest::TestClass' . $ClassRand[0],
            Name    => 'TestItem6',
            ValidID => 1,
            UserID  => 1,
        },
        AddGet => {
            Class    => 'UnitTest::TestClass' . $ClassRand[0],
            Name     => 'TestItem6',
            ValidID  => 1,
            Comment  => '',
            CreateBy => 1,
            ChangeBy => 1,
        },
    },

    # the item one add-test before must be updated (set functionality to '')
    {
        Update => {
            Name    => 'TestItem6UPDATE1',
            ValidID => 1,
            UserID  => 1,
        },
        UpdateGet => {
            Name     => 'TestItem6UPDATE1',
            ValidID  => 1,
            Comment  => '',
            CreateBy => 1,
            ChangeBy => 1,
        },
    },

    # this item must be inserted successfully (special character checks)
    {
        Add => {
            Class   => 'UnitTest::TestClass[test]%*\\' . $ClassRand[1],
            Name    => ' [test]%*\\ Test Item [test]%*\\ ',
            ValidID => 1,
            Comment => ' [test]%*\\ Test Comment [test]%*\\ ',
            UserID  => 1,
        },
        AddGet => {
            Class    => 'UnitTest::TestClass[test]%*\\' . $ClassRand[1],
            Name     => '[test]%*\\ Test Item [test]%*\\',
            ValidID  => 1,
            Comment  => '[test]%*\\ Test Comment [test]%*\\',
            CreateBy => 1,
            ChangeBy => 1,
        },
    },

    # the item one add-test before must be updated successfully (special character checks)
    {
        Update => {
            Name    => ' [test]%*\\ Test Item UPDATE1 [test]%*\\ ',
            ValidID => $UserIDs[1],
            Comment => ' [test]%*\\ Test Comment UPDATE1 [test]%*\\ ',
            UserID  => $UserIDs[1],
        },
        UpdateGet => {
            Name     => '[test]%*\\ Test Item UPDATE1 [test]%*\\',
            ValidID  => $UserIDs[1],
            Comment  => '[test]%*\\ Test Comment UPDATE1 [test]%*\\',
            CreateBy => 1,
            ChangeBy => $UserIDs[1],
        },
    },

    # this item must be inserted successfully
    {
        Add => {
            Class   => 'UnitTest::TestClass' . $ClassRand[0],
            Name    => 'TestItemPreferences',
            ValidID => 1,
            UserID  => 1,
        },
        AddGet => {
            Class    => 'UnitTest::TestClass' . $ClassRand[0],
            Name     => 'TestItemPreferences',
            ValidID  => 1,
            Comment  => '',
            CreateBy => 1,
            ChangeBy => 1,
        },
    },

    # the preferences of the item one add-test before must be set
    {
        PreferencesSet => {
            Test  => 'hello world',
            Group => 33,
        },
        PreferencesGet => {
            Test  => 'hello world',
            Group => 33,
        },
    },

    # the preferences of the item one add-test before must be set
    {
        PreferencesSet => {
            Test => 'hello',
            Size => 38,
        },
        PreferencesGet => {
            Test => 'hello',
            Size => 38,
        },
    },

    # this item has an empty name and must not be added
    {
        Add => {
            Class   => 'UnitTest::TestClass' . $ClassRand[0],
            Name    => '',
            ValidID => 1,
            UserID  => 1,
        },
    },

    # this item must be added, the number zero (0) is allowed as name
    {
        Add => {
            Class   => 'UnitTest::TestClass' . $ClassRand[0],
            Name    => '0',
            ValidID => 1,
            UserID  => 1,
        },
        AddGet => {
            Class    => 'UnitTest::TestClass' . $ClassRand[0],
            Name     => '0',
            ValidID  => 1,
            Comment  => '',
            CreateBy => 1,
            ChangeBy => 1,
        },
    },

    # the item one add-test before must be updated successfully (updating name to number zero (0) )
    {
        Update => {
            Name    => '0',
            ValidID => 1,
            Comment => '',
            UserID  => 1,
        },
        UpdateGet => {
            Name     => '0',
            ValidID  => 1,
            Comment  => '',
            CreateBy => 1,
            ChangeBy => 1,
        },
    },

    # the item one add-test before must not be updated successfully
    # (empty string as name is not allowed )
    {
        Update => {
            Name    => '',
            ValidID => 1,
            Comment => '',
            UserID  => 1,
        },
    },
];

# ------------------------------------------------------------ #
# run general tests
# ------------------------------------------------------------ #

my $TestCount = 1;
my $LastAddedItemID;
my %AddedItemCounter;

for my $Item ( @{$ItemData} ) {

    if ( $Item->{Add} ) {

        # add new item
        my $ItemID = $GeneralCatalogObject->ItemAdd(
            %{ $Item->{Add} },
        );

        # check if item was added successfully or not
        if ( $Item->{AddGet} ) {

            $Self->True(
                $ItemID,
                "Test $TestCount: ItemAdd() - ItemKey: $ItemID",
            );

            if ($ItemID) {

                # set last item id variable
                $LastAddedItemID = $ItemID;

                # increment the added item counter
                $AddedItemCounter{ $Item->{AddGet}->{Class} }++;
            }
        }
        else {
            $Self->False(
                $ItemID,
                "Test $TestCount: ItemAdd()",
            );
        }

        # get item data to check the values after creation of item using ItemId and UserID
        my $ItemGet = $GeneralCatalogObject->ItemGet(
            ItemID => $ItemID,
            UserID => $Item->{Add}->{UserID},
        );

        # check item data after creation of item
        for my $ItemAttribute ( sort keys %{ $Item->{AddGet} } ) {
            $Self->Is(
                $ItemGet->{$ItemAttribute},
                $Item->{AddGet}->{$ItemAttribute},
                "Test $TestCount: ItemGet() - Using ItemID and UserID - $ItemAttribute ",
            );
        }

        # get item data to check the values after creation of item using Class and Name
        $ItemGet = $GeneralCatalogObject->ItemGet(
            Class => $Item->{AddGet}->{Class},
            Name  => $Item->{AddGet}->{Name},
        );

        # check item data after creation of item
        for my $ItemAttribute ( sort keys %{ $Item->{AddGet} } ) {
            $Self->Is(
                $ItemGet->{$ItemAttribute},
                $Item->{AddGet}->{$ItemAttribute},
                "Test $TestCount: ItemGet() - Using Class and Name - $ItemAttribute ",
            );
        }
    }

    if ( $Item->{Update} ) {

        # check last item id variable
        if ( !$LastAddedItemID ) {
            $Self->False(
                1,
                "Test $TestCount: NO LAST ITEM ID GIVEN",
            );
        }

        # update the item
        my $UpdateSucess = $GeneralCatalogObject->ItemUpdate(
            %{ $Item->{Update} },
            ItemID => $LastAddedItemID,
        );

        # check if item was updated successfully or not
        if ( $Item->{UpdateGet} ) {
            $Self->True(
                $UpdateSucess,
                "Test $TestCount: ItemUpdate() - ItemKey: $LastAddedItemID",
            );
        }
        else {
            $Self->False(
                $UpdateSucess,
                "Test $TestCount: ItemUpdate()",
            );
        }

        # get item data to check the values after the update
        my $ItemGet2 = $GeneralCatalogObject->ItemGet(
            ItemID => $LastAddedItemID,
            UserID => $Item->{Update}->{UserID},
        );

        # check item data after update
        for my $ItemAttribute ( sort keys %{ $Item->{UpdateGet} } ) {
            $Self->Is(
                $ItemGet2->{$ItemAttribute},
                $Item->{UpdateGet}->{$ItemAttribute},
                "Test $TestCount: ItemGet() - $ItemAttribute",
            );
        }
    }

    if ( $Item->{PreferencesSet} ) {

        for my $Key ( sort keys %{ $Item->{PreferencesSet} } ) {

            # set preferences
            my $Success = $GeneralCatalogObject->GeneralCatalogPreferencesSet(
                Key    => $Key,
                Value  => $Item->{PreferencesSet}->{$Key},
                ItemID => $LastAddedItemID,
            );

            $Self->True(
                $Success,
                "Test $TestCount: PreferencesSet() - $Key",
            );
        }
    }

    # check preferences
    if ( $Item->{PreferencesGet} ) {
        my %Preferences = $GeneralCatalogObject->GeneralCatalogPreferencesGet(
            ItemID => $LastAddedItemID,
        );

        for my $Key ( sort keys %{ $Item->{PreferencesGet} } ) {
            if ( $Item->{PreferencesGet}->{$Key} eq $Preferences{$Key} ) {
                $Self->True(
                    1,
                    "Test $TestCount: PreferencesGet() - $Key",
                );
            }
            else {
                $Self->True(
                    0,
                    "Test $TestCount: PreferencesGet() - $Key",
                );
            }
        }
    }

    $TestCount++;
}

# ------------------------------------------------------------ #
# make preparations for later tests
# ------------------------------------------------------------ #

# create needed arrays
my %ExistingClassesTmp;
ITEM:
for my $Item ( @{$ItemData} ) {
    next ITEM if !$Item->{AddGet}->{Class};
    $ExistingClassesTmp{ $Item->{AddGet}->{Class} } = 1;
}
my @ExistingClasses = sort keys %ExistingClassesTmp;

my %ExistingFunctionalitiesTmp;
ITEM:
for my $Item ( @{$ItemData} ) {
    $Item->{UpdateGet}->{Functionality} ||= '';
    $ExistingFunctionalitiesTmp{ $Item->{UpdateGet}->{Functionality} } = 1;
}
my @ExistingFunctionalities = sort keys %ExistingFunctionalitiesTmp;

my @NonExistingClasses = ( 'UnitTest::NoExistingClass1', 'UnitTest::NoExistingClass2' );

# ------------------------------------------------------------ #
# ClassList test 1
# ------------------------------------------------------------ #

my $ClassList1 = $GeneralCatalogObject->ClassList();

for my $Class (@ExistingClasses) {

    my $ClassCount = 0;
    if ( $ClassList1 && ref $ClassList1 eq 'ARRAY' ) {
        $ClassCount = grep { $_ eq $Class } @{$ClassList1};
    }

    $Self->Is(
        $ClassCount,
        1,
        "Test $TestCount: ClassList() - $Class listed",
    );

    $TestCount++;
}

# ------------------------------------------------------------ #
# ItemList test 1
# ------------------------------------------------------------ #

for my $Class (@NonExistingClasses) {

    my $ItemList = $GeneralCatalogObject->ItemList(
        Class => $Class,
        Valid => 0,
    );

    $Self->False(
        $ItemList,
        "Test $TestCount: ItemList() - $Class not exists",
    );

    $TestCount++;
}

# ------------------------------------------------------------ #
# ItemList test 2
# ------------------------------------------------------------ #

for my $Class (@ExistingClasses) {

    my $ItemList = $GeneralCatalogObject->ItemList(
        Class => $Class,
        Valid => 0,
    );

    my $ListCount = 'NULL';
    if ( defined $ItemList && ref $ItemList eq 'HASH' ) {
        $ListCount = keys %{$ItemList};
    }

    $Self->Is(
        $ListCount,
        $AddedItemCounter{$Class},
        "Test $TestCount: ItemList() - $Class correct number of items",
    );

    $TestCount++;
}

# ------------------------------------------------------------ #
# ItemList test 3 - Item List with preferences (single hash entry)
# ------------------------------------------------------------ #

{

    my $Class    = 'UnitTest::TestClass' . $ClassRand[0];
    my $ItemList = $GeneralCatalogObject->ItemList(
        Class       => $Class,
        Valid       => 1,
        Preferences => {
            Hello => 'World',
        },
    );

    my $ListCount = 'NULL';
    if ( defined $ItemList && ref $ItemList eq 'HASH' ) {
        $ListCount = keys %{$ItemList};
    }

    $Self->Is(
        $ListCount,
        1,
        "Test $TestCount: ItemList() preferences (single hash entry) - $Class correct number of items",
    );

    $TestCount++;
}

# ------------------------------------------------------------ #
# ItemList test 4 - Item List with preferences (array)
# ------------------------------------------------------------ #

{

    my $Class    = 'UnitTest::TestClass' . $ClassRand[0];
    my $ItemList = $GeneralCatalogObject->ItemList(
        Class       => $Class,
        Valid       => 1,
        Preferences => {
            Color => [ 'Red', 'Blue' ],
        },
    );

    my $ListCount = 'NULL';
    if ( defined $ItemList && ref $ItemList eq 'HASH' ) {
        $ListCount = keys %{$ItemList};
    }

    $Self->Is(
        $ListCount,
        2,
        "Test $TestCount: ItemList() preferences (array) - $Class correct number of items",
    );

    $TestCount++;
}

# ------------------------------------------------------------ #
# Preferences test 1
# ------------------------------------------------------------ #
for my $Class (@ExistingClasses) {

    my $ItemID = $GeneralCatalogObject->ItemAdd(
        Class   => $Class,
        Name    => 'Item Preferences',
        ValidID => 1,
        UserID  => 1,
    );

    $GeneralCatalogObject->GeneralCatalogPreferencesSet(
        ItemID => $ItemID,
        Key    => 'UnitTestPref',
        Value  => '1',
    );

    my $ItemList = $GeneralCatalogObject->ItemList(
        Class       => $Class,
        Preferences => {
            UnitTestPref => 1,
        },
    );

    $Self->Is(
        $ItemList->{$ItemID},
        'Item Preferences',
        "Test $TestCount: ItemList() - Class $Class Preferences match",
    );

    $GeneralCatalogObject->GeneralCatalogPreferencesSet(
        ItemID => $ItemID,
        Key    => 'UnitTestPref',
        Value  => '2',
    );

    $ItemList = $GeneralCatalogObject->ItemList(
        Class       => $Class,
        Preferences => {
            UnitTestPref => 1,
        },
    );

    $Self->False(
        $ItemList,
        "Test $TestCount: ItemList() - Class $Class Preferences not match after PreferencesSet Change"
    );

    $GeneralCatalogObject->ItemUpdate(
        ItemID  => $ItemID,
        Name    => 'Item Preferences',
        ValidID => 2,
        UserID  => 1,
    );

    $TestCount++;
}

# ------------------------------------------------------------ #
# Preferences test 2
# ------------------------------------------------------------ #

=pod

my %FunctionalityList1;
map { $FunctionalityList1{$_} = 1 } @ExistingFunctionalities;

for my $Class (@ExistingClasses) {

    my $FunctionalityList = $GeneralCatalogObject->FunctionalityList(
        Class => $Class,
    );

    $Self->True(
        $FunctionalityList && ref $FunctionalityList eq 'ARRAY',
        "Test $TestCount: FunctionalityList() - return a array reference",
    );

    for my $Functionality ( @{$FunctionalityList} ) {
        delete $FunctionalityList1{$Functionality};
    }

    $TestCount++;
}

$Self->True(
    !keys %FunctionalityList1,
    "Test $TestCount: FunctionalityList()",
);

$TestCount++;

=cut

# ------------------------------------------------------------ #
# ClassRename test 1 (check normal rename)
# ------------------------------------------------------------ #

CLASS:
for my $Class (@ExistingClasses) {

    my $OldItemList = $GeneralCatalogObject->ItemList(
        Class => $Class,
        Valid => 0,
    );

    my $Success = $GeneralCatalogObject->ClassRename(
        ClassOld => $Class,
        ClassNew => $Class . 'RENAME1',
    );

    if ( !$Success ) {
        $Self->False(
            1,
            "Test $TestCount: ClassRename() - Rename failed",
        );
        next CLASS;
    }

    my $NewItemList = $GeneralCatalogObject->ItemList(
        Class => $Class . 'RENAME1',
        Valid => 0,
    );

    if (
        !$OldItemList
        || !$NewItemList
        || ref $OldItemList ne 'HASH'
        || ref $NewItemList ne 'HASH'
        )
    {
        $Self->False(
            1,
            "Test $TestCount: ClassRename() - ItemList failed",
        );
        next CLASS;
    }

    OLDKEY:
    for my $OldKey ( sort keys %{$OldItemList} ) {

        if ( !exists $NewItemList->{$OldKey} ) {
            $NewItemList->{FailedDummy} = 1;
            next OLDKEY;
        }

        next OLDKEY if $OldItemList->{$OldKey} ne $NewItemList->{$OldKey};

        delete $NewItemList->{$OldKey};
    }

    $Self->True(
        !keys %{$NewItemList},
        "Test $TestCount: ClassRename()",
    );

    $TestCount++;
}

# ------------------------------------------------------------ #
# ClassRename test 2 (check string cleaner function)
# ------------------------------------------------------------ #

CLASS:
for my $Class (@ExistingClasses) {

    my $OldItemList = $GeneralCatalogObject->ItemList(
        Class => $Class . 'RENAME1',
        Valid => 0,
    );

    my $Success = $GeneralCatalogObject->ClassRename(
        ClassOld => $Class . 'RENAME1',
        ClassNew => ' ' . $Class . "RE NA ME 2 \n \r \t ",
    );

    if ( !$Success ) {
        $Self->False(
            1,
            "Test $TestCount: ClassRename() - Rename failed",
        );
        next CLASS;
    }

    my $NewItemList = $GeneralCatalogObject->ItemList(
        Class => $Class . 'RENAME2',
        Valid => 0,
    );

    if (
        !$OldItemList
        || !$NewItemList
        || ref $OldItemList ne 'HASH'
        || ref $NewItemList ne 'HASH'
        )
    {
        $Self->False(
            1,
            "Test $TestCount: ClassRename() - ItemList failed",
        );
        next CLASS;
    }

    OLDKEY:
    for my $OldKey ( sort keys %{$OldItemList} ) {

        if ( !exists $NewItemList->{$OldKey} ) {
            $NewItemList->{FailedDummy} = 1;
            next OLDKEY;
        }

        next OLDKEY if $OldItemList->{$OldKey} ne $NewItemList->{$OldKey};

        delete $NewItemList->{$OldKey};
    }

    $Self->True(
        !keys %{$NewItemList},
        "Test $TestCount: ClassRename()",
    );

    $TestCount++;
}

# ------------------------------------------------------------ #
# ClassRename test 2 (identical name test)
# ------------------------------------------------------------ #

for my $Class (@ExistingClasses) {

    my $Success = $GeneralCatalogObject->ClassRename(
        ClassOld => $Class . 'RENAME2',
        ClassNew => $Class . 'RENAME2',
    );

    $Self->True(
        $Success,
        "Test $TestCount: ClassRename() - oldname and newname identical",
    );

    $TestCount++;
}

# ------------------------------------------------------------ #
# ClassRename test 3 (new class name already exists)
# ------------------------------------------------------------ #

$GeneralCatalogObject->ItemAdd(
    Class         => 'UnitTest::TestClass' . $ClassRand[2],
    Name          => 'Dummy',
    Functionality => '',
    ValidID       => 1,
    UserID        => 1,
);

for my $Class (@ExistingClasses) {

    my $Success = $GeneralCatalogObject->ClassRename(
        ClassOld => $Class . 'RENAME2',
        ClassNew => 'UnitTest::TestClass' . $ClassRand[2],
    );

    $Self->False(
        $Success,
        "Test $TestCount: ClassRename() - new class name already exists",
    );

    $TestCount++;
}

# restore original general catalog permission preferences setting
$ConfigObject->Set(
    Key   => 'GeneralCatalogPreferences###Permissions',
    Value => $GeneralCatalogPreferencesPermissionsOrg,
);

# cleanup is done by RestoreDatabase

1;
