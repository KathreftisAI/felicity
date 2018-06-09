# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::ConfigItem::ConfigItemUpdate;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

use base qw(
    Kernel::GenericInterface::Operation::Common
    Kernel::GenericInterface::Operation::ConfigItem::Common
);

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::GenericInterface::Operation::ConfigItem::ConfigItemUpdate - GenericInterface ConfigItem ConfigItemUpdate Operation backend

=head1 SYNOPSIS

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

usually, you want to create an instance of this
by using Kernel::GenericInterface::Operation->new();

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Needed (qw(DebuggerObject WebserviceID)) {
        if ( !$Param{$Needed} ) {
            return {
                Success      => 0,
                ErrorMessage => "Got no $Needed!",
            };
        }

        $Self->{$Needed} = $Param{$Needed};
    }

    # define operation name
    $Self->{OperationName} = 'ConfigItemUpdate';

    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get('GenericInterface::Operation::ConfigItemUpdate');

    $Self->{Config}->{DefaultValue} = 'Not Defined';

    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

    # get a list of all config item classes
    $Self->{ClassList} = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    if ( !IsHashRefWithData( $Self->{ClassList} ) ) {
        return $Self->{DebuggerObject}->Error(
            Summary => 'Error when trying to get class listing of ITSM::ConfigItem::Class',
        );
    }

    # get a list of all incistates
    $Self->{InciStateList} = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::Core::IncidentState',
    );

    if ( !IsHashRefWithData( $Self->{InciStateList} ) ) {
        return $Self->{DebuggerObject}->Error(
            Summary => 'Error when trying to get incident state listing of'
                . ' ITSM::Core::IncidentState',
        );
    }

    # get a list of all deplstates
    $Self->{DeplStateList} = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    if ( !IsHashRefWithData( $Self->{DeplStateList} ) ) {
        return $Self->{DebuggerObject}->Error(
            Summary => 'Error when trying to get incident state listing of'
                . ' ITSM::ConfigItem::DeploymentState',
        );
    }

    # also provide the classlist in reversed form for easier reverse lookups
    my %ReverseClassList = reverse %{ $Self->{ClassList} };
    $Self->{ReverseClassList} = \%ReverseClassList;

    # also provide the incistatelist in reversed form for easier reverse lookups
    my %ReverseInciStateList = reverse %{ $Self->{InciStateList} };
    $Self->{ReverseInciStateList} = \%ReverseInciStateList;

    # also provide the deplstatelist in reversed form for easier reverse lookups
    my %ReverseDeplStateList = reverse %{ $Self->{DeplStateList} };
    $Self->{ReverseDeplStateList} = \%ReverseDeplStateList;

    return $Self;
}

=item Run()

