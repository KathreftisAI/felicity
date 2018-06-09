# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeCondition;

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

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # store needed parameters in %GetParam to make this page reloadable
    my %GetParam;
    for my $ParamName (qw(ChangeID ConditionID AddCondition)) {
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    if ( !$GetParam{ChangeID} ) {
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
        ChangeID => $GetParam{ChangeID},
        UserID   => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message => $LayoutObject->{LanguageObject}->Translate(
                'You need %s permissions!', $Self->{Config}->{Permission}
            ),
            WithHeader => 'yes',
        );
    }

    # get change data
    my $ChangeData = $ChangeObject->ChangeGet(
        ChangeID => $GetParam{ChangeID},
        UserID   => $Self->{UserID},
    );

    # check if change is found
    if ( !$ChangeData ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'Change "%s" not found in database!', $GetParam{ChangeID} ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get valid list
    my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();

    # add condition button was pressed
    if ( $GetParam{AddCondition} ) {

        # redirect to condition edit mask
        return $LayoutObject->Redirect(
            OP =>
                "Action=AgentITSMChangeConditionEdit;ChangeID=$GetParam{ChangeID};ConditionID=NEW",
        );
    }

    # get condition object
    my $ConditionObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition');

    # get all condition ids for the given change id, including invalid conditions
    my $ConditionIDsRef = $ConditionObject->ConditionList(
        ChangeID => $GetParam{ChangeID},
        Valid    => 0,
        UserID   => $Self->{UserID},
    );

    # check if a condition should be deleted
    for my $ConditionID ( @{$ConditionIDsRef} ) {
        if ( $ParamObject->GetParam( Param => 'DeleteConditionID::' . $ConditionID ) ) {

            # delete the condition
            my $Success = $ConditionObject->ConditionDelete(
                ConditionID => $ConditionID,
                UserID      => $Self->{UserID},
            );

            # check error
            if ( !$Success ) {
                return $LayoutObject->ErrorScreen(
                    Message =>
                        $LayoutObject->{LanguageObject}->Translate( 'Could not delete ConditionID %s!', $ConditionID ),
                    Comment => Translatable('Please contact the admin.'),
                );
            }

            # redirect to overview
            return $LayoutObject->Redirect(
                OP => "Action=$Self->{Action};ChangeID=$GetParam{ChangeID}",
            );
        }
    }

    # only show the table headline if there conditions to be shown
    if ( @{$ConditionIDsRef} ) {

        # output overview
        $LayoutObject->Block(
            Name => 'Overview',
            Data => {
                %Param,
                %{$ChangeData},
            },
        );
    }

    for my $ConditionID ( @{$ConditionIDsRef} ) {

        # get condition data
        my $ConditionData = $ConditionObject->ConditionGet(
            ConditionID => $ConditionID,
            UserID      => $Self->{UserID},
        );

        # output overview row
        $LayoutObject->Block(
            Name => 'OverviewRow',
            Data => {
                Valid => $ValidList{ $ConditionData->{ValidID} },
                %{$ConditionData},
            },
        );
    }

    # output header
    my $Output = $LayoutObject->Header(
        Title => Translatable('Overview'),
        Type  => 'Small',
    );

    # generate output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMChangeCondition',
        Data         => {
            %Param,
            %{$ChangeData},
        },
    );
    $Output .= $LayoutObject->Footer( Type => 'Small' );

    return $Output;
}

1;
