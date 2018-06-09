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
my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
my $ImportExportObject   = $Kernel::OM->Get('Kernel::System::ImportExport');
my $ObjectBackendObject  = $Kernel::OM->Get('Kernel::System::ImportExport::ObjectBackend::ITSMConfigItem');
my $XMLObject            = $Kernel::OM->Get('Kernel::System::XML');

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

# add some test templates for later checks
my @TemplateIDs;
my $Counter = 0;
for ( 1 .. 30 ) {

    # add a test template for later checks
    my $TemplateID = $ImportExportObject->TemplateAdd(
        Object  => 'ITSMConfigItem',
        Format  => 'UnitTest' . $Counter . $RandomID,
        Name    => 'UnitTest' . $Counter . $RandomID,
        ValidID => 1,
        UserID  => 1,
    );

    push @TemplateIDs, $TemplateID;

    $Counter++;
}

# ------------------------------------------------------------ #
# ObjectList test 1 (check CSV item)
# ------------------------------------------------------------ #

# get object list
my $ObjectList1 = $ImportExportObject->ObjectList();

# check object list
$Self->True(
    $ObjectList1 && ref $ObjectList1 eq 'HASH' && $ObjectList1->{ITSMConfigItem},
    "ObjectList() - ITSMConfigItem exists",
);

# ------------------------------------------------------------ #
# ObjectAttributesGet test 1 (check attribute hash)
# ------------------------------------------------------------ #

{

    # get object attributes
    my $ObjectAttributesGet1 = $ImportExportObject->ObjectAttributesGet(
        TemplateID => $TemplateIDs[0],
        UserID     => 1,
    );

    # check object attribute reference
    $Self->True(
        $ObjectAttributesGet1 && ref $ObjectAttributesGet1 eq 'ARRAY',
        "ObjectAttributesGet() - check array reference",
    );

    # get class list
    my $ClassList = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # define the reference hash
    my $ObjectAttributesGet1Reference = [
        {
            Key   => 'ClassID',
            Name  => 'Class',
            Input => {
                Type         => 'Selection',
                Data         => $ClassList,
                Required     => 1,
                Translation  => 0,
                PossibleNone => 1,
            },
        },
        {
            Key   => 'CountMax',
            Name  => 'Maximum number of one element',
            Input => {
                Type         => 'Text',
                ValueDefault => '10',
                Required     => 1,
                Regex        => qr{ \A \d+ \z }xms,
                Translation  => 0,
                Size         => 5,
                MaxLength    => 5,
                DataType     => 'IntegerBiggerThanZero',
            },
        },
        {
            'Input' => {
                'Type' => 'Checkbox'
            },
            'Name' => 'Empty fields indicate that the current values are kept',
            'Key'  => 'EmptyFieldsLeaveTheOldValues',
        }
    ];

    $Self->IsDeeply(
        $ObjectAttributesGet1,
        $ObjectAttributesGet1Reference,
        "ObjectAttributesGet() - attributes of the row are identical",
    );
}

# ------------------------------------------------------------ #
# ObjectAttributesGet test 2 (check with non existing template)
# ------------------------------------------------------------ #

# get object attributes
my $ObjectAttributesGet2 = $ImportExportObject->ObjectAttributesGet(
    TemplateID => $TemplateIDs[-1] + 1,
    UserID     => 1,
);

# check false return
$Self->False(
    $ObjectAttributesGet2,
    "ObjectAttributesGet() - check false return",
);

# ------------------------------------------------------------ #
# MappingObjectAttributesGet test 1 (check attribute hash)
# ------------------------------------------------------------ #

# get mapping object attributes
my $MappingObjectAttributesGet1 = $ImportExportObject->MappingObjectAttributesGet(
    TemplateID => $TemplateIDs[0],
    UserID     => 1,
);

# check mapping object attribute reference
$Self->True(
    $MappingObjectAttributesGet1 && ref $MappingObjectAttributesGet1 eq 'ARRAY',
    "MappingObjectAttributesGet() - check array reference",
);

# ------------------------------------------------------------ #
# MappingObjectAttributesGet test 2 (check with non existing template)
# ------------------------------------------------------------ #

# get mapping object attributes
my $MappingObjectAttributesGet2 = $ImportExportObject->MappingObjectAttributesGet(
    TemplateID => $TemplateIDs[-1] + 1,
    UserID     => 1,
);

# check false return
$Self->False(
    $MappingObjectAttributesGet2,
    "MappingObjectAttributesGet() - check false return",
);

# ------------------------------------------------------------ #
# make preparations to test ExportDataGet() and ImportDataSave()
# ------------------------------------------------------------ #

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

# add the test classes
my @ConfigItemClassIDs;
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

# create some random numbers
my @ConfigItemNumbers;
for ( 1 .. 10 ) {
    push @ConfigItemNumbers, $Helper->GetRandomNumber();
}

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

