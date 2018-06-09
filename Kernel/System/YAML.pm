# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::YAML;

use strict;
use warnings;

use Encode qw();
use YAML::Any qw();
use YAML qw();

our @ObjectDependencies = (
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::YAML - YAML wrapper functions

=head1 SYNOPSIS

Functions for YAML serialization / deserialization.

=over 4

=cut

=item new()

create a YAML object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $YAMLObject = $Kernel::OM->Get('Kernel::System::YAML');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item Dump()

Dump a perl data structure to a YAML string.

    my $YAMLString = $YAMLObject->Dump(
        Data     => $Data,
    );

=cut

sub Dump {
    my ( $Self, %Param ) = @_;

    # check for needed data
    if ( !defined $Param{Data} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Data!',
        );
        return;
    }

    my $Result = YAML::Any::Dump( $Param{Data} ) || "--- ''\n";

    # Make sure the resulting string has the UTF-8 flag.
    Encode::_utf8_on($Result);

    return $Result;
}

=item Load()

Load a YAML string to a perl data structure.
This string must be a encoded in UTF8.

    my $PerlStructureScalar = $YAMLObject->Load(
        Data => $YAMLString,
    );

=cut

sub Load {
    my ( $Self, %Param ) = @_;

    # check for needed data
    return if !defined $Param{Data};

    if ( Encode::is_utf8( $Param{Data} ) ) {
        Encode::_utf8_off( $Param{Data} );
    }

    my $Result;

    # get used YAML implementation
    my $YAMLImplementation = YAML::Any->implementation();

    if ( !eval { $Result = YAML::Any::Load( $Param{Data} ) } ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Loading the YAML string failed: ' . $@,
        );
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'YAML data was: "' . $Param{Data} . '"',
        );

        # if used implementation is pure perl YAML there is nothing to do, but exit with error
        return if $YAMLImplementation eq 'YAML';

        # otherwise use pure-perl YAML as fallback if YAML::XS or other can't parse the data
        # structure correctly
        if ( !eval { $Result = YAML::Load( $Param{Data} ) } ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => 'YAML data was not readable even by pure-perl YAML module',
            );
            return;
        }
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Data was only readable pure-perl YAML module, please contact the'
                . ' System Administrator to update this record, as the stored data is still in a'
                . ' wrong format!',
        );
    }

    # YAML does not set the UTF8 flag on strings that need it, do that manually now.
    if ( $YAMLImplementation eq 'YAML' && defined $Result ) {
        _AddUTF8Flag( \$Result );
    }

    return $Result;
}

=begin Internal:

=item _AddUTF8Flag()

adds the UTF8 flag to all elements in a complex data structure.

=cut

sub _AddUTF8Flag {
    my ($Data) = @_;

    if ( !ref ${$Data} ) {
        Encode::_utf8_on( ${$Data} );
        return;
    }

    if ( ref ${$Data} eq 'SCALAR' ) {
        return _AddUTF8Flag( ${$Data} );
    }

    if ( ref ${$Data} eq 'HASH' ) {
        KEY:
        for my $Key ( sort keys %{ ${$Data} } ) {
            next KEY if !defined ${$Data}->{$Key};
            _AddUTF8Flag( \${$Data}->{$Key} );
        }
        return;
    }

    if ( ref ${$Data} eq 'ARRAY' ) {
        KEY:
        for my $Key ( 0 .. $#{ ${$Data} } ) {
            next KEY if !defined ${$Data}->[$Key];
            _AddUTF8Flag( \${$Data}->[$Key] );
        }
        return;
    }

    if ( ref ${$Data} eq 'REF' ) {
        return _AddUTF8Flag( ${$Data} );
    }

    return;
}

1;

=end Internal:

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
