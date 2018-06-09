# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMTemplateDelete;

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

    # get config for frontend
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMChange::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $Kernel::OM->Get('Kernel::System::ITSMChange')->Permission(
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
                $LayoutObject->{LanguageObject}->Translate( 'You need %s permission!', $Self->{Config}->{Permission} ),
            WithHeader => 'yes',
        );
    }

    # get needed TemplateID
    my $TemplateID = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'TemplateID' );

    # check needed stuff
    if ( !$TemplateID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No TemplateID is given!'),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get template object
    my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template');

    # get template data
    my $Template = $TemplateObject->TemplateGet(
        TemplateID => $TemplateID,
        UserID     => $Self->{UserID},
    );

    # check error
    if ( !$Template ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'Template "%s" not found in database!', $TemplateID ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    if ( $Self->{Subaction} eq 'TemplateDelete' ) {

        my $CouldDeleteTemplate = $TemplateObject->TemplateDelete(
            TemplateID => $TemplateID,
            UserID     => $Self->{UserID},
        );

        if ($CouldDeleteTemplate) {

            # redirect to template overview mask, when update was successful
            return $LayoutObject->Redirect(
                OP => "Action=AgentITSMTemplateOverview",
            );
        }
        else {

            # show error message, when delete failed
            return $LayoutObject->ErrorScreen(
                Message => $LayoutObject->{LanguageObject}
                    ->Translate( 'Was not able to delete the template %s!', $TemplateID ),
                Comment => Translatable('Please contact the admin.'),
            );
        }
    }

    # output content
    my $Output = $LayoutObject->Output(
        TemplateFile => 'AgentITSMTemplateDelete',
        Data         => {
            %{$Template},
        },
    );

    # build the returned data structure
    my %Data = (
        HTML       => $Output,
        DialogType => 'Confirmation',
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
