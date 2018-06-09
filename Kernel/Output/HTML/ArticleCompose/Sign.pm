# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ArticleCompose::Sign;

use strict;
use warnings;

use Mail::Address;
use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Crypt::PGP',
    'Kernel::System::Crypt::SMIME',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Queue',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Option {
    my ( $Self, %Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # check if pgp or smime is disabled
    return if !$ConfigObject->Get('PGP') && !$ConfigObject->Get('SMIME');

    return ('SignKeyID');
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # check if pgp or smime is disabled
    return if !$ConfigObject->Get('PGP') && !$ConfigObject->Get('SMIME');

    my %KeyList = $Self->Data(%Param);

    # add signing options
    if (
        !defined $Param{SignKeyID}
        || ( $Param{ExpandCustomerName} && $Param{ExpandCustomerName} == 3 )
        )
    {

        # get default signing key
        if ( $Param{QueueID} ) {
            my $QueueObject = $Kernel::OM->Get('Kernel::System::Queue');
            my %Queue = $QueueObject->QueueGet( ID => $Param{QueueID} );
            $Param{SignKeyID} = $Queue{DefaultSignKey} || '';
        }
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $List = $LayoutObject->BuildSelection(
        Data       => \%KeyList,
        Name       => 'SignKeyID',
        SelectedID => $Param{SignKeyID},
        Class      => 'Modernize',
    );
    $LayoutObject->Block(
        Name => 'Option',
        Data => {
            Name  => 'SignKeyID',
            Key   => Translatable('Sign'),
            Value => $List,
        },
    );
    return;
}

sub Data {
    my ( $Self, %Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # check if pgp or smime is disabled
    return if !$ConfigObject->Get('PGP') && !$ConfigObject->Get('SMIME');

    # generate key list
    my %KeyList;

    # add non signing option
    $KeyList{''} = Translatable('-none-');

    if ( $Param{From} ) {

        my @SearchAddress = Mail::Address->parse( $Param{From} );

        # check pgp backend
        my $PGPObject = $Kernel::OM->Get('Kernel::System::Crypt::PGP');
        if ($PGPObject) {
            my @PrivateKeys = $PGPObject->PrivateKeySearch(
                Search => $SearchAddress[0]->address(),
            );
            for my $DataRef (@PrivateKeys) {
                my $Expires = '';
                if ( $DataRef->{Expires} ) {
                    $Expires = "[$DataRef->{Expires}]";
                }

                # disable inline pgp if rich text is enabled
                if ( !$Kernel::OM->Get('Kernel::Output::HTML::Layout')->{BrowserRichText} ) {
                    $KeyList{"PGP::Inline::$DataRef->{Key}"}
                        = "PGP-Inline: $DataRef->{Key} $Expires $DataRef->{Identifier}";
                }
                $KeyList{"PGP::Detached::$DataRef->{Key}"}
                    = "PGP-Detached: $DataRef->{Key} $Expires $DataRef->{Identifier}";
            }
        }

        # check smime backend
        my $SMIMEObject = $Kernel::OM->Get('Kernel::System::Crypt::SMIME');
        if ($SMIMEObject) {
            my @PrivateKeys = $SMIMEObject->PrivateSearch(
                Search => $SearchAddress[0]->address(),
            );
            for my $DataRef (@PrivateKeys) {
                $KeyList{"SMIME::Detached::$DataRef->{Filename}"}
                    = "SMIME-Detached: $DataRef->{Filename} [$DataRef->{EndDate}] $DataRef->{Email}";
            }
        }

    }
    return %KeyList;
}

sub ArticleOption {
    my ( $Self, %Param ) = @_;

    if ( $Param{SignKeyID} ) {
        my ( $Type, $SubType, $Key ) = split /::/, $Param{SignKeyID};
        return (
            Sign => {
                Type    => $Type,
                SubType => $SubType,
                Key     => $Key,
            },
        );
    }
    return;
}

sub GetParamAJAX {
    my ( $Self, %Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # check if pgp or smime is disabled
    return if !$ConfigObject->Get('PGP') && !$ConfigObject->Get('SMIME');

    my %Result;

    # get default signing key
    if ( $Param{QueueID} ) {
        my $QueueObject = $Kernel::OM->Get('Kernel::System::Queue');
        my %Queue = $QueueObject->QueueGet( ID => $Param{QueueID} );
        $Result{SignKeyID} = $Queue{DefaultSignKey} || '';
    }

    return %Result;
}

sub Error {
    my ( $Self, %Param ) = @_;

    if ( $Self->{Error} ) {
        return %{ $Self->{Error} };
    }
    return;
}

1;
