# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ImportExport::LayoutText;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Web::Request',
    'Kernel::Output::HTML::Layout',
);

=head1 NAME

Kernel::Output::HTML::ImportExport::LayoutText - layout backend module

=head1 SYNOPSIS

All layout functions for text elements

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::ImportExport::LayoutText->new(
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
            Message  => 'Need Item!'
        );
        return;
    }

    $Param{Prefix} ||= '';

    my $Value = $Param{Value} || $Param{Item}->{Input}->{ValueDefault};
    my $Size = $Param{Item}->{Input}->{Size} || 40;
    my $SizeClass;
    if ( $Size < 15 ) {
        $SizeClass = 'W10pc';
    }
    elsif ( $Size < 35 ) {
        $SizeClass = 'W33pc';
    }
    elsif ( $Size < 50 ) {
        $SizeClass = 'W50pc';
    }
    else {
        $SizeClass = 'W75pc';
    }

    # prepare data
    my $ID = ( $Param{Prefix} || '' ) . ( $Param{Item}->{Key} );
    my $Name = ( $Param{Prefix} || '' ) . ( $Param{Name} || $ID );
    my $Class = ( $SizeClass || '' ) . ( $Param{Class} || '' );

    my $String = "<input id=\"$ID\" type=\"text\" name=\"$Name\" class=\"$Class\" ";

    if ($Value) {

        # get layout object
        my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

        # translate
        if ( $Param{Item}->{Input}->{Translation} ) {
            $Value = $LayoutObject->{LanguageObject}->Translate($Value);
        }

        # transform ascii to html
        $Value = $LayoutObject->Ascii2Html(
            Text           => $Value,
            HTMLResultMode => 1,
        );

        $String .= "value=\"$Value\" ";
    }

    # add maximum length
    if ( $Param{Item}->{Input}->{MaxLength} ) {
        $String .= "maxlength=\"$Param{Item}->{Input}->{MaxLength}\" ";
    }

    $String .= "/> ";

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
    my $FormData = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam(
        Param => $Param{Prefix} . $Param{Item}->{Key},
    );

    # regex check
    if ( $Param{Item}->{Input}->{Regex} && $FormData !~ $Param{Item}->{Input}->{Regex} ) {

        $Param{Item}->{Form}->{Invalid} = 1;
        return $FormData;
    }

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
