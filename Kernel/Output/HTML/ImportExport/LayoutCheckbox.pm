# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ImportExport::LayoutCheckbox;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Web::Request',
);

=head1 NAME

Kernel::Output::HTML::ImportExport::LayoutCheckbox - layout backend module

=head1 SYNOPSIS

All layout functions for checkbox elements in import/export.

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::ImportExport::LayoutCheckbox->new(
        %Param,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item FormInputCreate()

create a input string

    my $Value = $BackendObject->FormInputCreate(
        Item   => $ItemRef,
        Prefix => 'Prefix::',  # (optional)
        Value  => 'Value',     # (optional)
    );

=cut

sub FormInputCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    $Param{Prefix} ||= '';

    my $Checked = $Param{Value} ? 'checked="checked"' : '';

    return
        qq{<input id="$Param{Prefix}$Param{Item}->{Key}" type="checkbox" name="$Param{Prefix}$Param{Item}->{Key}" $Checked />};
}

=item FormDataGet()

get form data

    my $FormData = $BackendObject->FormDataGet(
        Item   => $ItemRef,
        Prefix => 'Prefix::',  # (optional)
    );

=cut

sub FormDataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    $Param{Prefix} ||= '';

    # get form data
    my $FormData = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam(
        Param => $Param{Prefix} . $Param{Item}->{Key},
    );

    return $FormData;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
