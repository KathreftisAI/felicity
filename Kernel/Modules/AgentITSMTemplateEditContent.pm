# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMTemplateEditContent;

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

    # get change object
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

    # get config for frontend
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMChange::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $ChangeObject->Permission(
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

    # create a new change or workorder so it can be edited
    if ( $Self->{Subaction} eq 'TemplateEditContent' ) {

        # get current system time in epoch seconds
        my $SystemTime = $Kernel::OM->Get('Kernel::System::Time')->SystemTime();

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

        # edit a change template
        if ( $Template->{Type} eq 'ITSMChange' ) {

            # create change based on the template
            my $ChangeID = $TemplateObject->TemplateDeSerialize(
                TemplateID      => $TemplateID,
                MoveTimeType    => 'PlannedStartTime',
                NewTimeInEpoche => $SystemTime,
                UserID          => $Self->{UserID},
            );

            # show error message, when adding failed
            if ( !$ChangeID ) {

                return $LayoutObject->ErrorScreen(
                    Message => Translatable('Was not able to create change from template!'),
                    Comment => Translatable('Please contact the admin.'),
                );
            }

            # store the change id to template id reference
            $Object2Template{ 'ChangeID' . $ChangeID } = $TemplateID;

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

            # redirect to change zoom mask, when adding was successful
            return $LayoutObject->Redirect(
                OP => "Action=AgentITSMChangeZoom;ChangeID=$ChangeID",
            );
        }

        # edit a workorder template
        elsif ( $Template->{Type} eq 'ITSMWorkOrder' ) {

            # add a dummy change, needed to contain the workorder
            my $ChangeID = $ChangeObject->ChangeAdd(
                ChangeTitle => $Self->{Config}->{DefaultChangeTitle},
                UserID      => $Self->{UserID},
            );

            # show error message, when adding failed
            if ( !$ChangeID ) {
                return $LayoutObject->ErrorScreen(
                    Message => Translatable('Was not able to create change!'),
                    Comment => Translatable('Please contact the admin.'),
                );
            }

            # create workorder based on the template, and add it to the dummy change
            my $WorkOrderID = $TemplateObject->TemplateDeSerialize(
                ChangeID        => $ChangeID,
                TemplateID      => $TemplateID,
                MoveTimeType    => 'PlannedStartTime',
                NewTimeInEpoche => $SystemTime,
                UserID          => $Self->{UserID},
            );

            # show error message, when adding failed
            if ( !$WorkOrderID ) {

                # show error message, when adding failed
                return $LayoutObject->ErrorScreen(
                    Message => Translatable('Was not able to create workorder from template!'),
                    Comment => Translatable('Please contact the admin.'),
                );
            }

            # store the workorder id to template id reference
            $Object2Template{ 'WorkOrderID' . $WorkOrderID } = $TemplateID;

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

            # redirect to workorder zoom mask, when adding was successful
            return $LayoutObject->Redirect(
                OP => "Action=AgentITSMWorkOrderZoom;WorkOrderID=$WorkOrderID",
            );
        }
    }

    # show a dialog before creating a new change or workorder to be edited
    elsif ( $Self->{Subaction} eq 'TemplateEditContentShowDialog' ) {

        # show the edit content dialog
        $LayoutObject->Block(
            Name => 'EditContentDialog',
            Data => {
                %{$Template},
            },
        );

        # show the correct block depending on template type
        if ( $Template->{Type} eq 'ITSMChange' ) {
            $LayoutObject->Block(
                Name => 'ChangeTemplate',
                Data => {
                    %{$Template},
                },
            );
        }
        elsif ( $Template->{Type} eq 'ITSMWorkOrder' ) {
            $LayoutObject->Block(
                Name => 'WorkOrderTemplate',
                Data => {
                    %{$Template},
                },
            );
        }

        # output content
        my $Output = $LayoutObject->Output(
            TemplateFile => 'AgentITSMTemplateEditContent',
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
}

1;
