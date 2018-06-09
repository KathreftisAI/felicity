# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
package Kernel::Modules::AgentITSMConfigItemDelete;

use strict;
use warnings;

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

    # get needed ConfigItemID
    my $ConfigItemID = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'ConfigItemID' );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    if ( !$ConfigItemID ) {
        return $LayoutObject->ErrorScreen(
            Message => 'No ConfigItemID is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # get config item object
    my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMConfigItem::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $ConfigItemObject->Permission(
        Type   => $Self->{Config}->{Permission},
        Scope  => 'Item',
        Action => $Self->{Action},
        ItemID => $ConfigItemID,
        UserID => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message    => "You need $Self->{Config}->{Permission} permissions!",
            WithHeader => 'yes',
        );
    }

    # get config item data
    my $ConfigItem = $ConfigItemObject->ConfigItemGet(
        ConfigItemID => $ConfigItemID,
        UserID       => $Self->{UserID},
    );

    # check if config item is found
    if ( !$ConfigItem ) {
        return $LayoutObject->ErrorScreen(
            Message => "Config item '$ConfigItemID' not found in database!",
            Comment => 'Please contact the admin.',
        );
    }

    # delete the config item
    if ( $Self->{Subaction} eq 'ConfigItemDelete' ) {

        # delete the config item
        my $CouldDeleteConfigItem = $ConfigItemObject->ConfigItemDelete(
            ConfigItemID => $ConfigItemID,
            UserID       => $Self->{UserID},
        );

        if ($CouldDeleteConfigItem) {

            # redirect to config item overview, when the deletion was successful
            return $LayoutObject->Redirect(
                OP => "Action=AgentITSMConfigItem",
            );
        }
        else {

            # show error message, when delete failed
            return $LayoutObject->ErrorScreen(
                Message => "Was not able to delete the configitem ID $ConfigItemID!",
                Comment => 'Please contact the administrator.',
            );
        }
    }

    # get latest version data
    my $Version = $ConfigItemObject->VersionGet(
        ConfigItemID => $ConfigItemID,
    );

    if ( !$Version->{VersionID} ) {
        return $LayoutObject->ErrorScreen(
            Message => "No Version found for ConfigItemID $ConfigItemID!",
            Comment => 'Please contact the admin.',
        );
    }

    # set the dialog type. As default, the dialog will have 2 buttons: Yes and No
    my $DialogType = 'Confirmation';

    # output content
    my $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMConfigItemDelete',
        Data         => {
            %Param,
            %{$ConfigItem},
            %{$Version},
        },
    );

    # build the returned data structure
    my %Data = (
        HTML       => $Output,
        DialogType => $DialogType,
    );

    # return JSON-String because of AJAX-Mode
    my $OutputJSON = $LayoutObject->JSONEncode( Data => \%Data );

    return $LayoutObject->Attachment(
        ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
        Content     => $OutputJSON,
        Type        => 'inline',
        NoCache     => 1,
    );
}

1;
