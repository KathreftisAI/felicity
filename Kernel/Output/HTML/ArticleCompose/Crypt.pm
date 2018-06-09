# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ArticleCompose::Crypt;

use strict;
use warnings;

use Mail::Address;
use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Crypt::PGP',
    'Kernel::System::Crypt::SMIME',
    'Kernel::Output::HTML::Layout',
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

    return ('CryptKeyID');
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # check if pgp or smime is disabled
    return if !$ConfigObject->Get('PGP') && !$ConfigObject->Get('SMIME');

    my %KeyList = $Self->Data(%Param);

    # find recipient list
    my $Recipient = '';
    for (qw(To Cc Bcc)) {
        if ( $Param{$_} ) {
            $Recipient .= ', ' . $Param{$_};
        }
    }
    my @SearchAddress = ();
    if ($Recipient) {
        @SearchAddress = Mail::Address->parse($Recipient);
    }

    my $Class = '';

    # backend currently only supports one recipient
    if ( $#SearchAddress > 0 && $Param{CryptKeyID} ) {
        $Self->{Error}->{CryptMultipleRecipient} = 1;
        $Class .= ' ServerError';
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # add crypt options
    my $List = $LayoutObject->BuildSelection(
        Data       => \%KeyList,
        Name       => 'CryptKeyID',
        SelectedID => $Param{CryptKeyID} || '',
        Class      => "$Class Modernize",
        Max        => 150,
    );
    $LayoutObject->Block(
        Name => 'Option',
        Data => {
            Name    => 'CryptKeyID',
            Key     => Translatable('Crypt'),
            Value   => $List,
            Invalid => 'Just one recipient for crypt is possible!',
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

    # find recipient list
    my $Recipient = '';
    for (qw(To Cc Bcc)) {
        if ( $Param{$_} ) {
            $Recipient .= ', ' . $Param{$_};
        }
    }
    my @SearchAddress = ();
    if ($Recipient) {
        @SearchAddress = Mail::Address->parse($Recipient);
    }

    # generate key list
    my %KeyList;

    # add non crypt option
    $KeyList{''} = Translatable('-none-');

    # backend currently only supports one recipient
    if ( $#SearchAddress > 0 ) {
        return %KeyList;
    }
    elsif (@SearchAddress) {

        # check pgp backend
        my $PGPObject = $Kernel::OM->Get('Kernel::System::Crypt::PGP');
        if ($PGPObject) {
            my @PublicKeys = $PGPObject->PublicKeySearch(
                Search => $SearchAddress[0]->address(),
            );
            for my $DataRef (@PublicKeys) {
                my $Expires = '';
                if ( $DataRef->{Expires} ) {
                    $Expires = "[$DataRef->{Expires}]";
                }

                my $Status = '';
                $Status = '[' . $DataRef->{Status} . ']';
                if ( $DataRef->{Status} eq 'expired' ) {
                    $Status = '[WARNING: EXPIRED KEY]';
                }
                elsif ( $DataRef->{Status} eq 'revoked' ) {
                    $Status = '[WARNING: REVOKED KEY]';
                }

                # disable inline pgp if rich text is enabled
                if ( !$Kernel::OM->Get('Kernel::Output::HTML::Layout')->{BrowserRichText} ) {
                    $KeyList{"PGP::Inline::$DataRef->{Key}"}
                        = "PGP-Inline: $Status $DataRef->{Key} $Expires $DataRef->{Identifier}";
                }

                $KeyList{"PGP::Detached::$DataRef->{Key}"}
                    = "PGP-Detached: $Status $DataRef->{Key} $Expires $DataRef->{Identifier}";
            }
        }

        # check smime backend
        my $SMIMEObject = $Kernel::OM->Get('Kernel::System::Crypt::SMIME');
        if ($SMIMEObject) {
            my @PublicKeys = $SMIMEObject->CertificateSearch(
                Search => $SearchAddress[0]->address(),
            );
            for my $DataRef (@PublicKeys) {
                my $EndDate = '';
                if ( $DataRef->{EndDate} ) {
                    $EndDate = "[$DataRef->{EndDate}]";
                }
                $KeyList{"SMIME::Detached::$DataRef->{Filename}"}
                    = "SMIME-Detached: $DataRef->{Filename} $EndDate $DataRef->{Email}";
            }
        }

    }
    return %KeyList;
}

sub ArticleOption {
    my ( $Self, %Param ) = @_;

    if ( $Param{CryptKeyID} ) {
        my ( $Type, $SubType, $Key ) = split /::/, $Param{CryptKeyID};
        return (
            Crypt => {
                Type    => $Type,
                SubType => $SubType,
                Key     => $Key,
            },
        );
    }
    return;
}

sub Error {
    my ( $Self, %Param ) = @_;

    if ( $Self->{Error} ) {
        return %{ $Self->{Error} };
    }
    return;
}

1;