# define the test config items
my @ConfigItems = (

    # config item for all provided data types
    {
        ConfigItem => {
            Number  => $ConfigItemNumbers[0],
            ClassID => $ConfigItemClassIDs[0],
            UserID  => 1,
        },
        Versions => [
            {
                Name         => 'UnitTest - ConfigItem 1 Version 1',
                DefinitionID => $ConfigItemDefinitionIDs[0],
                DeplStateID  => $DeplStateListReverse{Production},
                InciStateID  => $InciStateListReverse{Operational},
                XMLData      => [
                    undef,
                    {
                        Version => [
                            undef,
                            {
                                Customer1 => [
                                    undef,
                                    {
                                        Content => 'UnitTest',
                                    },
                                ],
                                Date1 => [
                                    undef,
                                    {
                                        Content => '2008-02-01',
                                    },
                                ],
                                DateTime1 => [
                                    undef,
                                    {
                                        Content => '2008-02-01 03:59',
                                    },
                                ],
                                GeneralCatalog1 => [
                                    undef,
                                    {
                                        Content => $GeneralCatalogListReverse{Test1},
                                    },
                                ],
                                Integer1 => [
                                    undef,
                                    {
                                        Content => '1',
                                    },
                                ],
                                Text1 => [
                                    undef,
                                    {
                                        Content => 'Test Text Test',
                                    },
                                ],
                                TextArea1 => [
                                    undef,
                                    {
                                        Content => "Test\nText Array\nTest",
                                    },
                                ],
                            },
                        ],
                    },
                ],
                UserID => 1,
            },
        ],
    },

    # a second config item for all provided data types
    # (duplicate name of first version for search checks)
    {
        ConfigItem => {
            Number  => $ConfigItemNumbers[1],
            ClassID => $ConfigItemClassIDs[0],
            UserID  => 1,
        },
        Versions => [
            {
                Name         => 'UnitTest - ConfigItem 1 Version 1',    # duplicate name for tests
                DefinitionID => $ConfigItemDefinitionIDs[0],
                DeplStateID  => $DeplStateListReverse{Production},
                InciStateID  => $InciStateListReverse{Operational},
                XMLData      => [
                    undef,
                    {
                        Version => [
                            undef,
                            {
                                Customer1 => [
                                    undef,
                                    {
                                        Content => 'UnitTest',
                                    },
                                ],
                                Date1 => [
                                    undef,
                                    {
                                        Content => '2008-02-01',
                                    },
                                ],
                                DateTime1 => [
                                    undef,
                                    {
                                        Content => '2008-02-01 03:59',
                                    },
                                ],
                                GeneralCatalog1 => [
                                    undef,
                                    {
                                        Content => $GeneralCatalogListReverse{Test1},
                                    },
                                ],
                                Integer1 => [
                                    undef,
                                    {
                                        Content => '1',
                                    },
                                ],
                                Text1 => [
                                    undef,
                                    {
                                        Content => 'Test Text Test',
                                    },
                                ],
                                TextArea1 => [
                                    undef,
                                    {
                                        Content => "Test\nText Array\nTest",
                                    },
                                ],
                            },
                        ],
                    },
                ],
                UserID => 1,
            },
            {
                Name         => 'UnitTest - ConfigItem 2 Version 2',
                DefinitionID => $ConfigItemDefinitionIDs[0],
                DeplStateID  => $DeplStateListReverse{Production},
                InciStateID  => $InciStateListReverse{Operational},
                XMLData      => [
                    undef,
                    {
                        Version => [
                            undef,
                            {
                                Customer1 => [
                                    undef,
                                    {
                                        Content => 'UnitTest2',
                                    },
                                ],
                                Date1 => [
                                    undef,
                                    {
                                        Content => '2008-02-02',
                                    },
                                ],
                                DateTime1 => [
                                    undef,
                                    {
                                        Content => '2008-02-02 03:59',
                                    },
                                ],
                                GeneralCatalog1 => [
                                    undef,
                                    {
                                        Content => $GeneralCatalogListReverse{Test2},
                                    },
                                ],
                                Integer1 => [
                                    undef,
                                    {
                                        Content => '2',
                                    },
                                ],
                                Text1 => [
                                    undef,
                                    {
                                        Content => 'Test Text Test2',
                                    },
                                ],
                                TextArea1 => [
                                    undef,
                                    {
                                        Content => "Test2\nText Array\nTest 2",
                                    },
                                ],
                            },
                        ],
                    },
                ],
                UserID => 1,
            },
        ],
    },

    # config item for sub element tests
    {
        ConfigItem => {
            Number  => $ConfigItemNumbers[2],
            ClassID => $ConfigItemClassIDs[1],
            UserID  => 1,
        },
        Versions => [
            {
                Name         => 'UnitTest - ConfigItem 3 Version 1',
                DefinitionID => $ConfigItemDefinitionIDs[1],
                DeplStateID  => $DeplStateListReverse{Production},
                InciStateID  => $InciStateListReverse{Operational},
                XMLData      => [
                    undef,
                    {
                        Version => [
                            undef,
                            {
                                Main1 => [
                                    undef,
                                    {
                                        Content   => 'Main1 (1)',
                                        Main1Sub1 => [
                                            undef,
                                            {
                                                Content          => 'Main1 (1) Sub1 (1)',
                                                Main1Sub1SubSub1 => [
                                                    undef,
                                                    {
                                                        Content => 'Main1 (1) Sub1 (1) SubSub1 (1)',
                                                    },
                                                    {
                                                        Content => 'Main1 (1) Sub1 (1) SubSub1 (2)',
                                                    },
                                                    {
                                                        Content => 'Main1 (1) Sub1 (1) SubSub1 (3)',
                                                    },
                                                ],
                                                Main1Sub1SubSub2 => [
                                                    undef,
                                                    {
                                                        Content => 'Main1 (1) Sub1 (1) SubSub2 (1)',
                                                    },
                                                ],
                                            },
                                            {
                                                Content          => 'Main1 (1) Sub1 (2)',
                                                Main1Sub1SubSub1 => [
                                                    undef,
                                                    {
                                                        Content => 'Main1 (1) Sub1 (2) SubSub1 (1)',
                                                    },
                                                ],
                                                Main1Sub1SubSub2 => [
                                                    undef,
                                                    {
                                                        Content => 'Main1 (1) Sub1 (2) SubSub2 (1)',
                                                    },
                                                    {
                                                        Content => 'Main1 (1) Sub1 (2) SubSub2 (2)',
                                                    },
                                                ],
                                            },
                                        ],
                                        Main1Sub2 => [
                                            undef,
                                            {
                                                Content => 'Main1 (1) Sub2 (1)',
                                            },
                                            {
                                                Content => 'Main1 (1) Sub2 (2)',
                                            },
                                        ],
                                    },
                                ],
                                Main2 => [
                                    undef,
                                    {
                                        Content   => 'Main2 (1)',
                                        Main2Sub1 => [
                                            undef,
                                            {
                                                Content => 'Main2 (1) Sub1 (1)',
                                            },
                                        ],
                                        Main2Sub2 => [
                                            undef,
                                            {
                                                'Content' => 'Main2 (1) Sub2 (1)',
                                            },
                                            {
                                                'Content' => 'Main2 (1) Sub2 (2)',
                                            },
                                        ],
                                    },
                                ],
                            },
                        ],
                    },
                ],
                UserID => 1,
            },
        ],
    },

    # config item for sub element tests
    {
        ConfigItem => {
            Number  => $ConfigItemNumbers[3],
            ClassID => $ConfigItemClassIDs[1],
            UserID  => 1,
        },
        Versions => [
            {
                Name         => 'UnitTest - ConfigItem 4 Version 1',
                DefinitionID => $ConfigItemDefinitionIDs[1],
                DeplStateID  => $DeplStateListReverse{Production},
                InciStateID  => $InciStateListReverse{Operational},
                XMLData      => [
                    undef,
                    {
                        Version => [
                            undef,
                            {
                                Main1 => [
                                    undef,
                                    {
                                        Content   => '',
                                        Main1Sub1 => [
                                            undef,
                                            {
                                                Content          => '',
                                                Main1Sub1SubSub1 => [
                                                    undef,
                                                    {
                                                        Content => '',
                                                    },
                                                ],
                                                Main1Sub1SubSub2 => [
                                                    undef,
                                                    {
                                                        Content => '',
                                                    },
                                                ],
                                            },
                                        ],
                                        Main1Sub2 => [
                                            undef,
                                            {
                                                Content => '',
                                            },
                                        ],
                                    },
                                ],
                                Main2 => [
                                    undef,
                                    {
                                        Content   => '',
                                        Main2Sub1 => [
                                            undef,
                                            {
                                                Content => '',
                                            },
                                        ],
                                        Main2Sub2 => [
                                            undef,
                                            {
                                                Content => '',
                                            },
                                        ],
                                    },
                                ],
                            },
                        ],
                    },
                ],
                UserID => 1,
            },
        ],
    },

    # config item for special character tests
    {
        ConfigItem => {
            Number  => $ConfigItemNumbers[4],
            ClassID => $ConfigItemClassIDs[1],
            UserID  => 1,
        },
        Versions => [
            {
                Name         => 'UnitTest - ConfigItem 5 Version 1',
                DefinitionID => $ConfigItemDefinitionIDs[1],
                DeplStateID  => $DeplStateListReverse{Production},
                InciStateID  => $InciStateListReverse{Operational},
                XMLData      => [
                    undef,
                    {
                        Version => [
                            undef,
                            {
                                Main1 => [
                                    undef,
                                    {
                                        Content   => '"";;::..--__##',
                                        Main1Sub1 => [
                                            undef,
                                            {
                                                Content          => 'Test;:_°^!"§$%&/()=?´`*+Test',
                                                Main1Sub1SubSub1 => [
                                                    undef,
                                                    {
                                                        Content => '><@~\'}{[]\\',
                                                    },
                                                ],
                                                Main1Sub1SubSub2 => [
                                                    undef,
                                                    {
                                                        Content => '><@~\'}{[]\\',
                                                    },
                                                ],
                                            },
                                        ],
                                        Main1Sub2 => [
                                            undef,
                                            {
                                                Content => 'Test;:_°^!"§$%&/()=?´`*+Test',
                                            },
                                        ],
                                    },
                                ],
                                Main2 => [
                                    undef,
                                    {
                                        Content   => '"";;::..--__##',
                                        Main2Sub1 => [
                                            undef,
                                            {
                                                Content => 'Test Test',
                                            },
                                        ],
                                        Main2Sub2 => [
                                            undef,
                                            {
                                                Content => "Test\nTest\tTest",
                                            },
                                        ],
                                    },
                                ],
                            },
                        ],
                    },
                ],
                UserID => 1,
            },
        ],
    },

    # config item for UTF-8 tests
    {
        ConfigItem => {
            Number  => $ConfigItemNumbers[5],
            ClassID => $ConfigItemClassIDs[1],
            UserID  => 1,
        },
        Versions => [
            {
                Name         => 'UnitTest - ConfigItem 6 Version 1',
                DefinitionID => $ConfigItemDefinitionIDs[1],
                DeplStateID  => $DeplStateListReverse{Production},
                InciStateID  => $InciStateListReverse{Operational},
                XMLData      => [
                    undef,
                    {
                        Version => [
                            undef,
                            {
                                Main1 => [
                                    undef,
                                    {
                                        Content   => 'ↂ ⅻ ⅛',
                                        Main1Sub1 => [
                                            undef,
                                            {
                                                Content          => '☄ ↮ ↹ →',
                                                Main1Sub1SubSub1 => [
                                                    undef,
                                                    {
                                                        Content => '₤ ₡ ₩ ₯ ₵',
                                                    },
                                                ],
                                                Main1Sub1SubSub2 => [
                                                    undef,
                                                    {
                                                        Content => '♊ ♈ ♉ ♊ ♋ ♍ ♑',
                                                    },
                                                ],
                                            },
                                        ],
                                        Main1Sub2 => [
                                            undef,
                                            {
                                                Content => '✈ ❤ ☮',
                                            },
                                        ],
                                    },
                                ],
                                Main2 => [
                                    undef,
                                    {
                                        Content   => 'Պ Մ Հ',
                                        Main2Sub1 => [
                                            undef,
                                            {
                                                Content => '® ©',
                                            },
                                        ],
                                        Main2Sub2 => [
                                            undef,
                                            {
                                                Content => 'か げ を',
                                            },
                                        ],
                                    },
                                ],
                            },
                        ],
                    },
                ],
                UserID => 1,
            },
        ],
    },
);

