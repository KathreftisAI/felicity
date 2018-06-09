# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ImportExport::FormatBackend::CSV;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::ImportExport',
    'Kernel::System::Log',
    'Kernel::System::Main',
);

=head1 NAME

Kernel::System::ImportExport::FormatBackend::CSV - import/export backend for CSV

=head1 SYNOPSIS

All functions to import and export a csv format

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $ImportExportCSVBackendObject = $Kernel::OM->Get('Kernel::System::ImportExport::FormatBackend::CSV');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    if ( !$Kernel::OM->Get('Kernel::System::Main')->Require('Text::CSV') ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "CPAN module Text::CSV is required to use the CSV import/export module!",
        );
        return;
    }

    # define available separators
    $Self->{AvailableSeparators} = {
        Tabulator => "\t",
        Semicolon => ';',
        Colon     => ':',
        Dot       => '.',
        Comma     => ',',
    };

    return $Self;
}

=item FormatAttributesGet()

get the format attributes of a format as array/hash reference

    my $Attributes = $FormatBackend->FormatAttributesGet(
        UserID => 1,
    );

=cut

sub FormatAttributesGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );
        return;
    }

    my $Attributes = [
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

    return $Attributes;
}

=item MappingFormatAttributesGet()

get the mapping attributes of an format as array/hash reference

    my $Attributes = $FormatBackend->MappingFormatAttributesGet(
        UserID => 1,
    );

=cut

sub MappingFormatAttributesGet {
    my ( $Self, %Param ) = @_;

    # check needed object
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );
        return;
    }

    my $Attributes = [
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

    return $Attributes;
}

=item ImportDataGet()

get import data as 2D-array reference

    my $ImportData = $FormatBackend->ImportDataGet(
        TemplateID    => 123,
        SourceContent => $StringRef,  # (optional)
        UserID        => 1,
    );

=cut

sub ImportDataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TemplateID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    return [] if !defined $Param{SourceContent};

    # check source content
    if ( ref $Param{SourceContent} ne 'SCALAR' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'SourceContent must be a scalar reference',
        );
        return;
    }

    # get format data
    my $FormatData = $Kernel::OM->Get('Kernel::System::ImportExport')->FormatDataGet(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    # check format data
    if ( !$FormatData || ref $FormatData ne 'HASH' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No format data found for the template id $Param{TemplateID}",
        );
        return;
    }

    # get charset
    my $Charset = $FormatData->{Charset} ||= '';
    $Charset =~ s{ \s* (utf-8|utf8) \s* }{UTF-8}xmsi;

    # check the charset
    if ( !$Charset ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No valid charset found for the template id $Param{TemplateID}",
        );
        return;
    }

    # get separator
    $FormatData->{ColumnSeparator} ||= '';
    my $Separator = $Self->{AvailableSeparators}->{ $FormatData->{ColumnSeparator} } || '';

    # check the separator
    if ( !$Separator ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No valid separator found for the template id $Param{TemplateID}",
        );
        return;
    }

    # create the parser object
    my $ParseObject = Text::CSV->new(
        {
            quote_char          => '"',
            escape_char         => '"',
            sep_char            => $Separator,
            eol                 => '',
            always_quote        => 1,
            binary              => 1,
            keep_meta_info      => 0,
            allow_loose_quotes  => 0,
            allow_loose_escapes => 0,
            allow_whitespace    => 0,
            blank_is_undef      => 0,
            verbatim            => 0,
        }
    );

    # create an in memory temp file and open it
    my $FileContent = '';
    open my $FH, '+<', \$FileContent;    ## no critic

    # write source content
    print $FH ${ $Param{SourceContent} };

    # rewind file handle
    seek $FH, 0, 0;

    # parse the content
    my $LineCount = 1;
    my @ImportData;

    # it is important to use this syntax "while ( !eof($FH) )"
    # as the CPAN module Text::CSV_XS might show errors if the
    # getline call is within the while test
    # have a look at http://bugs.otrs.org/show_bug.cgi?id=9270
    while ( !eof($FH) ) {
        my $Column = $ParseObject->getline($FH);
        push @ImportData, $Column;
        $LineCount++;
    }

    # error handling
    my ( $ParseErrorCode, $ParseErrorString ) = $ParseObject->error_diag();
    if ($ParseErrorCode) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ImportError at line $LineCount, "
                . "ErrorCode: $ParseErrorCode '$ParseErrorString' ",
        );
    }

    # close the in memory file handle
    close $FH;

    return \@ImportData if $Charset ne 'UTF-8';

    # set utf8 flag
    for my $Row (@ImportData) {
        for my $Cell ( @{$Row} ) {
            Encode::_utf8_on($Cell);
        }
    }

    return \@ImportData;
}

=item ExportDataSave()

export one row of the export data

    my $DestinationContent = $FormatBackend->ExportDataSave(
        TemplateID    => 123,
        ExportDataRow => $ArrayRef,
        UserID        => 1,
    );

=cut

sub ExportDataSave {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TemplateID ExportDataRow UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check export data row
    if ( ref $Param{ExportDataRow} ne 'ARRAY' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'ExportDataRow must be an array reference',
        );
        return;
    }

    # get format data
    my $FormatData = $Kernel::OM->Get('Kernel::System::ImportExport')->FormatDataGet(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    # check format data
    if ( !$FormatData || ref $FormatData ne 'HASH' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No format data found for the template id $Param{TemplateID}",
        );
        return;
    }

    # get charset
    my $Charset = $FormatData->{Charset} ||= '';
    $Charset =~ s{ \s* (utf-8|utf8) \s* }{UTF-8}xmsi;

    # check the charset
    if ( !$Charset ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No valid charset found for the template id $Param{TemplateID}",
        );
        return;
    }

    # get charset
    $FormatData->{ColumnSeparator} ||= '';
    my $Separator = $Self->{AvailableSeparators}->{ $FormatData->{ColumnSeparator} } || '';

    # check the separator
    if ( !$Separator ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No valid separator found for the template id $Param{TemplateID}",
        );
        return;
    }

    # create the parser object
    my $ParseObject = Text::CSV->new(
        {
            quote_char          => '"',
            escape_char         => '"',
            sep_char            => $Separator,
            eol                 => '',
            always_quote        => 1,
            binary              => 1,
            keep_meta_info      => 0,
            allow_loose_quotes  => 0,
            allow_loose_escapes => 0,
            allow_whitespace    => 0,
            blank_is_undef      => 0,
            verbatim            => 0,
        }
    );

    if ( !$ParseObject->combine( @{ $Param{ExportDataRow} } ) ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't combine the export data to a string!",
        );
        return;
    }

    # create the CSV string
    my $String = $ParseObject->string();

    return $String if $Charset ne 'UTF-8';

    # set utf8 flag
    Encode::_utf8_on($String);

    return $String;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
