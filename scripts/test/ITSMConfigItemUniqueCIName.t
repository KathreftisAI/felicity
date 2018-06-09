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
my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');
my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

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

# add the test classes
my @ConfigItemClassIDs;
my @ConfigItemClasses;
my @ConfigItemDefinitionIDs;

# generate a random name
my $FirstClassName  = 'UnitTestClass1' . $RandomID;
my $SecondClassName = 'UnitTestClass2' . $RandomID;

# set a name prefix
my $NamePrefix = 'UnitTestName' . $RandomID;

# add both unittest config item classes
my $FirstClassID = $GeneralCatalogObject->ItemAdd(
    Class   => 'ITSM::ConfigItem::Class',
    Name    => $FirstClassName,
    ValidID => 1,
    UserID  => 1,
);

# check first class id
if ( !$FirstClassID ) {

    $Self->True(
        0,
        "Can't add first config item class.",
    );
}

push @ConfigItemClassIDs, $FirstClassID;
push @ConfigItemClasses,  $FirstClassName;

my $SecondClassID = $GeneralCatalogObject->ItemAdd(
    Class   => 'ITSM::ConfigItem::Class',
    Name    => $SecondClassName,
    ValidID => 1,
    UserID  => 1,
);

# check second class id
if ( !$SecondClassID ) {

    $Self->True(
        0,
        "Can't add second config item class.",
    );
}

push @ConfigItemClassIDs, $SecondClassID;
push @ConfigItemClasses,  $SecondClassName;

# add an empty definition to the class. the definition doesn't need any elements, as we're only
# testing the name which isn't part of the definition, but of the config item itself
my $FirstDefinitionID = $ConfigItemObject->DefinitionAdd(
    ClassID    => $FirstClassID,
    Definition => "[]",
    UserID     => 1,
);

# check definition id
if ( !$FirstDefinitionID ) {

    $Self->True(
        0,
        "Can't add first config item definition.",
    );
}

push @ConfigItemDefinitionIDs, $FirstDefinitionID;

my $SecondDefinitionID = $ConfigItemObject->DefinitionAdd(
    ClassID    => $SecondClassID,
    Definition => "[]",
    UserID     => 1,
);

# check definition id
if ( !$SecondDefinitionID ) {

    $Self->True(
        0,
        "Can't add second config item definition.",
    );
}

push @ConfigItemDefinitionIDs, $SecondDefinitionID;

my @ConfigItemIDs;

# add a configitem to each class
my $FirstConfigItemID = $ConfigItemObject->ConfigItemAdd(
    ClassID => $FirstClassID,
    UserID  => 1,
);

if ( !$FirstConfigItemID ) {
    $Self->True(
        0,
        "Failed to add the first configitem",
    );
}

push @ConfigItemIDs, $FirstConfigItemID;

my $SecondConfigItemID = $ConfigItemObject->ConfigItemAdd(
    ClassID => $SecondClassID,
    UserID  => 1,
);

if ( !$SecondConfigItemID ) {
    $Self->True(
        0,
        "Failed to add the second configitem",
    );
}

push @ConfigItemIDs, $SecondConfigItemID;

# create a 3rd configitem in the 2nd class
my $ThirdConfigItemID = $ConfigItemObject->ConfigItemAdd(
    ClassID => $SecondClassID,
    UserID  => 1,
);

if ( !$ThirdConfigItemID ) {
    $Self->True(
        0,
        "Failed to add the third configitem",
    );
}

push @ConfigItemIDs, $ThirdConfigItemID;

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

# set a name for each configitem
my $FirstInitialVersionID = $ConfigItemObject->VersionAdd(
    ConfigItemID => $FirstConfigItemID,
    Name         => $NamePrefix . 'First#001',
    DefinitionID => $FirstDefinitionID,
    DeplStateID  => $DeplStateListReverse{Production},
    InciStateID  => $InciStateListReverse{Operational},
    UserID       => 1,
);

if ( !$FirstInitialVersionID ) {
    $Self->True(
        0,
        "Failed to add the initial version for the first configitem",
    );
}

my $SecondInitialVersionID = $ConfigItemObject->VersionAdd(
    ConfigItemID => $SecondConfigItemID,
    Name         => $NamePrefix . 'Second#001',
    DefinitionID => $SecondDefinitionID,
    DeplStateID  => $DeplStateListReverse{Production},
    InciStateID  => $InciStateListReverse{Operational},
    UserID       => 1,
);

