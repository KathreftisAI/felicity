# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeEdit;

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

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get needed ChangeID
    my $ChangeID = $ParamObject->GetParam( Param => 'ChangeID' );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    if ( !$ChangeID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No ChangeID is given!'),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get config of frontend module
    $Self->{Config} = $ConfigObject->Get("ITSMChange::Frontend::$Self->{Action}");

    # get change object
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

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

    # store needed parameters in %GetParam to make this page reloadable
    my %GetParam;
    for my $ParamName (
        qw(
        ChangeTitle Description Justification
        CategoryID ImpactID PriorityID
        AttachmentUpload FileID
        )
        )
    {
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }

    # get Dynamic fields from ParamObject
    my %DynamicFieldValues;

    # get the dynamic fields for this screen
    my $DynamicField = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => 'ITSMChange',
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
    if ( $Self->{Config}->{RequestedTime} ) {
        for my $TimePart (qw(Used Year Month Day Hour Minute)) {
            my $ParamName = 'RequestedTime' . $TimePart;
            $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
        }
    }

    # Remember the reason why performing the subaction was not attempted.
    my %ValidationError;

    # keep ChangeStateID only if configured
    if ( $Self->{Config}->{ChangeState} ) {
        $GetParam{ChangeStateID} = $ParamObject->GetParam( Param => 'ChangeStateID' );
    }

    # get upload cache object
    my $UploadCacheObject = $Kernel::OM->Get('Kernel::System::Web::UploadCache');

    # get form id
    $Self->{FormID} = $ParamObject->GetParam( Param => 'FormID' );

    # create form id
    if ( !$Self->{FormID} ) {
        $Self->{FormID} = $UploadCacheObject->FormIDCreate();
    }

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    # update change
    if ( $Self->{Subaction} eq 'Save' ) {

        # check the title
        if ( !$GetParam{ChangeTitle} ) {
            $ValidationError{ChangeTitleServerError} = 'ServerError';
        }

        # check CIP
        for my $Type (qw(Category Impact Priority)) {
            if ( !$GetParam{"${Type}ID"} || $GetParam{"${Type}ID"} !~ m{ \A \d+ \z }xms ) {
                $ValidationError{ $Type . 'IDServerError' } = 'ServerError';
            }
            else {
                my $CIPIsValid = $ChangeObject->ChangeCIPLookup(
                    ID   => $GetParam{"${Type}ID"},
                    Type => $Type,
                );

                if ( !$CIPIsValid ) {
                    $ValidationError{ $Type . 'IDServerError' } = 'ServerError';
                }
            }
        }

        # check the requested time
        if ( $Self->{Config}->{RequestedTime} && $GetParam{RequestedTimeUsed} ) {

            if (
                $GetParam{RequestedTimeYear}
                && $GetParam{RequestedTimeMonth}
                && $GetParam{RequestedTimeDay}
                && defined $GetParam{RequestedTimeHour}
                && defined $GetParam{RequestedTimeMinute}
                )
            {

                # transform change requested time, time stamp based on user time zone
                %GetParam = $LayoutObject->TransformDateSelection(
                    %GetParam,
                    Prefix => 'RequestedTime',
                );

                # format as timestamp, when all required time params were passed
                $GetParam{RequestedTime} = sprintf '%04d-%02d-%02d %02d:%02d:00',
                    $GetParam{RequestedTimeYear},
                    $GetParam{RequestedTimeMonth},
                    $GetParam{RequestedTimeDay},
                    $GetParam{RequestedTimeHour},
                    $GetParam{RequestedTimeMinute};

                # sanity check of the assembled timestamp
                my $SystemTime = $TimeObject->TimeStamp2SystemTime(
                    String => $GetParam{RequestedTime},
                );

                # do not save when time is invalid
                if ( !$SystemTime ) {
                    $ValidationError{RequestedTimeInvalid} = 'ServerError';
                }
            }
            else {

                # it was indicated that the requested time should be set,
                # but at least one of the required time params is missing
                $ValidationError{RequestedTimeInvalid} = 'ServerError';
            }
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

        # update only when there are no input validation errors
        if ( !%ValidationError ) {

            # setting of change state and requested time is configurable
            my %AdditionalParam;
            if ( $Self->{Config}->{ChangeState} ) {
                $AdditionalParam{ChangeStateID} = $GetParam{ChangeStateID};
            }
            if ( $Self->{Config}->{RequestedTime} ) {
                $AdditionalParam{RequestedTime} = $GetParam{RequestedTime};
            }

            # update the change
            my $CouldUpdateChange = $ChangeObject->ChangeUpdate(
                ChangeID      => $ChangeID,
                Description   => $GetParam{Description},
                Justification => $GetParam{Justification},
                ChangeTitle   => $GetParam{ChangeTitle},
                CategoryID    => $GetParam{CategoryID},
                ImpactID      => $GetParam{ImpactID},
                PriorityID    => $GetParam{PriorityID},
                UserID        => $Self->{UserID},
                %AdditionalParam,
                %DynamicFieldValues,
            );

            # update was successful
            if ($CouldUpdateChange) {

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

                # get all attachments meta data
                my @ExistingAttachments = $ChangeObject->ChangeAttachmentList(
                    ChangeID => $ChangeID,
                );

                # check the existing attachments
                FILENAME:
                for my $Filename (@ExistingAttachments) {

                    # get the existing attachment data
                    my $AttachmentData = $ChangeObject->ChangeAttachmentGet(
                        ChangeID => $ChangeID,
                        Filename => $Filename,
                        UserID   => $Self->{UserID},
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
                        my $DeleteSuccessful = $ChangeObject->ChangeAttachmentDelete(
                            ChangeID => $ChangeID,
                            Filename => $Filename,
                            UserID   => $Self->{UserID},
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

                        # remember that it is inline
                        $Inline = 1;

                        # remember if this inline attachment is used in
                        # the change description or justification
                        my $ContentIDFound;

                        # check change description and justification for content id
                        if (
                            ( $GetParam{Description} =~ m{ $Attachment->{ContentID} }xms )
                            || ( $GetParam{Justification} =~ m{ $Attachment->{ContentID} }xms )
                            )
                        {

                            # found the content id
                            $ContentIDFound = 1;
                        }

                        # we do not want to keep this attachment,
                        # because it was deleted in the richt text editor
                        next ATTACHMENT if !$ContentIDFound;
                    }

                    # add attachment
                    my $Success = $ChangeObject->ChangeAttachmentAdd(
                        %{$Attachment},
                        ChangeID => $ChangeID,
                        UserID   => $Self->{UserID},
                    );

                    # check error
                    if ( !$Success ) {
                        return $LayoutObject->FatalError();
                    }

                    next ATTACHMENT if !$Inline;
                    next ATTACHMENT if !$LayoutObject->{BrowserRichText};

                    # picture url in upload cache
                    my $Search = "Action=PictureUpload .+ FormID=$Self->{FormID} .+ "
                        . "ContentID=$Attachment->{ContentID}";

                    # picture url in change atttachment
                    my $Replace = "Action=AgentITSMChangeZoom;Subaction=DownloadAttachment;"
                        . "Filename=$Attachment->{Filename};ChangeID=$ChangeID";

                    # replace urls
                    $GetParam{Description} =~ s{$Search}{$Replace}xms;
                    $GetParam{Justification} =~ s{$Search}{$Replace}xms;

                    # update change
                    $Success = $ChangeObject->ChangeUpdate(
                        ChangeID      => $ChangeID,
                        Description   => $GetParam{Description},
                        Justification => $GetParam{Justification},
                        UserID        => $Self->{UserID},
                    );

                    # check error
                    if ( !$Success ) {
                        $Kernel::OM->Get('Kernel::System::Log')->Log(
                            Priority => 'error',
                            Message  => "Could not update the inline image URLs "
                                . "for ChangeID '$ChangeID'!!",
                        );
                    }
                }

                # delete the upload cache
                $UploadCacheObject->FormIDRemove( FormID => $Self->{FormID} );

                # load new URL in parent window and close popup
                return $LayoutObject->PopupClose(
                    URL => "Action=AgentITSMChangeZoom;ChangeID=$ChangeID",
                );

            }
            else {

                # show error message
                return $LayoutObject->ErrorScreen(
                    Message =>
                        $LayoutObject->{LanguageObject}->Translate( 'Was not able to update Change!', $ChangeID ),
                    Comment => Translatable('Please contact the admin.'),
                );
            }
        }
    }

    # handle AJAXUpdate
    elsif ( $Self->{Subaction} eq 'AJAXUpdate' ) {

        # get priorities
        my $Priorities = $ChangeObject->ChangePossibleCIPGet(
            Type   => 'Priority',
            UserID => $Self->{UserID},
        );

        # get selected priority
        my $SelectedPriority
            = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMChangeCIPAllocate')->PriorityAllocationGet(
            CategoryID => $GetParam{CategoryID},
            ImpactID   => $GetParam{ImpactID},
            );

        # build json
        my $JSON = $LayoutObject->BuildSelectionJSON(
            [
                {
                    Name        => 'PriorityID',
                    Data        => $Priorities,
                    SelectedID  => $SelectedPriority,
                    Translation => 1,
                    Max         => 100,
                    Class       => 'Modernize',
                },
            ],
        );

        # return json
        return $LayoutObject->Attachment(
            ContentType => 'text/plain; charset=' . $LayoutObject->{Charset},
            Content     => $JSON,
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    # delete all keys from %GetParam when it is no Subaction
    else {

        %GetParam = ();

        # set the change state from change, if configured
        if ( $Self->{Config}->{ChangeState} ) {
            $GetParam{ChangeStateID} = $Change->{ChangeStateID};
        }

        # set the requested time from change if configured
        if ( $Self->{Config}->{RequestedTime} && $Change->{RequestedTime} ) {

            # get requested time from the change
            my $SystemTime = $TimeObject->TimeStamp2SystemTime(
                String => $Change->{RequestedTime},
            );

            my ( $Second, $Minute, $Hour, $Day, $Month, $Year )
                = $TimeObject->SystemTime2Date( SystemTime => $SystemTime );

            # set the parameter hash for BuildDateSelection()
            $GetParam{RequestedTimeUsed}   = 1;
            $GetParam{RequestedTimeMinute} = $Minute;
            $GetParam{RequestedTimeHour}   = $Hour;
            $GetParam{RequestedTimeDay}    = $Day;
            $GetParam{RequestedTimeMonth}  = $Month;
            $GetParam{RequestedTimeYear}   = $Year;
        }

        # get all attachments meta data
        my @ExistingAttachments = $ChangeObject->ChangeAttachmentList(
            ChangeID => $ChangeID,
        );

        # copy all existing attachments to upload cache
        FILENAME:
        for my $Filename (@ExistingAttachments) {

            # get the existing attachment data
            my $AttachmentData = $ChangeObject->ChangeAttachmentGet(
                ChangeID => $ChangeID,
                Filename => $Filename,
                UserID   => $Self->{UserID},
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

    # if there was an attachment delete or upload
    # we do not want to show validation errors for other fields
    if ( $ValidationError{Attachment} ) {
        %ValidationError = ();
    }

    # check if change state is configured
    if ( $Self->{Config}->{ChangeState} ) {

        # get change state list
        my $ChangePossibleStates = $ChangeObject->ChangePossibleStatesGet(
            ChangeID => $ChangeID,
            UserID   => $Self->{UserID},
        );

        # build drop-down with change states
        my $StateSelectionString = $LayoutObject->BuildSelection(
            Data       => $ChangePossibleStates,
            Name       => 'ChangeStateID',
            SelectedID => $GetParam{ChangeStateID},
            Class      => 'Modernize',
        );

        # show change state dropdown
        $LayoutObject->Block(
            Name => 'ChangeState',
            Data => {
                StateSelectionString => $StateSelectionString,
            },
        );
    }

    # output header
    my $Output = $LayoutObject->Header(
        Title => Translatable('Edit'),
        Type  => 'Small',
    );

    # check if requested time should be shown
    if ( $Self->{Config}->{RequestedTime} ) {

        # time period that can be selected from the GUI
        my %TimePeriod = %{ $ConfigObject->Get('ITSMWorkOrder::TimePeriod') };

        # add selection for the time
        my $TimeSelectionString = $LayoutObject->BuildDateSelection(
            %GetParam,
            Format                => 'DateInputFormatLong',
            Prefix                => 'RequestedTime',
            RequestedTimeOptional => 1,
            RequestedTimeClass    => 'Validate ' . ( $ValidationError{RequestedTimeInvalid} || '' ),
            Validate              => 1,
            %TimePeriod,
        );

        # show time fields
        $LayoutObject->Block(
            Name => 'RequestedTime',
            Data => {
                'RequestedTimeString' => $TimeSelectionString,
            },
        );
    }

    # create dropdown for the category
    # all categories are selectable
    # when the category is changed, a new priority is proposed
    my $Categories = $ChangeObject->ChangePossibleCIPGet(
        Type   => 'Category',
        UserID => $Self->{UserID},
    );
    $Param{CategorySelectionString} = $LayoutObject->BuildSelection(
        Data       => $Categories,
        Name       => 'CategoryID',
        SelectedID => $GetParam{CategoryID} || $Change->{CategoryID},
        Class      => 'Modernize',
    );

    # create dropdown for the impact
    # all impacts are selectable
    # when the impact is changed, a new priority is proposed
    my $Impacts = $ChangeObject->ChangePossibleCIPGet(
        Type   => 'Impact',
        UserID => $Self->{UserID},
    );
    $Param{ImpactSelectionString} = $LayoutObject->BuildSelection(
        Data       => $Impacts,
        Name       => 'ImpactID',
        SelectedID => $GetParam{ImpactID} || $Change->{ImpactID},
        Class      => 'Modernize',
    );

    # create dropdown for priority,
    # all priorities are selectable
    my $Priorities = $ChangeObject->ChangePossibleCIPGet(
        Type   => 'Priority',
        UserID => $Self->{UserID},
    );
    $Param{PrioritySelectionString} = $LayoutObject->BuildSelection(
        Data       => $Priorities,
        Name       => 'PriorityID',
        SelectedID => $GetParam{PriorityID} || $Change->{PriorityID},
        Class      => 'Modernize',
    );

    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {

        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # get change dynamic fields from change if page is loaded the first time
        if ( !$Self->{Subaction} ) {
            $DynamicFieldValues{ 'DynamicField_' . $DynamicFieldConfig->{Name} }
                = $Change->{ 'DynamicField_' . $DynamicFieldConfig->{Name} };
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

    # show the attachment upload button
    $LayoutObject->Block(
        Name => 'AttachmentUpload',
        Data => {%Param},
    );

    # get all attachments meta data
    my @Attachments = $UploadCacheObject->FormIDGetAllFilesMeta(
        FormID => $Self->{FormID},
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
        TemplateFile => 'AgentITSMChangeEdit',
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