perform ConfigItemUpdate Operation. This will return the updated config item number.

    my $Result = $OperationObject->Run(
        Data => {
            UserLogin => 'some agent login',                # UserLogin or SessionID is
            SessionID => 123,                               #   required

            Password  => 'some password',                   # if UserLogin is sent then Password is required

            ReplaceExistingData => 0,                       # optional, 0 or 1, default 0
                                                            # this will replace the existing XML data and attachments
            ConfigItemID => 123,

            ConfigItem   => {
                Class     => 'Config Item Class',
                Name      => 'The Name',
                DeplState => 'deployment state',
                InciState => 'incident state',
                CIXMLData => $ArrayHashRef,                 # it depends on the Configuration Item class and definition

                Attachment => [
                    {
                        Content     => 'content'            # base64 encoded
                        ContentType => 'some content type'
                        Filename    => 'some fine name'
                    },
                    # ...
                ],
                # or
                #Attachment => {
                #   Content     => 'content'
                #   ContentType => 'some content type'
                #   Filename    => 'some fine name'
                #},
            },
        },
    );

    $Result = {
        Success         => 1,                       # 0 or 1
        ErrorMessage    => '',                      # in case of error
        Data            => {                        # result data payload after Operation
            ConfigItemID => 123,                    # Configuration Item  ID number in OTRS::ITSM (Service desk system)
            Number       => 2324454323322           # Configuration Item  Number in OTRS::ITSM (Service desk system)
            Error => {                              # should not return errors
                    ErrorCode    => 'ConfigItemUpdate.ErrorCode'
                    ErrorMessage => 'Error Description'
            },
        },
    };

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $Result = $Self->Init(
        WebserviceID => $Self->{WebserviceID},
    );

    if ( !$Result->{Success} ) {
        $Self->ReturnError(
            ErrorCode    => 'Webservice.InvalidConfiguration',
            ErrorMessage => $Result->{ErrorMessage},
        );
    }

    # check needed stuff
    if (
        !$Param{Data}->{UserLogin}
        && !$Param{Data}->{SessionID}
        )
    {
        return $Self->ReturnError(
            ErrorCode => "$Self->{OperationName}.MissingParameter",
            ErrorMessage =>
                "$Self->{OperationName}: UserLogin or SessionID is required!",
        );
    }

    if ( $Param{Data}->{UserLogin} ) {

        if ( !$Param{Data}->{Password} )
        {
            return $Self->ReturnError(
                ErrorCode    => "$Self->{OperationName}.MissingParameter",
                ErrorMessage => "$Self->{OperationName}: Password or SessionID is required!",
            );
        }
    }

    # authenticate user
    my ( $UserID, $UserType ) = $Self->Auth(%Param);

    if ( !$UserID ) {
        return $Self->ReturnError(
            ErrorCode    => "$Self->{OperationName}.AuthFail",
            ErrorMessage => "$Self->{OperationName}: User could not be authenticated!",
        );
    }

    # check needed hashes
    for my $Needed (qw(ConfigItem)) {
        if ( !IsHashRefWithData( $Param{Data}->{$Needed} ) ) {
            return $Self->ReturnError(
                ErrorCode => "$Self->{OperationName}.MissingParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: $Needed parameter is missing or not valid!",
            );
        }
    }

    # check needed items
    for my $Needed (qw(ConfigItemID)) {
        if ( !IsPositiveInteger( $Param{Data}->{$Needed} ) ) {
            return $Self->ReturnError(
                ErrorCode => "$Self->{OperationName}.MissingParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: $Needed parameter is missing or not valid!",
            );
        }
    }

    # check for valid ConfigItemID
    my $ConfigItemID = $Param{Data}->{ConfigItemID};

    # get config item object
    my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

    # get ConfigItem data
    my $ConfigItemData = $ConfigItemObject->ConfigItemGet(
        ConfigItemID => $ConfigItemID,
    );

    if ( !IsHashRefWithData($ConfigItemData) ) {
        return $Self->ReturnError(
            ErrorCode    => "$Self->{OperationName}.InvalidParameter",
            ErrorMessage => "$Self->{OperationName}: ConfigItemID is invalid!",
        );
    }

    # isolate config item parameter
    my $ConfigItem = $Param{Data}->{ConfigItem};

    # remove leading and trailing spaces
    for my $Attribute ( sort keys %{$ConfigItem} ) {
        if ( ref $Attribute ne 'HASH' && ref $Attribute ne 'ARRAY' ) {

            # remove leading spaces
            $ConfigItem->{$Attribute} =~ s{\A\s+}{};

            # remove trailing spaces
            $ConfigItem->{$Attribute} =~ s{\s+\z}{};
        }
    }

    # if the parameter ReplaceExistingData is set to 0 or if it is missing
    # then missing, empty or only partially defined CIXMLData parameter attributes are allowed
    # in this case the existing CIXMLData is used for the missing parts.
    # A missing (undefined) CIXMLData attribute has the same effect
    # the ReplaceExistingData parameter also influences if existing attachments should be replaced or kept
    if ( !$Param{Data}->{ReplaceExistingData} || !defined $ConfigItem->{CIXMLData} ) {

        # set to empty hash reference if empty or not defined
        $ConfigItem->{CIXMLData} ||= {};

        # CIXMLData must be a hash reference
        if ( ref $ConfigItem->{CIXMLData} ne 'HASH' ) {
            return $Self->ReturnError(
                ErrorCode    => "$Self->{OperationName}.MissingParameter",
                ErrorMessage => "$Self->{OperationName}: ConfigItem->CIXMLData is missing or invalid!",
            );
        }

        # get latest version data from configitem
        my $Version = $ConfigItemObject->VersionGet(
            ConfigItemID => $ConfigItemID,
            UserID       => $UserID,
        );

        if ( !IsHashRefWithData($Version) ) {

            my $ErrorMessage = 'Could not get ConfigItem data'
                . ' in Kernel::GenericInterface::Operation::ConfigItem::ConfigItemUpdate::Run()';

            return $Self->ReturnError(
                ErrorCode    => '$Self->{OperationName}.InvalidParameter',
                ErrorMessage => "$Self->{OperationName}: $ErrorMessage",
            );
        }

        # remove unneeded items
        delete $Version->{ClassID};
        delete $Version->{CurDeplStateID};
        delete $Version->{CurInciStateID};
        delete $Version->{DeplStateID};
        delete $Version->{InciStateID};
        delete $Version->{XMLDefinitionID};

        my $Definition = delete $Version->{XMLDefinition};

        my $FormatedXMLData = $Self->InvertFormatXMLData(
            XMLData => $Version->{XMLData}->[1]->{Version},
        );

        my $ReplacedXMLData = $Self->InvertReplaceXMLData(
            XMLData    => $FormatedXMLData,
            Definition => $Definition,
        );

        $Version->{XMLData} = $ReplacedXMLData;

        # rename XMLData since SOAP transport complains about XML prefix on names
        $Version->{CIXMLData} = delete $Version->{XMLData};

        # merge existing data and new data from parameters
        $ConfigItem->{CIXMLData} = {
            %{ $Version->{CIXMLData} },
            %{ $ConfigItem->{CIXMLData} },
        };
    }

    if ( !IsHashRefWithData( $ConfigItem->{CIXMLData} ) ) {
        return $Self->ReturnError(
            ErrorCode    => "$Self->{OperationName}.InvalidParameter",
            ErrorMessage => "$Self->{OperationName}: ConfigItem->CIXMLData is empty or invalid!",
        );
    }

    # remove leading and trailing spaces for CIXMLData
    $Self->_CleanXMLData( XMLData => $ConfigItem->{CIXMLData} );

    # check ConfigItem attribute values
    my $ConfigItemCheck = $Self->_CheckConfigItem( ConfigItem => $ConfigItem );

    if ( !$ConfigItemCheck->{Success} ) {
        return $Self->ReturnError( %{$ConfigItemCheck} );
    }

    # check update permissions
    my $Permission = $ConfigItemObject->Permission(
        Scope   => 'Class',
        ClassID => $Self->{ReverseClassList}->{ $ConfigItem->{Class} },
        UserID  => $UserID,
        Type    => $Self->{Config}->{Permission},
    );

    if ( !$Permission ) {
        return $Self->ReturnError(
            ErrorCode    => "$Self->{OperationName}.AccessDenied",
            ErrorMessage => "$Self->{OperationName}: Can not update configuration items!",
        );
    }

    # handle attachments
    my $Attachment;
    my @AttachmentList;

    if ( defined $Param{Data}->{ConfigItem}->{Attachment} ) {

        # isolate Attachment parameter
        $Attachment = delete $Param{Data}->{ConfigItem}->{Attachment};

        # homologate imput to array
        if ( IsHashRefWithData($Attachment) ) {
            push @AttachmentList, $Attachment;
        }
        elsif ( IsArrayRefWithData($Attachment) ) {
            @AttachmentList = @{$Attachment};
        }
        else {
            return $Self->ReturnError(
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->Attachment parameter is invalid!",
            );
        }

        # check Attachment internal structure
        for my $AttachmentItem (@AttachmentList) {
            if ( !IsHashRefWithData($AttachmentItem) ) {
                return $Self->ReturnError(
                    ErrorCode => "$Self->{OperationName}.InvalidParameter",
                    ErrorMessage =>
                        "$Self->{OperationName}: ConfigItem->Attachment parameter is invalid!",
                );
            }

            # remove leading and trailing spaces
            for my $Attribute ( sort keys %{$AttachmentItem} ) {
                if ( ref $Attribute ne 'HASH' && ref $Attribute ne 'ARRAY' ) {

                    #remove leading spaces
                    $AttachmentItem->{$Attribute} =~ s{\A\s+}{};

                    #remove trailing spaces
                    $AttachmentItem->{$Attribute} =~ s{\s+\z}{};
                }
            }

            # check Attachment attribute values
            my $AttachmentCheck = $Self->_CheckAttachment( Attachment => $AttachmentItem );

            if ( !$AttachmentCheck->{Success} ) {
                return $Self->ReturnError( %{$AttachmentCheck} );
            }
        }
    }

    return $Self->_ConfigItemUpdate(
        ConfigItem          => $ConfigItem,
        ConfigItemID        => $ConfigItemID,
        AttachmentList      => \@AttachmentList,
        ReplaceExistingData => $Param{Data}->{ReplaceExistingData},
        UserID              => $UserID,
    );
}

