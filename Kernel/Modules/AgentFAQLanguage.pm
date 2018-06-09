# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentFAQLanguage;

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

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # permission check
    if ( !$Self->{AccessRw} ) {
        return $LayoutObject->NoPermission(
            Message    => Translatable('You need rw permission!'),
            WithHeader => 'yes',
        );
    }

    my %GetParam;

    my $MultiLanguage = $Kernel::OM->Get('Kernel::Config')->Get('FAQ::MultiLanguage');

    # get needed objects
    my $FAQObject   = $Kernel::OM->Get('Kernel::System::FAQ');
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # ------------------------------------------------------------ #
    # change
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'Change' && $MultiLanguage ) {

        # get the LanguageID
        my $LanguageID = $ParamObject->GetParam( Param => 'LanguageID' ) || '';

        # check required parameters
        if ( !$LanguageID ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No LanguageID is given!'),
                Comment => Translatable('Please contact the administrator.'),
            );
        }

        # get language data
        my %LanguageData = $FAQObject->LanguageGet(
            LanguageID => $LanguageID,
            UserID     => $Self->{UserID},
        );

        # header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # output change language screen
        $Self->_Edit(
            Action => 'Change',
            %LanguageData,
            %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentFAQLanguage',
            Data         => {
                %Param,
            },
        );

        # footer
        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # change action
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'ChangeAction' && $MultiLanguage ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        # header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # check for name and language id
        for my $ParamName (qw(LanguageID Name)) {

            # store needed parameters in %GetParam to make it re-loadable
            $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );

            if ( !$GetParam{$ParamName} ) {

                # HTML output
                $Self->_Edit(
                    Action                 => 'Change',
                    NameServerError        => 'ServerError',
                    NameServerErrorMessage => Translatable('The name is required!'),
                    %GetParam,
                );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'AgentFAQLanguage',
                    Data         => \%Param,
                );

                # footer
                $Output .= $LayoutObject->Footer();

                return $Output;
            }
        }

        # check for duplicate language name
        my $LanguageExistsAlready = $FAQObject->LanguageDuplicateCheck(
            Name       => $GetParam{Name},
            LanguageID => $GetParam{LanguageID},
            UserID     => $Self->{UserID},
        );

        # show the edit screen again
        if ($LanguageExistsAlready) {

            # HTML output
            $Self->_Edit(
                Action                 => 'Change',
                NameServerError        => 'ServerError',
                NameServerErrorMessage => Translatable('This language already exists!'),
                %GetParam,
            );
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AgentFAQLanguage',
                Data         => \%Param,
            );

            # footer
            $Output .= $LayoutObject->Footer();

            return $Output;
        }

        # update the language
        my $LanguageUpdateSuccessful = $FAQObject->LanguageUpdate(
            %GetParam,
            UserID => $Self->{UserID},
        );

        # check error
        if ( !$LanguageUpdateSuccessful ) {
            return $LayoutObject->ErrorScreen();
        }

        # show overview
        $Self->_Overview();
        $Output .= $LayoutObject->Notify(
            Info => Translatable('FAQ language updated!'),
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentFAQLanguage',
            Data         => \%Param,
        );

        # footer
        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # add
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Add' && $MultiLanguage ) {

        # get the new name
        $GetParam{Name} = $ParamObject->GetParam( Param => 'Name' );

        # header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # HTML output
        $Self->_Edit(
            Action => 'Add',
            %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentFAQLanguage',
            Data         => {
                %Param,
            },
        );

        # footer
        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # add action
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AddAction' && $MultiLanguage ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        # header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # get the name
        $GetParam{Name} = $ParamObject->GetParam( Param => 'Name' );

        # check for name
        if ( !$GetParam{Name} ) {

            # HTML output
            $Self->_Edit(
                Action                 => 'Add',
                NameServerError        => 'ServerError',
                NameServerErrorMessage => Translatable('The name is required!'),
                %GetParam,
            );
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AgentFAQLanguage',
                Data         => \%Param,
            );

            # footer
            $Output .= $LayoutObject->Footer();

            return $Output;
        }

        # check for duplicate language name
        my $LanguageExistsAlready = $FAQObject->LanguageDuplicateCheck(
            Name   => $GetParam{Name},
            UserID => $Self->{UserID},
        );

        # show the edit screen again
        if ($LanguageExistsAlready) {
            $Self->_Edit(
                Action                 => 'Add',
                NameServerError        => 'ServerError',
                NameServerErrorMessage => Translatable('This language already exists!'),
                %GetParam,
            );
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AgentFAQLanguage',
                Data         => \%Param,
            );

            # footer
            $Output .= $LayoutObject->Footer();

            return $Output;
        }

        # add the new language
        my $LanguageAddSuccessful = $FAQObject->LanguageAdd(
            %GetParam,
            UserID => $Self->{UserID},
        );

        # check error
        if ( !$LanguageAddSuccessful ) {
            return $LayoutObject->ErrorScreen();
        }

        # show overview
        $Output .= $LayoutObject->Notify(
            Info => Translatable('FAQ language added!'),
        );
        $Self->_Overview();
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentFAQLanguage',
            Data         => {
                %Param,
            },
        );

        # footer
        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # delete
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Delete' && $MultiLanguage ) {

        # get the LanguageID
        my $LanguageID = $ParamObject->GetParam( Param => 'LanguageID' ) || '';

        # check required parameters
        if ( !$LanguageID ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No LanguageID is given!'),
                Comment => Translatable('Please contact the administrator.'),
            );
        }

        # get language data
        my %LanguageData = $FAQObject->LanguageGet(
            LanguageID => $LanguageID,
            UserID     => $Self->{UserID},
        );

        if ( !%LanguageData ) {
            return $LayoutObject->ErrorScreen();
        }

        my @AffectedItems = $FAQObject->FAQSearch(
            LanguageIDs => [$LanguageID],
            UserID      => 1,
        );

        # call Delete block
        $LayoutObject->Block(
            Name => 'Delete',
            Data => {%LanguageData},
        );

        # set the dialog type. As default, the dialog will have 2 buttons: Yes and No
        my $DialogType = 'Confirmation';

        # display list of affected FAQ articles
        if (@AffectedItems) {

            # set the dialog type to have only 1 button: OK
            $DialogType = 'Message';

            $LayoutObject->Block(
                Name => 'AffectedItems',
                Data => {},
            );

            ITEMID:
            for my $ItemID (@AffectedItems) {

                # get FAQ article
                my %FAQData = $FAQObject->FAQGet(
                    ItemID     => $ItemID,
                    ItemFields => 0,
                    UserID     => $Self->{UserID},
                );

                # check FAQ article
                next ITEMID if !%FAQData;

                $LayoutObject->Block(
                    Name => 'AffectedItemsRow',
                    Data => {
                        %FAQData,
                        %Param,
                    },
                );
            }
        }
        else {
            $LayoutObject->Block(
                Name => 'NoAffectedItems',
                Data => {%LanguageData},
            );
        }

        # output content
        my $Output = $LayoutObject->Output(
            TemplateFile => 'AgentFAQLanguage',
            Data         => {},
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

    # ------------------------------------------------------------ #
    # delete action
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'DeleteAction' && $MultiLanguage ) {

        # get the LanguageID
        my $LanguageID = $ParamObject->GetParam( Param => 'LanguageID' ) || '';

        # check required parameters
        if ( !$LanguageID ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No LanguageID is given!'),
                Comment => Translatable('Please contact the administrator.'),
            );
        }

        # get language data
        my %LanguageData = $FAQObject->LanguageGet(
            LanguageID => $LanguageID,
            UserID     => $Self->{UserID},
        );

        if ( !%LanguageData ) {
            return $LayoutObject->ErrorScreen();
        }

        # delete the language
        my $CouldDeleteLanguage = $FAQObject->LanguageDelete(
            LanguageID => $LanguageID,
            UserID     => $Self->{UserID},
        );

        if ($CouldDeleteLanguage) {

            # redirect to explorer, when the deletion was successful
            return $LayoutObject->Redirect(
                OP => "Action=AgentFAQLanguage",
            );
        }
        else {

            # show error message, when delete failed
            return $LayoutObject->ErrorScreen(
                Message => $LayoutObject->{LanguageObject}->Translate(
                    'Was not able to delete the language %s!',
                    $LanguageID,
                ),
                Comment => Translatable('Please contact the administrator.'),
            );
        }
    }

    # ---------------------------------------------------------- #
    # overview
    # ---------------------------------------------------------- #
    else {

        # header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # HTML output
        $Self->_Overview();
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentFAQLanguage',
            Data         => {
                %Param,
                %GetParam,
            },
        );

        # footer
        $Output .= $LayoutObject->Footer();

        return $Output;
    }
}

