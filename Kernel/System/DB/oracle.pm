# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::DB::oracle;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::Time',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub LoadPreferences {
    my ( $Self, %Param ) = @_;

    # db settings
    $Self->{'DB::Limit'}                = 0;
    $Self->{'DB::DirectBlob'}           = 0;
    $Self->{'DB::QuoteSingle'}          = '\'';
    $Self->{'DB::QuoteBack'}            = 0;
    $Self->{'DB::QuoteSemicolon'}       = '';
    $Self->{'DB::QuoteUnderscoreStart'} = '\\';
    $Self->{'DB::QuoteUnderscoreEnd'}   = '';
    $Self->{'DB::CaseSensitive'}        = 1;
    $Self->{'DB::LikeEscapeString'}     = q{ESCAPE '\\'};

    # how to determine server version
    $Self->{'DB::Version'}
        = "SELECT CONCAT('Oracle ', version) FROM product_component_version WHERE product LIKE 'Oracle Database%'";

    # dbi attributes
    $Self->{'DB::Attribute'} = {
        LongTruncOk => 1,
        LongReadLen => 40 * 1024 * 1024,
    };

    # set current time stamp if different to "current_timestamp"
    $Self->{'DB::CurrentTimestamp'} = '';

    # set encoding of selected data to utf8
    $Self->{'DB::Encode'} = 0;

    # shell setting
    $Self->{'DB::Comment'}      = '-- ';
    $Self->{'DB::ShellCommit'}  = ';';
    $Self->{'DB::ShellConnect'} = "SET DEFINE OFF;\nSET SQLBLANKLINES ON";    # must be on separate lines!

    # init sql setting on db connect
    $Self->{'DB::Connect'} = "ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS'";

    return 1;
}

sub Quote {
    my ( $Self, $Text, $Type ) = @_;

    if ( defined ${$Text} ) {
        if ( $Self->{'DB::QuoteBack'} ) {
            ${$Text} =~ s/\\/$Self->{'DB::QuoteBack'}\\/g;
        }
        if ( $Self->{'DB::QuoteSingle'} ) {
            ${$Text} =~ s/'/$Self->{'DB::QuoteSingle'}'/g;
        }
        if ( $Self->{'DB::QuoteSemicolon'} ) {
            ${$Text} =~ s/;/$Self->{'DB::QuoteSemicolon'};/g;
        }
        if ( $Type && $Type eq 'Like' ) {
            if ( $Self->{'DB::QuoteUnderscoreStart'} || $Self->{'DB::QuoteUnderscoreEnd'} ) {
                ${$Text}
                    =~ s/_/$Self->{'DB::QuoteUnderscoreStart'}_$Self->{'DB::QuoteUnderscoreEnd'}/g;
            }
        }
    }
    return $Text;
}

sub DatabaseCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Name!'
        );
        return;
    }

    # return SQL
    return ("CREATE DATABASE $Param{Name}");
}

sub DatabaseDrop {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Name!'
        );
        return;
    }

    # return SQL
    return ("DROP DATABASE $Param{Name}");
}

