# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Admin::ITSM::Change::Check;

use strict;
use warnings;

use base qw(
    Kernel::System::Console::BaseCommand
    Kernel::System::EventHandler);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Time',
    'Kernel::System::PID',
    'Kernel::System::ITSMChange',
    'Kernel::System::ITSMChange::ITSMWorkOrder',
    'Kernel::System::ITSMChange::History',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Check if ITSM changes have reached specific times.');
    $Self->AddOption(
        Name        => 'force-pid',
        Description => "Start even if another process is still registered in the database.",
        Required    => 0,
        HasValue    => 0,
    );

    return;
}

sub PreRun {
    my ( $Self, %Param ) = @_;

    # get PID object
    my $PIDObject = $Kernel::OM->Get('Kernel::System::PID');

    # create PID lock
    my $PIDCreated = $PIDObject->PIDCreate(
        Name  => $Self->Name(),
        Force => $Self->GetOption('force-pid'),
        TTL   => 60 * 60 * 2,
    );
    if ( !$PIDCreated ) {
        my $Error = "Unable to register the process in the database. Is another instance still running?\n";
        $Error .= "You can use --force-pid to override this check.\n";
        die $Error;
    }

    # init of event handler
    $Self->EventHandlerInit(
        Config => 'ITSMChangeCronjob::EventModule',
    );

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    $Self->{SystemTime} = $TimeObject->SystemTime();
    $Self->{Now}        = $TimeObject->SystemTime2TimeStamp(
        SystemTime => $Self->{SystemTime},
    );

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Checking ITSM changes...</yellow>\n");

    # get change object
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

    # notifications for changes' plannedXXXtime events
    for my $Type (qw(StartTime EndTime)) {

        # get changes with PlannedStartTime older than now
        my $PlannedChangeIDs = $ChangeObject->ChangeSearch(
            "Planned${Type}OlderDate" => $Self->{Now},
            MirrorDB                  => 1,
            UserID                    => 1,
        ) || [];

        CHANGEID:
        for my $ChangeID ( @{$PlannedChangeIDs} ) {

            # get change data
            my $Change = $ChangeObject->ChangeGet(
                ChangeID => $ChangeID,
                UserID   => 1,
            );

            # skip change if there is already an actualXXXtime set or notification was sent
            next CHANGEID if $Change->{"Actual$Type"};

            my $LastNotificationSentDate = $Self->ChangeNotificationSent(
                ChangeID => $ChangeID,
                Type     => "Planned${Type}",
            );

            my $AlreadySentWithinPeriod = $Self->SentWithinPeriod(
                LastNotificationSentDate => $LastNotificationSentDate,
            );

            next CHANGEID if $AlreadySentWithinPeriod;

            # trigger ChangePlannedStartTimeReachedPost-Event
            $Self->EventHandler(
                Event => "ChangePlanned${Type}ReachedPost",
                Data  => {
                    ChangeID => $ChangeID,
                },
                UserID => 1,
            );
        }

        # get changes with actualxxxtime
        my $ActualChangeIDs = $ChangeObject->ChangeSearch(
            "Actual${Type}OlderDate" => $Self->{Now},
            MirrorDB                 => 1,
            UserID                   => 1,
        ) || [];

        ACTUALCHANGEID:
        for my $ChangeID ( @{$ActualChangeIDs} ) {

            # get change data
            my $Change = $ChangeObject->ChangeGet(
                ChangeID => $ChangeID,
                UserID   => 1,
            );

            my $LastNotificationSentDate = $Self->ChangeNotificationSent(
                ChangeID => $ChangeID,
                Type     => "Actual${Type}",
            );

            next ACTUALCHANGEID if $LastNotificationSentDate;

            # trigger Event
            $Self->EventHandler(
                Event => "ChangeActual${Type}ReachedPost",
                Data  => {
                    ChangeID => $ChangeID,
                },
                UserID => 1,
            );
        }
    }

    # get changes with RequestedTimeOlderDate
    my $RequestedTimeChangeIDs = $ChangeObject->ChangeSearch(
        RequestedTimeOlderDate => $Self->{Now},
        MirrorDB               => 1,
        UserID                 => 1,
    ) || [];

    CHANGEID:
    for my $ChangeID ( @{$RequestedTimeChangeIDs} ) {

        # get change data
        my $Change = $ChangeObject->ChangeGet(
            ChangeID => $ChangeID,
            UserID   => 1,
        );

        my $LastNotificationSentDate = $Self->ChangeNotificationSent(
            ChangeID => $ChangeID,
            Type     => "RequestedTime",
        );

        next CHANGEID if $LastNotificationSentDate;

        # trigger Event
        $Self->EventHandler(
            Event => "ChangeRequestedTimeReachedPost",
            Data  => {
                ChangeID => $ChangeID,
            },
            UserID => 1,
        );
    }

    # notifications for workorders' plannedXXXtime events
    for my $Type (qw(StartTime EndTime)) {

        my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');

        # get workorders with PlannedStartTime older than now
        my $PlannedWorkOrderIDs = $WorkOrderObject->WorkOrderSearch(
            "Planned${Type}OlderDate" => $Self->{Now},
            MirrorDB                  => 1,
            UserID                    => 1,
        ) || [];

        WORKORDERID:
        for my $WorkOrderID ( @{$PlannedWorkOrderIDs} ) {

            # get workorder data
            my $WorkOrder = $WorkOrderObject->WorkOrderGet(
                WorkOrderID => $WorkOrderID,
                UserID      => 1,
            );

            # skip workorder if there is already an actualXXXtime set or notification was sent
            next WORKORDERID if $WorkOrder->{"Actual$Type"};

            my $LastNotificationSentDate = $Self->WorkOrderNotificationSent(
                WorkOrderID => $WorkOrderID,
                Type        => "Planned${Type}",
            );

            my $AlreadySentWithinPeriod = $Self->SentWithinPeriod(
                LastNotificationSentDate => $LastNotificationSentDate,
            );

            next WORKORDERID if $AlreadySentWithinPeriod;

            # trigger WorkOrderPlannedStartTimeReachedPost-Event
            $Self->EventHandler(
                Event => "WorkOrderPlanned${Type}ReachedPost",
                Data  => {
                    WorkOrderID => $WorkOrderID,
                    ChangeID    => $WorkOrder->{ChangeID},
                },
                UserID => 1,
            );
        }

        # get workorders with actualxxxtime
        my $ActualWorkOrderIDs = $WorkOrderObject->WorkOrderSearch(
            "Actual${Type}OlderDate" => $Self->{Now},
            MirrorDB                 => 1,
            UserID                   => 1,
        ) || [];

        WORKORDERID:
        for my $WorkOrderID ( @{$ActualWorkOrderIDs} ) {

            # get workorder data
            my $WorkOrder = $WorkOrderObject->WorkOrderGet(
                WorkOrderID => $WorkOrderID,
                UserID      => 1,
            );

            my $LastNotificationSentDate = $Self->WorkOrderNotificationSent(
                WorkOrderID => $WorkOrderID,
                Type        => "Actual${Type}",
            );

            next WORKORDERID if $LastNotificationSentDate;

            # trigger Event
            $Self->EventHandler(
                Event => "WorkOrderActual${Type}ReachedPost",
                Data  => {
                    WorkOrderID => $WorkOrderID,
                    ChangeID    => $WorkOrder->{ChangeID},
                },
                UserID => 1,
            );
        }
    }

    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();

}

