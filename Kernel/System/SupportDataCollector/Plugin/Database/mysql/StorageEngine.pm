# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::SupportDataCollector::Plugin::Database::mysql::StorageEngine;

use strict;
use warnings;

use base qw(Kernel::System::SupportDataCollector::PluginBase);

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::System::DB',
);

sub GetDisplayPath {
    return Translatable('Database');
}

sub Run {
    my $Self = shift;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    if ( $DBObject->GetDatabaseFunction('Type') ne 'mysql' ) {
        return $Self->GetResults();
    }

    my $DefaultStorageEngine;

    $DBObject->Prepare( SQL => "show variables like 'storage_engine'" );
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $DefaultStorageEngine = $Row[1];
        $Self->AddResultOk(
            Identifier => 'DefaultStorageEngine',
            Label      => Translatable('Default Storage Engine'),
            Value      => $DefaultStorageEngine,
        );
    }

    $DBObject->Prepare(
        SQL  => "show table status where engine != ?",
        Bind => [ \$DefaultStorageEngine ],
    );
    my @TablesWithDifferentStorageEngine;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @TablesWithDifferentStorageEngine, $Row[0];
    }

    if (@TablesWithDifferentStorageEngine) {
        $Self->AddResultProblem(
            Identifier => 'TablesWithDifferentStorageEngine',
            Label      => Translatable('Table Storage Engine'),
            Value      => join( ', ', @TablesWithDifferentStorageEngine ),
            Message    => Translatable('Tables with a different storage engine than the default engine were found.')
        );
    }
    else {
        $Self->AddResultOk(
            Identifier => 'TablesWithDifferentStorageEngine',
            Label      => Translatable('Table Storage Engine'),
            Value      => '',
        );
    }

    return $Self->GetResults();
}

1;