sub TableCreate {
    my ( $Self, @Param ) = @_;

    # get needed objects
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');

    my $SQLStart     = '';
    my $SQLEnd       = '';
    my $SQL          = '';
    my @Column       = ();
    my $TableName    = '';
    my $ForeignKey   = ();
    my %Foreign      = ();
    my $IndexCurrent = ();
    my %Index        = ();
    my $UniqCurrent  = ();
    my %Uniq         = ();
    my $PrimaryKey   = '';
    my @Return       = ();
    my @Return2      = ();
    for my $Tag (@Param) {

        if (
            ( $Tag->{Tag} eq 'Table' || $Tag->{Tag} eq 'TableCreate' )
            && $Tag->{TagType} eq 'Start'
            )
        {
            if ( $ConfigObject->Get('Database::ShellOutput') ) {
                $SQLStart .= $Self->{'DB::Comment'}
                    . "----------------------------------------------------------\n";
                $SQLStart .= $Self->{'DB::Comment'} . " create table $Tag->{Name}\n";
                $SQLStart .= $Self->{'DB::Comment'}
                    . "----------------------------------------------------------\n";
            }
        }
        if ( $Tag->{Tag} eq 'Table' || $Tag->{Tag} eq 'TableCreate' ) {
            if ( $Tag->{TagType} eq 'Start' ) {
                $SQLStart .= "CREATE TABLE $Tag->{Name} (\n";
                $TableName = $Tag->{Name};
            }
            elsif ( $Tag->{TagType} eq 'End' ) {
                $SQLEnd .= "\n)";
            }
        }
        elsif ( $Tag->{Tag} eq 'Column' && $Tag->{TagType} eq 'Start' ) {
            push @Column, $Tag;
        }
        elsif ( $Tag->{Tag} eq 'Index' && $Tag->{TagType} eq 'Start' ) {
            $IndexCurrent = $Tag->{Name};
        }
        elsif ( $Tag->{Tag} eq 'IndexColumn' && $Tag->{TagType} eq 'Start' ) {
            push @{ $Index{$IndexCurrent} }, $Tag;
        }
        elsif ( $Tag->{Tag} eq 'Unique' && $Tag->{TagType} eq 'Start' ) {
            $UniqCurrent = $Tag->{Name} || $TableName . '_U_' . int( rand(999) );
        }
        elsif ( $Tag->{Tag} eq 'UniqueColumn' && $Tag->{TagType} eq 'Start' ) {
            push @{ $Uniq{$UniqCurrent} }, $Tag;
        }
        elsif ( $Tag->{Tag} eq 'ForeignKey' && $Tag->{TagType} eq 'Start' ) {
            $ForeignKey = $Tag->{ForeignTable};
        }
        elsif ( $Tag->{Tag} eq 'Reference' && $Tag->{TagType} eq 'Start' ) {
            push @{ $Foreign{$ForeignKey} }, $Tag;
        }
    }
    for my $Tag (@Column) {

        # type translation
        $Tag = $Self->_TypeTranslation($Tag);

        # add new line
        if ($SQL) {
            $SQL .= ",\n";
        }

        # normal data type
        $SQL .= "    $Tag->{Name} $Tag->{Type}";

        # handle default
        my $DisableNotNull;
        if ( defined $Tag->{Default} ) {
            if ( $Tag->{Type} =~ m{ (int|number) }xmsi ) {
                $SQL .= " DEFAULT " . $Tag->{Default};
            }
            elsif ( $Tag->{Default} ) {
                $SQL .= " DEFAULT '" . $Tag->{Default} . "'";
            }
            else {
                $DisableNotNull = 1;
            }
        }

        # handle require
        if ( !$DisableNotNull && $Tag->{Required} && lc $Tag->{Required} eq 'true' ) {
            $SQL .= ' NOT NULL';
        }
        else {
            $SQL .= ' NULL';
        }

        # add primary key
        my $Constraint = 'PK_' . $TableName;
        if ( length $Constraint > 30 ) {
            my $MD5 = $MainObject->MD5sum(
                String => $Constraint,
            );
            $Constraint = substr $Constraint, 0, 28;
            $Constraint .= substr $MD5, 0,  1;
            $Constraint .= substr $MD5, 31, 1;
        }
        if ( $Tag->{PrimaryKey} && $Tag->{PrimaryKey} =~ /true/i ) {
            push(
                @Return2,
                "ALTER TABLE $TableName ADD CONSTRAINT $Constraint"
                    . " PRIMARY KEY ($Tag->{Name})"
            );
        }

        # auto increment
        if ( $Tag->{AutoIncrement} && $Tag->{AutoIncrement} =~ /^true$/i ) {
            my $Sequence = 'SE_' . $TableName;
            if ( length $Sequence > 28 ) {
                my $MD5 = $MainObject->MD5sum(
                    String => $Sequence,
                );
                $Sequence = substr $Sequence, 0, 26;
                $Sequence .= substr $MD5, 0,  1;
                $Sequence .= substr $MD5, 31, 1;
            }
            my $Shell = '';
            if ( $ConfigObject->Get('Database::ShellOutput') ) {
                $Shell = "/\n--";
            }

            push(
                @Return2,
                "BEGIN\n"
                    . "  EXECUTE IMMEDIATE 'DROP SEQUENCE $Sequence';\n"
                    . "EXCEPTION\n"
                    . "  WHEN OTHERS THEN NULL;\n"
                    . "END;\n"
                    . "$Shell",
            );

            push(
                @Return2,
                "CREATE SEQUENCE $Sequence\n"
                    . "INCREMENT BY 1\n"
                    . "START WITH 1\n"
                    . "NOMAXVALUE\n"
                    . "NOCYCLE\n"
                    . "CACHE 20\n"
                    . "ORDER",
            );

            push(
                @Return2,
                "CREATE OR REPLACE TRIGGER $Sequence"
                    . "_t\n"
                    . "BEFORE INSERT ON $TableName\n"
                    . "FOR EACH ROW\n"
                    . "BEGIN\n"
                    . "  IF :new.$Tag->{Name} IS NULL THEN\n"
                    . "    SELECT $Sequence.nextval\n"
                    . "    INTO :new.$Tag->{Name}\n"
                    . "    FROM DUAL;\n"
                    . "  END IF;\n"
                    . "END;\n"
                    . "$Shell",
            );
        }
    }

    # add uniq
    for my $Name ( sort keys %Uniq ) {
        my $Unique = $Name;
        if ( length $Unique > 30 ) {
            my $MD5 = $MainObject->MD5sum(
                String => $Unique,
            );
            $Unique = substr $Unique, 0, 28;
            $Unique .= substr $MD5, 0,  1;
            $Unique .= substr $MD5, 31, 1;
        }
        if ($SQL) {
            $SQL .= ",\n";
        }
        $SQL .= "    CONSTRAINT $Unique UNIQUE (";
        my @Array = @{ $Uniq{$Name} };
        my $Name  = '';
        for ( 0 .. $#Array ) {
            if ( $_ > 0 ) {
                $SQL .= ', ';
            }
            $SQL  .= $Array[$_]->{Name};
            $Name .= '_' . $Array[$_]->{Name};
        }
        $SQL .= ')';
    }
    push @Return, $SQLStart . $SQL . $SQLEnd, @Return2;

    # add foreign keys
    for my $ForeignKey ( sort keys %Foreign ) {
        my @Array = @{ $Foreign{$ForeignKey} };
        for ( 0 .. $#Array ) {
            push(
                @{ $Self->{Post} },
                $Self->ForeignKeyCreate(
                    LocalTableName   => $TableName,
                    Local            => $Array[$_]->{Local},
                    ForeignTableName => $ForeignKey,
                    Foreign          => $Array[$_]->{Foreign},
                ),
            );

            # generate forced index for every FK to do row locking (not table locking)
            my $IndexName = $TableName . '_' . $Array[$_]->{Local};
            if ( !$Index{$IndexName} ) {
                $Index{ 'FK_' . $IndexName } = [ { Name => $Array[$_]->{Local} } ];
            }
        }
    }

    # add indexs
    for my $Name ( sort keys %Index ) {
        push(
            @Return,
            $Self->IndexCreate(
                TableName => $TableName,
                Name      => $Name,
                Data      => $Index{$Name},
            ),
        );
    }

    return @Return;
}