# add the test config items
my @ConfigItemIDs;
for my $ConfigItem (@ConfigItems) {

    # add a config item
    my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
        %{ $ConfigItem->{ConfigItem} },
    );

    # check config item id
    if ( !$ConfigItemID ) {

        $Self->True(
            0,
            "Can't add new config item.",
        );
    }

    push @ConfigItemIDs, $ConfigItemID;

    # add the versions
    for my $Version ( @{ $ConfigItem->{Versions} } ) {

        # add a version
        my $VersionID = $ConfigItemObject->VersionAdd(
            %{$Version},
            ConfigItemID => $ConfigItemID,
        );

        # check version id
        if ( !$VersionID ) {

            $Self->True(
                0,
                "Can't add new version.",
            );
        }
    }
}

# ------------------------------------------------------------ #
# define general ExportDataGet tests
# ------------------------------------------------------------ #

my @ExportDataTests = (

    # ImportDataGet doesn't contains all data (check required attributes)
    {
        SourceExportData => {
            ExportDataGet => {
                UserID => 1,
            },
        },
    },

    # ImportDataGet doesn't contains all data (check required attributes)
    {
        SourceExportData => {
            ExportDataGet => {
                TemplateID => $TemplateIDs[1],
            },
        },
    },

    # no existing template id is given (check return false)
    {
        SourceExportData => {
            ExportDataGet => {
                TemplateID => $TemplateIDs[-1] + 1,
                UserID     => 1,
            },
        },
    },

    # no class id is given (check return false)
    {
        SourceExportData => {
            ExportDataGet => {
                TemplateID => $TemplateIDs[2],
                UserID     => 1,
            },
        },
    },

    # invalid class id is given (check return false)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[-1] + 1,
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[2],
                UserID     => 1,
            },
        },
    },

    # mapping list is empty (check return false)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[3],
                UserID     => 1,
            },
        },
    },

    # all required values are given (number search check)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
            ],
            SearchData => {
                Number => $ConfigItemNumbers[0],
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[5],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [ $ConfigItemNumbers[0] ],
        ],
    },

    # all required values are given (name search check)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
            ],
            SearchData => {
                Name => 'UnitTest - ConfigItem 1 Version 1',
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[5],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [ $ConfigItemNumbers[0] ],
        ],
    },

    # all required values are given (case insensitive name search check)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
            ],
            SearchData => {
                Name => 'unittest - configitem 1 version 1',
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[5],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [ $ConfigItemNumbers[0] ],
        ],
    },

    # all required values are given (name and number search check)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
            ],
            SearchData => {
                Number => $ConfigItemNumbers[0],
                Name   => 'UnitTest - ConfigItem 1 Version 1',
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[5],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [ $ConfigItemNumbers[0] ],
        ],
    },

    # all required values are given (deployment state search check)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
            ],
            SearchData => {
                DeplStateIDs => $DeplStateListReverse{Production},
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[5],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [ $ConfigItemNumbers[0] ],
            [ $ConfigItemNumbers[1] ],
        ],
    },

    # all required values are given (incident state search check)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
            ],
            SearchData => {
                InciStateIDs => $InciStateListReverse{Operational},
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[5],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [ $ConfigItemNumbers[0] ],
            [ $ConfigItemNumbers[1] ],
        ],
    },

    # all required values are given (combined search check)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
            ],
            SearchData => {
                Number       => $ConfigItemNumbers[0],
                Name         => 'UnitTest - ConfigItem 1 Version 1',
                DeplStateIDs => $DeplStateListReverse{Production},
                InciStateIDs => $InciStateListReverse{Operational},
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[5],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [ $ConfigItemNumbers[0] ],
        ],
    },

    # all required values are given (XML data search check)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
            ],
            SearchData => {
                Date1           => '2008-02-01',
                TextArea1       => "Test\nText Array\nTest",
                Customer1       => 'UnitTest',
                Text1           => 'Test Text Test',
                DateTime1       => '2008-02-01 03:59',
                Integer1        => '1',
                GeneralCatalog1 => $GeneralCatalogListReverse{Test1},
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[5],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [ $ConfigItemNumbers[0] ],
        ],
    },

    # all required values are given (combined all search check)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
            ],
            SearchData => {
                Number          => $ConfigItemNumbers[0],
                Name            => 'UnitTest - ConfigItem 1 Version 1',
                DeplStateIDs    => $DeplStateListReverse{Production},
                InciStateIDs    => $InciStateListReverse{Operational},
                Date1           => '2008-02-01',
                TextArea1       => "Test\nText Array\nTest",
                Customer1       => 'UnitTest',
                Text1           => 'Test Text Test',
                DateTime1       => '2008-02-01 03:59',
                Integer1        => '1',
                GeneralCatalog1 => $GeneralCatalogListReverse{Test1},
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[5],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [ $ConfigItemNumbers[0] ],
        ],
    },

    # all required values are given (check the returned array)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Customer1::1',
                },
                {
                    Key => 'Date1::1',
                },
                {
                    Key => 'DateTime1::1',
                },
                {
                    Key => 'Dummy1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
                {
                    Key => 'Integer1::1',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'TextArea1::1',
                },
            ],
            SearchData => {
                Number => $ConfigItemNumbers[0],
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[6],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [
                $ConfigItemNumbers[0],
                'UnitTest - ConfigItem 1 Version 1',
                'Production',
                'Operational',
                'UnitTest',
                '2008-02-01',
                '2008-02-01 03:59',
                undef,
                'Test1',
                '1',
                'Test Text Test',
                "Test\nText Array\nTest",
            ],
        ],
    },

    # all required values are given (double element checks)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
                {
                    Key => 'Number',
                },
                {
                    Key => 'Name',
                },
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Customer1::1',
                },
                {
                    Key => 'Customer1::1',
                },
                {
                    Key => 'Date1::1',
                },
                {
                    Key => 'Date1::1',
                },
                {
                    Key => 'DateTime1::1',
                },
                {
                    Key => 'DateTime1::1',
                },
                {
                    Key => 'Dummy1::1',
                },
                {
                    Key => 'Dummy1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
                {
                    Key => 'Integer1::1',
                },
                {
                    Key => 'Integer1::1',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'TextArea1::1',
                },
                {
                    Key => 'TextArea1::1',
                },
            ],
            SearchData => {
                Number => $ConfigItemNumbers[0],
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[6],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [
                $ConfigItemNumbers[0],
                $ConfigItemNumbers[0],
                'UnitTest - ConfigItem 1 Version 1',
                'UnitTest - ConfigItem 1 Version 1',
                'Production',
                'Production',
                'Operational',
                'Operational',
                'UnitTest',
                'UnitTest',
                '2008-02-01',
                '2008-02-01',
                '2008-02-01 03:59',
                '2008-02-01 03:59',
                undef,
                undef,
                'Test1',
                'Test1',
                '1',
                '1',
                'Test Text Test',
                'Test Text Test',
                "Test\nText Array\nTest",
                "Test\nText Array\nTest",
            ],
        ],
    },

    # all required values are given (sub element checks)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[1],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Main1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::3',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::2',
                },
                {
                    Key => 'Main1::1::Main1Sub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub2::2',
                },
                {
                    Key => 'Main2::1',
                },
                {
                    Key => 'Main2::1::Main2Sub1::1',
                },
                {
                    Key => 'Main2::1::Main2Sub2::1',
                },
                {
                    Key => 'Main2::1::Main2Sub2::2',
                },
            ],
            SearchData => {
                Number => $ConfigItemNumbers[2],
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[7],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [
                $ConfigItemNumbers[2],
                'UnitTest - ConfigItem 3 Version 1',
                'Production',
                'Operational',
                'Main1 (1)',
                'Main1 (1) Sub1 (1)',
                'Main1 (1) Sub1 (1) SubSub1 (1)',
                'Main1 (1) Sub1 (1) SubSub1 (2)',
                'Main1 (1) Sub1 (1) SubSub1 (3)',
                'Main1 (1) Sub1 (1) SubSub2 (1)',
                'Main1 (1) Sub1 (2)',
                'Main1 (1) Sub1 (2) SubSub1 (1)',
                'Main1 (1) Sub1 (2) SubSub2 (1)',
                'Main1 (1) Sub1 (2) SubSub2 (2)',
                'Main1 (1) Sub2 (1)',
                'Main1 (1) Sub2 (2)',
                'Main2 (1)',
                'Main2 (1) Sub1 (1)',
                'Main2 (1) Sub2 (1)',
                'Main2 (1) Sub2 (2)',
            ],
        ],
    },

    # all required values are given (sub element checks with undef values)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[1],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Main1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::3',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::4',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub2::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub1::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::3',
                },
                {
                    Key => 'Main1::1::Main1Sub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub2::2',
                },
                {
                    Key => 'Main1::1::Main1Sub2::3',
                },
                {
                    Key => 'Main2::1',
                },
                {
                    Key => 'Main2::1::Main2Sub1::1',
                },
                {
                    Key => 'Main2::1::Main2Sub1::2',
                },
                {
                    Key => 'Main2::1::Main2Sub2::1',
                },
                {
                    Key => 'Main2::1::Main2Sub2::2',
                },
                {
                    Key => 'Main2::1::Main2Sub2::3',
                },
                {
                    Key => 'Main2::2',
                },
            ],
            SearchData => {
                Number => $ConfigItemNumbers[2],
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[7],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [
                $ConfigItemNumbers[2],
                'UnitTest - ConfigItem 3 Version 1',
                'Production',
                'Operational',
                'Main1 (1)',
                'Main1 (1) Sub1 (1)',
                'Main1 (1) Sub1 (1) SubSub1 (1)',
                'Main1 (1) Sub1 (1) SubSub1 (2)',
                'Main1 (1) Sub1 (1) SubSub1 (3)',
                undef,
                'Main1 (1) Sub1 (1) SubSub2 (1)',
                undef,
                'Main1 (1) Sub1 (2)',
                'Main1 (1) Sub1 (2) SubSub1 (1)',
                undef,
                'Main1 (1) Sub1 (2) SubSub2 (1)',
                'Main1 (1) Sub1 (2) SubSub2 (2)',
                undef,
                'Main1 (1) Sub2 (1)',
                'Main1 (1) Sub2 (2)',
                undef,
                'Main2 (1)',
                'Main2 (1) Sub1 (1)',
                undef,
                'Main2 (1) Sub2 (1)',
                'Main2 (1) Sub2 (2)',
                undef,
                undef,
            ],
        ],
    },

    # all required values are given (sub element checks with undef values and empty strings)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[1],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Main1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::3',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::4',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub2::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub1::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::3',
                },
                {
                    Key => 'Main1::1::Main1Sub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub2::2',
                },
                {
                    Key => 'Main1::1::Main1Sub2::3',
                },
                {
                    Key => 'Main2::1',
                },
                {
                    Key => 'Main2::1::Main2Sub1::1',
                },
                {
                    Key => 'Main2::1::Main2Sub1::2',
                },
                {
                    Key => 'Main2::1::Main2Sub2::1',
                },
                {
                    Key => 'Main2::1::Main2Sub2::2',
                },
                {
                    Key => 'Main2::1::Main2Sub2::3',
                },
                {
                    Key => 'Main2::2',
                },
            ],
            SearchData => {
                Number => $ConfigItemNumbers[3],
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[7],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [
                $ConfigItemNumbers[3],
                'UnitTest - ConfigItem 4 Version 1',
                'Production',
                'Operational',
                '',
                '',
                '',
                undef,
                undef,
                undef,
                '',
                undef,
                undef,
                undef,
                undef,
                undef,
                undef,
                undef,
                '',
                undef,
                undef,
                '',
                '',
                undef,
                '',
                undef,
                undef,
                undef,
            ],
        ],
    },

    # all required values are given (special character checks)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[1],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Main1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub2::1',
                },
                {
                    Key => 'Main2::1',
                },
                {
                    Key => 'Main2::1::Main2Sub1::1',
                },
                {
                    Key => 'Main2::1::Main2Sub2::1',
                },
            ],
            SearchData => {
                Number => $ConfigItemNumbers[4],
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[8],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [
                $ConfigItemNumbers[4],
                'UnitTest - ConfigItem 5 Version 1',
                'Production',
                'Operational',
                '"";;::..--__##',
                'Test;:_°^!"§$%&/()=?´`*+Test',
                '><@~\'}{[]\\',
                '><@~\'}{[]\\',
                'Test;:_°^!"§$%&/()=?´`*+Test',
                '"";;::..--__##',
                'Test Test',
                "Test\nTest\tTest",
            ],
        ],
    },

    # all required values are given (UTF-8 checks)
    {
        SourceExportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[1],
            },
            MappingObjectData => [
                {
                    Key => 'Number',
                },
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Main1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub2::1',
                },
                {
                    Key => 'Main2::1',
                },
                {
                    Key => 'Main2::1::Main2Sub1::1',
                },
                {
                    Key => 'Main2::1::Main2Sub2::1',
                },
            ],
            SearchData => {
                Number => $ConfigItemNumbers[5],
            },
            ExportDataGet => {
                TemplateID => $TemplateIDs[9],
                UserID     => 1,
            },
        },
        ReferenceExportData => [
            [
                $ConfigItemNumbers[5],
                'UnitTest - ConfigItem 6 Version 1',
                'Production',
                'Operational',
                'ↂ ⅻ ⅛',
                '☄ ↮ ↹ →',
                '₤ ₡ ₩ ₯ ₵',
                '♊ ♈ ♉ ♊ ♋ ♍ ♑',
                '✈ ❤ ☮',
                'Պ Մ Հ',
                '® ©',
                'か げ を',
            ],
        ],
    },
);

