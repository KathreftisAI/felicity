# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Maint::Survey::RequestsSend;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DB',
    'Kernel::System::Time',
    'Kernel::System::Survey',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Send pending survey requests.');
    $Self->AddOption(
        Name        => 'force',
        Description => "Actually send the requests now.",
        Required    => 0,
        HasValue    => 0,
    );

    $Self->AdditionalHelp(<<"EOF");

 <yellow>Configure delayed request sending:</yellow>

  <yellow>1.</yellow> Go to your SysConfig (Survey->Core) and configure <green>Survey::SendInHoursAfterClose</green> to a higher value than 0
  <yellow>2.</yellow> Create a survey, make it master
  <yellow>3.</yellow> Create a ticket, close it
  <yellow>4.</yellow> Wait the necessary amount of hours you had configured
  <yellow>5.</yellow> You can do a dry run to get a list of survey requests that would be sent ( do not use --force )
  <yellow>6.</yellow> If you're fine with it, go again to SysConfig (Survey->Daemon::SchedulerCronTaskManager::Task) and activate daemon task <green> Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend</green>
EOF

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Processing pending survey requests...</yellow>\n\n");

    my $SendInHoursAfterClose = $Kernel::OM->Get('Kernel::Config')->Get('Survey::SendInHoursAfterClose');
    if ( !$SendInHoursAfterClose ) {
        $Self->Print("No hours configured in Survey::SendInHoursAfterClose.\n");

        $Self->Print("<green>Done.</green>\n");
        return $Self->ExitCodeOk();
    }

    # get force option
    my $Force = $Self->GetOption('force');

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # find survey_requests that haven't been sent yet
    my $Success = $DBObject->Prepare(
        SQL => '
            SELECT id, ticket_id, create_time, public_survey_key
            FROM survey_request
            WHERE send_time IS NULL
            ORDER BY create_time DESC',
    );

    if ( !$Success ) {
        $Self->PrintError("DB error during a Prepare function.\n");
        return $Self->ExitCodeError();
    }

    # fetch the result
    my @RequestList;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @RequestList, {
            ID              => $Row[0],
            TicketID        => $Row[1],
            CreateTime      => $Row[2],
            PublicSurveyKey => $Row[3],
        };
    }

    if ( !@RequestList ) {
        $Self->Print("\n<green>Done.</green>\n");
        return $Self->ExitCodeOk();
    }

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    # get SystemTime in UnixTime
    my $SystemTime = $TimeObject->SystemTime();

    REQUEST:
    for my $Request (@RequestList) {

        for my $Needed (qw(ID TicketID CreateTime)) {
            if ( !$Request->{$Needed} ) {
                $Self->Print("<red>Error: $Needed missing in service_request row.</red>\n");
                next REQUEST;
            }
        }

        # convert create_time to unixtime
        my $CreateTime = $TimeObject->TimeStamp2SystemTime(
            String => $Request->{CreateTime},
        );

        $Self->Print(
            "  RequestID: <yellow>$Request->{ID}</yellow>\n   -For TicketID: $Request->{TicketID}\n"
        );

        # don't send for survey_requests that are younger than CreateTime + $SendINHoursAfterClose
        if ( $SendInHoursAfterClose * 3_600 + $CreateTime > $SystemTime ) {
            $Self->Print(
                "   -Skipped because send time wasn't reached yet.\n\n"
            );
            next REQUEST;
        }

        $Self->Print(
            "   -Sending request...\n"
        );

        if ($Force) {
            my $Success = $Kernel::OM->Get('Kernel::System::Survey')->RequestSend(
                TriggerSendRequests => 1,
                SurveyRequestID     => $Request->{ID},
                TicketID            => $Request->{TicketID},
                PublicSurveyKey     => $Request->{PublicSurveyKey},
            );
            if ( !$Success ) {
                $Self->Print("    <red>Error sending the request</red>\n")
            }
            else {
                $Self->Print("    <green>Request is sent successfully.</green>\n");
            }
        }
        $Self->Print("\n");
    }

    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