=begin Internal:

=item _CleanXMLData()

removed trailing and leading white spaces in the XMLData.

    my $XMLDataClean = $OperationObject->_CleanXMLData(
        Definition => $DefinitionArrayRef,          # Config Item Definition ot just part of it
        XMLData    => $XMLDataHashRef,
    );

    returns:

    $XMLDataClean = {
        Success => 1,                               # if everything is OK
    }

    $XMLDataClean = {
        ErrorCode    => 'Function.Error',           # if error
        ErrorMessage => 'Error description',
    }

=cut

sub _CleanXMLData {
    my ( $Self, %Param ) = @_;

    my $XMLData = $Param{XMLData};

    KEY:
    for my $Key ( sort keys %{$XMLData} ) {
        if ( ref $XMLData->{$Key} eq 'ARRAY' ) {
            ELEMENT:
            for my $Element ( @{ $XMLData->{$Key} } ) {
                if ( ref $Element eq 'HASH' ) {

                    # start recursion
                    $Self->_CleanXMLData( XMLData => $Element );
                    next ELEMENT;
                }
                elsif ( ref $Element eq '' ) {

                    #remove leading spaces
                    $Element =~ s{\A\s+}{};

                    #remove trailing spaces
                    $Element =~ s{\s+\z}{};
                }
            }
        }
        elsif ( ref $XMLData->{$Key} eq 'HASH' ) {

            # start recursion
            $Self->_CleanXMLData( XMLData => $XMLData->{$Key} );
            next KEY;

        }
        elsif ( ref $XMLData->{$Key} eq '' ) {

            # TODO: Use StringClean function!

            #remove leading spaces
            $XMLData->{$Key} =~ s{\A\s+}{};

            #remove trailing spaces
            $XMLData->{$Key} =~ s{\s+\z}{};
        }
    }
}

