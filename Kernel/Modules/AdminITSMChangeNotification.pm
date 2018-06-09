# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminITSMChangeNotification;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);
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

    # hash with feedback to the user
    my %Notification;

    # get needed objects
    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
    my $NotificationObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Notification');
    my $ParamObject        = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $RichText = $ConfigObject->Get('Frontend::RichText');

    if ( $RichText && !$ConfigObject->Get("ITSMChange::Frontend::$Self->{Action}")->{RichText} ) {
        $RichText = 0;
    }

    # set content type for notifications
    my $ContentType = 'text/plain';
    if ($RichText) {
        $ContentType = 'text/html';
    }

    # ------------------------------------------------------------ #
    # change
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'Change' ) {
        my $ID = $ParamObject->GetParam( Param => 'ID' ) || '';
        my $Data = $NotificationObject->NotificationRuleGet( ID => $ID );

        $Self->_Edit(
            Action      => 'Change',
            ActionLabel => 'Edit',
            RichText    => $RichText,
            %{$Data},
        );
    }

    # ------------------------------------------------------------ #
    # change action
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'ChangeAction' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my %GetParam;

        # get scalar parameters
        for my $Param (qw(ID Name EventID Comment ValidID Attribute Rule)) {
            $GetParam{$Param} = $ParamObject->GetParam( Param => $Param ) || '';
        }

        # get array parameters
        $GetParam{RecipientIDs} = [
            $ParamObject->GetArray( Param => 'RecipientIDs' )
        ];

        # get message parameters for agents and customers and each present language
        for my $Type (qw(Agent Customer)) {

            my @LanguageIDs = $ParamObject->GetArray( Param => $Type . '_LanguageID' );

            # get the subject and body for all languages
            for my $LanguageID (@LanguageIDs) {

                my $Subject = $ParamObject->GetParam( Param => $Type . '_' . $LanguageID . '_Subject' ) || '';
                my $Body    = $ParamObject->GetParam( Param => $Type . '_' . $LanguageID . '_Body' )    || '';

                $GetParam{Message}->{$Type}->{$LanguageID} = {
                    Subject     => $Subject,
                    Body        => $Body,
                    ContentType => $ContentType,
                };

                # set server error flag if field is empty
                if ( !$Subject ) {
                    $GetParam{ $Type . '_' . $LanguageID . '_SubjectServerError' } = "ServerError";
                }
                if ( !$Body ) {
                    $GetParam{ $Type . '_' . $LanguageID . '_BodyServerError' } = "ServerError";
                }
            }
        }

        # update notification
        if ( $NotificationObject->NotificationRuleUpdate(%GetParam) ) {
            $Self->_Overview();

            # notification was updated
            %Notification = (
                Info => Translatable('Notification updated!'),
            );
        }
        else {

            # an error occured -> show notification
            %Notification = ( Priority => 'Error' );

            $Self->_Edit(
                Action      => 'Change',
                ActionLabel => 'Edit',
                RichText    => $RichText,
                %GetParam,
            );
        }
    }

    # ------------------------------------------------------------ #
    # add
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Add' ) {
        $Self->_Edit(
            Action      => 'Add',
            ActionLabel => 'Add',
            RichText    => $RichText,
        );
    }

    # ------------------------------------------------------------ #
    # add action
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AddAction' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my %GetParam;

        # get scalar parameters
        for my $Param (qw(ID Name EventID Comment ValidID Attribute Rule)) {
            $GetParam{$Param} = $ParamObject->GetParam( Param => $Param ) || '';
        }

        # get array parameters
        $GetParam{RecipientIDs} = [
            $ParamObject->GetArray( Param => 'RecipientIDs' )
        ];

        # get message parameters for agents and customers and each present language
        for my $Type (qw(Agent Customer)) {

            my @LanguageIDs = $ParamObject->GetArray( Param => $Type . '_LanguageID' );

            # get the subject and body for all languages
            for my $LanguageID (@LanguageIDs) {

                my $Subject = $ParamObject->GetParam( Param => $Type . '_' . $LanguageID . '_Subject' ) || '';
                my $Body    = $ParamObject->GetParam( Param => $Type . '_' . $LanguageID . '_Body' )    || '';

                $GetParam{Message}->{$Type}->{$LanguageID} = {
                    Subject     => $Subject,
                    Body        => $Body,
                    ContentType => $ContentType,
                };

                # set server error flag if field is empty
                if ( !$Subject ) {
                    $GetParam{ $Type . '_' . $LanguageID . '_SubjectServerError' } = "ServerError";
                }
                if ( !$Body ) {
                    $GetParam{ $Type . '_' . $LanguageID . '_BodyServerError' } = "ServerError";
                }
            }
        }

        # add notification
        if ( $NotificationObject->NotificationRuleAdd(%GetParam) ) {
            $Self->_Overview();

            # notification was updated
            %Notification = (
                Info => Translatable('Notification added!'),
            );
        }
        else {

            # an error occured -> show notification
            %Notification = ( Priority => 'Error' );

            $Self->_Edit(
                Action      => 'Add',
                ActionLabel => 'Add',
                RichText    => $RichText,
                %GetParam,
            );
        }
    }

    # ------------------------------------------------------------ #
    # delete
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Delete' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my %GetParam;
        for my $Parameter (qw(ID)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

        my $Delete = $NotificationObject->NotificationRuleDelete(
            ID => $GetParam{ID},
        );
        if ( !$Delete ) {
            return $LayoutObject->ErrorScreen();
        }

        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
    }

    # ------------------------------------------------------------ #
    # NotificationCopy
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'NotificationCopy' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my %GetParam;
        for my $Parameter (qw(ID)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

        # get Notification data
        my $Data = $NotificationObject->NotificationRuleGet(
            ID => $GetParam{ID},
        );

        if ( !IsHashRefWithData($Data) ) {
            return $LayoutObject->ErrorScreen(
                Message => $LayoutObject->{LanguageObject}->Translate( 'Unknown notification %s!', $GetParam{ID} ),
            );
        }

        # create new Notification name
        my $NotificationName =
            $Data->{Name}
            . ' ('
            . $LayoutObject->{LanguageObject}->Translate('Copy')
            . ')';

        # otherwise save configuration and return to overview screen
        my $NewNotificationID = $NotificationObject->NotificationRuleAdd(
            %{$Data},
            Name => $NotificationName,
        );

        # show error if can't create
        if ( !$NewNotificationID ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('There was an error creating the notification.'),
            );
        }

        # return to overview
        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
    }

    # ------------------------------------------------------------
    # overview
    # ------------------------------------------------------------
    else {
        $Self->_Overview();
    }

    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();

    if (%Notification) {
        $Output .= $LayoutObject->Notify(%Notification) || '';
    }
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminITSMChangeNotification',
        Data         => \%Param,
    );
    $Output .= $LayoutObject->Footer();

}

