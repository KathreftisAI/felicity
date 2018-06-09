# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMConfigItemEdit;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);
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

    # my param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get configitem id and class id
    my $ConfigItem = {};
    $ConfigItem->{ConfigItemID} = $ParamObject->GetParam( Param => 'ConfigItemID' ) || 0;
    $ConfigItem->{ClassID}      = $ParamObject->GetParam( Param => 'ClassID' )      || 0;
    my $DuplicateID = $ParamObject->GetParam( Param => 'DuplicateID' ) || 0;

    my $HasAccess;

    # get needed objects
    my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
    my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject         = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get config of frontend module
    $Self->{Config} = $ConfigObject->Get("ITSMConfigItem::Frontend::$Self->{Action}");

    # get needed data
    if ( $ConfigItem->{ConfigItemID} && $ConfigItem->{ConfigItemID} ne 'NEW' ) {

        # check access for config item
        $HasAccess = $ConfigItemObject->Permission(
            Scope  => 'Item',
            ItemID => $ConfigItem->{ConfigItemID},
            UserID => $Self->{UserID},
            Type   => $Self->{Config}->{Permission},
        );

        # get config item
        $ConfigItem = $ConfigItemObject->ConfigItemGet(
            ConfigItemID => $ConfigItem->{ConfigItemID},
        );
    }
    elsif ($DuplicateID) {

        # get config item to duplicate
        $ConfigItem = $ConfigItemObject->ConfigItemGet(
            ConfigItemID => $DuplicateID,
        );

        # check access for config item
        $HasAccess = $ConfigItemObject->Permission(
            Scope  => 'Item',
            ItemID => $ConfigItem->{ConfigItemID},
            UserID => $Self->{UserID},
            Type   => $Self->{Config}->{Permission},
        );

        # set config item id and number
        $ConfigItem->{ConfigItemID} = 'NEW';
        $ConfigItem->{Number}       = Translatable('New');
    }
    elsif ( $ConfigItem->{ClassID} ) {

        # set config item id and number
        $ConfigItem->{ConfigItemID} = 'NEW';
        $ConfigItem->{Number}       = Translatable('New');

        # check access for config item
        $HasAccess = $ConfigItemObject->Permission(
            Scope   => 'Class',
            ClassID => $ConfigItem->{ClassID},
            UserID  => $Self->{UserID},
            Type    => $Self->{Config}->{Permission},
        );

        # get class list
        my $ClassList = $GeneralCatalogObject->ItemList(
            Class => 'ITSM::ConfigItem::Class',
        );
        $ConfigItem->{Class} = $ClassList->{ $ConfigItem->{ClassID} };
    }
    else {
        return $LayoutObject->ErrorScreen(
            Message => 'No ConfigItemID, DuplicateID or ClassID is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # if user has no access rights show error page
    if ( !$HasAccess ) {
        return $LayoutObject->ErrorScreen(
            Message => 'No access is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # get definition
    my $XMLDefinition = $ConfigItemObject->DefinitionGet(
        ClassID => $ConfigItem->{ClassID},
    );

    # abort, if no definition is defined
    if ( !$XMLDefinition->{DefinitionID} ) {
        return $LayoutObject->ErrorScreen(
            Message => "No Definition was defined for class $ConfigItem->{Class}!",
            Comment => 'Please contact the admin.',
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

    # when there's no ClassID it means, an existing config item is edited as the ClassID is only
    # provided as GET param when creating a new config item
    if ( !$ParamObject->GetParam( Param => 'ClassID' ) ) {

        # get all attachments meta data
        my @ExistingAttachments = $ConfigItemObject->ConfigItemAttachmentList(
            ConfigItemID => $ConfigItem->{ConfigItemID},
        );

        # copy all existing attachments to upload cache
        FILENAME:
        for my $Filename (@ExistingAttachments) {

            # get the existing attachment data
            my $AttachmentData = $ConfigItemObject->ConfigItemAttachmentGet(
                ConfigItemID => $ConfigItem->{ConfigItemID},
                Filename     => $Filename,
                UserID       => $Self->{UserID},
            );

            # add attachment to the upload cache
            $UploadCacheObject->FormIDAddFile(
                FormID      => $Self->{FormID},
                Filename    => $AttachmentData->{Filename},
                Content     => $AttachmentData->{Content},
                ContentType => $AttachmentData->{ContentType},
            );
        }
    }

    # get submit save
    my $SubmitSave = $ParamObject->GetParam( Param => 'SubmitSave' );

    # get log object
    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    # get xml data
    my $Version = {};
    my $NameDuplicates;
    my $CINameRegexErrorMessage;
    if ( $Self->{Subaction} eq 'VersionSave' ) {

        # check if an attachment must be deleted
        ATTACHMENT:
        for my $Number ( 1 .. 32 ) {

            # check if the delete button was pressed for this attachment
            my $Delete = $ParamObject->GetParam( Param => "AttachmentDelete$Number" );

            # check next attachment if it was not pressed
            next ATTACHMENT if !$Delete;

            # remove the attachment from the upload cache
            $UploadCacheObject->FormIDRemoveFile(
                FormID => $Self->{FormID},
                FileID => $Number,
            );
        }

        # check if there was an attachment upload
        if ( $ParamObject->GetParam( Param => 'AttachmentUpload' ) ) {

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

        my $AllRequired = 1;

        # get general form data
        for my $FormParam (qw(Name DeplStateID InciStateID)) {
            $Version->{$FormParam} = $ParamObject->GetParam( Param => $FormParam );
            if ( !$Version->{$FormParam} ) {
                $AllRequired = 0;
            }
        }

        # get xml form data
        $Version->{XMLData}->[1]->{Version}->[1] = $Self->_XMLFormGet(
            XMLDefinition => $XMLDefinition->{DefinitionRef},
            AllRequired   => \$AllRequired,
            ConfigItemID  => $ConfigItem->{ConfigItemID},
        );

        # check, whether the feature to check for a unique name is enabled
        if (
            IsStringWithData( $Version->{Name} )
            && $ConfigObject->Get('UniqueCIName::EnableUniquenessCheck')
            )
        {

            if ( $ConfigObject->{Debug} > 0 ) {
                $LogObject->Log(
                    Priority => 'debug',
                    Message  => "Checking for duplicate names (ClassID: $ConfigItem->{ClassID}, "
                        . "Name: $Version->{Name}, ConfigItemID: $ConfigItem->{ConfigItemID})",
                );
            }

            $NameDuplicates = $ConfigItemObject->UniqueNameCheck(
                ConfigItemID => $ConfigItem->{ConfigItemID},
                ClassID      => $ConfigItem->{ClassID},
                Name         => $Version->{Name},
            );

            # stop processing if the name is not unique
            if ( IsArrayRefWithData($NameDuplicates) ) {

                $AllRequired = 0;

                # build a string of all duplicate IDs
                my $NameDuplicatesString = join ', ', @{$NameDuplicates};

                $LogObject->Log(
                    Priority => 'error',
                    Message =>
                        "The name $Version->{Name} is already in use by the ConfigItemID(s): "
                        . $NameDuplicatesString,
                );
            }
        }

        # get the config option for the name regex checks
        my $CINameRegexConfig = $ConfigObject->Get("ITSMConfigItem::CINameRegex");

        # check if the CI name is given and should be checked with a regular expression
        if ( IsStringWithData( $Version->{Name} ) && $CINameRegexConfig ) {

            # get class list
            my $ClassList = $GeneralCatalogObject->ItemList(
                Class => 'ITSM::ConfigItem::Class',
            );

            # get the class name
            my $ClassName = $ClassList->{ $ConfigItem->{ClassID} } || '';

            # get the regex for this class
            my $CINameRegex = $CINameRegexConfig->{ $ClassName . '::' . 'CINameRegex' } || '';

            # if a regex is defined and the CI name does not match the regular expression
            if ( $CINameRegex && $Version->{Name} !~ m{ $CINameRegex }xms ) {

                $AllRequired = 0;

                # get the error message for this class
                $CINameRegexErrorMessage = $CINameRegexConfig->{ $ClassName . '::' . 'CINameRegexErrorMessage' } || '';
            }
        }

        # save version to database
        if ( $SubmitSave && $AllRequired ) {

            if ( $ConfigItem->{ConfigItemID} eq 'NEW' ) {
                $ConfigItem->{ConfigItemID} = $ConfigItemObject->ConfigItemAdd(
                    ClassID => $ConfigItem->{ClassID},
                    UserID  => $Self->{UserID},
                );
            }

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

                # store all of the new attachment data
                $NewAttachment{$Key} = $Attachment;
            }

            # get all attachments meta data
            my @ExistingAttachments = $ConfigItemObject->ConfigItemAttachmentList(
                ConfigItemID => $ConfigItem->{ConfigItemID},
            );

            # check the existing attachments
            FILENAME:
            for my $Filename (@ExistingAttachments) {

                # get the existing attachment data
                my $AttachmentData = $ConfigItemObject->ConfigItemAttachmentGet(
                    ConfigItemID => $ConfigItem->{ConfigItemID},
                    Filename     => $Filename,
                    UserID       => $Self->{UserID},
                );

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
                    my $DeleteSuccessful = $ConfigItemObject->ConfigItemAttachmentDelete(
                        ConfigItemID => $ConfigItem->{ConfigItemID},
                        Filename     => $Filename,
                        UserID       => $Self->{UserID},
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

                # add attachment
                my $Success = $ConfigItemObject->ConfigItemAttachmentAdd(
                    %{$Attachment},
                    ConfigItemID => $ConfigItem->{ConfigItemID},
                    UserID       => $Self->{UserID},
                );

                # check error
                if ( !$Success ) {
                    return $LayoutObject->FatalError();
                }
            }

            # add version
            $ConfigItemObject->VersionAdd(
                %{$Version},
                ConfigItemID => $ConfigItem->{ConfigItemID},
                DefinitionID => $XMLDefinition->{DefinitionID},
                UserID       => $Self->{UserID},
            );

            # redirect to zoom mask
            my $ScreenType = $ParamObject->GetParam( Param => 'ScreenType' ) || 0;
            if ($ScreenType) {

                my $URL = "Action=AgentITSMConfigItemZoom;ConfigItemID=$ConfigItem->{ConfigItemID}";

                # return to overview or search results instead if called Duplicate from row action
                if (
                    $Self->{LastScreenView} eq 'Action=AgentITSMConfigItem'
                    || $Self->{LastScreenView} =~ m{\A Action=AgentITSMConfigItem(?: Search)?;}msx
                    )
                {
                    $URL = $Self->{LastScreenView};
                }
                return $LayoutObject->PopupClose(
                    URL => $URL,
                );
            }
            else {
                return $LayoutObject->Redirect(
                    OP => "Action=AgentITSMConfigItemZoom;ConfigItemID=$ConfigItem->{ConfigItemID}",
                );
            }
        }
    }
    elsif ($DuplicateID) {
        my $VersionID = $ParamObject->GetParam( Param => 'VersionID' );
        if ($VersionID) {

            # get version data to duplicate config item
            $Version = $ConfigItemObject->VersionGet(
                VersionID => $VersionID,
            );
        }
        else {

            # get last version data to duplicate config item
            $Version = $ConfigItemObject->VersionGet(
                ConfigItemID => $DuplicateID,
            );
        }
    }
    elsif ( $ConfigItem->{ConfigItemID} ne 'NEW' ) {

        # get last version data
        $Version = $ConfigItemObject->VersionGet(
            ConfigItemID => $ConfigItem->{ConfigItemID},
        );
    }

    my %XMLFormOutputParam;
    if ( $Version->{XMLData}->[1]->{Version}->[1] ) {
        $XMLFormOutputParam{XMLData} = $Version->{XMLData}->[1]->{Version}->[1];
    }

    # output name invalid block
    my $RowNameInvalid = '';
    if ( !$Version->{Name} && $Self->{Subaction} eq 'VersionSave' && $SubmitSave ) {
        $RowNameInvalid = 'ServerError';
    }

    # check for name duplicates
    if ( IsArrayRefWithData($NameDuplicates) ) {
        $RowNameInvalid = 'ServerError';
    }

    # check for not matched name regex
    if ($CINameRegexErrorMessage) {
        $RowNameInvalid = 'ServerError';
    }

    # output name block
    $LayoutObject->Block(
        Name => 'RowName',
        Data => {
            %{$Version},
            RowNameInvalid => $RowNameInvalid,
        },
    );

    if (
        IsStringWithData($RowNameInvalid)
        && !IsArrayRefWithData($NameDuplicates)
        && !$CINameRegexErrorMessage
        )
    {

        if ( $ConfigObject->{Debug} > 0 ) {
            $LogObject->Log(
                Priority => 'debug',
                Message  => "Rendering default error block",
            );
        }

        $LayoutObject->Block(
            Name => 'RowNameErrorDefault',
        );
    }
    elsif ( IsArrayRefWithData($NameDuplicates) ) {

        # build array with CI-Numbers
        my @NameDuplicatesByCINumber;
        for my $ConfigItemID ( @{$NameDuplicates} ) {

            # lookup the CI number
            my $CINumber = $ConfigItemObject->ConfigItemLookup(
                ConfigItemID => $ConfigItemID,
            );

            push @NameDuplicatesByCINumber, $CINumber;
        }

        my $DuplicateString = join ', ', @NameDuplicatesByCINumber;

        if ( $ConfigObject->{Debug} > 0 ) {
            $LogObject->Log(
                Priority => 'debug',
                Message =>
                    "Rendering block for duplicates (CI-Numbers: $DuplicateString) error message",
            );
        }

        $LayoutObject->Block(
            Name => 'RowNameErrorDuplicates',
            Data => {
                Duplicates => $DuplicateString,
            },
        );
    }

    elsif ($CINameRegexErrorMessage) {

        $LayoutObject->Block(
            Name => 'RowNameErrorRegEx',
            Data => {
                RegExErrorMessage => $CINameRegexErrorMessage,
            },
        );
    }

    # get deployment state list
    my $DeplStateList = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    # output deployment state invalid block
    my $RowDeplStateInvalid = '';
    if ( !$Version->{DeplStateID} && $Self->{Subaction} eq 'VersionSave' && $SubmitSave ) {
        $RowDeplStateInvalid = ' ServerError';
    }

    # generate DeplStateOptionStrg
    my $DeplStateOptionStrg = $LayoutObject->BuildSelection(
        Data         => $DeplStateList,
        Name         => 'DeplStateID',
        PossibleNone => 1,
        Class        => 'Validate_Required Modernize' . $RowDeplStateInvalid,
        SelectedID   => $Version->{DeplStateID},
    );

    # output deployment state block
    $LayoutObject->Block(
        Name => 'RowDeplState',
        Data => {
            DeplStateOptionStrg => $DeplStateOptionStrg,
        },
    );

    # get incident state list
    my $InciStateList = $GeneralCatalogObject->ItemList(
        Class       => 'ITSM::Core::IncidentState',
        Preferences => {
            Functionality => [ 'operational', 'incident' ],
        },
    );

    # output incident state invalid block
    my $RowInciStateInvalid = '';
    if ( !$Version->{InciStateID} && $Self->{Subaction} eq 'VersionSave' && $SubmitSave ) {
        $RowInciStateInvalid = ' ServerError';
    }

    # generate InciStateOptionStrg
    my $InciStateOptionStrg = $LayoutObject->BuildSelection(
        Data         => $InciStateList,
        Name         => 'InciStateID',
        PossibleNone => 1,
        Class        => 'Validate_Required Modernize' . $RowInciStateInvalid,
        SelectedID   => $Version->{InciStateID},
    );

    # output incident state block
    $LayoutObject->Block(
        Name => 'RowInciState',
        Data => {
            InciStateOptionStrg => $InciStateOptionStrg,
        },
    );

    # output xml form
    if ( $XMLDefinition->{Definition} ) {
        $Self->_XMLFormOutput(
            XMLDefinition => $XMLDefinition->{DefinitionRef},
            %XMLFormOutputParam,
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
        $LayoutObject->Block(
            Name => 'Attachment',
            Data => $Attachment,
        );
    }

    my $Output = '';
    if ( ( $ConfigItem->{ConfigItemID} && $ConfigItem->{ConfigItemID} ne 'NEW' ) || $DuplicateID ) {

        # output block
        $LayoutObject->Block(
            Name => 'StartSmall',
            Data => {
                %Param,
                %{$ConfigItem},
            },
        );
        $LayoutObject->Block( Name => 'EndSmall' );

        # output header
        $Output .= $LayoutObject->Header(
            Title => 'Edit',
            Type  => 'Small',
        );

        # start template output
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentITSMConfigItemEdit',
            Data         => {
                %Param,
                %{$ConfigItem},
                DuplicateID => $DuplicateID,
                FormID      => $Self->{FormID},
            },
        );
        $Output .= $LayoutObject->Footer( Type => 'Small' );
    }
    else {

        # Necessary stuff for Add New
        # get class list
        my $ClassList = $GeneralCatalogObject->ItemList(
            Class => 'ITSM::ConfigItem::Class',
        );

        # check for access rights
        for my $ClassID ( sort keys %{$ClassList} ) {
            my $HasAccess = $ConfigItemObject->Permission(
                Type    => $Self->{Config}->{Permission},
                Scope   => 'Class',
                ClassID => $ClassID,
                UserID  => $Self->{UserID},
            );

            delete $ClassList->{$ClassID} if !$HasAccess;
        }

        # generate ClassOptionStrg
        my $ClassOptionStrg = $LayoutObject->BuildSelection(
            Data         => $ClassList,
            Name         => 'ClassID',
            PossibleNone => 1,
            Translation  => 0,
            Class        => 'W100pc',
            SelectedID   => $ConfigItem->{ClassID},
        );

        # End Necessary stuff for Add New

        # output block
        $LayoutObject->Block(
            Name => 'StartNormal',
            Data => {
                ClassOptionStrg => $ClassOptionStrg,
                %Param,
                %{$ConfigItem},
            },
        );

        $LayoutObject->Block( Name => 'EndNormal' );

        # output header
        $Output .= $LayoutObject->Header( Title => 'Edit' );
        $Output .= $LayoutObject->NavigationBar();

        # start template output
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentITSMConfigItemEdit',
            Data         => {
                %Param,
                %{$ConfigItem},
                DuplicateID => $DuplicateID,
                FormID      => $Self->{FormID},
            },
        );
        $Output .= $LayoutObject->Footer();
    }

    return $Output;
}

sub _XMLFormGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{AllRequired};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{AllRequired} ne 'SCALAR';
    return if !$Param{ConfigItemID};

    my $FormData = {};

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {
        my $CounterInsert = 1;

        COUNTER:
        for my $Counter ( 1 .. $Item->{CountMax} ) {

            # create inputkey and addkey
            my $InputKey = $Item->{Key} . '::' . $Counter;
            my $AddKey   = $Item->{Key} . '::Add';
            if ( $Param{Prefix} ) {
                $InputKey = $Param{Prefix} . '::' . $InputKey;
                $AddKey   = $Param{Prefix} . '::' . $AddKey;
            }

            # get param
            my $FormValues = $Kernel::OM->Get('Kernel::Output::HTML::Layout')->ITSMConfigItemFormDataGet(
                Key          => $InputKey,
                Item         => $Item,
                ConfigItemID => $Param{ConfigItemID},
            );

            # get param object
            my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

            if ( defined $FormValues->{Value} ) {

                # check required value
                if ( $FormValues->{Invalid} ) {
                    ${ $Param{AllRequired} } = 0;
                }

                # check delete button
                next COUNTER if $ParamObject->GetParam( Param => $InputKey . '::Delete' );

                # start recursion, if "Sub" was found
                if ( $Item->{Sub} ) {
                    my $SubFormData = $Self->_XMLFormGet(
                        XMLDefinition => $Item->{Sub},
                        Prefix        => $InputKey,
                        AllRequired   => $Param{AllRequired},
                        ConfigItemID  => $Param{ConfigItemID},
                    );
                    $FormData->{ $Item->{Key} }->[$CounterInsert] = $SubFormData;
                }
                $FormData->{ $Item->{Key} }->[$CounterInsert]->{Content} = $FormValues->{Value};
                $CounterInsert++;
            }
            else {

                # check add button
                if ( $ParamObject->GetParam( Param => $AddKey ) ) {
                    if ( $Item->{Sub} ) {
                        $FormData->{ $Item->{Key} }->[$CounterInsert] = $Self->_XMLDefaultSet(
                            XMLDefinition => $Item->{Sub},
                        );
                    }
                    $FormData->{ $Item->{Key} }->[$CounterInsert]->{Content} = '';
                }
                last COUNTER;
            }
        }
    }

    return $FormData;
}

sub _XMLDefaultSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if ref $Param{XMLDefinition} ne 'ARRAY';

    my $DefaultData = {};

    for my $Item ( @{ $Param{XMLDefinition} } ) {
        for my $Counter ( 1 .. $Item->{CountDefault} ) {

            # start recursion, if "Sub" was found
            if ( $Item->{Sub} ) {
                $DefaultData->{ $Item->{Key} }->[$Counter] = $Self->_XMLDefaultSet(
                    XMLDefinition => $Item->{Sub},
                );
            }

            $DefaultData->{ $Item->{Key} }->[$Counter]->{Content} = '';
        }
    }

    return $DefaultData;
}

sub _XMLFormOutput {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if ref $Param{XMLDefinition} ne 'ARRAY';

    $Param{Level}  ||= 0;
    $Param{Prefix} ||= '';

    # get submit save
    my $SubmitSave = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'SubmitSave' );

    # set data present mode
    my $DataPresentMode = 0;
    if ( $Param{XMLData} && ref $Param{XMLData} eq 'HASH' ) {
        $DataPresentMode = 1;
    }

    my $ItemCounter = 1;
    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # set loop
        my $Loop = $Item->{CountDefault};
        if ($DataPresentMode) {
            $Loop = 0;

            # search the last content
            COUNTER:
            for my $Counter ( 1 .. $Item->{CountMax} ) {
                last COUNTER if !defined $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content};
                $Loop = $Counter;
            }

            # set absolut minimum
            if ( $Loop < $Item->{CountMin} ) {
                $Loop = $Item->{CountMin};
            }
        }

        # set delete
        my $Delete = 0;
        if ( $Loop > $Item->{CountMin} ) {
            $Delete = 1;
        }

        # get layout object
        my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

        # output content rows
        for my $Counter ( 1 .. $Loop ) {

            # output row block
            $LayoutObject->Block( Name => 'XMLRow' );

            if ( !$Param{Level} ) {
                $LayoutObject->Block( Name => 'XMLRowFieldsetStart' );
            }

            # create inputkey and addkey
            my $InputKey = $Item->{Key} . '::' . $Counter;
            if ( $Param{Prefix} ) {
                $InputKey = $Param{Prefix} . '::' . $InputKey;
            }

            # output blue required star
            my $XMLRowValueContentRequired = 0;
            my $LabelClass                 = '';
            if ( $Item->{Input}->{Required} ) {
                $XMLRowValueContentRequired = 1;
                $LabelClass                 = 'Mandatory';
            }

            # output red invalid star
            my $XMLRowValueContentInvalid = 0;
            if ( $Item->{Form}->{$InputKey}->{Invalid} && $SubmitSave ) {
                $XMLRowValueContentInvalid = 1;
            }

            my $ItemID = 'Item' . $ItemCounter++ . $Param{Prefix} . $Param{Level};

            if ( $Item->{Input}->{Type} eq 'Customer' ) {

                $LayoutObject->Block(
                    Name => 'CustomerSearchInit',
                    Data => {
                        ItemID => $ItemID,
                    },
                );
            }

            # create input element
            my $InputString = $LayoutObject->ITSMConfigItemInputCreate(
                Key      => $InputKey,
                Item     => $Item,
                Value    => $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content},
                ItemId   => $ItemID,
                Required => $XMLRowValueContentRequired,
                Invalid  => $XMLRowValueContentInvalid,
            );

            # ID?
            my $LabelFor = $ItemID;
            if ( $Item->{Input}->{Type} eq 'Date' || $Item->{Input}->{Type} eq 'DateTime' ) {
                $LabelFor = '';
            }

            # id needed?
            if ($LabelFor) {
                $LabelFor = 'for="' . $LabelFor . '"';
            }

            # is this a sub field?
            my $Class = '';
            if ( $Param{Level} ) {
                $Class = 'SubElement';
            }

            # class needed?
            if ($LabelClass) {
                $LabelClass = 'class="' . "$Class  $LabelClass" . '"';
            }
            else {
                $LabelClass = 'class="' . $Class . '"';
            }

            # output row value content block
            $LayoutObject->Block(
                Name => 'XMLRowValue',
                Data => {
                    Name        => $Item->{Name},
                    ItemID      => $ItemID,
                    LabelFor    => $LabelFor || '',
                    Description => $Item->{Description} || $Item->{Name},
                    InputString => $InputString,
                    LabelClass  => $LabelClass || '',
                    Class       => $Class || '',
                },
            );

            if ( $Item->{Input}->{Required} ) {
                $LayoutObject->Block( Name => 'XMLRowValueContentRequired' );
            }

            # output delete button
            if ($Delete) {
                $LayoutObject->Block(
                    Name => 'XMLRowValueContentDelete',
                    Data => {
                        InputKey => $InputKey,
                    },
                );
            }

            # the content is invalid
            if ($XMLRowValueContentInvalid) {

                # show regex error message block
                if ( $Item->{Form}->{$InputKey}->{RegExErrorMessage} ) {

                    $LayoutObject->Block(
                        Name => 'XMLRowValueRegExError',
                        Data => {
                            ItemID            => $ItemID,
                            RegExErrorMessage => $Item->{Form}->{$InputKey}->{RegExErrorMessage},
                        },
                    );
                }

                # otherwise show normal server error block
                else {
                    $LayoutObject->Block(
                        Name => 'XMLRowValueServerError',
                        Data => {
                            ItemID => $ItemID,
                        },
                    );
                }
            }

            # start recursion, if "Sub" was found
            if ( $Item->{Sub} ) {
                my %XMLFormOutputParam;
                if (
                    $DataPresentMode
                    && defined $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content}
                    )
                {
                    $XMLFormOutputParam{XMLData} = $Param{XMLData}->{ $Item->{Key} }->[$Counter];
                }

                $Self->_XMLFormOutput(
                    XMLDefinition => $Item->{Sub},
                    %XMLFormOutputParam,
                    Level  => $Param{Level} + 1,
                    Prefix => $InputKey,
                );
            }

            if ( !$Param{Level} ) {
                $LayoutObject->Block( Name => 'XMLRowFieldsetEnd' );
            }

            # output row to sort rows correctly
            $LayoutObject->Block( Name => 'XMLRow' );
        }

        # output add button
        if ( $Loop < $Item->{CountMax} ) {

            # if no item should be shown we need to show the add button
            # and therefore we need to show the XMLRow block
            if ( !$Loop ) {
                $LayoutObject->Block( Name => 'XMLRow' );
            }

            my $Class = '';
            if ( $Param{Level} ) {
                $Class = 'class="SubElement"';
            }
            else {
                $LayoutObject->Block( Name => 'XMLRowFieldsetEnd' );
                $LayoutObject->Block( Name => 'XMLRowFieldsetStart' );
            }

            # set prefix
            my $InputKey = $Item->{Key};
            if ( $Param{Prefix} ) {
                $InputKey = $Param{Prefix} . '::' . $InputKey;
            }

            # output row add content block
            $LayoutObject->Block(
                Name => 'XMLRowAddContent',
                Data => {
                    ItemID      => $InputKey . 'Add',
                    Name        => $Item->{Name},
                    Description => $Item->{Description} || $Item->{Name},
                    InputKey    => $InputKey,
                    Class       => $Class,
                },
            );
        }
    }

    return 1;
}

1;
