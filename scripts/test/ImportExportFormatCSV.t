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

use Data::Dumper;

# get needed objects
my $MainObject          = $Kernel::OM->Get('Kernel::System::Main');
my $ImportExportObject  = $Kernel::OM->Get('Kernel::System::ImportExport');
my $FormatBackendObject = $Kernel::OM->Get('Kernel::System::ImportExport::FormatBackend::CSV');

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

# ------------------------------------------------------------ #
# make preparations
# ------------------------------------------------------------ #

# get home directory
$Self->{Home} = $Kernel::OM->Get('Kernel::Config')->Get('Home');

# add some test templates for later checks
my @TemplateIDs;
for ( 1 .. 30 ) {

    my $RandomID = $Helper->GetRandomID();

    # add a test template for later checks
    my $TemplateID = $ImportExportObject->TemplateAdd(
        Object  => 'UnitTest' . $RandomID,
        Format  => 'CSV',
        Name    => 'UnitTest' . $RandomID,
        ValidID => 1,
        UserID  => 1,
    );

    push @TemplateIDs, $TemplateID;
}

my $TestCount = 1;

# ------------------------------------------------------------ #
# FormatList test 1 (check CSV item)
# ------------------------------------------------------------ #

# get format list
my $FormatList1 = $ImportExportObject->FormatList();

# check format list
$Self->True(
    $FormatList1 && ref $FormatList1 eq 'HASH' && $FormatList1->{CSV},
    "Test $TestCount: FormatList() - CSV exists",
);

$TestCount++;

# ------------------------------------------------------------ #
# FormatAttributesGet test 1 (check attribute hash)
# ------------------------------------------------------------ #

# get format attributes
my $FormatAttributesGet1 = $ImportExportObject->FormatAttributesGet(
    TemplateID => $TemplateIDs[0],
    UserID     => 1,
);

# check format attribute reference
$Self->True(
    $FormatAttributesGet1 && ref $FormatAttributesGet1 eq 'ARRAY',
    "Test $TestCount: FormatAttributesGet() - check array reference",
);

# define the reference hash
my $FormatAttributesGet1Reference = [
    {
        Key   => 'ColumnSeparator',
        Name  => 'Column Separator',
        Input => {
            Type => 'Selection',
            Data => {
                Tabulator => 'Tabulator (TAB)',
                Semicolon => 'Semicolon (;)',
                Colon     => 'Colon (:)',
                Dot       => 'Dot (.)',
                Comma     => 'Comma (,)',
            },
            Required     => 1,
            Translation  => 1,
            PossibleNone => 1,
        },
    },
    {
        Key   => 'Charset',
        Name  => 'Charset',
        Input => {
            Type         => 'Text',
            ValueDefault => 'UTF-8',
            Required     => 1,
            Translation  => 0,
            Size         => 20,
            MaxLength    => 20,
        },
    },
    {
        Key   => 'IncludeColumnHeaders',
        Name  => 'Include Column Headers',
        Input => {
            Type => 'Selection',
            Data => {
                0 => 'No',
                1 => 'Yes',
            },
            Translation  => 1,
            PossibleNone => 0,
        },
    },
];

$Self->IsDeeply(
    $FormatAttributesGet1,
    $FormatAttributesGet1Reference,
    "Test $TestCount: FormatAttributesGet() - attributes of the row are identical",
);

$TestCount++;

# ------------------------------------------------------------ #
# FormatAttributesGet test 2 (check with non existing template)
# ------------------------------------------------------------ #

# get format attributes
my $FormatAttributesGet2 = $ImportExportObject->FormatAttributesGet(
    TemplateID => $TemplateIDs[-1] + 1,
    UserID     => 1,
);

# check false return
$Self->False(
    $FormatAttributesGet2,
    "Test $TestCount: FormatAttributesGet() - check false return",
);

$TestCount++;

# ------------------------------------------------------------ #
# MappingFormatAttributesGet test 1 (check attribute hash)
# ------------------------------------------------------------ #

# get mapping format attributes
my $MappingFormatAttributesGet1 = $ImportExportObject->MappingFormatAttributesGet(
    TemplateID => $TemplateIDs[0],
    UserID     => 1,
);

# check mapping format attribute reference
$Self->True(
    $MappingFormatAttributesGet1 && ref $MappingFormatAttributesGet1 eq 'ARRAY',
    "Test $TestCount: MappingFormatAttributesGet() - check array reference",
);

