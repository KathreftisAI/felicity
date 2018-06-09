# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMConfigItem::LayoutDummy;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Web::Request',
    'Kernel::Config',
);

=head1 NAME

Kernel::Output::HTML::ITSMConfigItem::LayoutDummy - layout backend module

=head1 SYNOPSIS

All layout functions of dummy objects

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::ITSMConfigItem::LayoutDummy->new(
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

=item OutputStringCreate()

create output string

    my $Value = $BackendObject->OutputStringCreate();

=cut

sub OutputStringCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    if ( !defined $Param{Value} ) {
        $Param{Value} = '';
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # translate
    if ( $Param{Item}->{Input}->{Translation} ) {
        $Param{Value} = $LayoutObject->{LanguageObject}->Translate( $Param{Value} );
    }

    my $LinkFeature = 1;

    # do not transform links in print view
    if ( $Param{Print} ) {
        $LinkFeature = 0;
    }

    # transform ascii to html
    $Param{Value} = $LayoutObject->Ascii2Html(
        Text           => $Param{Value},
        HTMLResultMode => 1,
        LinkFeature    => $LinkFeature,
    );

    return $Param{Value};
}

=item FormDataGet()

get form data as hash reference

    my $FormDataRef = $BackendObject->FormDataGet();

=cut

sub FormDataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my %FormData;

    # get form data
    $FormData{Value} = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => $Param{Key} );

    # set invalid param
    if ( $Param{Item}->{Input}->{Required} && !$FormData{Value} ) {
        $FormData{Invalid} = 1;
        $Param{Item}->{Form}->{ $Param{Key} }->{Invalid} = 1;
    }

    return \%FormData;
}

=item InputCreate()

create a input string

    my $Value = $BackendObject->InputCreate();

=cut

sub InputCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Item)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my $Value = $Param{Value};
    if ( !defined $Param{Value} ) {
        $Value = $Param{Item}->{Input}->{ValueDefault} || '';
    }

    my $Class    = '';
    my $Size     = 'W50pc';
    my $Required = $Param{Required};
    my $Invalid  = $Param{Invalid};
    my $ItemId   = $Param{ItemId};

    if ($Required) {
        $Class .= ' Validate_Required';
    }

    if ($Invalid) {
        $Class .= ' ServerError';
    }
    $Class .= ' ' . $Size;
    my $String = "<span style=\"display: inline-block; height: 1.3em;\">";
    $String
        .= "<input style=\"display:none;\" type=\"text\" name=\"$Param{Key}\" class=\"$Class\" ";

    if ($ItemId) {
        $String .= "id=\"$ItemId\" ";
    }

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
    }

    $String .= "value=\"$Value\" ";

    # add maximum length
    if ( $Param{Item}->{Input}->{MaxLength} ) {
        $String .= "maxlength=\"$Param{Item}->{Input}->{MaxLength}\" ";
    }

    $String .= '/> </span>';

    return $String;
}

=item SearchFormDataGet()

get search form data

    my $Value = $BackendObject->SearchFormDataGet();

=cut

sub SearchFormDataGet {
    return [];
}

=item SearchInputCreate()

create a search input string

    my $Value = $BackendObject->SearchInputCreate();

=cut

sub SearchInputCreate {
    return '&nbsp;';
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
