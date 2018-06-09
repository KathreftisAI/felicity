# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ImportExport::LayoutSelection;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Web::Request',
);

=head1 NAME

Kernel::Output::HTML::ImportExport::LayoutSelection - layout backend module

=head1 SYNOPSIS

All layout functions for selection elements

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::ImportExport::LayoutSelection->new(
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
        Class  => 'Modernize'  # (optional)
    );

=cut

sub FormInputCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Item!'
        );
        return;
    }

    # set default value
    $Param{Prefix} ||= '';
    $Param{Value}  ||= $Param{Item}->{Input}->{ValueDefault};

    if ( $Param{Value} && $Param{Value} =~ m{ ##### }xms ) {
        my @Values = split '#####', $Param{Value};
        $Param{Value} = \@Values;
    }

    # generate option string
    my $String = $Kernel::OM->Get('Kernel::Output::HTML::Layout')->BuildSelection(
        ID           => $Param{Prefix} . $Param{Item}->{Key},
        Class        => $Param{Class},
        Name         => $Param{Prefix} . $Param{Item}->{Key},
        Data         => $Param{Item}->{Input}->{Data} || {},
        SelectedID   => $Param{Value},
        Translation  => $Param{Item}->{Input}->{Translation},
        TreeView     => $Param{Item}->{Input}->{TreeView} || 0,
        PossibleNone => $Param{Item}->{Input}->{PossibleNone},
        Multiple     => $Param{Item}->{Input}->{Multiple},
        Size         => $Param{Item}->{Input}->{Size},
    );

    return $String;
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
            Message  => 'Need Item!'
        );
        return;
    }

    $Param{Prefix} ||= '';

    # get form data
    my @FormDatas = $Kernel::OM->Get('Kernel::System::Web::Request')->GetArray(
        Param => $Param{Prefix} . $Param{Item}->{Key},
    );

    my $FormData = join '#####', @FormDatas;

    return $FormData if $FormData;
    return $FormData if !$Param{Item}->{Input}->{Required};

    # set invalid param
    $Param{Item}->{Form}->{Invalid} = 1;

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