# define the reference hash
my $MappingFormatAttributesGet1Reference = [
    {
        Key   => 'Column',
        Name  => 'Column',
        Input => {
            Type     => 'TT',
            Data     => '',
            Required => 0,
        },
    },
];

$Self->IsDeeply(
    $MappingFormatAttributesGet1,
    $MappingFormatAttributesGet1Reference,
    "Test $TestCount: MappingFormatAttributesGet() - attributes of the row are identical",
);

$TestCount++;

# ------------------------------------------------------------ #
# MappingFormatAttributesGet test 2 (check with non existing template)
# ------------------------------------------------------------ #

# get mapping format attributes
my $MappingFormatAttributesGet2 = $ImportExportObject->MappingFormatAttributesGet(
    TemplateID => $TemplateIDs[-1] + 1,
    UserID     => 1,
);

# check false return
$Self->False(
    $MappingFormatAttributesGet2,
    "Test $TestCount: MappingFormatAttributesGet() - check false return",
);

$TestCount++;

# ------------------------------------------------------------ #
# define general ImportDataGet tests
# ------------------------------------------------------------ #

my $ImportDataTests = [

    # ImportDataGet doesn't contains all data (check required attributes)
    {
        SourceImportData => {
            ImportDataGet => {
                UserID => 1,
            },
        },
    },

    # ImportDataGet doesn't contains all data (check required attributes)
    {
        SourceImportData => {
            ImportDataGet => {
                TemplateID => $TemplateIDs[1],
            },
        },
    },

    # no source content are given (empty array reference must be returned)
    {
        SourceImportData => {
            ImportDataGet => {
                TemplateID => $TemplateIDs[1],
                UserID     => 1,
            },
        },
        ReferenceImportData => [],
    },

    # source content must be a scalar reference (check return false)
    {
        SourceImportData => {
            ImportDataGet => {
                TemplateID    => $TemplateIDs[1],
                SourceContent => [],
                UserID        => 1,
            },
        },
    },

    # source content must be a scalar reference (check return false)
    {
        SourceImportData => {
            ImportDataGet => {
                TemplateID    => $TemplateIDs[1],
                SourceContent => {},
                UserID        => 1,
            },
        },
    },

    # source content must be a scalar reference (check return false)
    {
        SourceImportData => {
            ImportDataGet => {
                TemplateID    => $TemplateIDs[1],
                SourceContent => '',
                UserID        => 1,
            },
        },
    },

    # no existing template id is given (check return false)
    {
        SourceImportData => {
            ImportDataGet => {
                TemplateID    => $TemplateIDs[-1] + 1,
                SourceContent => \do {'Dummy'},
                UserID        => 1,
            },
        },
    },

    # no column Separator and charset are given (check return false)
    {
        SourceImportData => {
            ImportDataGet => {
                TemplateID    => $TemplateIDs[2],
                SourceContent => \do {'Dummy'},
                UserID        => 1,
            },
        },
    },

    # no column Separator is given (check return false)
    {
        SourceImportData => {
            FormatData => {
                Charset => 'UTF-8',
            },
            ImportDataGet => {
                TemplateID    => $TemplateIDs[2],
                SourceContent => \do {'Dummy'},
                UserID        => 1,
            },
        },
    },

    # no charset is given (check return false)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Dummy',
            },
            ImportDataGet => {
                TemplateID    => $TemplateIDs[2],
                SourceContent => \do {'Dummy'},
                UserID        => 1,
            },
        },
    },

    # invalid column Separator is given (check return false)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Dummy',
                Charset         => 'UTF-8',
            },
            ImportDataGet => {
                TemplateID    => $TemplateIDs[2],
                SourceContent => \do {'Dummy'},
                UserID        => 1,
            },
        },
    },

    # required values are given but source content is empty (empty array reference must be returned)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'UTF-8',
            },
            ImportDataGet => {
                TemplateID    => $TemplateIDs[3],
                SourceContent => \do {''},
                UserID        => 1,
            },
        },
        ReferenceImportData => [],
    },

    # source content is only a string with spaces (one cell array with the spaces must be returned)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'UTF-8',
            },
            ImportDataGet => {
                TemplateID    => $TemplateIDs[4],
                SourceContent => \do {'  '},
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            ['  '],
        ],
    },

    # all required values are given (check the parsed content)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV001-MSExcel-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[5],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'Row1-Col1', 'Row1-Col2', 'Row1-Col3' ],
            [ 'Row2-Col1', 'Row2-Col2', 'Row2-Col3' ],
            [ 'Row3-Col1', 'Row3-Col2', 'Row3-Col3' ],
        ],
    },

    # all required values are given, but Tabulator is used as Separator (check the parsed content)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV001-MSExcel-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[5],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            ['Row1-Col1;Row1-Col2;Row1-Col3'],
            ['Row2-Col1;Row2-Col2;Row2-Col3'],
            ['Row3-Col1;Row3-Col2;Row3-Col3'],
        ],
    },

    # all required values are given (check the parsed content)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV001-MSExcel-Tabulator.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[5],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'Row1-Col1', 'Row1-Col2', 'Row1-Col3' ],
            [ 'Row2-Col1', 'Row2-Col2', 'Row2-Col3' ],
            [ 'Row3-Col1', 'Row3-Col2', 'Row3-Col3' ],
        ],
    },

    # all required values are given, but Semicolon is used as Separator (check the parsed content)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV001-MSExcel-Tabulator.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[5],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            ["Row1-Col1\tRow1-Col2\tRow1-Col3"],
            ["Row2-Col1\tRow2-Col2\tRow2-Col3"],
            ["Row3-Col1\tRow3-Col2\tRow3-Col3"],
        ],
    },

    # all required values are given (check the parsed content)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV001-OpenOffice-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[5],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'Row1-Col1', 'Row1-Col2', 'Row1-Col3' ],
            [ 'Row2-Col1', 'Row2-Col2', 'Row2-Col3' ],
            [ 'Row3-Col1', 'Row3-Col2', 'Row3-Col3' ],
        ],
    },

    # all required values are given (check the parsed content)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV001-OpenOffice-Tabulator.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[5],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'Row1-Col1', 'Row1-Col2', 'Row1-Col3' ],
            [ 'Row2-Col1', 'Row2-Col2', 'Row2-Col3' ],
            [ 'Row3-Col1', 'Row3-Col2', 'Row3-Col3' ],
        ],
    },

    # all required values are given (check the parsed content)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV001-OpenOffice-Colon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[5],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'Row1-Col1', 'Row1-Col2', 'Row1-Col3' ],
            [ 'Row2-Col1', 'Row2-Col2', 'Row2-Col3' ],
            [ 'Row3-Col1', 'Row3-Col2', 'Row3-Col3' ],
        ],
    },

    # all required values are given (newline checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV002-MSExcel-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[6],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ "\nTest 1 - 1", "Test 1 - 2",   "Test 1\n- 3",  'Test \n\t\r\s' ],
            [ "Test 2 \n- 1", "Te\nst 2 - 2", "Test 2 - 3\n", '' ],
        ],
    },

    # all required values are given (newline checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV002-MSExcel-Tabulator.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[6],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ "\nTest 1 - 1", 'Test 1 - 2',   "Test 1\n- 3",  'Test \n\t\r\s' ],
            [ "Test 2 \n- 1", "Te\nst 2 - 2", "Test 2 - 3\n", '' ],
        ],
    },

    # all required values are given (newline checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV002-OpenOffice-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[6],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ "\nTest 1 - 1", "Test 1 - 2",   "Test 1\n- 3",  'Test \n\t\r\s' ],
            [ "Test 2 \n- 1", "Te\nst 2 - 2", "Test 2 - 3\n", '' ],
        ],
    },

    # all required values are given (newline checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV002-OpenOffice-Tabulator.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[6],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ "\nTest 1 - 1", "Test 1 - 2",   "Test 1\n- 3",  'Test \n\t\r\s' ],
            [ "Test 2 \n- 1", "Te\nst 2 - 2", "Test 2 - 3\n", '' ],
        ],
    },

    # all required values are given (newline checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV002-OpenOffice-Colon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[6],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ "\nTest 1 - 1", "Test 1 - 2",   "Test 1\n- 3",  'Test \n\t\r\s' ],
            [ "Test 2 \n- 1", "Te\nst 2 - 2", "Test 2 - 3\n", '' ],
        ],
    },

    # all required values are given (spaces checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV003-MSExcel-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[7],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ '  Test  ', '    ', 'Test  ' ],
            [ '    Test', '',     'Test' ],
            [ '',         '',     ' ' ],
        ],
    },

    # all required values are given (spaces checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV003-MSExcel-Tabulator.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[7],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ '  Test  ', '    ', 'Test  ' ],
            [ '    Test', '',     'Test' ],
            [ '',         '',     ' ' ],
        ],
    },

    # all required values are given (spaces checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV003-OpenOffice-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[7],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ '  Test  ', '    ', 'Test  ' ],
            [ '    Test', '',     'Test' ],
            [ '',         '',     ' ' ],
        ],
    },

    # all required values are given (spaces checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV003-OpenOffice-Tabulator.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[7],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ '  Test  ', '    ', 'Test  ' ],
            [ '    Test', '',     'Test' ],
            [ '',         '',     ' ' ],
        ],
    },

    # all required values are given (spaces checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV003-OpenOffice-Colon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[7],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ '  Test  ', '    ', 'Test  ' ],
            [ '    Test', '',     'Test' ],
            [ '',         '',     ' ' ],
        ],
    },

    # all required values are given (special character checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV004-MSExcel-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[8],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'Test;:_°^!"§$%&/()=?´`*+Test', '><@~\'}{[]\\' ],
            [ '"";;::..--__##',                  '' ],
        ],
    },

    # all required values are given (special character checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV004-MSExcel-Tabulator.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[8],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'Test;:_°^!"§$%&/()=?´`*+Test', '><@~\'}{[]\\' ],
            [ '"";;::..--__##',                  '' ],
        ],
    },

    # all required values are given (special character checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV004-OpenOffice-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[8],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'Test;:_°^!"§$%&/()=?´`*+Test', '><@~\'}{[]\\' ],
            [ '"";;::..--__##',                  '' ],
        ],
    },

    # all required values are given (special character checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV004-OpenOffice-Tabulator.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[8],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'Test;:_°^!"§$%&/()=?´`*+Test', '><@~\'}{[]\\' ],
            [ '"";;::..--__##',                  '' ],
        ],
    },

    # all required values are given (special character checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV004-OpenOffice-Colon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[8],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'Test;:_°^!"§$%&/()=?´`*+Test', '><@~\'}{[]\\' ],
            [ '"";;::..--__##',                  '' ],
        ],
    },

    # all required values are given (ISO-8859 checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV005-MSExcel-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[9],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'üöäß', 'ÜÖÄ' ],
            [ 'ßäöü', 'ÄÖÜ' ],
        ],
    },

    # all required values are given (ISO-8859 checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV005-MSExcel-Tabulator.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[9],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'üöäß', 'ÜÖÄ' ],
            [ 'ßäöü', 'ÄÖÜ' ],
        ],
    },

    # all required values are given (ISO-8859 checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV005-OpenOffice-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[9],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'üöäß', 'ÜÖÄ' ],
            [ 'ßäöü', 'ÄÖÜ' ],
        ],
    },

    # all required values are given (ISO-8859 checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV005-OpenOffice-Tabulator.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[9],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'üöäß', 'ÜÖÄ' ],
            [ 'ßäöü', 'ÄÖÜ' ],
        ],
    },

    # all required values are given (ISO-8859 checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV005-OpenOffice-Colon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[9],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'üöäß', 'ÜÖÄ' ],
            [ 'ßäöü', 'ÄÖÜ' ],
        ],
    },

    # all required values are given (UTF-8 checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'UTF-8',
            },
            SourceFile    => 'ImportExportFormatCSV006-OpenOffice-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[10],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'ʩ ʬ ʮ',     ' ʡ ˤ Ό ' ],
            [ '  Η ϗ Ϡ  ', 'Ά Λ Ξ' ],
        ],
    },

    # all required values are given (UTF-8 checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'UTF-8',
            },
            SourceFile    => 'ImportExportFormatCSV006-OpenOffice-Tabulator.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[10],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'ʩ ʬ ʮ',     ' ʡ ˤ Ό ' ],
            [ '  Η ϗ Ϡ  ', 'Ά Λ Ξ' ],
        ],
    },

    # all required values are given (UTF-8 checks)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'UTF-8',
            },
            SourceFile    => 'ImportExportFormatCSV006-OpenOffice-Colon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[10],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'ʩ ʬ ʮ',     ' ʡ ˤ Ό ' ],
            [ '  Η ϗ Ϡ  ', 'Ά Λ Ξ' ],
        ],
    },

    # all required values are given (check the parsed content)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV007-OpenOffice-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[5],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'Row1-Col1', 'Row1-Col2',  'Row1-Col3' ],
            [ 'Row2-Col1', 'Row2-Col2',  'Row2-Col3' ],
            [ 'Row3-Col1', '0Row3-Col2', 'Row3-Col3' ],
        ],
    },

    # all required values are given (check the parsed content)
    {
        SourceImportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            SourceFile    => 'ImportExportFormatCSV008-OpenOffice-Semicolon.csv',
            ImportDataGet => {
                TemplateID    => $TemplateIDs[5],
                SourceContent => 'SourceFile',
                UserID        => 1,
            },
        },
        ReferenceImportData => [
            [ 'Row1-Col1', 'Row1-Col2',  'Row1-Col3' ],
            [ 'Row2-Col1', '0Row2-Col2', 'Row2-Col3' ],
            [ 'Row3-Col1', 'Row3-Col2',  'Row3-Col3' ],
        ],
    },

];

