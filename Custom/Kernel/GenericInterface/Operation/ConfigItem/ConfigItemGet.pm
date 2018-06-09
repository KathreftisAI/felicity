# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::ConfigItem::ConfigItemGet;

use strict;
use warnings;

use MIME::Base64;
use Kernel::System::VariableCheck qw(:all);

use base qw(
    Kernel::GenericInterface::Operation::Common
    Kernel::GenericInterface::Operation::ConfigItem::Common
);

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::GenericInterface::Operation::ConfigItem::ConfigItemGet - GenericInterface Configuration Item Get Operation backend

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
    for my $Needed (qw( DebuggerObject WebserviceID )) {
        if ( !$Param{$Needed} ) {
            return {
                Success      => 0,
                ErrorMessage => "Got no $Needed!",
            };
        }

        $Self->{$Needed} = $Param{$Needed};
    }

    $Self->{OperationName} = 'ConfigItemGet';

    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get('GenericInterface::Operation::ConfigItemGet');

    return $Self;
}

=item Run()

perform ConfigItemGet Operation. This function is able to return
one or more ConfigItem entries in one call.

    my $Result = $OperationObject->Run(
        Data => {
            UserLogin         => 'some agent login',                            # UserLogin or SessionID is
            SessionID         => 123,                                           #   required
            Password          => 'some password',                               # if UserLogin is sent then Password is required
            ConfigItemID      => '32,33',                                       # required, could be coma separated IDs or an Array
            Attachments       => 1,                                             # Optional, 1 as default. If it's set with the value 1,
                                                                                # attachments for articles will be included on ConfigItem data
        },
    );

    $Result = {
        Success      => 1,                                # 0 or 1
        ErrorMessage => '',                               # In case of an error
        Data         => {
            ConfigItem => [
                {

                    Number             => '20101027000001',
                    ConfigItemID       => 123,
                    Name               => 'some name',
                    Class              => 'some class',
                    VersionID          => 123,
                    LastVersionID      => 123,
                    DefinitionID       => 123,
                    InciState          => 'some incident state',
                    InciStateType      => 'some incident state type',
                    DeplState          => 'some deployment state',
                    DeplStateType      => 'some deployment state type',
                    CurInciState       => 'some incident state',
                    CurInciStateType   => 'some incident state type',
                    CurDeplState       => 'some deployment state',
                    CurDeplStateType   => 'some deployment state type',
                    CreateTime         => '2010-10-27 20:15:00'
                    CreateBy           => 123,
                    CIXMLData          => $XMLDataHashRef,

                    Attachment => [
                        {
                            Content            => "xxxx",     # actual attachment contents, base64 enconded
                            ContentType        => "application/pdf",
                            Filename           => "StdAttachment-Test1.pdf",
                            Filesize           => "4.6 KBytes",
                            Preferences        => $PreferencesHashRef,
                        },
                        {
                           # . . .
                        },
                    ],
                },
                {
                    # . . .
                },
            ],
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

    my ( $UserID, $UserType ) = $Self->Auth(
        %Param
    );

    if ( !$UserID ) {
        return $Self->ReturnError(
            ErrorCode    => '$Self->{OperationName}.AuthFail',
            ErrorMessage => "$Self->{OperationName}: Authorization failing!",
        );
    }

    # check needed stuff
    for my $Needed (qw(ConfigItemID)) {
        if ( !$Param{Data}->{$Needed} ) {
            return $Self->ReturnError(
                ErrorCode    => "$Self->{OperationName}.MissingParameter",
                ErrorMessage => "$Self->{OperationName}: $Needed parameter is missing!",
            );
        }
    }
    my $ErrorMessage = '';

    # all needed variables
    my @ConfigItemIDs;
    if ( IsStringWithData( $Param{Data}->{ConfigItemID} ) ) {
        @ConfigItemIDs = split( /,/, $Param{Data}->{ConfigItemID} );
    }
    elsif ( IsArrayRefWithData( $Param{Data}->{ConfigItemID} ) ) {
        @ConfigItemIDs = @{ $Param{Data}->{ConfigItemID} };
    }
    else {
        return $Self->ReturnError(
            ErrorCode    => "$Self->{OperationName}.WrongStructure",
            ErrorMessage => "$Self->{OperationName}: Structure for ConfigItemID is not correct!",
        );
    }
    my $Attachments = $Param{Data}->{Attachments} || 0;
    my $ReturnData = {
        Success => 1,
    };

    my @Item;

    my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

    # start ConfigItem loop
    CONFIGITEM:
    for my $ConfigItemID (@ConfigItemIDs) {

        # check create permissions
        my $Permission = $ConfigItemObject->Permission(
            Scope  => 'Item',
            ItemID => $ConfigItemID,
            UserID => $UserID,
            Type   => $Self->{Config}->{Permission},
        );

        if ( !$Permission ) {
            return $Self->ReturnError(
                ErrorCode    => "$Self->{OperationName}.AccessDenied",
                ErrorMessage => "$Self->{OperationName}: Can not get configuration item!",
            );
        }

        # get the ConfigItem entry
        my $ConfigItem = $ConfigItemObject->ConfigItemGet(
            ConfigItemID => $ConfigItemID,
            UserID       => $UserID,
        );

        # get latest version
        my $Version = $ConfigItemObject->VersionGet(
            ConfigItemID => $ConfigItemID,
            UserID       => $UserID,
        );

        if ( !IsHashRefWithData($Version) ) {

            $ErrorMessage = 'Could not get ConfigItem data'
                . ' in Kernel::GenericInterface::Operation::ConfigItem::ConfigItemGet::Run()';

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

        # set ConfigItem entry data
        my $ConfigItemBundle = $Version;

        if ($Attachments) {

            my @Attachments = $ConfigItemObject->ConfigItemAttachmentList(
                ConfigItemID => $ConfigItemID,
            );

            my @AttachmentDetails;
            ATTACHMENT:
            for my $Filename (@Attachments) {

                next ATTACHMENT if !$Filename;

                my $Attachment = $ConfigItemObject->ConfigItemAttachmentGet(
                    ConfigItemID => $ConfigItemID,
                    Filename     => $Filename,
                );

                # next if not attachment
                next ATTACHMENT if !IsHashRefWithData($Attachment);

                # convert content to base64
                $Attachment->{Content} = encode_base64( $Attachment->{Content} );
                push @AttachmentDetails, $Attachment;
            }

            # set ConfigItem entry data
            $ConfigItemBundle->{Attachment} = '';
            if ( IsArrayRefWithData( \@AttachmentDetails ) ) {
                $ConfigItemBundle->{Attachment} = \@AttachmentDetails;
            }
        }

        # add
        push @Item, $ConfigItemBundle;

    }    # finish ConfigItem loop

    if ( !scalar @Item ) {
        $ErrorMessage = 'Could not get ConfigItem data'
            . ' in Kernel::GenericInterface::Operation::ConfigItem::ConfigItemGet::Run()';

        return $Self->ReturnError(
            ErrorCode    => '$Self->{OperationName}.NoConfigItemData',
            ErrorMessage => "$Self->{OperationName}: $ErrorMessage",
        );

    }

    # set ConfigItem data into return structure
    $ReturnData->{Data}->{ConfigItem} = '';
    if ( IsArrayRefWithData( \@Item ) ) {
        $ReturnData->{Data}->{ConfigItem} = \@Item;
    }

    # return result
    return $ReturnData;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