=item _CheckConfigItem()

checks if the given config item parameters are valid.

    my $ConfigItemCheck = $OperationObject->_CheckConfigItem(
        ConfigItem => $ConfigItem,                  # all config item parameters
    );

    returns:

    $ConfigItemCheck = {
        Success => 1,                               # if everything is OK
    }

    $ConfigItemCheck = {
        ErrorCode    => 'Function.Error',           # if error
        ErrorMessage => 'Error description',
    }

=cut

sub _CheckConfigItem {
    my ( $Self, %Param ) = @_;

    my $ConfigItem = $Param{ConfigItem};

    # check config item internally
    for my $Needed (qw(Class Name DeplState InciState CIXMLData)) {
        if ( !$ConfigItem->{$Needed} ) {
            return {
                ErrorCode    => "$Self->{OperationName}.MissingParameter",
                ErrorMessage => "$Self->{OperationName}: ConfigItem->$Needed parameter is missing!",
            };
        }
    }

    # check ConfigItem->Class
    if ( !$Self->ValidateClass( %{$ConfigItem} ) ) {
        return {
            ErrorCode => "$Self->{OperationName}.InvalidParameter",
            ErrorMessage =>
                "$Self->{OperationName}: ConfigItem->Class parameter is invalid!",
        };
    }

    # check ConfigItem->DeplState
    if ( !$Self->ValidateDeplState( %{$ConfigItem} ) ) {
        return {
            ErrorCode => "$Self->{OperationName}.InvalidParameter",
            ErrorMessage =>
                "$Self->{OperationName}: ConfigItem->DeplState parameter is invalid!",
        };
    }

    # check ConfigItem->DeplState
    if ( !$Self->ValidateInciState( %{$ConfigItem} ) ) {
        return {
            ErrorCode => "$Self->{OperationName}.InvalidParameter",
            ErrorMessage =>
                "$Self->{OperationName}: ConfigItem->InciState parameter is invalid!",
        };
    }

    # get last config item defintion
    my $DefinitionData = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->DefinitionGet(
        ClassID => $Self->{ReverseClassList}->{ $ConfigItem->{Class} },
    );

    my $XMLDataCheckResult = $Self->CheckXMLData(
        Definition => $DefinitionData->{DefinitionRef},
        XMLData    => $ConfigItem->{CIXMLData},
    );

    if ( !$XMLDataCheckResult->{Success} ) {
        return $XMLDataCheckResult;
    }

    # if everything is OK then return Success
    return {
        Success => 1,
    };
}

