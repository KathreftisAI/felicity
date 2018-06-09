# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeAdd;

use strict;
use warnings;
use POSIX qw(strftime);
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
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    # get config of frontend module
    $Self->{Config} = $ConfigObject->Get("ITSMChange::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $ChangeObject->Permission(
        Type   => $Self->{Config}->{Permission},
        Action => $Self->{Action},
        UserID => $Self->{UserID},
    );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'You need %s permissions!', $Self->{Config}->{Permission} ),
            WithHeader => 'yes',
        );
    }

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # store needed parameters in %GetParam to make it reloadable
    my %GetParam;
    for my $ParamName (
        qw(ChangeTitle Description Justification TicketID CategoryID ImpactID PriorityID AttachmentUpload FileID RequireAndOr WorkorderTagging NoofApprovers)
        )
    {
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }


    #add approvers to getparam if there are any to create workorders
    if($GetParam{NoofApprovers}>0){
        for my $i(1..$GetParam{NoofApprovers}){
            $GetParam{'approver_'.$i} = $ParamObject->GetParam( Param => 'approver_'.$i );
        }
    }


    # get dynamic fields from ParamObject
    my %DynamicFieldValues;

    # get the dynamic fields for this screen
    my $DynamicField = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => 'ITSMChange',
        FieldFilter => $Self->{Config}->{DynamicField} || {},
    );

    my $DynamicFieldWorkOrderTagging = $DynamicFieldObject->DynamicFieldGet(
        Name => 'WorkorderTagging',
    );

    # get dynamic field backend object
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # extract the dynamic field value from the web request and add the prefix
        $DynamicFieldValues{ 'DynamicField_' . $DynamicFieldConfig->{Name} } = $DynamicFieldBackendObject->EditFieldValueGet(
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

    # set default value for category
    $Param{CategoryID} = $GetParam{CategoryID};
    if ( !$Param{CategoryID} ) {
        my $DefaultCategory = $ConfigObject->Get('ITSMChange::Category::Default');
        $Param{CategoryID} = $ChangeObject->ChangeCIPLookup(
            CIP  => $DefaultCategory,
            Type => 'Category',
        );
    }

    # set default value for impact
    $Param{ImpactID} = $GetParam{ImpactID};
    if ( !$Param{ImpactID} ) {
        my $DefaultImpact = $ConfigObject->Get('ITSMChange::Impact::Default');
        $Param{ImpactID} = $ChangeObject->ChangeCIPLookup(
            CIP  => $DefaultImpact,
            Type => 'Impact',
        );
    }

    # get upload cache object
    my $UploadCacheObject = $Kernel::OM->Get('Kernel::System::Web::UploadCache');

    # get form id
    $Self->{FormID} = $ParamObject->GetParam( Param => 'FormID' );

    # create form id
    if ( !$Self->{FormID} ) {
        $Self->{FormID} = $UploadCacheObject->FormIDCreate();
    }

    # get log object
    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    # Remember the reason why saving was not attempted.
    my %ValidationError;

    $Param{WorkOrderTagging} = $LayoutObject->BuildSelection(
        Data => $DynamicFieldWorkOrderTagging->{Config}->{PossibleValues},
        Name => $DynamicFieldWorkOrderTagging->{Name},
        Class => 'Modernize',
    );

    # the TicketID can be validated even without the Subaction 'Save',
    # as it is passed as GET-param or in a hidden field.
    if ( $GetParam{TicketID} ) {

        # get ticket data
        my %Ticket = $Kernel::OM->Get('Kernel::System::Ticket')->TicketGet(
            TicketID => $GetParam{TicketID},
        );


        my %TicketInformation;
        for my $Param( qw(Type State Lock Queue Owner Priority)){
            $TicketInformation{$Param} = $Ticket{$Param};
        }

        $LayoutObject->Block(
            Name => 'TicketInformation',
            Data => {
                %TicketInformation,
            },
        );

        # check if ticket exists
        if ( !%Ticket ) {

            # show error message
            return $LayoutObject->ErrorScreen(
                Message => $LayoutObject->{LanguageObject}->Translate(
                    'Ticket with TicketID %s does not exist!', $GetParam{TicketID}
                ),
                Comment => Translatable('Please contact the admin.'),
            );
        }




        # get list of relevant ticket types
        my $AddChangeLinkTicketTypes = $ConfigObject->Get('ITSMChange::AddChangeLinkTicketTypes');

        # check the list of relevant ticket types
        if (
            !$AddChangeLinkTicketTypes
            || ref $AddChangeLinkTicketTypes ne 'ARRAY'
            || !@{$AddChangeLinkTicketTypes}
            )
        {

            # set error message
            my $Message = Translatable('Missing sysconfig option "ITSMChange::AddChangeLinkTicketTypes"!');

            # log error
            $LogObject->Log(
                Priority => 'error',
                Message  => $Message,
            );

            # show error message
            return $LayoutObject->ErrorScreen(
                Message => $Message,
                Comment => Translatable('Please contact the admin.'),
            );
        }



        # get relevant ticket types
        my %IsRelevant = map { $_ => 1 } @{$AddChangeLinkTicketTypes};

        # check whether the ticket's type is relevant
        if ( !$IsRelevant{ $Ticket{Type} } ) {

            # set error message
            my $Message = "Invalid ticket type '$Ticket{Type}' for directly linking a ticket with a change. "
                . 'Only the following ticket type(s) are allowed for this operation: '
                . join ',', @{$AddChangeLinkTicketTypes};

            # log error
            $LogObject->Log(
                Priority => 'error',
                Message  => $Message,
            );

            # show error message
            return $LayoutObject->ErrorScreen(
                Message => $Message,
                Comment => Translatable('Please contact the admin.'),
            );
        }
    }

    # get CIP allocate object
    my $CIPAllocateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMChangeCIPAllocate');

    # perform the adding
    if ( $Self->{Subaction} eq 'Save' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        # the title is required
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
                my $SystemTime = $Kernel::OM->Get('Kernel::System::Time')->TimeStamp2SystemTime(
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

        # add only when there are no input validation errors
        if ( !%ValidationError ) {

            my %AdditionalParam;

            # add requested time if configured
            if ( $Self->{Config}->{RequestedTime} ) {
                $AdditionalParam{RequestedTime} = $GetParam{RequestedTime};
            }

            # create the change
            my $ChangeID = $ChangeObject->ChangeAdd(
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

            # adding was successful
            if ($ChangeID) {

                # if the change add mask was called from the ticket zoom
                if ( $GetParam{TicketID} ) {

                    # link ticket with newly created change
                    my $LinkSuccess = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkAdd(
                        SourceObject => 'Ticket',
                        SourceKey    => $GetParam{TicketID},
                        TargetObject => 'ITSMChange',
                        TargetKey    => $ChangeID,
                        Type         => 'Normal',
                        State        => 'Valid',
                        UserID       => $Self->{UserID},
                    );

                    # link could not be added
                    if ( !$LinkSuccess ) {

                        # set error message
                        my $Message = "Change with ChangeID $ChangeID was successfully added, "
                            . "but a link to Ticket with TicketID $GetParam{TicketID} could not be created!";

                        # log error
                        $LogObject->Log(
                            Priority => 'error',
                            Message  => $Message,
                        );

                        # show error message
                        return $LayoutObject->ErrorScreen(
                            Message => $Message,
                            Comment => Translatable('Please contact the admin.'),
                        );
                    }
                }

                #Custom Code by Shrinivas A.
                #Creating Change
                my $ConditionObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition');
                my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');

                #If WorkOrderID is generated then start adding actions and expressions

                my %DynamicFieldValues;
                $DynamicFieldValues{DynamicField_WorkorderTagging} = $GetParam{WorkorderTagging};

                for my $i(1..$GetParam{NoofApprovers}){
                    my $epoc = time();
                    my $PlannedStartTime = strftime("%Y-%m-%d %H:%M:00",localtime($epoc));
                    $epoc = $epoc + 60 * 60;
                    my $PlannedEndTime = strftime("%Y-%m-%d %H:%M:00",localtime($epoc));
                    my $WorkOrderID = $WorkOrderObject->WorkOrderAdd(
                        ChangeID         => $ChangeID,
                        WorkOrderTitle   => "Approval Workorder",
                        Instruction      => "Request you to review the change and approve the workorder.",
                        WorkOrderTypeID  => 130,
                        WorkOrderAgentID => $GetParam{'approver_'.$i},
                        UserID           => $Self->{UserID},
                        PlannedStartTime => $PlannedStartTime,
                        PlannedEndTime   => $PlannedEndTime,
                        %DynamicFieldValues,
                    );

                    if ( !$WorkOrderID ) {
                        return $LayoutObject->ErrorScreen(
                            Message => Translatable('Could not add new WorkOrder!'),
                            Comment => Translatable('Please contact the admin.'),
                        );
                    }
                }

                my $ConditionID = $ConditionObject->ConditionAdd(
                    ChangeID              => $ChangeID,
                    Name                  => "Approval",
                    ExpressionConjunction => $GetParam{RequireAndOr},
                    Comment               => "Automatically added approval request.",
                    ValidID               => 1,
                    UserID                => $Self->{UserID},
                );


                if ( !$ConditionID ) {
                    return $LayoutObject->ErrorScreen(
                        Message => Translatable('Could not add new Condition!'),
                        Comment => Translatable('Please contact the admin.'),
                    );
                }

                if($ConditionID){
                    #                    Create Expression
                    my $ExpressionID = $ConditionObject->ExpressionAdd(
                        ConditionID  => $ConditionID,
                        ObjectID     => 2,
                        AttributeID  => 16,
                        OperatorID   => 1,
                        Selector     => $GetParam{RequireAndOr},
                        CompareValue => 125,
                        UserID => $Self->{UserID},
                    );

                    if ( !$ExpressionID ) {
                        return $LayoutObject->ErrorScreen(
                            Message => Translatable('Could not add new Expression!'),
                            Comment => Translatable('Please contact the admin.'),
                        );
                    }

                    my $ActionID = $ConditionObject->ActionAdd(
                        ConditionID  => $ConditionID,
                        ObjectID    => 1,
                        AttributeID => 1,
                        OperatorID  => 13,
                        Selector    => $ChangeID,
                        ActionValue => 117,
                        UserID      => $Self->{UserID},
                    );

                    if ( !$ActionID ) {
                        return $LayoutObject->ErrorScreen(
                            Message => Translatable('Could not add new Action!'),
                            Comment => Translatable('Please contact the admin.'),
                        );
                    }
                }

                #Custom Code ends

                # move attachments from cache to virtual fs
                my @CachedAttachments = $UploadCacheObject->FormIDGetAllFilesData(
                    FormID => $Self->{FormID},
                );

                for my $CachedAttachment (@CachedAttachments) {
                    my $Success = $ChangeObject->ChangeAttachmentAdd(
                        %{$CachedAttachment},
                        ChangeID => $ChangeID,
                        UserID   => $Self->{UserID},
                    );

                    # delete file from cache if move was successful
                    if ($Success) {

                        # rewrite URL for inline images
                        if ( $CachedAttachment->{ContentID} ) {

                            # get the change data
                            my $ChangeData = $ChangeObject->ChangeGet(
                                ChangeID => $ChangeID,
                                UserID   => $Self->{UserID},
                            );

                            # picture url in upload cache
                            my $Search = "Action=PictureUpload .+ FormID=$Self->{FormID} .+ "
                                . "ContentID=$CachedAttachment->{ContentID}";

                            # picture url in change atttachment
                            my $Replace = "Action=AgentITSMChangeZoom;Subaction=DownloadAttachment;"
                                . "Filename=$CachedAttachment->{Filename};ChangeID=$ChangeID";

                            # replace urls
                            $ChangeData->{Description} =~ s{$Search}{$Replace}xms;
                            $ChangeData->{Justification} =~ s{$Search}{$Replace}xms;

                            # update change
                            my $Success = $ChangeObject->ChangeUpdate(
                                ChangeID      => $ChangeID,
                                Description   => $ChangeData->{Description},
                                Justification => $ChangeData->{Justification},
                                UserID        => $Self->{UserID},
                            );

                            # check error
                            if ( !$Success ) {
                                $LogObject->Log(
                                    Priority => 'error',
                                    Message  => "Could not update the inline image URLs "
                                        . "for ChangeID '$ChangeID'!",
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

                # redirect to zoom mask of the new change, when adding was successful
                return $LayoutObject->Redirect(
                    OP => "Action=AgentITSMChangeZoom;ChangeID=$ChangeID",
                );
            }
            else {

                # show error message, when adding failed
                return $LayoutObject->ErrorScreen(
                    Message => Translatable('Was not able to add change!'),
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
        my $SelectedPriority = $CIPAllocateObject->PriorityAllocationGet(
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
        Title => 'Add',
    );
    $Output .= $LayoutObject->NavigationBar();

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
        SelectedID => $Param{CategoryID},
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
        SelectedID => $Param{ImpactID},
        Class      => 'Modernize',
    );

    # create dropdown for priority,
    # all priorities are selectable
    # the default value might depend on category and impact
    my $Priorities = $ChangeObject->ChangePossibleCIPGet(
        Type   => 'Priority',
        UserID => $Self->{UserID},
    );
    my $SelectedPriority = $GetParam{PriorityID}
        || $CIPAllocateObject->PriorityAllocationGet(
        CategoryID => $Param{CategoryID},
        ImpactID   => $Param{ImpactID},
        );
    $Param{PrioritySelectionString} = $LayoutObject->BuildSelection(
        Data       => $Priorities,
        Name       => 'PriorityID',
        SelectedID => $SelectedPriority,
        Class      => 'Modernize',
    );

    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {

        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # get dynamic fields defaults if page is loaded the first time
        if ( !$Self->{Subaction} ) {
            $DynamicFieldValues{ 'DynamicField_' . $DynamicFieldConfig->{Name} }
                = $DynamicFieldConfig->{Config}->{DefaultValue} || '';
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
        TemplateFile => 'AgentITSMChangeAdd',
        Data         => {
            %Param,
            %GetParam,
            %ValidationError,
            FormID => $Self->{FormID},
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer();

    return $Output;
}

1;
