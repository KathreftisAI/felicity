# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMWorkOrderTemplate;

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

    # get needed object
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get needed WorkOrderID
    my $WorkOrderID = $ParamObject->GetParam( Param => 'WorkOrderID' );

    # check needed stuff
    if ( !$WorkOrderID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No WorkOrderID is given!'),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get workorder data
    my $WorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
        WorkOrderID => $WorkOrderID,
        UserID      => $Self->{UserID},
    );

    # check if LayoutObject has TranslationObject
    if ( $LayoutObject->{LanguageObject} ) {

        # translate workorder type
        $WorkOrder->{WorkOrderType} = $LayoutObject->{LanguageObject}->Translate(
            $WorkOrder->{WorkOrderType}
        );
    }

    # check error
    if ( !$WorkOrder ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'WorkOrder "%s" not found in database!', $WorkOrderID ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get change object
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMWorkOrder::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $ChangeObject->Permission(
        Type        => $Self->{Config}->{Permission},
        Action      => $Self->{Action},
        ChangeID    => $WorkOrder->{ChangeID},
        WorkOrderID => $WorkOrderID,
        UserID      => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'You need %s permissions!', $Self->{Config}->{Permission} ),
            WithHeader => 'yes',
        );
    }

    # store needed parameters in %GetParam to make it reloadable
    my %GetParam;
    for my $ParamName (
        qw(TemplateName Comment ValidID StateReset OverwriteTemplate DeleteWorkOrder)
        )
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
    my $TemplateID = $Object2Template{ 'WorkOrderID' . $WorkOrderID };

    # get template object
    my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template');

    # check if this workorder was created by this user using a template
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

            # serialize the workorder
            my $TemplateContent = $TemplateObject->TemplateSerialize(
                TemplateType => 'ITSMWorkOrder',
                StateReset   => $GetParam{StateReset} || 0,
                WorkOrderID  => $WorkOrderID,
                UserID       => $Self->{UserID},
            );

            # show error message
            if ( !$TemplateContent ) {
                return $LayoutObject->ErrorScreen(
                    Message => $LayoutObject->{LanguageObject}->Translate(
                        'The workorder "%s" could not be serialized.', $WorkOrderID
                    ),
                    Comment => Translatable('Please contact the administrator.'),
                );
            }

            # if this workorder was created from a template and should be saved back
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
                # store the serialized workorder as a new template
                $TemplateID = $TemplateObject->TemplateAdd(
                    Name         => $GetParam{TemplateName},
                    Comment      => $GetParam{Comment},
                    ValidID      => $GetParam{ValidID},
                    TemplateType => 'ITSMWorkOrder',
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
            my $RedirectURL = "Action=AgentITSMWorkOrderZoom;WorkOrderID=$WorkOrderID";

            # if the original change and all workorders should be deleted
            if ( $GetParam{DeleteWorkOrder} ) {

                # delete the change and all workorders (including this one)
                my $DeleteSuccess = $ChangeObject->ChangeDelete(
                    ChangeID => $WorkOrder->{ChangeID},
                    UserID   => $Self->{UserID},
                );

                # show error message
                if ( !$DeleteSuccess ) {
                    return $LayoutObject->ErrorScreen(
                        Message => $LayoutObject->{LanguageObject}->Translate(
                            'Could not delete change "%s".', $WorkOrder->{ChangeID}
                        ),
                        Comment => Translatable('Please contact the administrator.'),
                    );
                }

                # delete the user preference entry
                delete $Object2Template{ 'WorkOrderID' . $WorkOrderID };

                # redirect to template overview
                $RedirectURL = 'Action=AgentITSMTemplateOverview';
            }

            # update the user preference with the new template id
            elsif ( $Object2Template{ 'WorkOrderID' . $WorkOrderID } ) {
                $Object2Template{ 'WorkOrderID' . $WorkOrderID } = $TemplateID;
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

    # get change that the workorder belongs to
    my $Change = $ChangeObject->ChangeGet(
        ChangeID => $WorkOrder->{ChangeID},
        UserID   => $Self->{UserID},
    );

    # no change found
    if ( !$Change ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'Could not find Change for WorkOrder %s!', $WorkOrderID ),
            Comment => Translatable('Please contact the administrator.'),
        );
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

    # show dropdowns only if this workorder was created from a template
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

        # build selection string for delete workorder
        my $DeleteWorkOrderSelectionString = $LayoutObject->BuildSelection(
            Data => {
                0 => Translatable('No'),
                1 => Translatable('Yes'),
            },
            Name       => 'DeleteWorkOrder',
            SelectedID => $GetParam{DeleteWorkOrder} // 1,
            Class      => 'Modernize',
        );

        # show delete WorkOrder dropdown
        $LayoutObject->Block(
            Name => 'DeleteWorkOrder',
            Data => {
                %GetParam,
                DeleteWorkOrderSelectionString => $DeleteWorkOrderSelectionString,
            },
        );
    }

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMWorkOrderTemplate',
        Data         => {
            %GetParam,
            %{$Change},
            %{$WorkOrder},
            ValidSelectionString      => $ValidSelectionString,
            StateResetSelectionString => $StateResetSelectionString,
            %Error,
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer( Type => 'Small' );

    return $Output;
}

1;
