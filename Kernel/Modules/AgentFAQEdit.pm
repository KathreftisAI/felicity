# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentFAQEdit;

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

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("FAQ::Frontend::$Self->{Action}") || '';

    # get the dynamic fields for this screen
    $Self->{DynamicField} = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => 'FAQ',
        FieldFilter => $Self->{Config}->{DynamicField} || {},
    );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # permission check
    if ( !$Self->{AccessRw} ) {
        return $LayoutObject->NoPermission(
            Message    => Translatable('You need rw permission!'),
            WithHeader => 'yes',
        );
    }

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get parameters
    my %GetParam;
    for my $ParamName (
        qw(ItemID Title CategoryID StateID LanguageID ValidID Keywords Approved Field1 Field2 Field3 Field4 Field5 Field6)
        )
    {
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }

    # check needed stuff
    if ( !$GetParam{ItemID} ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No ItemID is given!'),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # get FAQ item data
    my %FAQData = $FAQObject->FAQGet(
        ItemID        => $GetParam{ItemID},
        ItemFields    => 1,
        UserID        => $Self->{UserID},
        DynamicFields => 1,
    );

    # check error
    if ( !%FAQData ) {
        return $LayoutObject->ErrorScreen();
    }

    # check user permission
    my $Permission = $FAQObject->CheckCategoryUserPermission(
        UserID     => $Self->{UserID},
        CategoryID => $FAQData{CategoryID},
    );

    # show error message
    if ( !$Permission ) {
        return $LayoutObject->NoPermission(
            Message    => Translatable('You have no permission for this category!'),
            WithHeader => 'yes',
        );
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get dynamic field values form http request
    my %DynamicFieldValues;

    # get dynamic field backend object
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # extract the dynamic field value form the web request
        $DynamicFieldValues{ $DynamicFieldConfig->{Name} } = $DynamicFieldBackendObject->EditFieldValueGet(
            DynamicFieldConfig => $DynamicFieldConfig,
            ParamObject        => $ParamObject,
            LayoutObject       => $LayoutObject,
        );
    }

    # get upload cache object
    my $UploadCacheObject = $Kernel::OM->Get('Kernel::System::Web::UploadCache');

    # get form id
    my $FormID = $ParamObject->GetParam( Param => 'FormID' );

    # create form id
    if ( !$FormID ) {
        $FormID = $UploadCacheObject->FormIDCreate();
    }

    # get screen type
    my $ScreenType = $ParamObject->GetParam( Param => 'ScreenType' ) || '';

    # get queue object
    my $QueueObject = $Kernel::OM->Get('Kernel::System::Queue');

    # ------------------------------------------------------------ #
    # show the FAQ edit screen
    # ------------------------------------------------------------ #
    if ( !$Self->{Subaction} ) {

        my $Output;

        # show a pop-up screen
        if ( $ScreenType eq 'Popup' ) {

            # show the small pop-up screen header
            $Output = $LayoutObject->Header(
                Type      => 'Small',
                BodyClass => 'Popup',
            );

            $LayoutObject->Block(
                Name => 'StartSmall',
                Data => {
                    %FAQData,
                },
            );
        }

        # show a normal window
        else {

            # show the normal screen header with navigation bar
            $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();

            $LayoutObject->Block(
                Name => 'StartNormal',
                Data => {
                    %FAQData,
                },
            );
        }

        # get all existing attachments (without inline attachments)
        my @ExistingAttachments = $FAQObject->AttachmentIndex(
            ItemID     => $GetParam{ItemID},
            ShowInline => 0,
            UserID     => $Self->{UserID},
        );

        # copy all existing attachments to upload cache
        for my $Attachment (@ExistingAttachments) {

            # get the existing attachment data
            my %File = $FAQObject->AttachmentGet(
                ItemID => $GetParam{ItemID},
                FileID => $Attachment->{FileID},
                UserID => $Self->{UserID},
            );

            # get content disposition (if its an inline attachment)
            my $Disposition = $Attachment->{Inline} ? 'inline' : '';

            # add attachment to the upload cache
            $UploadCacheObject->FormIDAddFile(
                FormID      => $FormID,
                Filename    => $File{Filename},
                Content     => $File{Content},
                ContentType => $File{ContentType},
                Disposition => $Disposition,
            );
        }

        # get all attachments meta data from upload cache
        my @Attachments = $UploadCacheObject->FormIDGetAllFilesMeta(
            FormID => $FormID,
        );

        # rewrite old style inline image URLs
        FIELD:
        for my $Field (qw(Field1 Field2 Field3 Field4 Field5 Field6)) {

            next FIELD if !$FAQData{$Field};

            # rewrite handle and action, take care of old style before FAQ 2.0.x
            $FAQData{$Field} =~ s{
                Action=AgentFAQ [&](amp;)? Subaction=Download [&](amp;)?
            }{Action=AgentFAQZoom;Subaction=DownloadAttachment;}gxms;
        }

        # create HTML strings for all dynamic fields
        my %DynamicFieldHTML;

        # cycle trough the activated Dynamic Fields for this screen
        DYNAMICFIELD:
        for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
            next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

            # to store dynamic field value from database (or undefined)
            my $Value = $FAQData{ 'DynamicField_' . $DynamicFieldConfig->{Name} };

            # get field HTML
            $DynamicFieldHTML{ $DynamicFieldConfig->{Name} } =
                $DynamicFieldBackendObject->EditFieldRender(
                DynamicFieldConfig => $DynamicFieldConfig,
                Value              => $Value,
                Mandatory =>
                    $Self->{Config}->{DynamicField}->{ $DynamicFieldConfig->{Name} } == 2,
                LayoutObject => $LayoutObject,
                ParamObject  => $ParamObject,
                );
        }

        if ( $ConfigObject->Get('FAQ::ApprovalRequired') ) {

            # get Approval queue name
            my $ApprovalQueue = $ConfigObject->Get('FAQ::ApprovalQueue') || '';

            # check if Approval queue exists
            my $ApprovalQueueID = $QueueObject->QueueLookup(
                Queue => $ApprovalQueue,
            );

            # show notification if Approval queue does not exists
            if ( !$ApprovalQueueID ) {
                $Output .= $LayoutObject->Notify(
                    Priority => 'Error',
                    Info     => "FAQ Approval is enabled but queue '$ApprovalQueue' does not exists",
                    Link     => $LayoutObject->{Baselink}
                        . 'Action=AdminSysConfig;Subaction=Edit;'
                        . 'SysConfigSubGroup=Core%3A%3AApproval;SysConfigGroup=FAQ',
                );
            }
        }

        # HTML output
        $Output .= $Self->_MaskNew(
            %FAQData,
            Attachments      => \@Attachments,
            ScreenType       => $ScreenType,
            FormID           => $FormID,
            DynamicFieldHTML => \%DynamicFieldHTML,
        );

        # show a pop-up screen footer
        if ( $ScreenType eq 'Popup' ) {

            $LayoutObject->Block(
                Name => 'EndSmall',
                Data => {},
            );

            $Output .= $LayoutObject->Footer( Type => 'Small' );

        }

        # show a normal footer
        else {

            $LayoutObject->Block(
                Name => 'EndNormal',
                Data => {},
            );

            $Output .= $LayoutObject->Footer();
        }

        return $Output;
    }

    # ------------------------------------------------------------ #
    # save the FAQ
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Save' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my $Output;

        # show a pop-up screen
        if ( $ScreenType eq 'Popup' ) {

            # show the small pop-up screen header
            $Output = $LayoutObject->Header(
                Type      => 'Small',
                BodyClass => 'Popup',
            );

            $LayoutObject->Block(
                Name => 'StartSmall',
                Data => {
                    %FAQData,
                },
            );
        }

        # show a normal window
        else {

            # show the normal screen header with navigation bar
            $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();

            $LayoutObject->Block(
                Name => 'StartNormal',
                Data => {
                    %FAQData,
                },
            );
        }

        # check required parameters
        my %Error;
        for my $ParamName (qw(Title CategoryID)) {

            # if required field is not given, add server error class
            if ( !$GetParam{$ParamName} ) {
                $Error{ $ParamName . 'ServerError' } = 'ServerError';
            }
        }

        # check if an attachment must be deleted
        my @AttachmentIDs = map {
            my ($ID) = $_ =~ m{ \A AttachmentDelete (\d+) \z }xms;
            $ID ? $ID : ();
        } $ParamObject->GetParamNames();

        COUNT:
        for my $Count ( reverse sort @AttachmentIDs ) {

            # check if the delete button was pressed for this attachment
            my $Delete = $ParamObject->GetParam( Param => "AttachmentDelete$Count" );

            # check next attachment if it was not pressed
            next COUNT if !$Delete;

            # remember that we need to show the page again
            $Error{Attachment} = 1;

            # remove the attachment from the upload cache
            $UploadCacheObject->FormIDRemoveFile(
                FormID => $FormID,
                FileID => $Count,
            );
        }

        # check if there was an attachment upload
        if ( $ParamObject->GetParam( Param => 'AttachmentUpload' ) ) {

            # remember that we need to show the page again
            $Error{Attachment} = 1;

            # get the uploaded attachment
            my %UploadStuff = $ParamObject->GetUploadAll(
                Param  => 'FileUpload',
                Source => 'string',
            );

            # add attachment to the upload cache
            $UploadCacheObject->FormIDAddFile(
                FormID => $FormID,
                %UploadStuff,
            );
        }

        # create HTML strings for all dynamic fields
        my %DynamicFieldHTML;

        # cycle trough the activated Dynamic Fields for this screen
        DYNAMICFIELD:
        for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
            next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

            my $ValidationResult;

            # do not validate on attachment upload
            if ( !$Error{Attachment} ) {

                $ValidationResult = $DynamicFieldBackendObject->EditFieldValueValidate(
                    DynamicFieldConfig => $DynamicFieldConfig,
                    ParamObject        => $ParamObject,
                    Mandatory =>
                        $Self->{Config}->{DynamicField}->{ $DynamicFieldConfig->{Name} } == 2,
                );

                if ( !IsHashRefWithData($ValidationResult) ) {
                    return $LayoutObject->ErrorScreen(
                        Message => $LayoutObject->{LanguageObject}->Translate(
                            'Could not perform validation on field %s!',
                            $DynamicFieldConfig->{Label},
                        ),
                        Comment => Translatable('Please contact the administrator.'),
                    );
                }

                # propagate validation error to the Error variable to be detected by the frontend
                if ( $ValidationResult->{ServerError} ) {
                    $Error{ $DynamicFieldConfig->{Name} } = ' ServerError';
                }
            }

            # get field HTML
            $DynamicFieldHTML{ $DynamicFieldConfig->{Name} } =
                $DynamicFieldBackendObject->EditFieldRender(
                DynamicFieldConfig => $DynamicFieldConfig,
                Mandatory =>
                    $Self->{Config}->{DynamicField}->{ $DynamicFieldConfig->{Name} } == 2,
                ServerError  => $ValidationResult->{ServerError}  || '',
                ErrorMessage => $ValidationResult->{ErrorMessage} || '',
                LayoutObject => $LayoutObject,
                ParamObject  => $ParamObject,
                );
        }

        # send server error if any required parameter is missing
        # or an attachment was deleted or uploaded
        if (%Error) {

            # if there was an attachment delete or upload
            # we do not want to show validation errors for other fields
            if ( $Error{Attachment} ) {
                %Error = ();
            }

            # get all attachments meta data
            my @Attachments = $UploadCacheObject->FormIDGetAllFilesMeta(
                FormID           => $FormID,
                DynamicFieldHTML => \%DynamicFieldHTML,
            );

            if ( $ConfigObject->Get('FAQ::ApprovalRequired') ) {

                # get Approval queue name
                my $ApprovalQueue = $ConfigObject->Get('FAQ::ApprovalQueue') || '';

                # check if Approval queue exists
                my $ApprovalQueueID = $QueueObject->QueueLookup(
                    Queue => $ApprovalQueue,
                );

                # show notification if Approval queue does not exists
                if ( !$ApprovalQueueID ) {
                    $Output .= $LayoutObject->Notify(
                        Priority => 'Error',
                        Info =>
                            "FAQ Approval is enabled but queue '$ApprovalQueue' does not exists",
                        Link => $LayoutObject->{Baselink}
                            . 'Action=AdminSysConfig;Subaction=Edit;'
                            . 'SysConfigSubGroup=Core%3A%3AApproval;SysConfigGroup=FAQ',
                    );
                }
            }

            # HTML output
            $Output .= $Self->_MaskNew(
                Attachments => \@Attachments,
                %GetParam,
                %Error,
                ScreenType       => $ScreenType,
                FormID           => $FormID,
                DynamicFieldHTML => \%DynamicFieldHTML,
            );

            # show a pop-up screen footer
            if ( $ScreenType eq 'Popup' ) {

                $LayoutObject->Block(
                    Name => 'EndSmall',
                    Data => {},
                );

                $Output .= $LayoutObject->Footer( Type => 'Small' );

            }

            # show a normal footer
            else {

                $LayoutObject->Block(
                    Name => 'EndNormal',
                    Data => {},
                );

                $Output .= $LayoutObject->Footer();
            }

            return $Output;
        }

        # set the content type
        my $ContentType = 'text/plain';
        if ( $LayoutObject->{BrowserRichText} && $ConfigObject->Get('FAQ::Item::HTML') ) {
            $ContentType = 'text/html';
        }

        # update the new FAQ article
        my $UpdateSuccess = $FAQObject->FAQUpdate(
            %GetParam,
            ContentType => $ContentType,
            UserID      => $Self->{UserID},
        );

        # show error if FAQ could not be updated
        if ( !$UpdateSuccess ) {
            return $LayoutObject->ErrorScreen();
        }

        # get all attachments from upload cache
        my @Attachments = $UploadCacheObject->FormIDGetAllFilesData(
            FormID => $FormID,
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

        # get all existing attachments, without inline attachments
        my @ExistingAttachments = $FAQObject->AttachmentIndex(
            ItemID     => $GetParam{ItemID},
            ShowInline => 0,
            UserID     => $Self->{UserID},
        );

        # check the existing attachments
        ATTACHMENT:
        for my $Attachment (@ExistingAttachments) {

            # the key is the filename + filesize + content type
            # (no content id, as existing attachments don't have it)
            my $Key = $Attachment->{Filename}
                . $Attachment->{Filesize}
                . $Attachment->{ContentType};

            # attachment is already existing, we can delete it from the new attachment hash
            if ( $NewAttachment{$Key} ) {
                delete $NewAttachment{$Key};
            }

            # existing attachment is no longer in new attachments hash
            else {

                # delete the existing attachment
                my $DeleteSuccessful = $FAQObject->AttachmentDelete(
                    ItemID => $GetParam{ItemID},
                    FileID => $Attachment->{FileID},
                    UserID => $Self->{UserID},
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

                # remember if this inline attachment is used in any FAQ article
                my $ContentIDFound;

                # check all fields for content id
                NUMBER:
                for my $Number ( 1 .. 6 ) {

                    # get FAQ field
                    my $Field = $GetParam{ 'Field' . $Number };

                    # skip empty fields
                    next NUMBER if !$Field;

                    # skip fields that do not contain the content id
                    next NUMBER if $Field !~ m{ $Attachment->{ContentID} }xms;

                    # found the content id
                    $ContentIDFound = 1;

                    # we do not need to search further
                    last NUMBER;
                }

                # we do not want to keep this attachment,
                # because it was deleted in the rich-text editor
                next ATTACHMENT if !$ContentIDFound;
            }

            # add attachment
            my $FileID = $FAQObject->AttachmentAdd(
                %{$Attachment},
                ItemID => $GetParam{ItemID},
                Inline => $Inline,
                UserID => $Self->{UserID},
            );

            # check error
            if ( !$FileID ) {
                return $LayoutObject->FatalError();
            }

            next ATTACHMENT if !$Inline;
            next ATTACHMENT if !$LayoutObject->{BrowserRichText};

            # rewrite the URLs of the inline images for the uploaded pictures
            my $OK = $FAQObject->FAQInlineAttachmentURLUpdate(
                Attachment => $Attachment,
                FormID     => $FormID,
                ItemID     => $GetParam{ItemID},
                FileID     => $FileID,
                UserID     => $Self->{UserID},
            );

            # check error
            if ( !$OK ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Could not update the inline image URLs "
                        . "for FAQ Item# '$GetParam{ItemID}'!",
                );
            }
        }

        # delete the upload cache
        $UploadCacheObject->FormIDRemove( FormID => $FormID );

        # set dynamic fields
        # cycle trough the activated Dynamic Fields for this screen
        DYNAMICFIELD:
        for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
            next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

            # set the object ID depending on the field configuration
            my $ObjectID = $GetParam{ItemID};

            # set the value
            my $Success = $DynamicFieldBackendObject->ValueSet(
                DynamicFieldConfig => $DynamicFieldConfig,
                ObjectID           => $ObjectID,
                Value              => $DynamicFieldValues{ $DynamicFieldConfig->{Name} },
                UserID             => $Self->{UserID},
            );
        }

        # check if there if we need to close a pop-up screen or not
        if ( $ScreenType eq 'Popup' ) {
            return $LayoutObject->PopupClose(
                URL => "Action=AgentFAQZoom;ItemID=$GetParam{ItemID}",
            );
        }
        else {
            return $LayoutObject->Redirect(
                OP => "Action=AgentFAQZoom;ItemID=$GetParam{ItemID}",
            );
        }
    }
}