# ------------------------------------------------------------ #
# run general ExportDataGet tests
# ------------------------------------------------------------ #

my $ExportTestCount = 1;
TEST:
for my $Test (@ExportDataTests) {

    # check SourceExportData attribute
    if ( !$Test->{SourceExportData} || ref $Test->{SourceExportData} ne 'HASH' ) {

        $Self->True(
            0,
            "ExportTest $ExportTestCount: No SourceExportData found for this test."
        );

        next TEST;
    }

    # set the object data
    if (
        $Test->{SourceExportData}->{ObjectData}
        && ref $Test->{SourceExportData}->{ObjectData} eq 'HASH'
        && $Test->{SourceExportData}->{ExportDataGet}->{TemplateID}
        )
    {

        # save object data
        $ImportExportObject->ObjectDataSave(
            TemplateID => $Test->{SourceExportData}->{ExportDataGet}->{TemplateID},
            ObjectData => $Test->{SourceExportData}->{ObjectData},
            UserID     => 1,
        );
    }

    # set the mapping object data
    if (
        $Test->{SourceExportData}->{MappingObjectData}
        && ref $Test->{SourceExportData}->{MappingObjectData} eq 'ARRAY'
        && $Test->{SourceExportData}->{ExportDataGet}->{TemplateID}
        )
    {

        # delete all existing mapping data
        $ImportExportObject->MappingDelete(
            TemplateID => $Test->{SourceExportData}->{ExportDataGet}->{TemplateID},
            UserID     => 1,
        );

        # add the mapping object rows
        MAPPINGOBJECTDATA:
        for my $MappingObjectData ( @{ $Test->{SourceExportData}->{MappingObjectData} } ) {

            # add a new mapping row
            my $MappingID = $ImportExportObject->MappingAdd(
                TemplateID => $Test->{SourceExportData}->{ExportDataGet}->{TemplateID},
                UserID     => 1,
            );

            # add the mapping object data
            $ImportExportObject->MappingObjectDataSave(
                MappingID         => $MappingID,
                MappingObjectData => $MappingObjectData,
                UserID            => 1,
            );
        }
    }

    # add the search data
    if (
        $Test->{SourceExportData}->{SearchData}
        && ref $Test->{SourceExportData}->{SearchData} eq 'HASH'
        && $Test->{SourceExportData}->{ExportDataGet}->{TemplateID}
        )
    {

        # save search data
        $ImportExportObject->SearchDataSave(
            TemplateID => $Test->{SourceExportData}->{ExportDataGet}->{TemplateID},
            SearchData => $Test->{SourceExportData}->{SearchData},
            UserID     => 1,
        );
    }

    # get export data
    my $ExportData = $ObjectBackendObject->ExportDataGet(
        %{ $Test->{SourceExportData}->{ExportDataGet} },
    );

    if ( !$Test->{ReferenceExportData} ) {

        $Self->False(
            $ExportData,
            "ExportTest $ExportTestCount: ExportDataGet() - return false",
        );

        next TEST;
    }

    if ( ref $ExportData ne 'ARRAY' ) {

        # check array reference
        $Self->True(
            0,
            "ExportTest $ExportTestCount: ExportDataGet() - return value is an array reference",
        );

        next TEST;
    }

    # check number of rows
    $Self->Is(
        scalar @{$ExportData},
        scalar @{ $Test->{ReferenceExportData} },
        "ExportTest $ExportTestCount: ExportDataGet() - correct number of rows",
    );

    # check content of export data
    my $CounterRow = 0;
    ROW:
    for my $ExportRow ( @{$ExportData} ) {

        # extract reference row
        my $ReferenceRow = $Test->{ReferenceExportData}->[$CounterRow];

        if ( ref $ExportRow ne 'ARRAY' || ref $ReferenceRow ne 'ARRAY' ) {

            # check array reference
            $Self->True(
                0,
                "ExportTest $ExportTestCount: ExportDataGet() - export row and reference row matched",
            );

            next TEST;
        }

        # check number of columns
        $Self->Is(
            scalar @{$ExportRow},
            scalar @{$ReferenceRow},
            "ExportTest $ExportTestCount: ExportDataGet() - correct number of columns",
        );

        my $CounterColumn = 0;
        for my $Cell ( @{$ExportRow} ) {

            # set content if values are undef
            if ( !defined $Cell ) {
                $Cell = 'UNDEF-unittest';
            }
            if ( !defined $ReferenceRow->[$CounterColumn] ) {
                $ReferenceRow->[$CounterColumn] = 'UNDEF-unittest';
            }

            # check cell data
            $Self->Is(
                $Cell,
                $ReferenceRow->[$CounterColumn],
                "ExportTest $ExportTestCount: ExportDataGet() ",
            );

            $CounterColumn++;
        }

        $CounterRow++;
    }
}
continue {
    $ExportTestCount++;
}

