# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMTemplateEdit;

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

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get needed TemplateID
    my $TemplateID = $ParamObject->GetParam( Param => 'TemplateID' );

    # check needed stuff
    if ( !$TemplateID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No TemplateID is given!'),
            Comment => Translatable('Please contact the administrator.'),
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
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    my %GetParam;

    # update the template
    if ( $Self->{Subaction} eq 'UpdateTemplate' ) {

        # store needed parameters in %GetParam to make it reloadable
        for my $ParamName (qw(TemplateName Comment ValidID)) {
            $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
        }

        # check validity of the template name
        my $TemplateName = $GetParam{TemplateName} || $Template->{Name};

        if ($TemplateName) {

            my $CouldUpdateTemplate = $TemplateObject->TemplateUpdate(
                TemplateID => $TemplateID,
                Name       => $TemplateName,
                Comment    => $GetParam{Comment},
                ValidID    => $GetParam{ValidID} || $Template->{ValidID},
                UserID     => $Self->{UserID},
            );

            if ($CouldUpdateTemplate) {

                # load new URL in parent window and close popup
                return $LayoutObject->PopupClose(
                    URL => "Action=AgentITSMTemplateOverview",
                );
            }
            else {

                # show error message
                return $LayoutObject->ErrorScreen(
                    Message => $LayoutObject->{LanguageObject}
                        ->Translate( 'Was not able to update Template %s!', $TemplateID ),
                    Comment => Translatable('Please contact the administrator.'),
                );
            }
        }
    }
    else {

        # no subaction
    }

    # fix up the name
    $Template->{TemplateName} = $GetParam{TemplateName} || $Template->{Name};

    # output header
    my $Output = $LayoutObject->Header(
        Type  => 'Small',
        Title => $Template->{TemplateName},
    );

    # get valid object
    my $ValidObject = $Kernel::OM->Get('Kernel::System::Valid');

    my $ValidSelectionString = $LayoutObject->BuildSelection(
        Data => {
            $ValidObject->ValidList(),
        },
        Name       => 'ValidID',
        SelectedID => $GetParam{ValidID}
            || $Template->{ValidID}
            || ( $ValidObject->ValidIDsGet() )[0],
        Sort => 'NumericKey',
    );

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMTemplateEdit',
        Data         => {
            %{$Template},
            %GetParam,
            ValidSelectionString => $ValidSelectionString,
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer();

    return $Output;
}

1;