# ------------------------------------------------------------ #
# run general ImportDataGet tests
# ------------------------------------------------------------ #

TEST:
for my $Test ( @{$ImportDataTests} ) {

    # check SourceImportData attribute
    if ( !$Test->{SourceImportData} || ref $Test->{SourceImportData} ne 'HASH' ) {

        $Self->True(
            0,
            "Test $TestCount: No SourceImportData found for this test."
        );

        next TEST;
    }

    # set default ImportDataGet
    if ( !$Test->{SourceImportData}->{ImportDataGet} ) {
        $Test->{SourceImportData}->{ImportDataGet} = {};
    }

    # set source content
    if (
        $Test->{SourceImportData}->{SourceFile}
        && $Test->{SourceImportData}->{ImportDataGet}->{SourceContent}
        && $Test->{SourceImportData}->{ImportDataGet}->{SourceContent} eq 'SourceFile'
        )
    {

        my $SourceFile = $Test->{SourceImportData}->{SourceFile};

        # read source file
        my $SourceContent = $MainObject->FileRead(
            Location => $Self->{Home} . '/scripts/test/sample/ImportExport/' . $SourceFile,
            Result   => 'SCALAR',
            Mode     => 'binmode',
        );

        $Test->{SourceImportData}->{ImportDataGet}->{SourceContent} = $SourceContent;
    }

    # set the format data
    if (
        $Test->{SourceImportData}->{FormatData}
        && ref $Test->{SourceImportData}->{FormatData} eq 'HASH'
        && $Test->{SourceImportData}->{ImportDataGet}->{TemplateID}
        )
    {

        # save format data
        $ImportExportObject->FormatDataSave(
            TemplateID => $Test->{SourceImportData}->{ImportDataGet}->{TemplateID},
            FormatData => $Test->{SourceImportData}->{FormatData},
            UserID     => 1,
        );
    }

    # get import data
    my $ImportData = $FormatBackendObject->ImportDataGet(
        %{ $Test->{SourceImportData}->{ImportDataGet} },
    );

    if ( !$Test->{ReferenceImportData} ) {

        $Self->False(
            $ImportData,
            "Test $TestCount: ImportDataGet() - return false"
        );

        next TEST;
    }

    if ( ref $ImportData ne 'ARRAY' ) {

        # check array reference
        $Self->True(
            0,
            "Test $TestCount: ImportDataGet() - return value is an array reference",
        );

        next TEST;
    }

    # check number of rows
    $Self->Is(
        scalar @{$ImportData},
        scalar @{ $Test->{ReferenceImportData} },
        "Test $TestCount: ImportDataGet() - same number of rows",
    );

    # check content of import data
    my $CounterRow = 0;
    ROW:
    for my $ImportRow ( @{$ImportData} ) {

        # extract reference row
        my $ReferenceRow = $Test->{ReferenceImportData}->[$CounterRow];

        if ( ref $ImportRow ne 'ARRAY' || ref $ReferenceRow ne 'ARRAY' ) {

            # check array reference
            $Self->True(
                0,
                "Test $TestCount: ImportDataGet() - import row and reference row matched",
            );

            next TEST;
        }

        # check number of columns
        $Self->Is(
            scalar @{$ImportRow},
            scalar @{$ReferenceRow},
            "Test $TestCount: ImportDataGet() - same number of columns",
        );

        my $CounterColumn = 0;
        for my $Cell ( @{$ImportRow} ) {

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
                "Test $TestCount: ImportDataGet() ",
            );

            $CounterColumn++;
        }

        $CounterRow++;
    }
}
continue {
    $TestCount++;
}

