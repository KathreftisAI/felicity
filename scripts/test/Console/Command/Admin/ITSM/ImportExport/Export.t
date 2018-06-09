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
use File::Path qw(mkpath rmtree);

# get needed objects
my $CommandObject        = $Kernel::OM->Get('Kernel::System::Console::Command::Admin::ITSM::ImportExport::Export');
my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

# test command without --template-number option
my $ExitCode = $CommandObject->Execute();

$Self->Is(
    $ExitCode,
    1,
    "No --template-number  - exit code",
);

# get 'Hardware' catalog class ID
my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
    Class => 'ITSM::ConfigItem::Class',
    Name  => 'Hardware',
);
my $HardwareConfigItemID = $ConfigItemDataRef->{ItemID};

# get 'Production' deployment state IDs
my $ProductionDeplStateDataRef = $GeneralCatalogObject->ItemGet(
    Class => 'ITSM::ConfigItem::DeploymentState',
    Name  => 'Production',
);
my $ProductionDeplStateID = $ProductionDeplStateDataRef->{ItemID};

my @ConfigItemIDs;

# add test config items
for ( 1 .. 10 ) {

    # create ConfigItem number
    my $ConfigItemNumber = $ConfigItemObject->ConfigItemNumberCreate(
        Type    => $Kernel::OM->Get('Kernel::Config')->Get('ITSMConfigItem::NumberGenerator'),
        ClassID => $HardwareConfigItemID,
    );

    # add test ConfigItem
    my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
        Number  => $ConfigItemNumber,
        ClassID => $HardwareConfigItemID,
        UserID  => 1,
    );

    $Self->True(
        $ConfigItemID,
        "Config item is created - $ConfigItemID",
    );

    my $ConfigItemName = 'TestConfigItem' . $Helper->GetRandomID();
    my $VersionID      = $ConfigItemObject->VersionAdd(
        Name         => $ConfigItemName,
        DefinitionID => 1,
        DeplStateID  => $ProductionDeplStateID,
        InciStateID  => 1,
        UserID       => 1,
        ConfigItemID => $ConfigItemID,
    );

    $Self->True(
        $VersionID,
        "Version for config item $ConfigItemID is created - $ConfigItemName",
    );

    push @ConfigItemIDs, $ConfigItemID;
}

# get ImportExport object
my $ImportExportObject = $Kernel::OM->Get('Kernel::System::ImportExport');

# add test template
my $TemplateID = $ImportExportObject->TemplateAdd(
    Object  => 'ITSMConfigItem',
    Format  => 'CSV',
    Name    => 'Template' . $Helper->GetRandomID(),
    ValidID => 1,
    Comment => 'Comment',
    UserID  => 1,
);

$Self->True(
    $TemplateID,
    "Import/Export template is created - $TemplateID",
);

# get object data for test template
my %TemplateRef = (
    'ClassID'  => $HardwareConfigItemID,
    'CountMax' => 10,
);
my $Success = $ImportExportObject->ObjectDataSave(
    TemplateID => $TemplateID,
    ObjectData => \%TemplateRef,
    UserID     => 1,
);

$Self->True(
    $Success,
    "ObjectData for test template is added",
);

# add the format data of the test template
my %FormatData = (
    Charset              => 'UTF-8',
    ColumnSeparator      => 'Comma',
    IncludeColumnHeaders => 1,
);
$Success = $ImportExportObject->FormatDataSave(
    TemplateID => $TemplateID,
    FormatData => \%FormatData,
    UserID     => 1,
);

$Self->True(
    $Success,
    "FormatData for test template is added",
);

# save the search data of a template
my %SearchData = (
    Name => 'TestConfigItem*',
);
$Success = $ImportExportObject->SearchDataSave(
    TemplateID => $TemplateID,
    SearchData => \%SearchData,
    UserID     => 1,
);

# add mapping data for test template
for my $ObjectDataValue (qw( Name DeplState InciState )) {

    my $MappingID = $ImportExportObject->MappingAdd(
        TemplateID => $TemplateID,
        UserID     => 1,
    );

    my %MappingObjectData = ( Key => $ObjectDataValue );
    my $Success = $ImportExportObject->MappingObjectDataSave(
        MappingID         => $MappingID,
        MappingObjectData => \%MappingObjectData,
        UserID            => 1,
    );

    $Self->True(
        $Success,
        "ObjectData for test template is mapped - $ObjectDataValue",
    );
}

# make directory for export file
my $DestinationPath = $Kernel::OM->Get('Kernel::Config')->Get('Home') . "/var/tmp/ImportExport/";
mkpath( [$DestinationPath], 0, 0770 );    ## no critic

# test command with wrong template number
$ExitCode = $CommandObject->Execute(
    '--template-number',
    $Helper->GetRandomNumber(),
    $DestinationPath . 'TemplateExport.csv'
);

$Self->Is(
    $ExitCode,
    1,
    "Command with wrong template number - exit code",
);

# test command without destination argument
$ExitCode = $CommandObject->Execute( '--template-number', $TemplateID );

$Self->Is(
    $ExitCode,
    1,
    "No destination argument - exit code",
);

# test command with --template-number option and destination argument
$ExitCode = $CommandObject->Execute( '--template-number', $TemplateID, $DestinationPath . 'TemplateExport.csv' );

$Self->Is(
    $ExitCode,
    0,
    "Option - --template-number option and destination argument",
);

# remove test destination path
$Success = rmtree( [$DestinationPath] );
$Self->True(
    $Success,
    "Test directory deleted - $DestinationPath",
);

# cleanup is done by RestoreDatabase.

1;
