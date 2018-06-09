# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMWorkOrderAdd;

use strict;
use warnings;

use Kernel::Language qw(Translatable);
use Kernel::System::VariableCheck qw(:all);

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
        qw(WorkOrderTitle Instruction WorkOrderTypeID PlannedEffort AttachmentUpload FileID UserSelected)
        )
    {
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }

    # get Dynamic fields from ParamObject
    my %DynamicFieldValues;

    # get the dynamic fields for this screen
    my $DynamicField = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => 'ITSMWorkOrder',
        FieldFilter => $Self->{Config}->{DynamicField} || {},
    );

    # get dynamic field backend object
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # extract the dynamic field value from the web request and add the prefix
        $DynamicFieldValues{ 'DynamicField_' . $DynamicFieldConfig->{Name} }
            = $DynamicFieldBackendObject->EditFieldValueGet(
            DynamicFieldConfig => $DynamicFieldConfig,
            ParamObject        => $ParamObject,
            LayoutObject       => $LayoutObject,
            );
    }

    # store time related fields in %GetParam
    for my $TimeType (qw(PlannedStartTime PlannedEndTime)) {
        for my $TimePart (qw(Year Month Day Hour Minute)) {
            my $ParamName = $TimeType . $TimePart;
            $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
        }
    }

    # Remember the reason why saving was not attempted.
    my %ValidationError;

    # get workorder object
    my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');

    # get form id
    $Self->{FormID} = $ParamObject->GetParam( Param => 'FormID' );

    # get upload cache object
    my $UploadCacheObject = $Kernel::OM->Get('Kernel::System::Web::UploadCache');

    # create form id
    if ( !$Self->{FormID} ) {
        $Self->{FormID} = $UploadCacheObject->FormIDCreate();
    }

    # add the workorder
    if ( $Self->{Subaction} eq 'Save' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        # the title is required
        if ( !$GetParam{WorkOrderTitle} ) {
            $ValidationError{WorkOrderTitleServerError} = 'ServerError';
        }

        if ( !$GetParam{UserSelected} ) {
            $ValidationError{UserSelectedServerError} = 'ServerError';
        }

        # check WorkOrderTypeID
        my $WorkOrderType = $WorkOrderObject->WorkOrderTypeLookup(
            UserID          => $Self->{UserID},
            WorkOrderTypeID => $GetParam{WorkOrderTypeID},
        );

        if ( !$WorkOrderType ) {
            $ValidationError{WorkOrderTypeIDServerError} = 'ServerError';
        }

        # get log object
        my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

        # check whether complete times are passed and build the time stamps
        my %SystemTime;
        TIMETYPE:
        for my $TimeType (qw(PlannedStartTime PlannedEndTime)) {
            for my $TimePart (qw(Year Month Day Hour Minute)) {
                my $ParamName = $TimeType . $TimePart;
                if ( !defined $GetParam{$ParamName} ) {
                    $LogObject->Log(
                        Priority => 'error',
                        Message  => "Need $ParamName!",
                    );
                    next TIMETYPE;
                }
            }

            # transform work order planned time, time stamp based on user time zone
            %GetParam = $LayoutObject->TransformDateSelection(
                %GetParam,
                Prefix => $TimeType,
            );

            # format as timestamp
            $GetParam{$TimeType} = sprintf '%04d-%02d-%02d %02d:%02d:00',
                $GetParam{ $TimeType . 'Year' },
                $GetParam{ $TimeType . 'Month' },
                $GetParam{ $TimeType . 'Day' },
                $GetParam{ $TimeType . 'Hour' },
                $GetParam{ $TimeType . 'Minute' };

            # sanity check the assembled timestamp
            $SystemTime{$TimeType} = $Kernel::OM->Get('Kernel::System::Time')->TimeStamp2SystemTime(
                String => $GetParam{$TimeType},
            );

            # do not save if time is invalid
            if ( !$SystemTime{$TimeType} ) {
                $ValidationError{ $TimeType . 'Invalid' } = 'ServerError';
            }
        }

        # check validity of the planned start and end times
        if ( $SystemTime{PlannedStartTime} && !$SystemTime{PlannedEndTime} ) {
            $ValidationError{PlannedEndTimeInvalid}   = 'ServerError';
            $ValidationError{PlannedEndTimeErrorType} = 'GenericServerError';
        }
        elsif ( !$SystemTime{PlannedStartTime} && $SystemTime{PlannedEndTime} ) {
            $ValidationError{PlannedStartTimeInvalid}   = 'ServerError';
            $ValidationError{PlannedStartTimeErrorType} = 'GenericServerError';
        }
        elsif (
            ( $SystemTime{PlannedStartTime} && $SystemTime{PlannedEndTime} )
            && ( $SystemTime{PlannedEndTime} <= $SystemTime{PlannedStartTime} )
            )
        {
            $ValidationError{PlannedStartTimeInvalid}   = 'ServerError';
            $ValidationError{PlannedStartTimeErrorType} = 'BeforeThanEndTimeServerError';
        }

        # check format of planned effort, empty is allowed
        if ( $GetParam{PlannedEffort} !~ m{ \A \d* (?: [.] \d{1,2} )? \z }xms ) {
            $ValidationError{'PlannedEffortInvalid'} = 'ServerError';
        }

        # cycle trough the activated Dynamic Fields for this screen
        DYNAMICFIELD:
        for my $DynamicFieldConfig ( @{$DynamicField} ) {
            next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

            my $ValidationResult = $DynamicFieldBackendObject->EditFieldValueValidate(
                DynamicFieldConfig => $DynamicFieldConfig,
                ParamObject        => $ParamObject,
                Mandatory          => $Self->{Config}->{DynamicField}->{ $DynamicFieldConfig->{Name} } == 2,
            );

            if ( !IsHashRefWithData($ValidationResult) ) {
                return $LayoutObject->ErrorScreen(
                    Message => $LayoutObject->{LanguageObject}->Translate(
                        'Could not perform validation on field %s!', $DynamicFieldConfig->{Label}
                    ),
                    Comment => Translatable('Please contact the admin.'),
                );
            }

            # propagate validation error to the Error variable to be detected by the frontend
            if ( $ValidationResult->{ServerError} ) {
                $ValidationError{ $DynamicFieldConfig->{Name} } = ' ServerError';
            }
        }

        # check if an attachment must be deleted
        ATTACHMENT:
        for my $Number ( 1 .. 32 ) {

            # check if the delete button was pressed for this attachment
            my $Delete = $ParamObject->GetParam( Param => "AttachmentDelete$Number" );

            # check next attachment if it was not pressed
            next ATTACHMENT if !$Delete;

            # remember that we need to show the page again
            $ValidationError{Attachment} = 1;

            # remove the attachment from the upload cache
            $UploadCacheObject->FormIDRemoveFile(
                FormID => $Self->{FormID},
                FileID => $Number,
            );
        }

        # check if there was an attachment upload
        if ( $GetParam{AttachmentUpload} ) {

            # remember that we need to show the page again
            $ValidationError{Attachment} = 1;

            # get the uploaded attachment
            my %UploadStuff = $ParamObject->GetUploadAll(
                Param  => 'FileUpload',
                Source => 'string',
            );

            # add attachment to the upload cache
            $UploadCacheObject->FormIDAddFile(
                FormID => $Self->{FormID},
                %UploadStuff,
            );
        }

        # add only when there are no input validation errors
        if ( !%ValidationError ) {

            # create the workorder
            my $WorkOrderID = $WorkOrderObject->WorkOrderAdd(
                ChangeID         => $ChangeID,
                WorkOrderTitle   => $GetParam{WorkOrderTitle},
                Instruction      => $GetParam{Instruction},
                PlannedStartTime => $GetParam{PlannedStartTime},
                PlannedEndTime   => $GetParam{PlannedEndTime},
                WorkOrderTypeID  => $GetParam{WorkOrderTypeID},
                PlannedEffort    => $GetParam{PlannedEffort},
                UserID           => $Self->{UserID},
                WorkOrderAgentID => $GetParam{UserSelected},
                %DynamicFieldValues,
            );

            # adding was successful
            if ($WorkOrderID) {

                # move attachments from cache to virtual fs
                my @CachedAttachments = $UploadCacheObject->FormIDGetAllFilesData(
                    FormID => $Self->{FormID},
                );

                for my $CachedAttachment (@CachedAttachments) {
                    my $Success = $WorkOrderObject->WorkOrderAttachmentAdd(
                        %{$CachedAttachment},
                        WorkOrderID => $WorkOrderID,
                        ChangeID    => $ChangeID,
                        UserID      => $Self->{UserID},
                    );

                    # delete file from cache if move was successful
                    if ($Success) {

                        # rewrite URL for inline images
                        if ( $CachedAttachment->{ContentID} ) {

                            # get the workorder data
                            my $WorkOrderData = $WorkOrderObject->WorkOrderGet(
                                WorkOrderID => $WorkOrderID,
                                UserID      => $Self->{UserID},
                            );

                            # picture url in upload cache
                            my $Search = "Action=PictureUpload .+ FormID=$Self->{FormID} .+ "
                                . "ContentID=$CachedAttachment->{ContentID}";

                            # picture url in workorder atttachment
                            my $Replace = "Action=AgentITSMWorkOrderZoom;Subaction=DownloadAttachment;"
                                . "Filename=$CachedAttachment->{Filename};WorkOrderID=$WorkOrderID";

                            # replace url
                            $WorkOrderData->{Instruction} =~ s{$Search}{$Replace}xms;

                            # update workorder
                            my $Success = $WorkOrderObject->WorkOrderUpdate(
                                WorkOrderID => $WorkOrderID,
                                Instruction => $WorkOrderData->{Instruction},
                                UserID      => $Self->{UserID},
                            );

                            # check error
                            if ( !$Success ) {
                                $LogObject->Log(
                                    Priority => 'error',
                                    Message  => "Could not update the inline image URLs "
                                        . "for WorkOrderID '$WorkOrderID'!",
                                );
                            }
                        }

                        $UploadCacheObject->FormIDRemoveFile(
                            FormID => $Self->{FormID},
                            FileID => $CachedAttachment->{FileID},
                        );
                    }
                    else {
                        $LogObject->Log(
                            Priority => 'error',
                            Message  => 'Cannot move File from Cache to VirtualFS'
                                . "(${$CachedAttachment}{Filename})",
                        );
                    }
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
            else {

                # show error message, when adding failed
                return $LayoutObject->ErrorScreen(
                    Message => Translatable('Was not able to add workorder!'),
                    Comment => Translatable('Please contact the admin.'),
                );
            }
        }
    }

    # if there was an attachment delete or upload
    # we do not want to show validation errors for other fields
    if ( $ValidationError{Attachment} ) {
        %ValidationError = ();
    }

    # get all attachments meta data
    my @Attachments = $UploadCacheObject->FormIDGetAllFilesMeta(
        FormID => $Self->{FormID},
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
    my $WorkOrderTypeList = $WorkOrderObject->WorkOrderTypeList(
        UserID => $Self->{UserID},
        %SelectedInfo,
    ) || [];

    # build the WorkOrderType dropdown
    $GetParam{WorkOrderTypeStrg} = $LayoutObject->BuildSelection(
        Name  => 'WorkOrderTypeID',
        Data  => $WorkOrderTypeList,
        Class => 'Modernize',
    );

    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {

        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # get dynamic fields defaults if page is loaded the first time
        if ( !$Self->{Subaction} ) {

            # get dynamic fields defaults if page is loaded the first time
            if ( !$Self->{Subaction} ) {
                $DynamicFieldValues{ 'DynamicField_' . $DynamicFieldConfig->{Name} }
                    = $DynamicFieldConfig->{Config}->{DefaultValue} || '';
            }
        }

        # get field html
        my $DynamicFieldHTML = $DynamicFieldBackendObject->EditFieldRender(
            DynamicFieldConfig => $DynamicFieldConfig,
            Value              => $DynamicFieldValues{ 'DynamicField_' . $DynamicFieldConfig->{Name} },
            ServerError        => $ValidationError{ $DynamicFieldConfig->{Name} } || '',
            Mandatory          => $Self->{Config}->{DynamicField}->{ $DynamicFieldConfig->{Name} } == 2,
            LayoutObject       => $LayoutObject,
            ParamObject        => $ParamObject,
            AJAXUpdate         => 0,
        );

        # skip fields that HTML could not be retrieved
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldHTML);

        $LayoutObject->Block(
            Name => 'DynamicField',
            Data => {
                Name  => $DynamicFieldConfig->{Name},
                Label => $DynamicFieldHTML->{Label},
                Field => $DynamicFieldHTML->{Field},
            },
        );


        # example of dynamic fields order customization
        $LayoutObject->Block(
            Name => 'DynamicField_' . $DynamicFieldConfig->{Name},
            Data => {
                Name  => $DynamicFieldConfig->{Name},
                Label => $DynamicFieldHTML->{Label},
                Field => $DynamicFieldHTML->{Field},
            },
        );
    }

    # time period that can be selected from the GUI
    my %TimePeriod = %{ $ConfigObject->Get('ITSMWorkOrder::TimePeriod') };

    # set the time selections
    for my $TimeType (qw(PlannedStartTime PlannedEndTime)) {

        # set default value for $DiffTime
        # When no time is given yet, then use the current time plus the difftime
        # When an explicit time was retrieved, $DiffTime is not used
        my $DiffTime = $TimeType eq 'PlannedStartTime' ? 0 : 60 * 60;

        # add selection for the time
        $GetParam{ $TimeType . 'SelectionString' } = $LayoutObject->BuildDateSelection(
            %GetParam,
            Format              => 'DateInputFormatLong',
            Prefix              => $TimeType,
            DiffTime            => $DiffTime,
            Validate            => 1,
            $TimeType . 'Class' => 'Validate_Required '
                . ( $ValidationError{ $TimeType . 'Invalid' } || '' ),
            %TimePeriod,
        );

        # add server error messages for the planned times
        $LayoutObject->Block(
            Name => $TimeType
                . ( $ValidationError{ $TimeType . 'ErrorType' } || 'GenericServerError' )
        );
    }

    # show planned effort if it is configured
    if ( $Self->{Config}->{PlannedEffort} ) {
        $LayoutObject->Block(
            Name => 'ShowPlannedEffort',
            Data => {
                PlannedEffort => $GetParam{PlannedEffort},
                %ValidationError,
            },
        );
    }

    # show the attachment upload button
    $LayoutObject->Block(
        Name => 'AttachmentUpload',
        Data => {%Param},
    );

    # show attachments
    ATTACHMENT:
    for my $Attachment (@Attachments) {

        # do not show inline images as attachments
        # (they have a content id)
        if ( $Attachment->{ContentID} && $LayoutObject->{BrowserRichText} ) {
            next ATTACHMENT;
        }

        $LayoutObject->Block(
            Name => 'Attachment',
            Data => $Attachment,
        );
    }

    # add rich text editor javascript
    # only if activated and the browser can handle it
    # otherwise just a textarea is shown
    if ( $LayoutObject->{BrowserRichText} ) {
        $LayoutObject->Block(
            Name => 'RichText',
            Data => {%Param},
        );
    }

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMWorkOrderAdd',
        Data         => {
            %Param,
            %{$Change},
            %GetParam,
            %ValidationError,
            FormID => $Self->{FormID},
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer( Type => 'Small' );

    return $Output;
}

1;