if ( !$SecondInitialVersionID ) {
    $Self->True(
        0,
        "Failed to add the initial version for the second configitem",
    );
}

my $ThirdInitialVersionID = $ConfigItemObject->VersionAdd(
    ConfigItemID => $ThirdConfigItemID,
    Name         => $NamePrefix . 'Second#002',
    DefinitionID => $SecondDefinitionID,
    DeplStateID  => $DeplStateListReverse{Production},
    InciStateID  => $InciStateListReverse{Operational},
    UserID       => 1,
);

if ( !$ThirdInitialVersionID ) {
    $Self->True(
        0,
        "Failed to add the initial version for the third configitem",
    );
}

# ------------------------------------------------------------ #
# run the actual tests
# ------------------------------------------------------------ #

# read the original setting for the setting EnableUniquenessCheck
my $OrigEnableSetting = $ConfigObject->Get('UniqueCIName::EnableUniquenessCheck');

# enable the uniqueness check
$ConfigObject->Set(
    Key   => 'UniqueCIName::EnableUniquenessCheck',
    Value => 1,
);

# read the original setting for the scope of the uniqueness check
my $OrigScope = $ConfigObject->Get('UniqueCIName::UniquenessCheckScope');

# make sure, the scope for the uniqueness check is set to 'global'
$ConfigObject->Set(
    Key   => 'UniqueCIName::UniquenessCheckScope',
    Value => 'global',
);

my $RenameSuccess;

# try to give the 1st configitem the same name as the 2nd one
$RenameSuccess = $ConfigItemObject->VersionAdd(
    ConfigItemID => $FirstConfigItemID,
    Name         => $NamePrefix . 'Second#001',
    DefinitionID => $FirstDefinitionID,
    DeplStateID  => $DeplStateListReverse{Production},
    InciStateID  => $InciStateListReverse{Operational},
    UserID       => 1,
);

$Self->False(
    $RenameSuccess,
    "Scope => global: Renaming First#001 to already existing Second#001 successfully prevented"
);

# try to give the 2nd configitem the same name as the 3rd one
$RenameSuccess = $ConfigItemObject->VersionAdd(
    ConfigItemID => $SecondConfigItemID,
    Name         => $NamePrefix . 'Second#002',
    DefinitionID => $FirstDefinitionID,
    DeplStateID  => $DeplStateListReverse{Production},
    InciStateID  => $InciStateListReverse{Operational},
    UserID       => 1,
);

$Self->False(
    $RenameSuccess,
    "Scope => global: Renaming Second#001 to already existing Second#002 successfully prevented"
);

# set the scope for the uniqueness check to 'class'
$ConfigObject->Set(
    Key   => 'UniqueCIName::UniquenessCheckScope',
    Value => 'class',
);

# try to rename First#001 again to Second#001 which should work now, due to the different class
$RenameSuccess = $ConfigItemObject->VersionAdd(
    ConfigItemID => $FirstConfigItemID,
    Name         => $NamePrefix . 'Second#001',
    DefinitionID => $FirstDefinitionID,
    DeplStateID  => $DeplStateListReverse{Production},
    InciStateID  => $InciStateListReverse{Operational},
    UserID       => 1,
);

$Self->True(
    $RenameSuccess,
    "Scope => class: Renaming First#001 to already existing Second#001 succeeded"
);

# trying now to create a duplicate name within a class
$RenameSuccess = $ConfigItemObject->VersionAdd(
    ConfigItemID => $SecondConfigItemID,
    Name         => $NamePrefix . 'Second#002',
    DefinitionID => $SecondDefinitionID,
    DeplStateID  => $DeplStateListReverse{Production},
    InciStateID  => $InciStateListReverse{Operational},
    UserID       => 1,
);

$Self->False(
    $RenameSuccess,
    "Scope => class: Renaming Second#001 to already existing Second#002 successfully prevented"
);

# reset the enabled setting for the uniqueness check to its original value
$ConfigObject->Set(
    Key   => 'UniqueCIName::EnableUniquenessCheck',
    Value => $OrigEnableSetting,
);

# reset the scope for the uniqueness check to its original value
$ConfigObject->Set(
    Key   => 'UniqueCIName::UniquenessCheckScope',
    Value => $OrigScope,
);

# cleanup is done by RestoreDatabase

1;
