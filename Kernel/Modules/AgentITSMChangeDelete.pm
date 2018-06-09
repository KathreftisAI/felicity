# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeDelete;

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

    # get needed ChangeID
    my $ChangeID = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'ChangeID' );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    if ( !$ChangeID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No ChangeID is given!'),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get change object
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMChange::Frontend::$Self->{Action}");

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

    # build a lookup hash for the allowed change states
    my %AllowedChangeStates = map { $_ => 1 } @{ $Self->{Config}->{ChangeStates} };

    # only allow deletion if change is in one of the allowed change states
    if ( !$AllowedChangeStates{ $Change->{ChangeState} } ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}->Translate(
                'Change "%s" does not have an allowed change state to be deleted!', $ChangeID
            ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    if ( $Self->{Subaction} eq 'ChangeDelete' ) {

        # delete the change
        my $CouldDeleteChange = $ChangeObject->ChangeDelete(
            ChangeID => $ChangeID,
            UserID   => $Self->{UserID},
        );

        if ($CouldDeleteChange) {

            # redirect to change overview, when the deletion was successful
            return $LayoutObject->Redirect(
                OP => "Action=AgentITSMChange",
            );
        }
        else {

            # show error message, when delete failed
            return $LayoutObject->ErrorScreen(
                Message =>
                    $LayoutObject->{LanguageObject}->Translate( 'Was not able to delete the changeID %s!', $ChangeID ),
                Comment => Translatable('Please contact the administrator.'),
            );
        }
    }

    # set the dialog type. As default, the dialog will have 2 buttons: Yes and No
    my $DialogType = 'Confirmation';

    # output content
    my $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMChangeDelete',
        Data         => {
            %Param,
            %{$Change},
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