# ------------------------------------------------------------ #
# define general ExportDataSave tests
# ------------------------------------------------------------ #

my $ExportDataTests = [

    # ExportDataSave doesn't contains all data (check required attributes)
    {
        SourceExportData => {
            ExportDataSave => {
                ExportDataRow => ['Dummy'],
                UserID        => 1,
            },
        },
    },

    # ExportDataSave doesn't contains all data (check required attributes)
    {
        SourceExportData => {
            ExportDataSave => {
                TemplateID => $TemplateIDs[20],
                UserID     => 1,
            },
        },
    },

    # ExportDataSave doesn't contains all data (check required attributes)
    {
        SourceExportData => {
            ExportDataSave => {
                TemplateID    => $TemplateIDs[20],
                ExportDataRow => ['Dummy'],
            },
        },
    },

    # export data row must be an array reference (check return false)
    {
        SourceExportData => {
            ExportDataSave => {
                TemplateID    => $TemplateIDs[20],
                ExportDataRow => '',
                UserID        => 1,
            },
        },
    },

    # export data row must be an array reference (check return false)
    {
        SourceExportData => {
            ExportDataSave => {
                TemplateID    => $TemplateIDs[20],
                ExportDataRow => {},
                UserID        => 1,
            },
        },
    },

    # no existing template id is given (check return false)
    {
        SourceExportData => {
            ExportDataSave => {
                TemplateID    => $TemplateIDs[-1] + 1,
                ExportDataRow => ['Dummy'],
                UserID        => 1,
            },
        },
    },

    # no column Separator and charset are given (check return false)
    {
        SourceExportData => {
            ExportDataSave => {
                TemplateID    => $TemplateIDs[21],
                ExportDataRow => ['Dummy'],
                UserID        => 1,
            },
        },
    },

    # no column Separator is given (check return false)
    {
        SourceExportData => {
            FormatData => {
                Charset => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[21],
                ExportDataRow => ['Dummy'],
                UserID        => 1,
            },
        },
    },

    # no charset is given (check return false)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Dummy',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[21],
                ExportDataRow => ['Dummy'],
                UserID        => 1,
            },
        },
    },

    # invalid column Separator is given (check return false)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Dummy',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[21],
                ExportDataRow => ['Dummy'],
                UserID        => 1,
            },
        },
    },

    # export data are one cells with empty strings (one empty cell must be returned)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[22],
                ExportDataRow => [''],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '""',
    },

    # export data are one cells with empty strings (one empty cell must be returned)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[22],
                ExportDataRow => [''],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '""',
    },

    # export data are one cells with empty strings (one empty cell must be returned)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[22],
                ExportDataRow => [''],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '""',
    },

    # export data are one cells with empty strings (one empty cell must be returned)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Dot',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[22],
                ExportDataRow => [''],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '""',
    },

    # export data are three cells with empty strings (three empty cells must be returned)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[22],
                ExportDataRow => [ '', '', '' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '"";"";""',
    },

    # export data are three cells with empty strings (three empty cells must be returned)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[22],
                ExportDataRow => [ '', '', '' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => "\"\"\t\"\"\t\"\"",
    },

    # export data are three cells with empty strings (three empty cells must be returned)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[22],
                ExportDataRow => [ '', '', '' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '"":"":""',
    },

    # export data are three cells with empty strings (three empty cells must be returned)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Dot',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[22],
                ExportDataRow => [ '', '', '' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '""."".""',
    },

    # export data are three cells with empty and undef content (three empty cells must be returned)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[22],
                ExportDataRow => [ undef, '', undef ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => ';"";',
    },

    # export data are three cells with empty and undef content (three empty cells must be returned)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[22],
                ExportDataRow => [ undef, '', undef ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => "\t\"\"\t",
    },

    # export data are three cells with empty and undef content (three empty cells must be returned)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[22],
                ExportDataRow => [ undef, '', undef ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => ':"":',
    },

    # export data are three cells with empty and undef content (three empty cells must be returned)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Dot',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[22],
                ExportDataRow => [ undef, '', undef ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '."".',
    },

    # all required values are given (check the parsed content)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ExportDataRow => [ 'Row1-Col1', 'Row1-Col2', 'Row1-Col3' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '"Row1-Col1";"Row1-Col2";"Row1-Col3"',
    },

    # all required values are given (check the parsed content)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Comma',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ExportDataRow => [ 'Row1-Col1', 'Row1-Col2', 'Row1-Col3' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '"Row1-Col1","Row1-Col2","Row1-Col3"',
    },

    # all required values are given (check the parsed content)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ExportDataRow => [ 'Row1-Col1', 'Row1-Col2', 'Row1-Col3' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => "\"Row1-Col1\"\t\"Row1-Col2\"\t\"Row1-Col3\"",
    },

    # all required values are given (check the parsed content)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ExportDataRow => [ 'Row1-Col1', 'Row1-Col2', 'Row1-Col3' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '"Row1-Col1":"Row1-Col2":"Row1-Col3"',
    },

    # all required values are given (check the parsed content)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Dot',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[23],
                ExportDataRow => [ 'Row1-Col1', 'Row1-Col2', 'Row1-Col3' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '"Row1-Col1"."Row1-Col2"."Row1-Col3"',
    },

    # all required values are given (newline checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[24],
                ExportDataRow => [ "\nTest 1", "Test \n 2", 'Test 3 \n\t\r\s', "Test 4\n" ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => qq{"\nTest 1";"Test \n 2";"Test 3 \\n\\t\\r\\s";"Test 4\n"},
    },

    # all required values are given (newline checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[24],
                ExportDataRow => [ "\nTest 1", "Test \n 2", 'Test 3 \n\t\r\s', "Test 4\n" ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent =>
            qq{"\nTest 1"\t"Test \n 2"\t"Test 3 \\n\\t\\r\\s"\t"Test 4\n"},
    },

    # all required values are given (newline checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[24],
                ExportDataRow => [ "\nTest 1", "Test \n 2", 'Test 3 \n\t\r\s', "Test 4\n" ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => qq{"\nTest 1":"Test \n 2":"Test 3 \\n\\t\\r\\s":"Test 4\n"},
    },

    # all required values are given (newline checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Dot',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[24],
                ExportDataRow => [ "\nTest 1", "Test \n 2", 'Test 3 \n\t\r\s', "Test 4\n" ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => qq{"\nTest 1"."Test \n 2"."Test 3 \\n\\t\\r\\s"."Test 4\n"},
    },

    # all required values are given (spaces checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[24],
                ExportDataRow => [ '  Test  ', '    ', 'Test  ', '    Test', '', 'Test', '', ' ' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '"  Test  ";"    ";"Test  ";"    Test";"";"Test";"";" "',
    },

    # all required values are given (spaces checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[24],
                ExportDataRow => [ '  Test  ', '    ', 'Test  ', '    Test', '', 'Test', '', ' ' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent =>
            "\"  Test  \"\t\"    \"\t\"Test  \"\t\"    Test\"\t\"\"\t\"Test\"\t\"\"\t\" \"",
    },

    # all required values are given (spaces checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[24],
                ExportDataRow => [ '  Test  ', '    ', 'Test  ', '    Test', '', 'Test', '', ' ' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '"  Test  ":"    ":"Test  ":"    Test":"":"Test":"":" "',
    },

    # all required values are given (spaces checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Dot',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[24],
                ExportDataRow => [ '  Test  ', '    ', 'Test  ', '    Test', '', 'Test', '', ' ' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '"  Test  "."    "."Test  "."    Test".""."Test".""." "',
    },

    # all required values are given (special character checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ExportDataRow => [
                    'Test;:_^!"$%&/()=?`*+Test',
                    '><@~\'}{[]\\',
                    '',
                    '"";;::..--__##'
                ],
                UserID => 1,
            },
        },
        ReferenceDestinationContent =>
            '"Test;:_^!""$%&/()=?`*+Test";"><@~\'}{[]\";"";""""";;::..--__##"'
    },

    # all required values are given (special character checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ExportDataRow => [
                    'Test;:_^!"$%&/()=?`*+Test',
                    '><@~\'}{[]\\',
                    '',
                    '"";;::..--__##'
                ],
                UserID => 1,
            },
        },
        ReferenceDestinationContent =>
            '"Test;:_^!""$%&/()=?`*+Test"'
            . "\t"
            . '"><@~\'}{[]\\"'
            . "\t"
            . '""'
            . "\t"
            . '""""";;::..--__##"',
    },

    # all required values are given (special character checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ExportDataRow => [
                    'Test;:_^!"$%&/()=?`*+Test',
                    '><@~\'}{[]\\',
                    '',
                    '"";;::..--__##'
                ],
                UserID => 1,
            },
        },
        ReferenceDestinationContent =>
            '"Test;:_^!""$%&/()=?`*+Test":"><@~\'}{[]\":"":""""";;::..--__##"',
    },

    # all required values are given (special character checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Dot',
                Charset         => 'ISO-8859-1',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[25],
                ExportDataRow => [
                    'Test;:_^!"$%&/()=?`*+Test',
                    '><@~\'}{[]\\',
                    '',
                    '"";;::..--__##'
                ],
                UserID => 1,
            },
        },
        ReferenceDestinationContent =>
            '"Test;:_^!""$%&/()=?`*+Test"."><@~\'}{[]\\"."".""""";;::..--__##"',
    },

    # all required values are given (UTF-8 checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Semicolon',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[26],
                ExportDataRow => [ ' Ѫ Ѭ Ѳ', 'ѯ Ѵ ѿ', '҂ Ҋ Җ ' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '" Ѫ Ѭ Ѳ";"ѯ Ѵ ѿ";"҂ Ҋ Җ "',
    },

    # all required values are given (UTF-8 checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Tabulator',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[26],
                ExportDataRow => [ ' Ѫ Ѭ Ѳ', 'ѯ Ѵ ѿ', '҂ Ҋ Җ ' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => "\" Ѫ Ѭ Ѳ\"\t\"ѯ Ѵ ѿ\"\t\"҂ Ҋ Җ \"",
    },

    # all required values are given (UTF-8 checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Colon',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[26],
                ExportDataRow => [ ' Ѫ Ѭ Ѳ', 'ѯ Ѵ ѿ', '҂ Ҋ Җ ' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '" Ѫ Ѭ Ѳ":"ѯ Ѵ ѿ":"҂ Ҋ Җ "',
    },

    # all required values are given (UTF-8 checks)
    {
        SourceExportData => {
            FormatData => {
                ColumnSeparator => 'Dot',
                Charset         => 'UTF-8',
            },
            ExportDataSave => {
                TemplateID    => $TemplateIDs[26],
                ExportDataRow => [ ' Ѫ Ѭ Ѳ', 'ѯ Ѵ ѿ', '҂ Ҋ Җ ' ],
                UserID        => 1,
            },
        },
        ReferenceDestinationContent => '" Ѫ Ѭ Ѳ"."ѯ Ѵ ѿ"."҂ Ҋ Җ "',
    },
];