sub TableDrop {
    my ( $Self, @Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $SQL = '';
    for my $Tag (@Param) {
        if ( $Tag->{Tag} eq 'Table' && $Tag->{TagType} eq 'Start' ) {
            if ( $ConfigObject->Get('Database::ShellOutput') ) {
                $SQL .= $Self->{'DB::Comment'}
                    . "----------------------------------------------------------\n";
                $SQL .= $Self->{'DB::Comment'} . " drop table $Tag->{Name}\n";
                $SQL .= $Self->{'DB::Comment'}
                    . "----------------------------------------------------------\n";
            }
        }

        $SQL .= "DROP TABLE $Tag->{Name} CASCADE CONSTRAINTS";

        return ($SQL);
    }
    return ();
}

sub TableAlter {
    my ( $Self, @Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $SQLStart      = '';
    my @SQL           = ();
    my @Index         = ();
    my $IndexName     = ();
    my $ForeignTable  = '';
    my $ReferenceName = '';
    my @Reference     = ();
    my $Table         = '';
    for my $Tag (@Param) {

        if ( $Tag->{Tag} eq 'TableAlter' && $Tag->{TagType} eq 'Start' ) {
            $Table = $Tag->{Name} || $Tag->{NameNew};
            if ( $ConfigObject->Get('Database::ShellOutput') ) {
                $SQLStart .= $Self->{'DB::Comment'}
                    . "----------------------------------------------------------\n";
                $SQLStart .= $Self->{'DB::Comment'} . " alter table $Table\n";
                $SQLStart .= $Self->{'DB::Comment'}
                    . "----------------------------------------------------------\n";
            }

            # rename table
            if ( $Tag->{NameOld} && $Tag->{NameNew} ) {
                push @SQL, $SQLStart . "ALTER TABLE $Tag->{NameOld} RENAME TO $Tag->{NameNew}";
            }
            $SQLStart .= "ALTER TABLE $Table";
        }
        elsif ( $Tag->{Tag} eq 'ColumnAdd' && $Tag->{TagType} eq 'Start' ) {

            # Type translation
            $Tag = $Self->_TypeTranslation($Tag);

            # normal data type
            push @SQL, $SQLStart . " ADD $Tag->{Name} $Tag->{Type} NULL";

            # investigate the require
            my $Required = ( $Tag->{Required} && lc $Tag->{Required} eq 'true' ) ? 1 : 0;

            # investigate the default value
            my $Default = '';
            if ( $Tag->{Type} =~ m{ (int|number) }xmsi ) {
                $Default = defined $Tag->{Default} ? $Tag->{Default} : 0;
            }
            else {
                $Default = defined $Tag->{Default} ? "'$Tag->{Default}'" : "''";
            }

            # handle default and require
            if ( $Default ne "''" && ( $Required || defined $Tag->{Default} ) ) {

                # fill up empty rows
                push @SQL, "UPDATE $Table SET $Tag->{Name} = $Default WHERE $Tag->{Name} IS NULL";

                my $SQLAlter = "ALTER TABLE $Table MODIFY $Tag->{Name} $Tag->{Type}";

                # add default
                if ( defined $Tag->{Default} ) {
                    $SQLAlter .= " DEFAULT $Default";
                }

                # add require
                if ($Required) {
                    $SQLAlter .= ' NOT NULL';
                }

                push @SQL, $SQLAlter;
            }
        }
        elsif ( $Tag->{Tag} eq 'ColumnChange' && $Tag->{TagType} eq 'Start' ) {

            # Type translation
            $Tag = $Self->_TypeTranslation($Tag);

            # rename oldname to newname
            if ( $Tag->{NameOld} ne $Tag->{NameNew} ) {
                push @SQL, $SQLStart . " RENAME COLUMN $Tag->{NameOld} TO $Tag->{NameNew}";
            }

            # alter table name modify
            if ( !$Tag->{Name} && $Tag->{NameNew} ) {
                $Tag->{Name} = $Tag->{NameNew};
            }
            if ( !$Tag->{Name} && $Tag->{NameOld} ) {
                $Tag->{Name} = $Tag->{NameOld};
            }

            # investigate the require
            my $Required = ( $Tag->{Required} && lc $Tag->{Required} eq 'true' ) ? 1 : 0;

            # investigate the default value
            my $Default = '';
            if ( $Tag->{Type} =~ m{ (int|number) }xmsi ) {
                $Default = defined $Tag->{Default} ? $Tag->{Default} : 0;
            }
            else {
                $Default = defined $Tag->{Default} ? "'$Tag->{Default}'" : "''";
            }

            # if the column is a CLOB we create a temporary column with the CLOB type,
            # then copy the data from the old column to the temporary column
            # and then remove the temporary column
            # Fix/Workaround for ORA-22858: invalid alteration of datatype
            if ( $Tag->{Type} eq 'CLOB' ) {

                # create temp column name
                my $ColumnTemp = $Tag->{Name} . '_TEMP';

                # create temp column
                push @SQL, "ALTER TABLE $Table ADD $ColumnTemp $Tag->{Type} NULL";

                # copy data from old column into temp column
                push @SQL, "UPDATE $Table SET $ColumnTemp = $Tag->{Name}";

                # delete old column
                push @SQL, "ALTER TABLE $Table DROP COLUMN $Tag->{Name}";

                # rename temp column to old column name
                push @SQL, "ALTER TABLE $Table RENAME COLUMN $ColumnTemp TO $Tag->{Name}";
            }

            # the column type is no CLOB
            else {
                my $SQLEnd = "ALTER TABLE $Table MODIFY $Tag->{Name} $Tag->{Type} DEFAULT NULL";
                push @SQL, $SQLEnd;
            }

            # handle default and require
            if ( $Default ne "''" && ( $Required || defined $Tag->{Default} ) ) {

                # fill up empty rows
                push @SQL, "UPDATE $Table SET $Tag->{Name} = $Default WHERE $Tag->{Name} IS NULL";

                my $SQLAlter = "ALTER TABLE $Table MODIFY $Tag->{Name} $Tag->{Type}";

                # add default
                if ( defined $Tag->{Default} ) {
                    $SQLAlter .= " DEFAULT $Default";
                }

                # add require
                if ($Required) {
                    $SQLAlter .= ' NOT NULL';
                }

                push @SQL, $SQLAlter;
            }
        }
        elsif ( $Tag->{Tag} eq 'ColumnDrop' && $Tag->{TagType} eq 'Start' ) {
            my $SQLEnd = $SQLStart . " DROP COLUMN $Tag->{Name}";
            push @SQL, $SQLEnd;
        }
        elsif ( $Tag->{Tag} =~ /^((Index|Unique)(Create|Drop))/ ) {
            my $Method = $Tag->{Tag};
            if ( $Tag->{Name} ) {
                $IndexName = $Tag->{Name};
            }
            if ( $Tag->{TagType} eq 'End' ) {
                push @SQL, $Self->$Method(
                    TableName => $Table,
                    Name      => $IndexName,
                    Data      => \@Index,
                );
                $IndexName = '';
                @Index     = ();
            }
        }
        elsif ( $Tag->{Tag} =~ /^(IndexColumn|UniqueColumn)/ && $Tag->{TagType} eq 'Start' ) {
            push @Index, $Tag;
        }
        elsif ( $Tag->{Tag} =~ /^((ForeignKey)(Create|Drop))/ ) {
            my $Method = $Tag->{Tag};
            if ( $Tag->{ForeignTable} ) {
                $ForeignTable = $Tag->{ForeignTable};
            }
            if ( $Tag->{TagType} eq 'End' ) {
                for my $Reference (@Reference) {
                    push @SQL, $Self->$Method(
                        LocalTableName   => $Table,
                        Local            => $Reference->{Local},
                        ForeignTableName => $ForeignTable,
                        Foreign          => $Reference->{Foreign},
                    );
                }
                $ReferenceName = '';
                @Reference     = ();
            }
        }
        elsif ( $Tag->{Tag} =~ /^(Reference)/ && $Tag->{TagType} eq 'Start' ) {
            push @Reference, $Tag;
        }
    }
    return @SQL;
}

sub IndexCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TableName Name Data)) {
        if ( !$Param{$_} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $_!"
            );
            return;
        }
    }
    my $Index = $Param{Name};
    if ( length $Index > 30 ) {
        my $MD5 = $Kernel::OM->Get('Kernel::System::Main')->MD5sum(
            String => $Index,
        );
        $Index = substr $Index, 0, 28;
        $Index .= substr $MD5, 0,  1;
        $Index .= substr $MD5, 31, 1;
    }
    my $SQL   = "CREATE INDEX $Index ON $Param{TableName} (";
    my @Array = @{ $Param{Data} };
    for ( 0 .. $#Array ) {
        if ( $_ > 0 ) {
            $SQL .= ', ';
        }
        $SQL .= $Array[$_]->{Name};
    }
    $SQL .= ')';

    return ($SQL);

}