sub _Edit {
    my ( $Self, %Param ) = @_;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    $LayoutObject->Block(
        Name => 'Overview',
        Data => \%Param,
    );

    $LayoutObject->Block(
        Name => 'ActionList',
        Data => {},
    );
    $LayoutObject->Block(
        Name => 'ActionOverview',
        Data => {},
    );

    $LayoutObject->Block(
        Name => 'OverviewUpdate',
        Data => \%Param,
    );

    # shows header
    if ( $Param{Action} eq 'Change' ) {
        $LayoutObject->Block(
            Name => 'HeaderEdit',
            Data => {},
        );
    }
    else {
        $LayoutObject->Block(
            Name => 'HeaderAdd',
            Data => {},
        );
    }

    return 1;
}

sub _Overview {
    my ( $Self, %Param ) = @_;

    my $Output = '';

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # output overview blocks
    $LayoutObject->Block(
        Name => 'Overview',
        Data => {},
    );

    my $MultiLanguage = $Kernel::OM->Get('Kernel::Config')->Get('FAQ::MultiLanguage');
    if ($MultiLanguage) {
        $LayoutObject->Block(
            Name => 'ActionList',
            Data => {},
        );
        $LayoutObject->Block(
            Name => 'ActionAdd',
            Data => {},
        );
        $LayoutObject->Block(
            Name => 'OverviewResult',
            Data => {},
        );

        # get FAQ object
        my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

        # get languages list
        my %Languages = $FAQObject->LanguageList(
            UserID => $Self->{UserID},
        );

        # if there are any languages, they are shown
        if (%Languages) {
            for my $LanguageID ( sort { $Languages{$a} cmp $Languages{$b} } keys %Languages ) {

                # get languages result
                my %LanguageData = $FAQObject->LanguageGet(
                    LanguageID => $LanguageID,
                    UserID     => $Self->{UserID},
                );

                #output results
                $LayoutObject->Block(
                    Name => 'OverviewResultRow',
                    Data => {%LanguageData},
                );
            }
        }

        # otherwise a no data found message is displayed
        else {
            $LayoutObject->Block(
                Name => 'NoDataFoundMsg',
                Data => {},
            );
        }
    }
    else {
        $LayoutObject->Block(
            Name => 'Disabled',
            Data => {},
        );
    }
}

1;