# ------------------------------------------------------------ #
# run general ExportDataSave tests
# ------------------------------------------------------------ #

TEST:
for my $Test ( @{$ExportDataTests} ) {

    # check SourceExportData attribute
    if ( !$Test->{SourceExportData} || ref $Test->{SourceExportData} ne 'HASH' ) {

        $Self->True(
            0,
            "Test $TestCount: No SourceExportData found for this test."
        );

        next TEST;
    }

    # set default ExportDataSave
    if ( !$Test->{SourceExportData}->{ExportDataSave} ) {
        $Test->{SourceExportData}->{ExportDataSave} = {};
    }

    # set the format data
    if (
        $Test->{SourceExportData}->{FormatData}
        && ref $Test->{SourceExportData}->{FormatData} eq 'HASH'
        && $Test->{SourceExportData}->{ExportDataSave}->{TemplateID}
        )
    {

        # save format data
        $ImportExportObject->FormatDataSave(
            TemplateID => $Test->{SourceExportData}->{ExportDataSave}->{TemplateID},
            FormatData => $Test->{SourceExportData}->{FormatData},
            UserID     => 1,
        );
    }

    # get export data row
    my $ExportString = $FormatBackendObject->ExportDataSave(
        %{ $Test->{SourceExportData}->{ExportDataSave} },
    );

    if ( !defined $Test->{ReferenceDestinationContent} ) {

        $Self->True(
            !defined $ExportString,
            "Test $TestCount: ExportDataSave() - return false"
        );

        next TEST;
    }

    if ( !defined $ExportString ) {

        $Self->True(
            !defined $Test->{ReferenceDestinationContent},
            "Test $TestCount: ExportDataSave() - return false"
        );

        next TEST;
    }

    if ( !$Test->{SourceExportData}->{ExportDataSave}->{ExportDataRow} ) {

        $Self->True(
            defined $ExportString,
            "Test $TestCount: ExportDataSave() - return false"
        );

        next TEST;
    }

    # check the export string
    $Self->Is(
        $ExportString,
        $Test->{ReferenceDestinationContent},
        "Test $TestCount: ExportDataSave()",
    );
}
continue {
    $TestCount++;
}

# cleanup is done by RestoreDatabase.

1;