sub IndexDrop {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TableName Name)) {
        if ( !$Param{$_} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $_!"
            );
            return;
        }
    }

    my $Index = $Param{Name};
    if ( length $Index > 30 ) {
        my $MD5 = $Kernel::OM->Get('Kernel::System::Main')->MD5sum(
            String => $Index,
        );
        $Index = substr $Index, 0, 28;
        $Index .= substr $MD5, 0,  1;
        $Index .= substr $MD5, 31, 1;
    }

    my $SQL = 'DROP INDEX ' . $Index;
    return ($SQL);
}

sub ForeignKeyCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(LocalTableName Local ForeignTableName Foreign)) {
        if ( !$Param{$_} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $_!"
            );
            return;
        }
    }

    # create foreign key name
    my $ForeignKey = "FK_$Param{LocalTableName}_$Param{Local}_$Param{Foreign}";
    if ( length($ForeignKey) > 30 ) {
        my $MD5 = $Kernel::OM->Get('Kernel::System::Main')->MD5sum(
            String => $ForeignKey,
        );
        $ForeignKey = substr $ForeignKey, 0, 28;
        $ForeignKey .= substr $MD5, 0,  1;
        $ForeignKey .= substr $MD5, 31, 1;
    }

    # add foreign key
    my $SQL = "ALTER TABLE $Param{LocalTableName} ADD CONSTRAINT $ForeignKey FOREIGN KEY "
        . "($Param{Local}) REFERENCES $Param{ForeignTableName} ($Param{Foreign})";

    return ($SQL);
}

