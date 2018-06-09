# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Maint::PostMaster::MailAccountFetch;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::MailAccount',
    'Kernel::System::PID',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Fetch incoming emails from configured mail accounts.');
    $Self->AddOption(
        Name        => 'mail-account-id',
        Description => "Fetch mail only from this account (default: fetch from all).",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr{^\d+$}smx,
    );
    $Self->AddOption(
        Name        => 'force-pid',
        Description => "Start even if another process is still registered in the database.",
        Required    => 0,
        HasValue    => 0,
    );
    $Self->AddOption(
        Name        => 'debug',
        Description => "Print debug info to the OTRS log.",
        Required    => 0,
        HasValue    => 0,
    );

    return;
}

sub PreRun {
    my ($Self) = @_;

    my $PIDObject = $Kernel::OM->Get('Kernel::System::PID');

    my $PIDCreated = $PIDObject->PIDCreate(
        Name  => $Self->Name(),
        Force => $Self->GetOption('force-pid'),
        TTL   => 60 * 60 * 24 * 3,
    );
    if ( !$PIDCreated ) {
        my $Error = "Unable to register the process in the database. Is another instance still running?\n";
        $Error .= "You can use --force-pid to override this check.\n";
        die $Error;
    }

    my $Debug = $Self->GetOption('debug');
    my $Name  = $Self->Name();

    if ($Debug) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'debug',
            Message  => "OTRS email handle ($Name) started.",
        );
    }

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Fetching incoming mails from mail accounts...</yellow>\n\n");

    my $MailAccountObject = $Kernel::OM->Get('Kernel::System::MailAccount');
    my $MailAccountID     = $Self->GetOption('mail-account-id');

    my %List = $MailAccountObject->MailAccountList( Valid => 1 );
    my ( $ErrorCount, $FetchedCount );

    KEY:
    for my $Key ( sort keys %List ) {
        next KEY if ( $MailAccountID && $Key != $MailAccountID );
        my %Data = $MailAccountObject->MailAccountGet( ID => $Key );
        $Self->Print("<yellow>$Data{Host} ($Data{Type})...</yellow>\n");
        my $Status = $MailAccountObject->MailAccountFetch(
            %Data,
            Debug  => $Self->GetOption('debug'),
            CMD    => 1,
            UserID => 1,
        );
        if ($Status) {
            $FetchedCount++;
        }
        else {
            $ErrorCount++;
        }
    }

    if ($ErrorCount) {

        # Error messages printed by backend
        return $Self->ExitCodeError();
    }

    if ( !$FetchedCount && $MailAccountID ) {
        $Self->PrintError("Could not find mail account $MailAccountID.");
        return $Self->ExitCodeError();
    }

    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

sub PostRun {
    my ($Self) = @_;

    my $Debug = $Self->GetOption('debug');
    my $Name  = $Self->Name();

    if ($Debug) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'debug',
            Message  => "OTRS email handle ($Name) stopped.",
        );
    }

    return $Kernel::OM->Get('Kernel::System::PID')->PIDDelete( Name => $Self->Name() );
}

1;