=item _CheckAttachment()

checks if the given attachment parameter is valid.

    my $AttachmentCheck = $OperationObject->_CheckAttachment(
        Attachment => $Attachment,                  # all attachment parameters
    );

    returns:

    $AttachmentCheck = {
        Success => 1,                               # if everething is OK
    }

    $AttachmentCheck = {
        ErrorCode    => 'Function.Error',           # if error
        ErrorMessage => 'Error description',
    }

=cut

sub _CheckAttachment {
    my ( $Self, %Param ) = @_;

    my $Attachment = $Param{Attachment};

    # check attachment item internally
    for my $Needed (qw(Content ContentType Filename)) {
        if ( !$Attachment->{$Needed} ) {
            return {
                ErrorCode => "$Self->{OperationName}.MissingParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: Attachment->$Needed  parameter is missing!",
            };
        }
    }

    # check Article->ContentType
    if ( $Attachment->{ContentType} ) {

        $Attachment->{ContentType} = lc $Attachment->{ContentType};

        # check Charset part
        my $Charset = '';
        if ( $Attachment->{ContentType} =~ /charset=/i ) {
            $Charset = $Attachment->{ContentType};
            $Charset =~ s/.+?charset=("|'|)(\w+)/$2/gi;
            $Charset =~ s/"|'//g;
            $Charset =~ s/(.+?);.*/$1/g;
        }

        if ( $Charset && !$Self->ValidateCharset( Charset => $Charset ) )
        {
            return {
                ErrorCode    => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage => "$Self->{OperationName}: Attachment->ContentType is invalid!",
            };
        }

        # check MimeType part
        my $MimeType = '';
        if ( $Attachment->{ContentType} =~ /^(\w+\/\w+)/i ) {
            $MimeType = $1;
            $MimeType =~ s/"|'//g;
        }

        if ( !$Self->ValidateMimeType( MimeType => $MimeType ) ) {
            return {
                ErrorCode    => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage => "$Self->{OperationName}: Attachment->ContentType is invalid!",
            };
        }
    }

    # if everything is OK then return Success
    return {
        Success => 1,
    };
}

=item _ConfigItemUpdate()

updates a configuration item with attachments if specified.

    my $Response = $OperationObject->_ConfigItemUpdate(
        ConfigItemID        => 123,
        ConfigItem          => $ConfigItem,             # all configuration item parameters
        AttachmentList      => $Attachment,             # a list of all attachments
        ReplaceExistingData => 0,                       # if the existing xml attributes and attachments should be replaced or kept
        UserID              => 123,
    );

    returns:

    $Response = {
        Success => 1,                               # if everething is OK
        Data => {
            ConfigItemID => 123,
            ConfigItemNumber => 'CN123',
        }
    }

    $Response = {
        Success      => 0,                         # if unexpected error
        ErrorMessage => "$Param{ErrorCode}: $Param{ErrorMessage}",
    }

=cut

sub _ConfigItemUpdate {
    my ( $Self, %Param ) = @_;

    my $ConfigItemID   = $Param{ConfigItemID};
    my $ConfigItem     = $Param{ConfigItem};
    my $AttachmentList = $Param{AttachmentList};

    my $DeplStateID = $Self->{ReverseDeplStateList}->{ $ConfigItem->{DeplState} };
    my $InciStateID = $Self->{ReverseInciStateList}->{ $ConfigItem->{InciState} };

    my $RawXMLData = $ConfigItem->{CIXMLData};

    # get config item object
    my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

    # get last config item defintion
    my $DefinitionData = $ConfigItemObject->DefinitionGet(
        ClassID => $Self->{ReverseClassList}->{ $ConfigItem->{Class} },
    );

    # replace date, date time, customer, company and general catalog values
    my $ReplacedXMLData = $Self->ReplaceXMLData(
        XMLData    => $RawXMLData,
        Definition => $DefinitionData->{DefinitionRef},
    );

    # create an XMLData structure suitable for VersionAdd
    my $XMLData = $Self->FormatXMLData(
        XMLData => $ReplacedXMLData,
    );

    # get the current config item version data
    my $CurrentVersion = $ConfigItemObject->VersionGet(
        ConfigItemID => $ConfigItemID,
        UserID       => $Param{UserID},
    );

    my $VersionID = $ConfigItemObject->VersionAdd(
        ConfigItemID => $ConfigItemID,
        Name         => $ConfigItem->{Name},
        DefinitionID => $DefinitionData->{DefinitionID},
        DeplStateID  => $DeplStateID,
        InciStateID  => $InciStateID,
        XMLData      => $XMLData,
        UserID       => $Param{UserID},
    );

    if ( !$VersionID ) {
        return {
            Success      => 0,
            ErrorMessage => 'Configuration Item could not be updated, please contact the system'
                . 'administrator'
            }
    }

    # get the version ID of the config item before the update
    my $CurrentVersionID = $CurrentVersion->{VersionID} || '';

    # compare old version and new version IDs
    if ( $CurrentVersionID eq $VersionID ) {
        $Self->{DebuggerObject}->Notice(
            Summary => "$Self->{OperationName}: No change in configuration item version",
            Data    => 'The internal structure of the configuration item was indentical to the last'
                . ' one, no update was performed',
        );
    }

    # the ReplaceExistingData flag is set
    if ( $Param{ReplaceExistingData} ) {

        # get a list of all attachments
        my @ExistingAttachments = $ConfigItemObject->ConfigItemAttachmentList(
            ConfigItemID => $ConfigItemID,
        );

        # delete all attachments of this config item
        FILENAME:
        for my $Filename (@ExistingAttachments) {

            # delete the attachment
            my $DeletionSuccess = $ConfigItemObject->ConfigItemAttachmentDelete(
                ConfigItemID => $ConfigItemID,
                Filename     => $Filename,
                UserID       => $Param{UserID},
            );

            if ( !$DeletionSuccess ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Unknown problem when deleting attachment $Filename of ConfigItem "
                        . "$ConfigItemID. Please check the VirtualFS backend for stale files!",
                );
            }
        }
    }

    # set attachments
    if ( IsArrayRefWithData($AttachmentList) ) {

        for my $Attachment ( @{$AttachmentList} ) {
            my $Result = $Self->CreateAttachment(
                Attachment   => $Attachment,
                ConfigItemID => $ConfigItemID,
                UserID       => $Param{UserID}
            );

            if ( !$Result->{Success} ) {
                my $ErrorMessage = $Result->{ErrorMessage}
                    || "Attachment could not be created, please contact the system administrator";

                return {
                    Success      => 0,
                    ErrorMessage => $ErrorMessage,
                };
            }
        }
    }

    # get ConfigItem data
    my $ConfigItemData = $ConfigItemObject->ConfigItemGet(
        ConfigItemID => $ConfigItemID,
    );

    if ( !IsHashRefWithData($ConfigItemData) ) {
        return {
            Success      => 0,
            ErrorMessage => 'Could not get new configuration item information, please contact the system administrator',
        };
    }

    return {
        Success => 1,
        Data    => {
            ConfigItemID => $ConfigItemID,
            Number       => $ConfigItemData->{Number},
        },
    };
}

1;

=end Internal:

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