sub _MaskNew {
    my ( $Self, %Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get list type
    my $TreeView = 0;
    if ( $ConfigObject->Get('Ticket::Frontend::ListType') eq 'tree' ) {
        $TreeView = 1;
    }

    # get valid list
    my %ValidList        = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();
    my %ValidListReverse = reverse %ValidList;

    my %Data;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # build valid selection
    $Data{ValidOption} = $LayoutObject->BuildSelection(
        Data       => \%ValidList,
        Name       => 'ValidID',
        SelectedID => $Param{ValidID} || $ValidListReverse{valid},
        Class      => 'Modernize',
    );

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # get categories (with category long names) where user has rights
    my $UserCategoriesLongNames = $FAQObject->GetUserCategoriesLongNames(
        Type   => 'rw',
        UserID => $Self->{UserID},
    );

    # set no server error class as default
    $Param{CategoryIDServerError} ||= '';

    # build category selection
    $Data{CategoryOption} = $LayoutObject->BuildSelection(
        Data         => $UserCategoriesLongNames,
        Name         => 'CategoryID',
        SelectedID   => $Param{CategoryID},
        PossibleNone => 1,
        Class        => 'Validate_Required Modernize ' . $Param{CategoryIDServerError},
        Translation  => 0,
        TreeView     => $TreeView,
    );

    # get the language list
    my %Languages = $FAQObject->LanguageList(
        UserID => $Self->{UserID},
    );

    # get the selected language
    my $SelectedLanguage;
    if ( $Param{LanguageID} && $Languages{ $Param{LanguageID} } ) {

        # get language from given language id
        $SelectedLanguage = $Languages{ $Param{LanguageID} };
    }
    else {

        # use the user language, or if not found 'en'
        $SelectedLanguage = $LayoutObject->{UserLanguage} || 'en';

        # get user language ID
        my $SelectedLanguageID = $FAQObject->LanguageLookup(
            Name => $SelectedLanguage,
        );

        # check if LanduageID does not exists
        if ( !$SelectedLanguageID ) {

            # get the lowest language ID
            my @LanguageIDs = sort keys %Languages;
            $SelectedLanguageID = $LanguageIDs[0];

            # set the language with lowest language ID as selected language
            $SelectedLanguage = $Languages{$SelectedLanguageID};
        }
    }

    # build the language selection
    $Data{LanguageOption} = $LayoutObject->BuildSelection(
        Data          => \%Languages,
        Name          => 'LanguageID',
        SelectedValue => $SelectedLanguage,
        Translation   => 0,
        Class         => 'Modernize',
    );

    # get the states list
    my %States = $FAQObject->StateList(
        UserID => $Self->{UserID},
    );

    # get the selected state
    my $SelectedState;
    if ( $Param{StateID} && $States{ $Param{StateID} } ) {

        # get state from given state id
        $SelectedState = $States{ $Param{StateID} };
    }
    else {

        # get default state
        $SelectedState = $ConfigObject->Get('FAQ::Default::State') || 'internal (agent)';
    }

    # build the state selection
    $Data{StateOption} = $LayoutObject->BuildSelection(
        Data          => \%States,
        Name          => 'StateID',
        SelectedValue => $SelectedState,
        Translation   => 1,
        Class         => 'Modernize',
    );

    # get screen type
    my $ScreenType = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'ScreenType' ) || '';

    my $FieldsetClass = '';
    if ( $ScreenType eq 'Popup' ) {
        $FieldsetClass = 'FixedLabel';
    }

    # show FAQ edit screen
    $LayoutObject->Block(
        Name => 'FAQEdit',
        Data => {
            %Param,
            %Data,
            FieldsetClass => $FieldsetClass,
        },
    );

    # show languages field
    my $MultiLanguage = $ConfigObject->Get('FAQ::MultiLanguage');
    if ($MultiLanguage) {
        $LayoutObject->Block(
            Name => 'Language',
            Data => {
                %Param,
                %Data,
            },
        );
    }
    else {
        $LayoutObject->Block(
            Name => 'NoLanguage',
            Data => {
                %Param,
                %Data,
            },
        );
    }

    # show approval field
    if ( $ConfigObject->Get('FAQ::ApprovalRequired') ) {

        # check permission
        my %Groups = reverse $Kernel::OM->Get('Kernel::System::Group')->GroupMemberList(
            UserID => $Self->{UserID},
            Type   => 'ro',
            Result => 'HASH',
        );

        # get the FAQ approval group from config
        my $ApprovalGroup = $ConfigObject->Get('FAQ::ApprovalGroup') || '';

        # build the approval selection if user is in the approval group
        if ( $Groups{$ApprovalGroup} ) {

            $Data{ApprovalOption} = $LayoutObject->BuildSelection(
                Name => 'Approved',
                Data => {
                    0 => 'No',
                    1 => 'Yes',
                },
                SelectedID => $Param{Approved} || 0,
                Class => 'Modernize',
            );
            $LayoutObject->Block(
                Name => 'Approval',
                Data => {%Data},
            );
        }
    }

    # show the attachment upload button
    $LayoutObject->Block(
        Name => 'AttachmentUpload',
        Data => {%Param},
    );

    # show attachments
    ATTACHMENT:
    for my $Attachment ( @{ $Param{Attachments} } ) {

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

    # get config of frontend module
    my $Config = $ConfigObject->Get("FAQ::Frontend::$Self->{Action}") || '';

    # add rich text editor JavaScript
    # only if activated and the browser can handle it
    # otherwise just a text-area is shown
    if ( $LayoutObject->{BrowserRichText} && $ConfigObject->Get('FAQ::Item::HTML') ) {

        # use height/width defined for this screen
        $Param{RichTextHeight} = $Config->{RichTextHeight} || 0;
        $Param{RichTextWidth}  = $Config->{RichTextWidth}  || 0;

        $LayoutObject->Block(
            Name => 'RichText',
            Data => {%Param},
        );
    }

    # set default interface settings
    my $InterfaceStates = $FAQObject->StateTypeList(
        Types  => $ConfigObject->Get('FAQ::Agent::StateTypes'),
        UserID => $Self->{UserID},
    );

    # show FAQ Content
    $LayoutObject->FAQContentShow(
        FAQObject       => $FAQObject,
        InterfaceStates => $InterfaceStates,
        FAQData         => {%Param},
        UserID          => $Self->{UserID},
    );

    # Dynamic fields
    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {

        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # skip fields that HTML could not be retrieved
        next DYNAMICFIELD if !IsHashRefWithData(
            $Param{DynamicFieldHTML}->{ $DynamicFieldConfig->{Name} }
        );

        # get the HTML strings form $Param
        my $DynamicFieldHTML = $Param{DynamicFieldHTML}->{ $DynamicFieldConfig->{Name} };

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

    if ( $ScreenType ne 'Popup' ) {
        $LayoutObject->Block(
            Name => 'EndNormal',
        );
    }

    if ( $ScreenType eq 'Popup' ) {
        $LayoutObject->Block(
            Name => 'EndSmall',
        );
    }

    # generate output
    return $LayoutObject->Output(
        TemplateFile => 'AgentFAQEdit',
        Data         => \%Param,
    );
}

1;