sub ForeignKeyDrop {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(LocalTableName Local ForeignTableName Foreign)) {
        if ( !$Param{$_} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $_!"
            );
            return;
        }
    }

    # create foreign key name
    my $ForeignKey = "FK_$Param{LocalTableName}_$Param{Local}_$Param{Foreign}";
    if ( length($ForeignKey) > 30 ) {
        my $MD5 = $Kernel::OM->Get('Kernel::System::Main')->MD5sum(
            String => $ForeignKey,
        );
        $ForeignKey = substr $ForeignKey, 0, 28;
        $ForeignKey .= substr $MD5, 0,  1;
        $ForeignKey .= substr $MD5, 31, 1;
    }

    # drop foreign key
    my $SQL = "ALTER TABLE $Param{LocalTableName} DROP CONSTRAINT $ForeignKey";

    return ($SQL);
}

sub UniqueCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TableName Name Data)) {
        if ( !$Param{$_} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $_!"
            );
            return;
        }
    }

    my $Unique = $Param{Name};
    if ( length $Unique > 30 ) {
        my $MD5 = $Kernel::OM->Get('Kernel::System::Main')->MD5sum(
            String => $Unique,
        );
        $Unique = substr $Unique, 0, 28;
        $Unique .= substr $MD5, 0,  1;
        $Unique .= substr $MD5, 31, 1;
    }

    my $SQL   = "ALTER TABLE $Param{TableName} ADD CONSTRAINT $Unique UNIQUE (";
    my @Array = @{ $Param{Data} };
    my $Name  = '';
    for ( 0 .. $#Array ) {
        if ( $_ > 0 ) {
            $SQL .= ', ';
        }
        $SQL  .= $Array[$_]->{Name};
        $Name .= '_' . $Array[$_]->{Name};
    }
    $SQL .= ')';

    return ($SQL);

}

