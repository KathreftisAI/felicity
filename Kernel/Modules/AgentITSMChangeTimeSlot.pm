# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeTimeSlot;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get needed object
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get needed ChangeID
    my $ChangeID = $ParamObject->GetParam( Param => 'ChangeID' );

    # check needed stuff
    if ( !$ChangeID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No ChangeID is given!'),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get needed objects
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get config of frontend module
    $Self->{Config} = $ConfigObject->Get("ITSMChange::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $ChangeObject->Permission(
        Type     => $Self->{Config}->{Permission},
        Action   => $Self->{Action},
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'You need %s permissions!', $Self->{Config}->{Permission} ),
            WithHeader => 'yes',
        );
    }

    # get change data
    my $Change = $ChangeObject->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # check if change is found
    if ( !$Change ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}->Translate( 'Change "%s" not found in database!', $ChangeID ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # Moving is possible only when there are workorders.
    if ( !$Change->{WorkOrderCount} ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('The change can\'t be moved, as it has no workorders.'),
            Comment => Translatable('Add a workorder first.'),
        );
    }

    # Moving is allowed only when there the change has not started yet.
    if ( $Change->{ActualStartTime} ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('Can\'t move a change which already has started!'),
            Comment => Translatable('Please move the individual workorders instead.'),
        );
    }

    # store needed parameters in %GetParam to make it reloadable
    my %GetParam;
    $GetParam{MoveTimeType} = $ParamObject->GetParam(
        Param => 'MoveTimeType',
    ) || 'PlannedStartTime';

    # store time related fields in %GetParam
    for my $TimePart (qw(Year Month Day Hour Minute)) {
        my $ParamName = 'MoveTime' . $TimePart;
        $GetParam{$ParamName} = $ParamObject->GetParam(
            Param => $ParamName,
        );
    }

    # Remember the reason why saving was not attempted.
    my %ValidationErrors;

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    # move time slot of change
    if ( $Self->{Subaction} eq 'MoveTimeSlot' ) {

        # check validity of the time type
        my $MoveTimeType = $GetParam{MoveTimeType};
        if ( !defined $MoveTimeType )
        {
            $ValidationErrors{MoveTimeInvalid} = 'ServerError';
        }
        else {

            # check the completeness of the time parameter list,
            # only hour and minute are allowed to be '0'
            if (
                !$GetParam{MoveTimeYear}
                || !$GetParam{MoveTimeMonth}
                || !$GetParam{MoveTimeDay}
                || !defined $GetParam{MoveTimeHour}
                || !defined $GetParam{MoveTimeMinute}
                )
            {
                $ValidationErrors{MoveTimeInvalid} = 'ServerError';
            }
        }

        # get the system time from the input, if it can't be determined we have a validation error
        my $PlannedSystemTime;
        if ( !%ValidationErrors ) {

            # transform change planned time, time stamp based on user time zone
            %GetParam = $LayoutObject->TransformDateSelection(
                %GetParam,
                Prefix => 'MoveTime',
            );

            # format as timestamp
            my $PlannedTime = sprintf '%04d-%02d-%02d %02d:%02d:00',
                $GetParam{MoveTimeYear},
                $GetParam{MoveTimeMonth},
                $GetParam{MoveTimeDay},
                $GetParam{MoveTimeHour},
                $GetParam{MoveTimeMinute};

            # sanity check of the assembled timestamp
            $PlannedSystemTime = $TimeObject->TimeStamp2SystemTime(
                String => $PlannedTime,
            );

            if ( !$PlannedSystemTime ) {
                $ValidationErrors{MoveTimeInvalid} = 'ServerError';
            }
        }

        # move time slot only when there are no validation errors
        if ( !%ValidationErrors ) {

            # Determine the difference in seconds
            my $CurrentPlannedTime = $Change->{$MoveTimeType};

            # Even when there are workorders, a change might still miss a planned time.
            # In that case moving the time slot is not possible.
            if ( !$CurrentPlannedTime ) {

                # show error message
                return $LayoutObject->ErrorScreen(
                    Message => $LayoutObject->{LanguageObject}
                        ->Translate( 'The current %s could not be determined.', $MoveTimeType ),
                    Comment => $LayoutObject->{LanguageObject}
                        ->Translate( 'The %s of all workorders has to be defined.', $MoveTimeType ),
                );
            }

            my $CurrentPlannedSystemTime = $TimeObject->TimeStamp2SystemTime(
                String => $CurrentPlannedTime,
            );
            my $DiffSeconds = $PlannedSystemTime - $CurrentPlannedSystemTime;

            my $MoveError = $Self->_MoveWorkOrders(
                DiffSeconds  => $DiffSeconds,
                WorkOrderIDs => $Change->{WorkOrderIDs},
                ChangeNumber => $Change->{ChangeNumber},
            );

            if ($MoveError) {
                return $MoveError;
            }

            # load new URL in parent window and close popup
            return $LayoutObject->PopupClose(
                URL => "Action=AgentITSMChangeZoom;ChangeID=$ChangeID",
            );
        }
    }
    elsif ( $Self->{Subaction} eq 'AJAXUpdate' ) {

        # get planned start time or planned end time from the change
        my $SystemTime = $TimeObject->TimeStamp2SystemTime(
            String => $Change->{ $GetParam{MoveTimeType} },
        );

        # time zone translation
        if ( $ConfigObject->Get('TimeZoneUser') && $Self->{UserTimeZone} ) {
            $SystemTime = $SystemTime + ( $Self->{UserTimeZone} * 3600 );
        }

        # set the parameter hash for the answers
        # the seconds are ignored
        my ( $Second, $Minute, $Hour, $Day, $Month, $Year ) = $TimeObject->SystemTime2Date(
            SystemTime => $SystemTime,
        );

        # get config for the number of years which should be selectable
        my $TimePeriod = $ConfigObject->Get('ITSMWorkOrder::TimePeriod');
        my $StartYear  = $Year - $TimePeriod->{YearPeriodPast};
        my $EndYear    = $Year + $TimePeriod->{YearPeriodFuture};

        # assemble the data that will be returned
        my $JSON = $LayoutObject->BuildSelectionJSON(
            [
                {
                    Name       => 'MoveTimeMinute',
                    Data       => [ map { sprintf '%02d', $_ } ( 0 .. 59 ) ],
                    SelectedID => $Minute,
                },
                {
                    Name       => 'MoveTimeHour',
                    Data       => [ map { sprintf '%02d', $_ } ( 0 .. 23 ) ],
                    SelectedID => $Hour,
                },
                {
                    Name       => 'MoveTimeDay',
                    Data       => [ map { sprintf '%02d', $_ } ( 1 .. 31 ) ],
                    SelectedID => $Day,
                },
                {
                    Name       => 'MoveTimeMonth',
                    Data       => [ map { sprintf '%02d', $_ } ( 1 .. 12 ) ],
                    SelectedID => $Month,
                },
                {
                    Name       => 'MoveTimeYear',
                    Data       => [ $StartYear .. $EndYear ],
                    SelectedID => $GetParam{MoveTimeYear},
                },
            ],
        );

        return $LayoutObject->Attachment(
            ContentType => 'text/plain; charset=' . $LayoutObject->{Charset},
            Content     => $JSON,
            Type        => 'inline',
            NoCache     => 1,
        );
    }
    else {

        # no subaction,
        # get planned start time or planned end time from the change
        my $SystemTime = $TimeObject->TimeStamp2SystemTime(
            String => $Change->{ $GetParam{MoveTimeType} },
        );

        # set the parameter hash for BuildDateSelection()
        # the seconds are ignored
        my ( $Second, $Minute, $Hour, $Day, $Month, $Year ) = $TimeObject->SystemTime2Date(
            SystemTime => $SystemTime,
        );
        $GetParam{MoveTimeMinute} = $Minute;
        $GetParam{MoveTimeHour}   = $Hour;
        $GetParam{MoveTimeDay}    = $Day;
        $GetParam{MoveTimeMonth}  = $Month;
        $GetParam{MoveTimeYear}   = $Year;
    }

    # build drop-down with time types
    my $MoveTimeTypeSelectionString = $LayoutObject->BuildSelection(
        Data => [
            {
                Key   => 'PlannedStartTime',
                Value => Translatable('Planned Start Time')
            },
            {
                Key   => 'PlannedEndTime',
                Value => Translatable('Planned End Time')
            },
        ],
        Name       => 'MoveTimeType',
        SelectedID => $GetParam{MoveTimeType},
        Class      => 'Modernize',
    );

    # time period that can be selected from the GUI
    my %TimePeriod = %{ $ConfigObject->Get('ITSMWorkOrder::TimePeriod') };

    # add selection for the time
    my $MoveTimeSelectionString = $LayoutObject->BuildDateSelection(
        %GetParam,
        Format        => 'DateInputFormatLong',
        Prefix        => 'MoveTime',
        Validate      => 1,
        MoveTimeClass => $ValidationErrors{MoveTimeInvalid} || '',
        %TimePeriod,
    );

    # output header
    my $Output = $LayoutObject->Header(
        Title => Translatable('Move Time Slot'),
        Type  => 'Small',
    );

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMChangeTimeSlot',
        Data         => {
            %{$Change},
            %ValidationErrors,
            MoveTimeTypeSelectionString => $MoveTimeTypeSelectionString,
            MoveTimeSelectionString     => $MoveTimeSelectionString,
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer( Type => 'Small' );

    return $Output;
}