# ------------------------------------------------------------ #
# define general ImportDataSave tests
# ------------------------------------------------------------ #

my @ImportDataTests = (

    # ImportDataSave doesn't contains all data (check required attributes)
    {
        SourceImportData => {
            ImportDataSave => {
                ImportDataRow => [],
                UserID        => 1,
            },
        },
    },

    # ImportDataSave doesn't contains all data (check required attributes)
    {
        SourceImportData => {
            ImportDataSave => {
                TemplateID => $TemplateIDs[20],
                UserID     => 1,
            },
        },
    },

    # ImportDataSave doesn't contains all data (check required attributes)
    {
        SourceImportData => {
            ImportDataSave => {
                TemplateID    => $TemplateIDs[20],
                ImportDataRow => [],
            },
        },
    },

    # import data row must be an array reference (check return false)
    {
        SourceImportData => {
            ImportDataSave => {
                TemplateID    => $TemplateIDs[20],
                ImportDataRow => '',
                UserID        => 1,
            },
        },
    },

    # import data row must be an array reference (check return false)
    {
        SourceImportData => {
            ImportDataSave => {
                TemplateID    => $TemplateIDs[20],
                ImportDataRow => {},
                UserID        => 1,
            },
        },
    },

    # no existing template id is given (check return false)
    {
        SourceImportData => {
            ImportDataSave => {
                TemplateID    => $TemplateIDs[-1] + 1,
                ImportDataRow => ['Dummy'],
                UserID        => 1,
            },
        },
    },

    # no class id is given (check return false)
    {
        SourceImportData => {
            ImportDataSave => {
                TemplateID    => $TemplateIDs[21],
                ImportDataRow => ['Dummy'],
                UserID        => 1,
            },
        },
    },

    # invalid class id is given (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[-1] + 1,
            },
            ImportDataSave => {
                TemplateID    => $TemplateIDs[22],
                ImportDataRow => ['Dummy'],
                UserID        => 1,
            },
        },
    },

    # mapping list is empty (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            ImportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ImportDataRow => ['Dummy'],
                UserID        => 1,
            },
        },
    },

    # more than one identifier with the same name (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ImportDataRow => [ '123', '321' ],
                UserID        => 1,
            },
        },
    },

    # identifier is empty (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ImportDataRow => [''],
                UserID        => 1,
            },
        },
    },

    # identifier is undef (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ImportDataRow => [undef],
                UserID        => 1,
            },
        },
    },

    # both identifiers are empty (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ImportDataRow => [ '', '' ],
                UserID        => 1,
            },
        },
    },

    # both identifiers are undef (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ImportDataRow => [ undef, undef ],
                UserID        => 1,
            },
        },
    },

    # one identifiers is empty, one is undef (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ImportDataRow => [ '', undef ],
                UserID        => 1,
            },
        },
    },

    # one of the identifiers is empty (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ImportDataRow => [ '123', '' ],
                UserID        => 1,
            },
        },
    },

    # one of the identifiers is undef (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ImportDataRow => [ '123', undef ],
                UserID        => 1,
            },
        },
    },

    # one of the identifiers is empty (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ImportDataRow => [ '', '123' ],
                UserID        => 1,
            },
        },
    },

    # one of the identifiers is empty (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ImportDataRow => [ undef, '123' ],
                UserID        => 1,
            },
        },
    },

    # TODO Add some identifier tests

    # empty name is given (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[24],
                ImportDataRow => [ '', 'Production', 'Operational' ],
                UserID        => 1,
            },
        },
    },

    # invalid deployment state is given (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[24],
                ImportDataRow => [ 'UnitTest - Importtest 1', 'Dummy', 'Operational' ],
                UserID        => 1,
            },
        },
    },

    # invalid incident state is given (check return false)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[24],
                ImportDataRow => [ 'UnitTest - Importtest 2', 'Production', 'Dummy' ],
                UserID        => 1,
            },
        },
    },

    # all required values are given (a NEW config item must be created)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Customer1::1',
                },
                {
                    Key => 'Date1::1',
                },
                {
                    Key => 'DateTime1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
                {
                    Key => 'Integer1::1',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'TextArea1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 3',
                    'Production',
                    'Operational',
                    'UnitTest',
                    '2008-06-05',
                    '2008-08-05 04:50',
                    'Test3',
                    '3',
                    'Test3 Text3 Test3',
                    "Test3\nTextArray3\nTest3",
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 1,
            LastVersion   => {
                Name                 => 'UnitTest - Importtest 3',
                DeplState            => 'Production',
                InciState            => 'Operational',
                'Customer1::1'       => 'UnitTest',
                'Date1::1'           => '2008-06-05',
                'DateTime1::1'       => '2008-08-05 04:50',
                'GeneralCatalog1::1' => $GeneralCatalogListReverse{Test3},
                'Integer1::1'        => '3',
                'Text1::1'           => 'Test3 Text3 Test3',
                'TextArea1::1'       => "Test3\nTextArray3\nTest3",
            },
        },
    },

    # all required values are given (a second NEW config item must be created)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Customer1::1',
                },
                {
                    Key => 'Date1::1',
                },
                {
                    Key => 'DateTime1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
                {
                    Key => 'Integer1::1',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'TextArea1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 4',
                    'Production',
                    'Operational',
                    'UnitTest',
                    '2008-09-05',
                    '2008-12-05 04:50',
                    'Test4',
                    '4',
                    'Test4 Text4 Test4',
                    "Test4\nTextArray4\nTest4",
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 1,
            LastVersion   => {
                Name                 => 'UnitTest - Importtest 4',
                DeplState            => 'Production',
                InciState            => 'Operational',
                'Customer1::1'       => 'UnitTest',
                'Date1::1'           => '2008-09-05',
                'DateTime1::1'       => '2008-12-05 04:50',
                'GeneralCatalog1::1' => $GeneralCatalogListReverse{Test4},
                'Integer1::1'        => '4',
                'Text1::1'           => 'Test4 Text4 Test4',
                'TextArea1::1'       => "Test4\nTextArray4\nTest4",
            },
        },
    },

    # all required values are given (a new version must be added to first test config item)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Customer1::1',
                },
                {
                    Key => 'Date1::1',
                },
                {
                    Key => 'DateTime1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
                {
                    Key => 'Integer1::1',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'TextArea1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[26],
                ImportDataRow => [
                    $ConfigItemNumbers[0],
                    'UnitTest - ConfigItem 1 Version 2',
                    'Pilot',
                    'Incident',
                    'UnitTest',
                    '2008-02-02',
                    '2008-02-02 03:59',
                    'Test2',
                    '2',
                    'Test Text UPDATE1 Test',
                    "Test\nText Array UPDATE1\nTest",
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 2,
            LastVersion   => {
                Name                 => 'UnitTest - ConfigItem 1 Version 2',
                DeplState            => 'Pilot',
                InciState            => 'Incident',
                'Customer1::1'       => 'UnitTest',
                'Date1::1'           => '2008-02-02',
                'DateTime1::1'       => '2008-02-02 03:59',
                'GeneralCatalog1::1' => $GeneralCatalogListReverse{Test2},
                'Integer1::1'        => '2',
                'Text1::1'           => 'Test Text UPDATE1 Test',
                'TextArea1::1'       => "Test\nText Array UPDATE1\nTest",
            },
        },
    },

    # all required values are given (a new version must be added to first test config item again)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Customer1::1',
                },
                {
                    Key => 'Date1::1',
                },
                {
                    Key => 'DateTime1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
                {
                    Key => 'Integer1::1',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'TextArea1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[27],
                ImportDataRow => [
                    $ConfigItemNumbers[0],
                    'UnitTest - ConfigItem 1 Version 3',
                    'Repair',
                    'Operational',
                    'UnitTest',
                    '2008-02-03',
                    '2008-02-03 03:59',
                    'Test3',
                    '3',
                    'Test Text UPDATE2 Test',
                    "Test\nText Array UPDATE2\nTest",
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 3,
            LastVersion   => {
                Name                 => 'UnitTest - ConfigItem 1 Version 3',
                DeplState            => 'Repair',
                InciState            => 'Operational',
                'Customer1::1'       => 'UnitTest',
                'Date1::1'           => '2008-02-03',
                'DateTime1::1'       => '2008-02-03 03:59',
                'GeneralCatalog1::1' => $GeneralCatalogListReverse{Test3},
                'Integer1::1'        => '3',
                'Text1::1'           => 'Test Text UPDATE2 Test',
                'TextArea1::1'       => "Test\nText Array UPDATE2\nTest",
            },
        },
    },

    # all required values are given (a new version must be added to third test config item)
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[1],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Main1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::3',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::2',
                },
                {
                    Key => 'Main1::1::Main1Sub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub2::2',
                },
                {
                    Key => 'Main2::1',
                },
                {
                    Key => 'Main2::1::Main2Sub1::1',
                },
                {
                    Key => 'Main2::1::Main2Sub2::1',
                },
                {
                    Key => 'Main2::1::Main2Sub2::2',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[27],
                ImportDataRow => [
                    $ConfigItemNumbers[2],
                    'UnitTest - ConfigItem 3 Version 2',
                    'Production',
                    'Operational',
                    'Main1 (1)',
                    'Main1 (1) Main1Sub1 (1)',
                    'Main1 (1) Main1Sub1 (1) Main1Sub1SubSub1 (1)',
                    'Main1 (1) Main1Sub1 (1) Main1Sub1SubSub1 (2)',
                    'Main1 (1) Main1Sub1 (1) Main1Sub1SubSub1 (3)',
                    'Main1 (1) Main1Sub1 (1) Main1Sub1SubSub2 (1)',
                    'Main1 (1) Main1Sub1 (2)',
                    'Main1 (1) Main1Sub1 (2) Main1Sub1SubSub1 (1)',
                    'Main1 (1) Main1Sub1 (2) Main1Sub1SubSub2 (1)',
                    'Main1 (1) Main1Sub1 (2) Main1Sub1SubSub2 (2)',
                    'Main1 (1) Main1Sub2 (1)',
                    'Main1 (1) Main1Sub2 (2)',
                    'Main2 (1)',
                    'Main2 (1) Main2Sub1 (1)',
                    'Main2 (1) Main2Sub2 (1)',
                    'Main2 (1) Main2Sub2 (2)',
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 2,
            LastVersion   => {
                Name                     => 'UnitTest - ConfigItem 3 Version 2',
                DeplState                => 'Production',
                InciState                => 'Operational',
                'Main1::1'               => 'Main1 (1)',
                'Main1::1::Main1Sub1::1' => 'Main1 (1) Main1Sub1 (1)',
                'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::1' =>
                    'Main1 (1) Main1Sub1 (1) Main1Sub1SubSub1 (1)',
                'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::2' =>
                    'Main1 (1) Main1Sub1 (1) Main1Sub1SubSub1 (2)',
                'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::3' =>
                    'Main1 (1) Main1Sub1 (1) Main1Sub1SubSub1 (3)',
                'Main1::1::Main1Sub1::1::Main1Sub1SubSub2::1' =>
                    'Main1 (1) Main1Sub1 (1) Main1Sub1SubSub2 (1)',
                'Main1::1::Main1Sub1::2' => 'Main1 (1) Main1Sub1 (2)',
                'Main1::1::Main1Sub1::2::Main1Sub1SubSub1::1' =>
                    'Main1 (1) Main1Sub1 (2) Main1Sub1SubSub1 (1)',
                'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::1' =>
                    'Main1 (1) Main1Sub1 (2) Main1Sub1SubSub2 (1)',
                'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::2' =>
                    'Main1 (1) Main1Sub1 (2) Main1Sub1SubSub2 (2)',
                'Main1::1::Main1Sub2::1' => 'Main1 (1) Main1Sub2 (1)',
                'Main1::1::Main1Sub2::2' => 'Main1 (1) Main1Sub2 (2)',
                'Main2::1'               => 'Main2 (1)',
                'Main2::1::Main2Sub1::1' => 'Main2 (1) Main2Sub1 (1)',
                'Main2::1::Main2Sub2::1' => 'Main2 (1) Main2Sub2 (1)',
                'Main2::1::Main2Sub2::2' => 'Main2 (1) Main2Sub2 (2)',
            },
        },
    },

    # all required values are given (special character checks)
    # In 'UnitTest - ConfigItem 3 Version 2' 16 Attributes were imported,
    # so there will be 8 lingering attributes.
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[1],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Main1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub2::1',
                },
                {
                    Key => 'Main2::1',
                },
                {
                    Key => 'Main2::1::Main2Sub1::1',
                },
                {
                    Key => 'Main2::1::Main2Sub2::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[27],
                ImportDataRow => [
                    $ConfigItemNumbers[2],
                    'UnitTest - ConfigItem 3 Version 3',
                    'Production',
                    'Operational',
                    '"";;::..--__##',
                    'Test;:_°^!"§$%&/()=?´`*+Test',
                    '><@~\'}{[]\\',
                    '><@~\'}{[]\\',
                    'Test;:_°^!"§$%&/()=?´`*+Test',
                    '"";;::..--__##',
                    'Test Test',
                    "Test\nTest\tTest",
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 3,
            LastVersion   => {
                Name                                          => 'UnitTest - ConfigItem 3 Version 3',
                DeplState                                     => 'Production',
                InciState                                     => 'Operational',
                'Main1::1'                                    => '"";;::..--__##',
                'Main1::1::Main1Sub1::1'                      => 'Test;:_°^!"§$%&/()=?´`*+Test',
                'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::1' => '><@~\'}{[]\\',
                'Main1::1::Main1Sub1::1::Main1Sub1SubSub2::1' => '><@~\'}{[]\\',
                'Main1::1::Main1Sub2::1'                      => 'Test;:_°^!"§$%&/()=?´`*+Test',
                'Main2::1'                                    => '"";;::..--__##',
                'Main2::1::Main2Sub1::1'                      => 'Test Test',
                'Main2::1::Main2Sub2::1'                      => "Test\nTest\tTest",

                # lingering from 'UnitTest - ConfigItem 3 Version 2',
                'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::2' =>
                    'Main1 (1) Main1Sub1 (1) Main1Sub1SubSub1 (2)',
                'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::3' =>
                    'Main1 (1) Main1Sub1 (1) Main1Sub1SubSub1 (3)',
                'Main1::1::Main1Sub1::2' => 'Main1 (1) Main1Sub1 (2)',
                'Main1::1::Main1Sub1::2::Main1Sub1SubSub1::1' =>
                    'Main1 (1) Main1Sub1 (2) Main1Sub1SubSub1 (1)',
                'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::1' =>
                    'Main1 (1) Main1Sub1 (2) Main1Sub1SubSub2 (1)',
                'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::2' =>
                    'Main1 (1) Main1Sub1 (2) Main1Sub1SubSub2 (2)',
                'Main1::1::Main1Sub2::2' => 'Main1 (1) Main1Sub2 (2)',
                'Main2::1::Main2Sub2::2' => 'Main2 (1) Main2Sub2 (2)',
            },
        },
    },

    # all required values are given (UTF-8 checks)
    # In 'UnitTest - ConfigItem 3 Version 2' 16 Attributes were imported,
    # so there will be 8 lingering attributes.
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[1],
            },
            MappingObjectData => [
                {
                    Key        => 'Number',
                    Identifier => 1,
                },
                {
                    Key => 'Name',
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Main1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::1',
                },
                {
                    Key => 'Main1::1::Main1Sub1::1::Main1Sub1SubSub2::1',
                },
                {
                    Key => 'Main1::1::Main1Sub2::1',
                },
                {
                    Key => 'Main2::1',
                },
                {
                    Key => 'Main2::1::Main2Sub1::1',
                },
                {
                    Key => 'Main2::1::Main2Sub2::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[27],
                ImportDataRow => [
                    $ConfigItemNumbers[2],
                    'UnitTest - ConfigItem 3 Version 4',
                    'Production',
                    'Operational',
                    'Ϋ δ λ',
                    'π χ Ϙ',
                    'Ϻ ϱ Ϯ',
                    'ɯ ʓ ʠ',
                    'ʬ ʯ',
                    'й ф щ',
                    'њ ё',
                    'Ѭ Ѧ',
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 4,
            LastVersion   => {
                Name                                          => 'UnitTest - ConfigItem 3 Version 4',
                DeplState                                     => 'Production',
                InciState                                     => 'Operational',
                'Main1::1'                                    => 'Ϋ δ λ',
                'Main1::1::Main1Sub1::1'                      => 'π χ Ϙ',
                'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::1' => 'Ϻ ϱ Ϯ',
                'Main1::1::Main1Sub1::1::Main1Sub1SubSub2::1' => 'ɯ ʓ ʠ',
                'Main1::1::Main1Sub2::1'                      => 'ʬ ʯ',
                'Main2::1'                                    => 'й ф щ',
                'Main2::1::Main2Sub1::1'                      => 'њ ё',
                'Main2::1::Main2Sub2::1'                      => 'Ѭ Ѧ',

                # lingering from 'UnitTest - ConfigItem 3 Version 2',
                'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::2' =>
                    'Main1 (1) Main1Sub1 (1) Main1Sub1SubSub1 (2)',
                'Main1::1::Main1Sub1::1::Main1Sub1SubSub1::3' =>
                    'Main1 (1) Main1Sub1 (1) Main1Sub1SubSub1 (3)',
                'Main1::1::Main1Sub1::2' => 'Main1 (1) Main1Sub1 (2)',
                'Main1::1::Main1Sub1::2::Main1Sub1SubSub1::1' =>
                    'Main1 (1) Main1Sub1 (2) Main1Sub1SubSub1 (1)',
                'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::1' =>
                    'Main1 (1) Main1Sub1 (2) Main1Sub1SubSub2 (1)',
                'Main1::1::Main1Sub1::2::Main1Sub1SubSub2::2' =>
                    'Main1 (1) Main1Sub1 (2) Main1Sub1SubSub2 (2)',
                'Main1::1::Main1Sub2::2' => 'Main1 (1) Main1Sub2 (2)',
                'Main2::1::Main2Sub2::2' => 'Main2 (1) Main2Sub2 (2)',
            },
        },
    },

    # a simple import for testing the overriding behavior of empty values
    {
        SourceImportData => {
            ObjectData => {
                ClassID => $ConfigItemClassIDs[0],
            },
            MappingObjectData => [
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 5',
                    'Production',
                    'Operational',
                    'Importtest 5 for behavior of empty values',
                    'Test1',
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 1,
            LastVersion   => {
                Name                 => 'UnitTest - Importtest 5',
                DeplState            => 'Production',
                InciState            => 'Operational',
                'Text1::1'           => 'Importtest 5 for behavior of empty values',
                'GeneralCatalog1::1' => $GeneralCatalogListReverse{Test1},
            },
        },
    },

    # import an empty value for Text1, with EmptyFieldsLeaveTheOldValues turned on
    # no new version should be created
    {
        SourceImportData => {
            ObjectData => {
                ClassID                      => $ConfigItemClassIDs[0],
                EmptyFieldsLeaveTheOldValues => 'on',
            },
            MappingObjectData => [
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 5',
                    'Production',
                    'Operational',
                    '',
                    'Test1',
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 1,
            LastVersion   => {
                Name                 => 'UnitTest - Importtest 5',
                DeplState            => 'Production',
                InciState            => 'Operational',
                'Text1::1'           => 'Importtest 5 for behavior of empty values',
                'GeneralCatalog1::1' => $GeneralCatalogListReverse{Test1},
            },
        },
    },

    # import undef for Text1, with EmptyFieldsLeaveTheOldValues turned on
    # no new version should be created
    {
        SourceImportData => {
            ObjectData => {
                ClassID                      => $ConfigItemClassIDs[0],
                EmptyFieldsLeaveTheOldValues => 'on',
            },
            MappingObjectData => [
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 5',
                    'Production',
                    'Operational',
                    undef,
                    'Test1',
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 1,
            LastVersion   => {
                Name                 => 'UnitTest - Importtest 5',
                DeplState            => 'Production',
                InciState            => 'Operational',
                'Text1::1'           => 'Importtest 5 for behavior of empty values',
                'GeneralCatalog1::1' => $GeneralCatalogListReverse{Test1},
            },
        },
    },

    # import an empty value for Text1, with EmptyFieldsLeaveTheOldValues turned off
    # a new version should be created
    {
        SourceImportData => {
            ObjectData => {
                ClassID                      => $ConfigItemClassIDs[0],
                EmptyFieldsLeaveTheOldValues => '',
            },
            MappingObjectData => [
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 5',
                    'Production',
                    'Operational',
                    '',
                    'Test1',
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 2,
            LastVersion   => {
                Name                 => 'UnitTest - Importtest 5',
                DeplState            => 'Production',
                InciState            => 'Operational',
                'Text1::1'           => '',
                'GeneralCatalog1::1' => $GeneralCatalogListReverse{Test1},
            },
        },
    },

    # import a single space value for Text1, with EmptyFieldsLeaveTheOldValues turned on
    # a new version should be created
    {
        SourceImportData => {
            ObjectData => {
                ClassID                      => $ConfigItemClassIDs[0],
                EmptyFieldsLeaveTheOldValues => '',
            },
            MappingObjectData => [
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 5',
                    'Production',
                    'Operational',
                    ' ',
                    'Test1',
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 3,
            LastVersion   => {
                Name                 => 'UnitTest - Importtest 5',
                DeplState            => 'Production',
                InciState            => 'Operational',
                'Text1::1'           => ' ',
                'GeneralCatalog1::1' => $GeneralCatalogListReverse{Test1},
            },
        },
    },

    # import the string '0' value for Text1, with EmptyFieldsLeaveTheOldValues turned on
    # a new version should be created
    {
        SourceImportData => {
            ObjectData => {
                ClassID                      => $ConfigItemClassIDs[0],
                EmptyFieldsLeaveTheOldValues => '',
            },
            MappingObjectData => [
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 5',
                    'Production',
                    'Operational',
                    '0',
                    'Test1',
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 4,
            LastVersion   => {
                Name                 => 'UnitTest - Importtest 5',
                DeplState            => 'Production',
                InciState            => 'Operational',
                'Text1::1'           => '0',
                'GeneralCatalog1::1' => $GeneralCatalogListReverse{Test1},
            },
        },
    },

    # import an empty value for GeneralCatalog1, with EmptyFieldsLeaveTheOldValues turned on
    # no new version should be created
    {
        SourceImportData => {
            ObjectData => {
                ClassID                      => $ConfigItemClassIDs[0],
                EmptyFieldsLeaveTheOldValues => 'on',
            },
            MappingObjectData => [
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 5',
                    'Production',
                    'Operational',
                    '',
                    '',
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 4,
            LastVersion   => {
                Name                 => 'UnitTest - Importtest 5',
                DeplState            => 'Production',
                InciState            => 'Operational',
                'Text1::1'           => '0',
                'GeneralCatalog1::1' => $GeneralCatalogListReverse{Test1},
            },
        },
    },

    # import an invalid value for GeneralCatalog1, with EmptyFieldsLeaveTheOldValues turned on
    # the import should fail
    {
        SourceImportData => {
            ObjectData => {
                ClassID                      => $ConfigItemClassIDs[0],
                EmptyFieldsLeaveTheOldValues => 'on',
            },
            MappingObjectData => [
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 5',
                    'Production',
                    'Operational',
                    '',
                    'non-existent general catalog entry',
                ],
                UserID => 1,
            },
        },
    },

    # import an invalid value for GeneralCatalog1, with EmptyFieldsLeaveTheOldValues turned off
    # the import should fail
    {
        SourceImportData => {
            ObjectData => {
                ClassID                      => $ConfigItemClassIDs[0],
                EmptyFieldsLeaveTheOldValues => '',
            },
            MappingObjectData => [
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 5',
                    'Production',
                    'Operational',
                    '',
                    'non-existent general catalog entry',
                ],
                UserID => 1,
            },
        },
    },

    # import an empty value for DeplState, with EmptyFieldsLeaveTheOldValues turned on
    # no new version should be created
    {
        SourceImportData => {
            ObjectData => {
                ClassID                      => $ConfigItemClassIDs[0],
                EmptyFieldsLeaveTheOldValues => 'on',
            },
            MappingObjectData => [
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 5',
                    '',
                    'Operational',
                    '',
                    '',
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 4,
            LastVersion   => {
                Name                 => 'UnitTest - Importtest 5',
                DeplState            => 'Production',
                InciState            => 'Operational',
                'Text1::1'           => '0',
                'GeneralCatalog1::1' => $GeneralCatalogListReverse{Test1},
            },
        },
    },

    # import an invalid value for DeplState, with EmptyFieldsLeaveTheOldValues turned on
    # an error should be generated
    {
        SourceImportData => {
            ObjectData => {
                ClassID                      => $ConfigItemClassIDs[0],
                EmptyFieldsLeaveTheOldValues => 'on',
            },
            MappingObjectData => [
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 5',
                    'invalid deployment state',
                    'Operational',
                    '',
                    '',
                ],
                UserID => 1,
            },
        },
    },

    # import an empty value for InciState, with EmptyFieldsLeaveTheOldValues turned on
    # no new version should be created
    {
        SourceImportData => {
            ObjectData => {
                ClassID                      => $ConfigItemClassIDs[0],
                EmptyFieldsLeaveTheOldValues => 'on',
            },
            MappingObjectData => [
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 5',
                    'Production',
                    '',
                    '',
                    '',
                ],
                UserID => 1,
            },
        },
        ReferenceImportData => {
            VersionNumber => 4,
            LastVersion   => {
                Name                 => 'UnitTest - Importtest 5',
                DeplState            => 'Production',
                InciState            => 'Operational',
                'Text1::1'           => '0',
                'GeneralCatalog1::1' => $GeneralCatalogListReverse{Test1},
            },
        },
    },

    # import an invalid value for InciState, with EmptyFieldsLeaveTheOldValues turned on
    # an error should be generated
    {
        SourceImportData => {
            ObjectData => {
                ClassID                      => $ConfigItemClassIDs[0],
                EmptyFieldsLeaveTheOldValues => 'on',
            },
            MappingObjectData => [
                {
                    Key        => 'Name',
                    Identifier => 1,
                },
                {
                    Key => 'DeplState',
                },
                {
                    Key => 'InciState',
                },
                {
                    Key => 'Text1::1',
                },
                {
                    Key => 'GeneralCatalog1::1',
                },
            ],
            ImportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ImportDataRow => [
                    'UnitTest - Importtest 5',
                    'Production',
                    'invalid incident state',
                    '',
                    '',
                ],
                UserID => 1,
            },
        },
    },
);

# ------------------------------------------------------------ #
# run general ExportDataGet tests
# ------------------------------------------------------------ #

my $ImportTestCount = 1;
TEST:
for my $Test (@ImportDataTests) {

    # check SourceImportData attribute
    if ( !$Test->{SourceImportData} || ref $Test->{SourceImportData} ne 'HASH' ) {

        $Self->True(
            0,
            "ImportTest $ImportTestCount: No SourceImportData found for this test."
        );

        next TEST;
    }

    # set the object data
    if (
        $Test->{SourceImportData}->{ObjectData}
        && ref $Test->{SourceImportData}->{ObjectData} eq 'HASH'
        && $Test->{SourceImportData}->{ImportDataSave}->{TemplateID}
        )
    {

        # save object data
        $ImportExportObject->ObjectDataSave(
            TemplateID => $Test->{SourceImportData}->{ImportDataSave}->{TemplateID},
            ObjectData => $Test->{SourceImportData}->{ObjectData},
            UserID     => 1,
        );
    }

    # set the mapping object data
    if (
        $Test->{SourceImportData}->{MappingObjectData}
        && ref $Test->{SourceImportData}->{MappingObjectData} eq 'ARRAY'
        && $Test->{SourceImportData}->{ImportDataSave}->{TemplateID}
        )
    {

        # delete all existing mapping data
        $ImportExportObject->MappingDelete(
            TemplateID => $Test->{SourceImportData}->{ImportDataSave}->{TemplateID},
            UserID     => 1,
        );

        # add the mapping object rows
        MAPPINGOBJECTDATA:
        for my $MappingObjectData ( @{ $Test->{SourceImportData}->{MappingObjectData} } ) {

            # add a new mapping row
            my $MappingID = $ImportExportObject->MappingAdd(
                TemplateID => $Test->{SourceImportData}->{ImportDataSave}->{TemplateID},
                UserID     => 1,
            );

            # add the mapping object data
            $ImportExportObject->MappingObjectDataSave(
                MappingID         => $MappingID,
                MappingObjectData => $MappingObjectData,
                UserID            => 1,
            );
        }
    }

    # import data save
    my ( $ConfigItemID, $RetCode ) = $ObjectBackendObject->ImportDataSave(
        %{ $Test->{SourceImportData}->{ImportDataSave} },
        Counter => $ImportTestCount,
    );

    if ( !$Test->{ReferenceImportData} ) {

        $Self->False(
            $ConfigItemID,
            "ImportTest $ImportTestCount: ImportDataSave() - return no ConfigItemID"
        );
        $Self->False(
            $RetCode,
            "ImportTest $ImportTestCount: ImportDataSave() - return no RetCode"
        );

        next TEST;
    }

    $Self->True(
        $ConfigItemID,
        "ImportTest $ImportTestCount: ImportDataSave() - return ConfigItemID"
    );
    $Self->True(
        $RetCode,
        "ImportTest $ImportTestCount: ImportDataSave() - return RetCode"
    );

    # get the version list
    my $VersionList = $ConfigItemObject->VersionList(
        ConfigItemID => $ConfigItemID,
    ) // [];

    # check number of versions
    $Self->Is(
        scalar @{$VersionList},
        $Test->{ReferenceImportData}->{VersionNumber} || 0,
        "ImportTest $ImportTestCount: ImportDataSave() - correct number of versions",
    );

    # get the last version
    my $VersionData = $ConfigItemObject->VersionGet(
        ConfigItemID => $ConfigItemID,
        XMLDataGet   => 1,
    );

    # translate xmldata in a 2d hash
    my %XMLHash = $XMLObject->XMLHash2D(
        XMLHash => $VersionData->{XMLData},
    );

    # clean the xml hash
    KEY:
    for my $Key ( sort keys %XMLHash ) {

        next KEY if $Key =~ m{ \{'Content'\} \z }xms;

        delete $XMLHash{$Key};
    }

    # check general elements
    ELEMENT:
    for my $Element (qw(Number Name DeplState InciState)) {

        next ELEMENT if !exists $Test->{ReferenceImportData}->{LastVersion}->{$Element};

        # set content if values are undef
        if ( !defined $Test->{ReferenceImportData}->{LastVersion}->{$Element} ) {
            $Test->{ReferenceImportData}->{LastVersion}->{$Element} = 'UNDEF-unittest';
        }
        if ( !defined $Test->{ReferenceImportData}->{LastVersion}->{$Element} ) {
            $Test->{ReferenceImportData}->{LastVersion}->{$Element} = 'UNDEF-unittest';
        }

        # check element
        $Self->Is(
            $VersionData->{$Element},
            $Test->{ReferenceImportData}->{LastVersion}->{$Element},
            "ImportTest $ImportTestCount: ImportDataSave() $Element is identical",
        );

        delete $Test->{ReferenceImportData}->{LastVersion}->{$Element};
    }

    # check number of XML elements
    $Self->Is(
        scalar keys %XMLHash,
        scalar keys %{ $Test->{ReferenceImportData}->{LastVersion} },
        "ImportTest $ImportTestCount: ImportDataSave() - correct number of XML elements",
    );

    # check XML elements
    ELEMENT:
    for my $Key ( sort keys %{ $Test->{ReferenceImportData}->{LastVersion} } ) {

        # duplicate key
        my $XMLKey = $Key;

        # prepare key
        my $Counter = 0;
        while ( $XMLKey =~ m{ :: }xms ) {

            if ( $Counter % 2 ) {
                $XMLKey =~ s{ :: }{]\{'}xms;
            }
            else {
                $XMLKey =~ s{ :: }{'\}[}xms;
            }

            $Counter++;
        }

        next ELEMENT if !exists $XMLHash{ '[1]{\'Version\'}[1]{\'' . $XMLKey . ']{\'Content\'}' };

        # set content if values are undef
        if ( !defined $XMLHash{ '[1]{\'Version\'}[1]{\'' . $XMLKey . ']{\'Content\'}' } ) {
            $XMLHash{ '[1]{\'Version\'}[1]{\'' . $XMLKey . ']{\'Content\'}' } = 'UNDEF-unittest';
        }
        if ( !defined $Test->{ReferenceImportData}->{LastVersion}->{$Key} ) {
            $Test->{ReferenceImportData}->{LastVersion}->{$Key} = 'UNDEF-unittest';
        }

        # check XML element
        $Self->Is(
            $XMLHash{ '[1]{\'Version\'}[1]{\'' . $XMLKey . ']{\'Content\'}' },
            $Test->{ReferenceImportData}->{LastVersion}->{$Key},
            "ImportTest $ImportTestCount: ImportDataSave() $Key is identical",
        );
    }
}
continue {
    $ImportTestCount++;
}

# cleanup is done by RestoreDatabase

1;