# check if a notification was already sent for the given change
sub ChangeNotificationSent {

    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(ChangeID Type)) {
        return if !$Param{$Needed};
    }

    # get history entries
    my $History = $Kernel::OM->Get('Kernel::System::ITSMChange::History')->ChangeHistoryGet(
        ChangeID => $Param{ChangeID},
        UserID   => 1,
    );

    # search for notifications sent earlier
    for my $HistoryEntry ( reverse @{$History} ) {
        if (
            $HistoryEntry->{HistoryType} eq 'Change' . $Param{Type} . 'Reached'
            && $HistoryEntry->{ContentNew} =~ m{ Notification \s Sent $ }xms
            )
        {
            return $HistoryEntry->{CreateTime};
        }
    }

    return;
}

# check if a notification was already sent for the given workorder
sub WorkOrderNotificationSent {

    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(WorkOrderID Type)) {
        return if !$Param{$Needed};
    }

    # get history entries
    my $History = $Kernel::OM->Get('Kernel::System::ITSMChange::History')->WorkOrderHistoryGet(
        WorkOrderID => $Param{WorkOrderID},
        UserID      => 1,
    );

    # search for notifications sent earlier
    for my $HistoryEntry ( reverse @{$History} ) {
        if (
            $HistoryEntry->{HistoryType} eq 'WorkOrder' . $Param{Type} . 'Reached'
            && $HistoryEntry->{ContentNew} =~ m{ Notification \s Sent }xms
            )
        {
            return $HistoryEntry->{CreateTime};
        }
    }

    return;
}

sub SentWithinPeriod {

    my ( $Self, %Param ) = @_;

    return if !$Param{LastNotificationSentDate};

    # get SysConfig option
    my $Config = $Kernel::OM->Get('Kernel::Config')->Get('ITSMChange::TimeReachedNotifications');

    # if notifications should be sent only once
    return 1 if $Config->{Frequency} eq 'once';

    # get epoche seconds of send time
    my $SentEpoche = $Kernel::OM->Get('Kernel::System::Time')->TimeStamp2SystemTime(
        String => $Param{LastNotificationSentDate},
    );

    # calc diff
    my $EpocheSinceSent = $Self->{SystemTime} - $SentEpoche;
    my $HoursSinceSent = int( $EpocheSinceSent / ( 60 * 60 ) );

    if ( $HoursSinceSent >= $Config->{Hours} ) {
        return;
    }

    return 1;
}

sub PostRun {
    my ( $Self, %Param ) = @_;

    # delete pid lock
    $Kernel::OM->Get('Kernel::System::PID')->PIDDelete( Name => $Self->Name() );

    return;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
