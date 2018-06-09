# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Maint::Database::PasswordCrypt;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::DB',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Makes a database password unreadable for inclusion in Kernel/Config.pm.');
    $Self->AddArgument(
        Name        => 'password',
        Description => "The database password to be crypted.",
        Required    => 1,
        ValueRegex  => qr/.*/smx,
    );

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Password = $Self->GetArgument('password');
    chomp $Password;
    my $CryptedString = $Kernel::OM->Get('Kernel::System::DB')->_Encrypt($Password);

    $Self->Print(
        "<red>Please note that this just makes the password unreadable but is not a secure form of encryption.</red>\n"
    );
    $Self->Print("<green>Crypted password: </green>{$CryptedString}\n");

    return $Self->ExitCodeOk();
}

1;