# the actual moving is done here
sub _MoveWorkOrders {
    my ( $Self, %Param ) = @_;

    my @CollectedUpdateParams;    # an array of params for WorkOrderUpdate()
    my %WorkOrderID2Number;       # used only for error messages

    # get work order object
    my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');
    my $LayoutObject    = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # determine the new times
    WORKORDERID:
    for my $WorkOrderID ( @{ $Param{WorkOrderIDs} } ) {
        my $WorkOrder = $WorkOrderObject->WorkOrderGet(
            WorkOrderID => $WorkOrderID,
            UserID      => $Self->{UserID},
        );

        next WORKORDERID if !$WorkOrder;
        next WORKORDERID if ref $WorkOrder ne 'HASH';
        next WORKORDERID if !%{$WorkOrder};

        $WorkOrderID2Number{$WorkOrderID} = $WorkOrder->{WorkOrderNumber};
        my %UpdateParams;
        TYPE:
        for my $Type (qw(PlannedStartTime PlannedEndTime)) {

            next TYPE if !$WorkOrder->{$Type};

            # get time object
            my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

            my $SystemTime = $TimeObject->TimeStamp2SystemTime(
                String => $WorkOrder->{$Type},
            );
            next TYPE if !$SystemTime;

            # add the number of seconds that the time slot should be moved
            $SystemTime += $Param{DiffSeconds};
            $UpdateParams{$Type} = $TimeObject->SystemTime2TimeStamp(
                SystemTime => $SystemTime,
            );
        }

        next WORKORDERID if !%UpdateParams;

        # remember the workorder that should be moved
        $UpdateParams{WorkOrderID} = $WorkOrderID;

        push @CollectedUpdateParams, \%UpdateParams;
    }

    # do the updating
    UPDATEPARAMS:
    for my $UpdateParams (@CollectedUpdateParams) {

        # no number calculation necessary because the workorder order doesn't change
        my $UpdateOk = $WorkOrderObject->WorkOrderUpdate(
            %{$UpdateParams},
            NoNumberCalc => 1,
            UserID       => $Self->{UserID},
        );

        if ( !$UpdateOk ) {

            # show error message
            my $Number = join '-',
                $Param{ChangeNumber},
                $WorkOrderID2Number{ $UpdateParams->{WorkOrderID} };

            return $LayoutObject->ErrorScreen(
                Message => $LayoutObject->{LanguageObject}
                    ->Translate( 'Was not able to move time slot for workorder #%s!', $Number ),
                Comment => Translatable('Please contact the admin.'),
            );
        }
    }

    # moving was successful
    return;
}

1;