sub UniqueDrop {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(TableName Name)) {
        if ( !$Param{$_} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $_!"
            );
            return;
        }
    }

    my $Unique = $Param{Name};
    if ( length $Unique > 30 ) {
        my $MD5 = $Kernel::OM->Get('Kernel::System::Main')->MD5sum(
            String => $Unique,
        );
        $Unique = substr $Unique, 0, 28;
        $Unique .= substr $MD5, 0,  1;
        $Unique .= substr $MD5, 31, 1;
    }

    my $SQL = "ALTER TABLE $Param{TableName} DROP CONSTRAINT $Unique";
    return ($SQL);
}

sub Insert {
    my ( $Self, @Param ) = @_;

    # get needed objects
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $TimeObject   = $Kernel::OM->Get('Kernel::System::Time');

    my $SQL    = '';
    my @Keys   = ();
    my @Values = ();
    TAG:
    for my $Tag (@Param) {
        if ( $Tag->{Tag} eq 'Insert' && $Tag->{TagType} eq 'Start' ) {
            if ( $ConfigObject->Get('Database::ShellOutput') ) {
                $SQL .= $Self->{'DB::Comment'}
                    . "----------------------------------------------------------\n";
                $SQL .= $Self->{'DB::Comment'} . " insert into table $Tag->{Table}\n";
                $SQL .= $Self->{'DB::Comment'}
                    . "----------------------------------------------------------\n";
            }
            $SQL .= "INSERT INTO $Tag->{Table} ";
        }
        if ( $Tag->{Tag} eq 'Data' && $Tag->{TagType} eq 'Start' ) {

            # do not use auto increment values
            next TAG if $Tag->{Type} && $Tag->{Type} =~ m{ ^AutoIncrement$ }xmsi;

            $Tag->{Key} = ${ $Self->Quote( \$Tag->{Key} ) };
            push @Keys, $Tag->{Key};
            my $Value;
            if ( defined $Tag->{Value} ) {
                $Value = $Tag->{Value};
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => 'The content for inserts is not longer appreciated '
                        . 'attribut Value, use Content from now on! Reason: You can\'t '
                        . 'use new lines in attributes.',
                );
            }
            elsif ( defined $Tag->{Content} ) {
                $Value = $Tag->{Content};
            }
            else {
                $Value = '';
            }
            if ( $Tag->{Type} && $Tag->{Type} eq 'Quote' ) {
                $Value = "'" . ${ $Self->Quote( \$Value ) } . "'";
            }
            else {
                $Value = ${ $Self->Quote( \$Value ) };
            }
            push @Values, $Value;
        }
    }
    my $Key = '';
    for (@Keys) {
        if ( $Key ne '' ) {
            $Key .= ', ';
        }
        $Key .= $_;
    }
    my $Value = '';
    for my $Tmp (@Values) {
        if ( $Value ne '' ) {
            $Value .= ', ';
        }
        if ( $Tmp eq 'current_timestamp' ) {
            if ( $ConfigObject->Get('Database::ShellOutput') ) {
                $Value .= $Tmp;
            }
            else {
                my $Timestamp = $TimeObject->CurrentTimestamp();
                $Value .= '\'' . $Timestamp . '\'';
            }
        }
        else {
            $Value .= $Tmp;
        }
    }
    $SQL .= "($Key)\n    VALUES\n    ($Value)";
    return ($SQL);
}