# show the edit mask for a notification rule
sub _Edit {
    my ( $Self, %Param ) = @_;

    # get needed objects
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject    = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');
    my $ValidObject     = $Kernel::OM->Get('Kernel::System::Valid');

    $LayoutObject->Block(
        Name => 'Overview',
        Data => \%Param,
    );
    $LayoutObject->Block( Name => 'ActionList' );
    $LayoutObject->Block( Name => 'ActionOverview' );

    $Param{ValidOption} = $LayoutObject->BuildSelection(
        Data => {
            $ValidObject->ValidList(),
        },
        Name       => 'ValidID',
        SelectedID => $Param{ValidID} || ( $ValidObject->ValidIDsGet() )[0],
        Sort       => 'NumericKey',
    );
    $Param{EventOption} = $LayoutObject->BuildSelection(
        Data => $Kernel::OM->Get('Kernel::System::ITSMChange::History')->HistoryTypeList( UserID => 1 ) || [],
        Name => 'EventID',
        SelectedID => $Param{EventID},
    );
    $Param{RecipientOption} = $LayoutObject->BuildSelection(
        Data => $Kernel::OM->Get('Kernel::System::ITSMChange::Notification')->RecipientList( UserID => 1 ) || [],
        Name => 'RecipientIDs',
        Multiple   => 1,
        Size       => 13,                     # current number of default recipients, avoid scrolling
        SelectedID => $Param{RecipientIDs},
    );

    $LayoutObject->Block(
        Name => 'OverviewUpdate',
        Data => \%Param,
    );

    # add rich text editor
    if ( $Param{RichText} ) {

        # use height/width defined for this screen
        my $Config = $ConfigObject->Get("ITSMChange::Frontend::$Self->{Action}");
        $Param{RichTextHeight} = $Config->{RichTextHeight} || 0;
        $Param{RichTextWidth}  = $Config->{RichTextWidth}  || 0;

        $LayoutObject->Block(
            Name => 'RichText',
            Data => \%Param,
        );
    }

    # show differnet widget containers for agent and customer notifications
    for my $Type (qw(Agent Customer)) {

        # show the widget container for this type
        $LayoutObject->Block(
            Name => 'NotificationType',
            Data => {
                %Param,
                Type => $Type,
            },
        );

        # get language ids from message parameter, use English if no message is given
        # make sure English is the first language
        my @LanguageIDs;
        if ( IsHashRefWithData( $Param{Message}->{$Type} ) ) {
            if ( $Param{Message}->{$Type}->{en} ) {
                push @LanguageIDs, 'en';
            }
            LANGUAGEID:
            for my $LanguageID ( sort keys %{ $Param{Message}->{$Type} } ) {
                next LANGUAGEID if $LanguageID eq 'en';
                push @LanguageIDs, $LanguageID;
            }
        }
        else {
            @LanguageIDs = ('en');
        }

        my %DefaultUsedLanguages         = %{ $ConfigObject->Get('DefaultUsedLanguages') };
        my %OriginalDefaultUsedLanguages = %DefaultUsedLanguages;

        for my $LanguageID (@LanguageIDs) {

            # format the content according to the content type
            if ( $Param{RichText} ) {

                # make sure body is rich text (if body is based on config)
                if (
                    $Param{Message}->{$Type}->{$LanguageID}->{ContentType}
                    && $Param{Message}->{$Type}->{$LanguageID}->{ContentType} =~ m{text\/plain}xmsi
                    )
                {
                    $Param{Message}->{$Type}->{$LanguageID}->{Body} = $HTMLUtilsObject->ToHTML(
                        String => $Param{Message}->{$Type}->{$LanguageID}->{Body},
                    );
                }
            }
            else {

                # reformat from HTML to plain
                if (
                    $Param{Message}->{$Type}->{$LanguageID}->{ContentType}
                    && $Param{Message}->{$Type}->{$LanguageID}->{ContentType} =~ m{text\/html}xmsi
                    && $Param{Message}->{$Type}->{$LanguageID}->{Body}
                    )
                {
                    $Param{Message}->{$Type}->{$LanguageID}->{Body} = $HTMLUtilsObject->ToAscii(
                        String => $Param{Message}->{$Type}->{$LanguageID}->{Body},
                    );
                }
            }

            # show the notification for this language
            $LayoutObject->Block(
                Name => 'NotificationLanguage',
                Data => {
                    %Param,
                    Subject => $Param{Message}->{$Type}->{$LanguageID}->{Subject} || '',
                    Body    => $Param{Message}->{$Type}->{$LanguageID}->{Body}    || '',
                    Type    => $Type,
                    LanguageID         => $LanguageID,
                    Language           => $DefaultUsedLanguages{$LanguageID},
                    SubjectServerError => $Param{ $Type . '_' . $LanguageID . '_SubjectServerError' } || '',
                    BodyServerError    => $Param{ $Type . '_' . $LanguageID . '_BodyServerError' } || '',
                },
            );

            # show the button to remove a notification only if it is not the English notification
            if ( $LanguageID ne 'en' ) {
                $LayoutObject->Block(
                    Name => 'NotificationLanguageRemoveButton',
                    Data => {
                        %Param,
                        LanguageID => $Type . '_' . $LanguageID,
                        Type       => $Type,
                    },
                );
            }

            # delete language from drop-down list because it is already shown
            delete $DefaultUsedLanguages{$LanguageID};
        }

        # show language add dropdown
        $Param{LanguageStrg} = $LayoutObject->BuildSelection(
            Data         => \%DefaultUsedLanguages,
            Name         => $Type . 'LanguageAdd',
            Class        => 'LanguageAdd',
            Translation  => 1,
            PossibleNone => 1,
            HTMLQuote    => 0,
        );
        $Param{LanguageOrigStrg} = $LayoutObject->BuildSelection(
            Data         => \%OriginalDefaultUsedLanguages,
            Name         => $Type . 'LanguageOrig',
            Translation  => 1,
            PossibleNone => 1,
            HTMLQuote    => 0,
        );
        $LayoutObject->Block(
            Name => 'NotificationLanguageAdd',
            Data => {
                %Param,
                Type => $Type,
            },
        );
    }

    return 1;
}

# show a table of notification rules
sub _Overview {
    my ( $Self, %Param ) = @_;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    $LayoutObject->Block(
        Name => 'Overview',
        Data => \%Param,
    );

    $LayoutObject->Block( Name => 'ActionList' );
    $LayoutObject->Block( Name => 'ActionAdd' );

    $LayoutObject->Block(
        Name => 'OverviewResult',
        Data => \%Param,
    );

    # get notification object
    my $NotificationObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Notification');

    my $RuleIDs = $NotificationObject->NotificationRuleList() || [];

    # get valid list
    my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();
    for my $RuleID ( @{$RuleIDs} ) {

        my $Data = $NotificationObject->NotificationRuleGet( ID => $RuleID );
        my $Recipients = join ', ', @{ $Data->{Recipients} || [] };

        $LayoutObject->Block(
            Name => 'OverviewResultRow',
            Data => {
                Valid => $ValidList{ $Data->{ValidID} },
                %{$Data},
                Recipients => $Recipients,
            },
        );
    }
    return 1;
}

1;
