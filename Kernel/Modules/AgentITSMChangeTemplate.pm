# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeTemplate;

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

    # get needed objects
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get needed ChangeID
    my $ChangeID = $ParamObject->GetParam( Param => 'ChangeID' );

    # check needed stuff
    if ( !$ChangeID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No ChangeID is given!'),
            Comment => Translatable('Please contact the administrator.'),
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

    # error screen
    if ( !$Change ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}->Translate( 'No change found for changeID %s.', $ChangeID ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # store needed parameters in %GetParam to make it reloadable
    my %GetParam;
    for my $ParamName (qw(TemplateName Comment ValidID StateReset OverwriteTemplate DeleteChange ))
    {
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }

    # get user object
    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # get existing user preferences
    my %UserPreferences = $UserObject->GetPreferences(
        UserID => $Self->{UserID},
    );

    # get preference to see which templates are in edit by the user
    my $TemplateEditPreferenceString = $UserPreferences{UserITSMChangeManagementTemplateEdit} || '';

    # convert to lookup hash
    my @EditedTemplates = split m/;/, $TemplateEditPreferenceString;
    my %Object2Template;
    for my $String (@EditedTemplates) {
        my ( $Object, $Template ) = split m/::/, $String;
        $Object2Template{$Object} = $Template;
    }

    # get template id from user preferences
    my $TemplateID = $Object2Template{ 'ChangeID' . $ChangeID };

    # get template object
    my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template');

    # check if this change was created by this user using a template
    if ($TemplateID) {

        # get template data
        my $TemplateData = $TemplateObject->TemplateGet(
            TemplateID => $TemplateID,
            UserID     => 1,
        );

        if ($TemplateData) {

            # overwrite empty values with template data
            $GetParam{TemplateName} ||= $TemplateData->{Name};
            $GetParam{Comment}      ||= $TemplateData->{Comment};
            $GetParam{ValidID}      ||= $TemplateData->{ValidID};
        }
        else {
            $TemplateID = '';
        }
    }

    # Check required fields to look for errors.
    my %Error;

    # add a template
    if ( $Self->{Subaction} eq 'AddTemplate' ) {

        # check validity of the template name
        if ( !$GetParam{TemplateName} ) {
            $Error{'TemplateNameInvalid'} = 'ServerError';
        }

        if ( !%Error ) {

            # serialize the change
            my $TemplateContent = $TemplateObject->TemplateSerialize(
                TemplateType => 'ITSMChange',
                StateReset   => $GetParam{StateReset} || 0,
                ChangeID     => $ChangeID,
                UserID       => $Self->{UserID},
            );

            # show error message
            if ( !$TemplateContent ) {
                return $LayoutObject->ErrorScreen(
                    Message => $LayoutObject->{LanguageObject}
                        ->Translate( 'The change "%s" could not be serialized.', $ChangeID ),
                    Comment => Translatable('Please contact the administrator.'),
                );
            }

            # if this change was created from a template and should be saved back
            if ( $TemplateID && $GetParam{OverwriteTemplate} ) {

                my $UpdateSuccess = $TemplateObject->TemplateUpdate(
                    TemplateID => $TemplateID,
                    Name       => $GetParam{TemplateName},
                    Comment    => $GetParam{Comment},
                    ValidID    => $GetParam{ValidID},
                    Content    => $TemplateContent,
                    UserID     => $Self->{UserID},
                );

                # show error message
                if ( !$UpdateSuccess ) {
                    return $LayoutObject->ErrorScreen(
                        Message => $LayoutObject->{LanguageObject}
                            ->Translate( 'Could not update the template "%s".', $TemplateID ),
                        Comment => Translatable('Please contact the administrator.'),
                    );
                }
            }
            else {
                # store the serialized change as a new template
                $TemplateID = $TemplateObject->TemplateAdd(
                    Name         => $GetParam{TemplateName},
                    Comment      => $GetParam{Comment},
                    ValidID      => $GetParam{ValidID},
                    TemplateType => 'ITSMChange',
                    Content      => $TemplateContent,
                    UserID       => $Self->{UserID},
                );

                # show error message
                if ( !$TemplateID ) {
                    return $LayoutObject->ErrorScreen(
                        Message => Translatable('Could not add the template.'),
                        Comment => Translatable('Please contact the administrator.'),
                    );
                }
            }

            # define redirect URL
            my $RedirectURL = "Action=AgentITSMChangeZoom;ChangeID=$ChangeID";

            # if the original change should be deleted
            if ( $GetParam{DeleteChange} ) {

                # delete the change
                my $DeleteSuccess = $ChangeObject->ChangeDelete(
                    ChangeID => $ChangeID,
                    UserID   => $Self->{UserID},
                );

                # show error message
                if ( !$DeleteSuccess ) {
                    return $LayoutObject->ErrorScreen(
                        Message =>
                            $LayoutObject->{LanguageObject}->Translate( 'Could not delete change "%s".', $ChangeID ),
                        Comment => Translatable('Please contact the administrator.'),
                    );
                }

                # delete the user preference entry
                delete $Object2Template{ 'ChangeID' . $ChangeID };

                # redirect to template overview
                $RedirectURL = 'Action=AgentITSMTemplateOverview';
            }

            # update the user preference with the new template id
            elsif ( $Object2Template{ 'ChangeID' . $ChangeID } ) {
                $Object2Template{ 'ChangeID' . $ChangeID } = $TemplateID;
            }

            # convert to string
            $TemplateEditPreferenceString = '';
            for my $Object ( sort keys %Object2Template ) {
                $TemplateEditPreferenceString .= $Object . '::' . $Object2Template{$Object} . ';';
            }

            # save preferences
            $UserObject->SetPreferences(
                Key    => 'UserITSMChangeManagementTemplateEdit',
                Value  => $TemplateEditPreferenceString,
                UserID => $Self->{UserID},
            );

            # load new URL in parent window and close popup
            return $LayoutObject->PopupClose(
                URL => $RedirectURL,
            );
        }
    }

    # output header
    my $Output = $LayoutObject->Header(
        Type  => 'Small',
        Title => Translatable('Template'),
    );

    # get valid object
    my $ValidObject = $Kernel::OM->Get('Kernel::System::Valid');

    # build valid selection
    my $ValidSelectionString = $LayoutObject->BuildSelection(
        Data => {
            $ValidObject->ValidList(),
        },
        Name       => 'ValidID',
        SelectedID => $GetParam{ValidID} || ( $ValidObject->ValidIDsGet() )[0],
        Sort       => 'NumericKey',
        Class      => 'Modernize',
    );

    # build selection string for state reset
    my $StateResetSelectionString = $LayoutObject->BuildSelection(
        Data => {
            0 => Translatable('No'),
            1 => Translatable('Yes'),
        },
        Name       => 'StateReset',
        SelectedID => $GetParam{StateReset} // 1,
        Class      => 'Modernize',
    );

    # show dropdowns only if this change was created from a template
    if ($TemplateID) {

        # build selection string for template overwrite, default is yes
        my $OverwriteTemplateSelectionString = $LayoutObject->BuildSelection(
            Data => {
                0 => Translatable('No'),
                1 => Translatable('Yes'),
            },
            Name       => 'OverwriteTemplate',
            SelectedID => $GetParam{OverwriteTemplate} // 1,
            Class      => 'Modernize',
        );

        # show overwrite original template dropdown
        $LayoutObject->Block(
            Name => 'OverwriteTemplate',
            Data => {
                %GetParam,
                OverwriteTemplateSelectionString => $OverwriteTemplateSelectionString,
            },
        );

        # build selection string for delete change
        my $DeleteChangeSelectionString = $LayoutObject->BuildSelection(
            Data => {
                0 => Translatable('No'),
                1 => Translatable('Yes'),
            },
            Name       => 'DeleteChange',
            SelectedID => $GetParam{DeleteChange} // 1,
            Class      => 'Modernize',
        );

        # show delete change dropdown
        $LayoutObject->Block(
            Name => 'DeleteChange',
            Data => {
                %GetParam,
                DeleteChangeSelectionString => $DeleteChangeSelectionString,
            },
        );
    }

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMChangeTemplate',
        Data         => {
            %GetParam,
            ChangeID                  => $ChangeID,
            ValidSelectionString      => $ValidSelectionString,
            StateResetSelectionString => $StateResetSelectionString,
            ChangeNumber              => $Change->{ChangeNumber},
            ChangeTitle               => $Change->{ChangeTitle},
            %Error,
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer( Type => 'Small' );

    return $Output;
}

1;
