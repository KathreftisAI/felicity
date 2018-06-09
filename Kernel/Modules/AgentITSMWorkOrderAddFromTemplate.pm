# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMWorkOrderAddFromTemplate;

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

    # get needed objects
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

    # get config of frontend module (WorkorderAdd is a change action!)
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
            Message => $LayoutObject->{LanguageObject}->Translate(
                'You need %s permissions on the change!', $Self->{Config}->{Permission}
            ),
            WithHeader => 'yes',
        );
    }

    # get change data
    my $Change = $ChangeObject->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # check error
    if ( !$Change ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}->Translate( 'Change "%s" not found in database!', $ChangeID ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # store needed parameters in %GetParam to make it reloadable
    my %GetParam;
    for my $ParamName (
        qw(MoveTimeType MoveTimeYear MoveTimeMonth MoveTimeDay MoveTimeHour MoveTimeMinute TemplateID)
        )
    {
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }

    # store time related fields in %GetParam
    for my $TimePart (qw(Year Month Day Hour Minute)) {
        my $ParamName = 'MoveTime' . $TimePart;
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }

    # Remember the reason why saving was not attempted.
    my %ValidationError;

    # get template object
    my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template');

    # create workorder from template
    if ( $Self->{Subaction} eq 'CreateFromTemplate' ) {

        my $NewTime;

        # check validity of the time type
        if (
            !defined $GetParam{MoveTimeType}
            || (
                $GetParam{MoveTimeType} ne 'PlannedStartTime'
                && $GetParam{MoveTimeType} ne 'PlannedEndTime'
            )
            )
        {
            $ValidationError{MoveTimeTypeInvalid} = 'ServerError';
        }

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
            $ValidationError{MoveTimeInvalid} = 'ServerError';
        }

        # get the system time from the input, if it can't be determined we have a validation error
        if ( !%ValidationError ) {

            # transform work order planned time, time stamp based on user time zone
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
            $NewTime = $Kernel::OM->Get('Kernel::System::Time')->TimeStamp2SystemTime(
                String => $PlannedTime,
            );

            if ( !$NewTime ) {
                $ValidationError{MoveTimeInvalid} = 'ServerError';
            }
        }

        # check whether a template was selected
        if ( !$GetParam{TemplateID} ) {
            $ValidationError{TemplateIDServerError} = 'ServerError';
        }

        if ( !%ValidationError ) {

            # create workorder based on the template
            my $WorkOrderID = $TemplateObject->TemplateDeSerialize(
                ChangeID        => $ChangeID,
                TemplateID      => $ParamObject->GetParam( Param => 'TemplateID' ),
                UserID          => $Self->{UserID},
                NewTimeInEpoche => $NewTime,
                MoveTimeType    => $GetParam{MoveTimeType},
            );

            # workorder could not be created
            if ( !$WorkOrderID ) {

                # show error message, when adding failed
                return $LayoutObject->ErrorScreen(
                    Message => Translatable('Was not able to create workorder from template!'),
                    Comment => Translatable('Please contact the admin.'),
                );
            }

            # get redirect screen
            my $NextScreen = $Self->{UserCreateWorkOrderNextMask} || 'AgentITSMWorkOrderZoom';

            # add the correct id
            if ( $NextScreen eq 'AgentITSMWorkOrderZoom' ) {
                $NextScreen .= ";WorkOrderID=$WorkOrderID";
            }
            elsif ( $NextScreen eq 'AgentITSMChangeZoom' ) {
                $NextScreen .= ";ChangeID=$ChangeID";
            }

            # load new URL in parent window and close popup
            return $LayoutObject->PopupClose(
                URL => "Action=$NextScreen",
            );
        }
    }

    # build template dropdown
    my $TemplateList = $TemplateObject->TemplateList(
        UserID        => $Self->{UserID},
        CommentLength => 15,
        TemplateType  => 'ITSMWorkOrder',
    );
    my $TemplateSelectionString = $LayoutObject->BuildSelection(
        Name         => 'TemplateID',
        Data         => $TemplateList,
        Class        => 'Modernize Validate_Required ' . ( $ValidationError{TemplateIDServerError} || '' ),
        TreeView     => 1,
        PossibleNone => 1,
    );

    # build drop-down with time types
    my $MoveTimeTypeSelectionString = $LayoutObject->BuildSelection(
        Name => 'MoveTimeType',
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
        SelectedID => $GetParam{MoveTimeType} || 'PlannedStartTime',
        Class => 'Modernize Validate_Required ' . ( $ValidationError{MoveTimeTypeInvalid} || '' ),
    );

    # time period that can be selected from the GUI
    my %TimePeriod = %{ $ConfigObject->Get('ITSMWorkOrder::TimePeriod') };

    # add selection for the time
    my $MoveTimeSelectionString = $LayoutObject->BuildDateSelection(
        %GetParam,
        Format        => 'DateInputFormatLong',
        Prefix        => 'MoveTime',
        MoveTimeClass => 'Validate_Required ' . ( $ValidationError{MoveTimeInvalid} || '' ),
        Validate      => 1,
        %TimePeriod,
    );

    # output header
    my $Output = $LayoutObject->Header(
        Title => Translatable('Add'),
        Type  => 'Small',
    );

    # set selected type
    my %SelectedInfo = (
        Default => 1,
    );

    if ( $GetParam{WorkOrderTypeID} ) {
        %SelectedInfo = ( Selected => $GetParam{WorkOrderTypeID} );
    }

    # get WorkOrderType list
    my $WorkOrderTypeList = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderTypeList(
        UserID => $Self->{UserID},
        %SelectedInfo,
    ) || [];

    # build the WorkOrderType dropdown
    $GetParam{WorkOrderTypeStrg} = $LayoutObject->BuildSelection(
        Name  => 'WorkOrderTypeID',
        Data  => $WorkOrderTypeList,
        Class => 'Modernize',
    );

    # get form id
    $Self->{FormID} = $ParamObject->GetParam( Param => 'FormID' );

    # create form id
    if ( !$Self->{FormID} ) {
        $Self->{FormID} = $Kernel::OM->Get('Kernel::System::Web::UploadCache')->FormIDCreate();
    }

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMWorkOrderAddFromTemplate',
        Data         => {
            %Param,
            %{$Change},
            %GetParam,
            ChangeID                    => $ChangeID,
            TemplateSelectionString     => $TemplateSelectionString,
            MoveTimeTypeSelectionString => $MoveTimeTypeSelectionString,
            MoveTimeSelectionString     => $MoveTimeSelectionString,
            %ValidationError,
            FormID => $Self->{FormID},
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer( Type => 'Small' );

    return $Output;
}

1;