sub _TypeTranslation {
    my ( $Self, $Tag ) = @_;

    # Type translation
    if ( $Tag->{Type} =~ /^DATE$/i ) {
        $Tag->{Type} = 'DATE';
    }
    elsif ( $Tag->{Type} =~ /^smallint$/i ) {
        $Tag->{Type} = 'NUMBER (5, 0)';
    }
    elsif ( $Tag->{Type} =~ /^integer$/i ) {
        $Tag->{Type} = 'NUMBER (12, 0)';
    }
    elsif ( $Tag->{Type} =~ /^bigint$/i ) {
        $Tag->{Type} = 'NUMBER (20, 0)';
    }
    elsif ( $Tag->{Type} =~ /^longblob$/i ) {
        $Tag->{Type} = 'CLOB';
    }
    elsif ( $Tag->{Type} =~ /^VARCHAR$/i ) {
        $Tag->{Type} = 'VARCHAR2 (' . $Tag->{Size} . ')';
        if ( $Tag->{Size} > 4000 ) {
            $Tag->{Type} = 'CLOB';
        }
    }
    elsif ( $Tag->{Type} =~ /^DECIMAL$/i ) {
        $Tag->{Type} = 'DECIMAL (' . $Tag->{Size} . ')';
    }
    return $Tag;
}

1;
