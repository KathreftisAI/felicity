# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMWorkOrderReport;

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

    # get needed WorkOrderID
    my $WorkOrderID = $ParamObject->GetParam( Param => 'WorkOrderID' );

    # check needed stuff
    if ( !$WorkOrderID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No WorkOrderID is given!'),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get needed objects
    my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    # get config of frontend module
    $Self->{Config} = $ConfigObject->Get("ITSMWorkOrder::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $WorkOrderObject->Permission(
        Type        => $Self->{Config}->{Permission},
        Action      => $Self->{Action},
        WorkOrderID => $WorkOrderID,
        UserID      => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'You need %s permissions!', $Self->{Config}->{Permission} ),
            WithHeader => 'yes',
        );
    }

    # get workorder data
    my $WorkOrder = $WorkOrderObject->WorkOrderGet(
        WorkOrderID => $WorkOrderID,
        UserID      => $Self->{UserID},
    );

    # check error
    if ( !$WorkOrder ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'WorkOrder "%s" not found in database!', $WorkOrderID ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # store needed parameters in %GetParam to make this page reloadable
    my %GetParam;
    for my $ParamName (qw(Report WorkOrderStateID AccountedTime AttachmentUpload FileID)) {
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

    # store actual time related fields in %GetParam
    if ( $Self->{Config}->{ActualTimeSpan} ) {
        for my $TimeType (qw(ActualStartTime ActualEndTime)) {
            for my $TimePart (qw(Year Month Day Hour Minute Used)) {
                my $ParamName = $TimeType . $TimePart;
                $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
            }
        }
    }

    # Remember the reason why perfoming the subaction was not attempted.
    # The entries are the names of the dtl validation error blocks.
    my %ValidationError;

    # get upload cache object
    my $UploadCacheObject = $Kernel::OM->Get('Kernel::System::Web::UploadCache');

    # get form id
    $Self->{FormID} = $ParamObject->GetParam( Param => 'FormID' );

    # create form id
    if ( !$Self->{FormID} ) {
        $Self->{FormID} = $UploadCacheObject->FormIDCreate();
    }

    # check if an attachment should be deleted
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

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    # update workorder
    if ( $Self->{Subaction} eq 'Save' ) {

        # validate the actual time related parameters
        if ( $Self->{Config}->{ActualTimeSpan} ) {
            my %SystemTime;
            for my $TimeType (qw(ActualStartTime ActualEndTime)) {

                if ( !$GetParam{ $TimeType . 'Used' } ) {

                    # when the button was not checked, then clear the time
                    $GetParam{$TimeType} = undef;
                }
                elsif (
                    $GetParam{ $TimeType . 'Year' }
                    && $GetParam{ $TimeType . 'Month' }
                    && $GetParam{ $TimeType . 'Day' }
                    && defined $GetParam{ $TimeType . 'Hour' }
                    && defined $GetParam{ $TimeType . 'Minute' }
                    )
                {

                    # transform work order actual time, time stamp based on user time zone
                    %GetParam = $LayoutObject->TransformDateSelection(
                        %GetParam,
                        Prefix => $TimeType,
                    );

                    # format as timestamp, when all required time params were passed
                    $GetParam{$TimeType} = sprintf '%04d-%02d-%02d %02d:%02d:00',
                        $GetParam{ $TimeType . 'Year' },
                        $GetParam{ $TimeType . 'Month' },
                        $GetParam{ $TimeType . 'Day' },
                        $GetParam{ $TimeType . 'Hour' },
                        $GetParam{ $TimeType . 'Minute' };

                    # sanity check of the assembled timestamp
                    $SystemTime{$TimeType} = $TimeObject->TimeStamp2SystemTime(
                        String => $GetParam{$TimeType},
                    );

                    # do not save if time is invalid
                    if ( !$SystemTime{$TimeType} ) {
                        $ValidationError{ $TimeType . 'Invalid' } = 'ServerError';
                    }
                }
                else {

                    # it was indicated that the time should be set,
                    # but at least one of the required time params is missing
                    $ValidationError{ $TimeType . 'Invalid' }   = 'ServerError';
                    $ValidationError{ $TimeType . 'ErrorType' } = 'GenericServerError';
                }
            }

            # check validity of the actual start and end times
            if ( $SystemTime{ActualEndTime} && !$SystemTime{ActualStartTime} ) {
                $ValidationError{ActualStartTimeInvalid}   = 'ServerError';
                $ValidationError{ActualStartTimeErrorType} = 'SetServerError';
            }
            elsif (
                ( $SystemTime{ActualEndTime} && $SystemTime{ActualStartTime} )
                && ( $SystemTime{ActualEndTime} < $SystemTime{ActualStartTime} )
                )
            {
                $ValidationError{ActualStartTimeInvalid}   = 'ServerError';
                $ValidationError{ActualStartTimeErrorType} = 'BeforeThanEndTimeServerError';
            }
        }

        # validate format of accounted time
        if (
            $GetParam{AccountedTime}
            && $GetParam{AccountedTime} !~ m{ \A -? \d* (?: [.] \d{1,2} )? \z }xms
            )
        {
            $ValidationError{'AccountedTimeInvalid'} = 'ServerError';
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

        # update only when there are no input validation errors
        if ( !%ValidationError ) {

            # the actual time related fields are configurable
            my %AdditionalParam;
            if ( $Self->{Config}->{ActualTimeSpan} ) {
                for my $TimeType (qw(ActualStartTime ActualEndTime)) {

                    # $GetParam{$TimeType} is either a valid timestamp or undef
                    $AdditionalParam{$TimeType} = $GetParam{$TimeType};
                }
            }

            # update the workorder
            my $CouldUpdateWorkOrder = $WorkOrderObject->WorkOrderUpdate(
                WorkOrderID      => $WorkOrderID,
                Report           => $GetParam{Report},
                WorkOrderStateID => $GetParam{WorkOrderStateID},
                UserID           => $Self->{UserID},
                AccountedTime    => $GetParam{AccountedTime},
                %AdditionalParam,
                %DynamicFieldValues,
            );

            # if workorder update was successful
            if ($CouldUpdateWorkOrder) {

                # get all attachments from upload cache
                my @Attachments = $UploadCacheObject->FormIDGetAllFilesData(
                    FormID => $Self->{FormID},
                );

                # build a lookup lookup hash of the new attachments
                my %NewAttachment;
                for my $Attachment (@Attachments) {

                    # the key is the filename + filesize + content type
                    my $Key = $Attachment->{Filename}
                        . $Attachment->{Filesize}
                        . $Attachment->{ContentType};

                    # append content id if available (for new inline images)
                    if ( $Attachment->{ContentID} ) {
                        $Key .= $Attachment->{ContentID};
                    }

                    # store all of the new attachment data
                    $NewAttachment{$Key} = $Attachment;
                }

                # get all report attachments meta data
                my @ExistingAttachments = $WorkOrderObject->WorkOrderReportAttachmentList(
                    WorkOrderID => $WorkOrderID,
                );

                # check the existing attachments
                FILENAME:
                for my $Filename (@ExistingAttachments) {

                    # get the existing attachment data
                    my $AttachmentData = $WorkOrderObject->WorkOrderAttachmentGet(
                        WorkOrderID    => $WorkOrderID,
                        Filename       => $Filename,
                        AttachmentType => 'WorkOrderReport',
                    );

                    # do not consider inline attachments
                    next FILENAME if $AttachmentData->{Preferences}->{ContentID};

                    # the key is the filename + filesize + content type
                    # (no content id, as existing attachments don't have it)
                    my $Key = $AttachmentData->{Filename}
                        . $AttachmentData->{Filesize}
                        . $AttachmentData->{ContentType};

                    # attachment is already existing, we can delete it from the new attachment hash
                    if ( $NewAttachment{$Key} ) {
                        delete $NewAttachment{$Key};
                    }

                    # existing attachment is no longer in new attachments hash
                    else {

                        # delete the existing attachment
                        my $DeleteSuccessful = $WorkOrderObject->WorkOrderAttachmentDelete(
                            ChangeID       => $WorkOrder->{ChangeID},
                            WorkOrderID    => $WorkOrderID,
                            AttachmentType => 'WorkOrderReport',
                            Filename       => $Filename,
                            UserID         => $Self->{UserID},
                        );

                        # check error
                        if ( !$DeleteSuccessful ) {
                            return $LayoutObject->FatalError();
                        }
                    }
                }

                # write the new attachments
                ATTACHMENT:
                for my $Attachment ( values %NewAttachment ) {

                    # check if attachment is an inline attachment
                    my $Inline = 0;
                    if ( $Attachment->{ContentID} ) {

                        # check workorder report for content id
                        # we do not want to keep this attachment,
                        # if it was deleted in the rich text editor
                        next ATTACHMENT if $GetParam{Report} !~ m{ $Attachment->{ContentID} }xms;

                        # remember that it is inline
                        $Inline = 1;
                    }

                    # add attachment
                    my $Success = $WorkOrderObject->WorkOrderAttachmentAdd(
                        %{$Attachment},
                        WorkOrderID    => $WorkOrderID,
                        ChangeID       => $WorkOrder->{ChangeID},
                        UserID         => $Self->{UserID},
                        AttachmentType => 'WorkOrderReport',
                    );

                    # check error
                    return $LayoutObject->FatalError() if !$Success;

                    next ATTACHMENT if !$Inline;
                    next ATTACHMENT if !$LayoutObject->{BrowserRichText};

                    # picture url in upload cache
                    my $Search = "Action=PictureUpload .+ FormID=$Self->{FormID} .+ "
                        . "ContentID=$Attachment->{ContentID}";

                    # picture url in workorder report attachment
                    my $Replace = "Action=AgentITSMWorkOrderZoom;Subaction=DownloadAttachment;"
                        . "Filename=$Attachment->{Filename};WorkOrderID=$WorkOrderID;Type=WorkOrderReport";

                    # replace url
                    $GetParam{Report} =~ s{$Search}{$Replace}xms;

                    # update workorder
                    $Success = $WorkOrderObject->WorkOrderUpdate(
                        WorkOrderID => $WorkOrderID,
                        Report      => $GetParam{Report},
                        UserID      => $Self->{UserID},
                    );

                    # check error
                    if ( !$Success ) {
                        $Kernel::OM->Get('Kernel::System::Log')->Log(
                            Priority => 'error',
                            Message  => "Could not update the inline image URLs "
                                . "for WorkOrderID '$WorkOrderID'!!",
                        );
                    }
                }

                # delete the upload cache
                $UploadCacheObject->FormIDRemove( FormID => $Self->{FormID} );

                # load new URL in parent window and close popup
                return $LayoutObject->PopupClose(
                    URL => "Action=AgentITSMWorkOrderZoom;WorkOrderID=$WorkOrderID",
                );
            }
            else {

                # show error message
                return $LayoutObject->ErrorScreen(
                    Message => $LayoutObject->{LanguageObject}
                        ->Translate( 'Was not able to update WorkOrder %s!', $WorkOrderID ),
                    Comment => Translatable('Please contact the admin.'),
                );
            }
        }
    }
    else {

        # delete all keys from GetParam when it is no Subaction
        %GetParam = ();

        # initialize the actual time related fields
        if ( $Self->{Config}->{ActualTimeSpan} ) {
            TIMETYPE:
            for my $TimeType (qw(ActualStartTime ActualEndTime)) {

                next TIMETYPE if !$WorkOrder->{$TimeType};

                # get the time from the workorder
                my $SystemTime = $TimeObject->TimeStamp2SystemTime(
                    String => $WorkOrder->{$TimeType},
                );

                my ( $Second, $Minute, $Hour, $Day, $Month, $Year )
                    = $TimeObject->SystemTime2Date( SystemTime => $SystemTime );

                # set the parameter hash for BuildDateSelection()
                $GetParam{ $TimeType . 'Used' }   = 1;
                $GetParam{ $TimeType . 'Minute' } = $Minute;
                $GetParam{ $TimeType . 'Hour' }   = $Hour;
                $GetParam{ $TimeType . 'Day' }    = $Day;
                $GetParam{ $TimeType . 'Month' }  = $Month;
                $GetParam{ $TimeType . 'Year' }   = $Year;
            }
        }

        # get all report attachments meta data
        my @ExistingAttachments = $WorkOrderObject->WorkOrderReportAttachmentList(
            WorkOrderID => $WorkOrderID,
        );

        # copy all existing report attachments to upload cache
        FILENAME:
        for my $Filename (@ExistingAttachments) {

            # get the existing attachment data
            my $AttachmentData = $WorkOrderObject->WorkOrderAttachmentGet(
                WorkOrderID    => $WorkOrderID,
                Filename       => $Filename,
                AttachmentType => 'WorkOrderReport',
            );

            # do not consider inline attachments
            next FILENAME if $AttachmentData->{Preferences}->{ContentID};

            # add attachment to the upload cache
            $UploadCacheObject->FormIDAddFile(
                FormID      => $Self->{FormID},
                Filename    => $AttachmentData->{Filename},
                Content     => $AttachmentData->{Content},
                ContentType => $AttachmentData->{ContentType},
            );
        }
    }

    # get change that the workorder belongs to
    my $Change = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
        ChangeID => $WorkOrder->{ChangeID},
        UserID   => $Self->{UserID},
    );

    # no change found
    if ( !$Change ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'Could not find Change for WorkOrder %s!', $WorkOrderID ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # if there was an attachment delete or upload
    # we do not want to show validation errors for other fields
    if ( $ValidationError{Attachment} ) {
        %ValidationError = ();
    }

    # get workorder state list
    my $WorkOrderPossibleStates = $WorkOrderObject->WorkOrderPossibleStatesGet(
        WorkOrderID => $WorkOrderID,
        UserID      => $Self->{UserID},
    );

    # build drop-down with workorder states
    $Param{StateSelect} = $LayoutObject->BuildSelection(
        Data       => $WorkOrderPossibleStates,
        Name       => 'WorkOrderStateID',
        SelectedID => $WorkOrder->{WorkOrderStateID},
        Class      => 'Modernize',
    );

    # show state dropdown
    $LayoutObject->Block(
        Name => 'State',
        Data => {
            %Param,
        },
    );

    # output header
    my $Output = $LayoutObject->Header(
        Title => $WorkOrder->{WorkOrderTitle},
        Type  => 'Small',
    );

    # add rich text editor
    if ( $ConfigObject->Get('Frontend::RichText') ) {
        $LayoutObject->Block(
            Name => 'RichText',
        );
    }

    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {

        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # get workorder dynamic fields from workorder if page is loaded the first time
        if ( !$Self->{Subaction} ) {
            $DynamicFieldValues{ 'DynamicField_' . $DynamicFieldConfig->{Name} }
                = $WorkOrder->{ 'DynamicField_' . $DynamicFieldConfig->{Name} };
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

    # check if actual times should be shown
    if ( $Self->{Config}->{ActualTimeSpan} ) {

        for my $TimeType (qw(ActualEndTime ActualStartTime)) {

            # time period that can be selected from the GUI
            my %TimePeriod = %{ $ConfigObject->Get('ITSMWorkOrder::TimePeriod') };

            # add selection for the time
            my $TimeSelectionString = $LayoutObject->BuildDateSelection(
                %GetParam,
                Format                => 'DateInputFormatLong',
                Prefix                => $TimeType,
                "${TimeType}Optional" => 1,
                $TimeType . 'Class' => $ValidationError{ $TimeType . 'Invalid' } || '',
                Validate => 1,
                %TimePeriod,
            );

            # show time field
            $LayoutObject->Block(
                Name => $TimeType,
                Data => {
                    $TimeType . 'SelectionString' => $TimeSelectionString,
                },
            );
        }

        # add server error messages for the actual start time
        $LayoutObject->Block(
            Name => 'ActualStartTime'
                . ( $ValidationError{ActualStartTimeErrorType} || 'GenericServerError' )
        );
    }

    # show accounted time only when form was submitted
    if ( $Self->{Config}->{AccountedTime} ) {
        $LayoutObject->Block(
            Name => 'ShowAccountedTime',
            Data => {
                AccountedTime => $GetParam{AccountedTime},
                %ValidationError,
            },
        );
    }

    # show accounted time only when form was submitted
    my $AccountedTime = '';
    if ( $GetParam{AccountedTime} ) {
        $AccountedTime = $GetParam{AccountedTime};
    }

    # show the attachment upload button
    $LayoutObject->Block(
        Name => 'AttachmentUpload',
        Data => {%Param},
    );

    # get all report attachments meta data
    my @Attachments = $UploadCacheObject->FormIDGetAllFilesMeta(
        FormID => $Self->{FormID},
    );

    # show report attachments
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

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMWorkOrderReport',
        Data         => {
            %Param,
            %{$Change},
            %{$WorkOrder},
            %GetParam,
            %ValidationError,
            AccountedTime => $AccountedTime,
            FormID        => $Self->{FormID},
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer( Type => 'Small' );

    return $Output;
}

1;
