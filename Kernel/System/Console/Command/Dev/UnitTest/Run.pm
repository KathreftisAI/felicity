# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Dev::UnitTest::Run;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::UnitTest',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Executes unit tests.');
    $Self->AddOption(
        Name => 'test',
        Description =>
            "Run individual test files, e.g. 'Ticket' or 'Ticket/ArchiveFlags' (can be specified several times).",
        Required   => 0,
        HasValue   => 1,
        Multiple   => 1,
        ValueRegex => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'directory',
        Description => "Run all test files in the specified directory.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'verbose',
        Description => "Show details for all tests, not just failing.",
        Required    => 0,
        HasValue    => 0,
    );
    $Self->AddOption(
        Name        => 'submit-url',
        Description => "Send unit test results to a server (url).",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'submit-auth',
        Description => "Authentication string for unit test result server.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name => 'submit-result-as-exit-code',
        Description =>
            "Specify if command return code should not indicate if tests were ok/not ok, but if submission was successful instead.",
        Required => 0,
        HasValue => 0,
    );
    $Self->AddOption(
        Name        => 'job-id',
        Description => "Job ID for unit test submission to server.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'scenario',
        Description => "Scenario identifier for unit test submission to server.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name => 'attachment-path',
        Description =>
            "Send an additional file to the server, for example to submit the complete command output that has been redirected to a file.",
        Required   => 0,
        HasValue   => 1,
        ValueRegex => qr/.*/smx,
        Multiple   => 1
    );
}

sub PreRun {
    my ( $Self, %Param ) = @_;

    if ( $Self->GetOption('submit-result-as-exit-code') && !$Self->GetOption('submit-url') ) {
        die "Please specify a valid 'submit-url'.";
    }
    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Kernel::OM->ObjectParamAdd(
        'Kernel::System::UnitTest' => {
            ANSI => $Self->{ANSI},
        },
    );

    my $FunctionResult = $Kernel::OM->Get('Kernel::System::UnitTest')->Run(
        Tests                  => $Self->GetOption('test'),
        Directory              => $Self->GetOption('directory'),
        JobID                  => $Self->GetOption('job-id'),
        Scenario               => $Self->GetOption('scenario'),
        SubmitURL              => $Self->GetOption('submit-url'),
        SubmitAuth             => $Self->GetOption('submit-auth'),
        SubmitResultAsExitCode => $Self->GetOption('submit-result-as-exit-code') || '',
        Verbose                => $Self->GetOption('verbose'),
        AttachmentPath         => $Self->GetOption('attachment-path'),
    );

    if ($FunctionResult) {
        return $Self->ExitCodeOk();
    }
    return $Self->ExitCodeError();
}

1;
