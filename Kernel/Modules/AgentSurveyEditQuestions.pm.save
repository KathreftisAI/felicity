# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentSurveyEditQuestions;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get common objects
    %{$Self} = %Param;

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Output;

    # get needed objects
    my $SurveyObject = $Kernel::OM->Get('Kernel::System::Survey');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get params
    my %GetParam;
    for my $Key (qw(SurveyID QuestionID AnswerID)) {
        $GetParam{$Key} = $ParamObject->GetParam( Param => $Key );
    }

    my $SurveyExists = 'no';
    if ( $GetParam{SurveyID} ) {
        $SurveyExists = $SurveyObject->ElementExists(
            ElementID => $GetParam{SurveyID},
            Element   => 'Survey'
        );
    }

    my $QuestionExists = 'no';
    if ( $GetParam{QuestionID} ) {
        $QuestionExists = $SurveyObject->ElementExists(
            ElementID => $GetParam{QuestionID},
            Element   => 'Question'
        );
    }

    my $AnswerExists = 'no';
    if ( $GetParam{AnswerID} ) {
        $AnswerExists = $SurveyObject->ElementExists(
            ElementID => $GetParam{AnswerID},
            Element   => 'Answer'
        );
    }

    # ------------------------------------------------------------ #
    # question add
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'QuestionAdd' ) {

        my $Question       = $ParamObject->GetParam( Param => "Question" );
        my $Type           = $ParamObject->GetParam( Param => "Type" );
        my $AnswerRequired = $ParamObject->GetParam( Param => 'AnswerRequired' );

        if ( $AnswerRequired && $AnswerRequired eq 'No' ) {
            $AnswerRequired = 0;
        }
        else {
            $AnswerRequired = 1;
        }

        # check if survey exists
        if ( $SurveyExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey!'),
                WithHeader => 'yes',
            );
        }

        my %ServerError;
        if ($Question) {
            $SurveyObject->QuestionAdd(
                SurveyID       => $GetParam{SurveyID},
                Question       => $Question,
                Type           => $Type,
                AnswerRequired => $AnswerRequired,
                UserID         => $Self->{UserID},
            );
            $SurveyObject->QuestionSort(
                SurveyID => $GetParam{SurveyID},
            );
        }
        else {
            $ServerError{Question} = 1;
        }

        return $Self->_MaskQuestionOverview(
            SurveyID    => $GetParam{SurveyID},
            ServerError => \%ServerError,
        );
    }

    # ------------------------------------------------------------ #
    # question delete
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'QuestionDelete' ) {

        # check if survey and question exists
        if ( $SurveyExists ne 'Yes' || $QuestionExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey or question!'),
                WithHeader => 'yes',
            );
        }
        $SurveyObject->QuestionDelete(
            SurveyID   => $GetParam{SurveyID},
            QuestionID => $GetParam{QuestionID},
        );
        $SurveyObject->QuestionSort(
            SurveyID => $GetParam{SurveyID},
        );

        return $LayoutObject->Redirect(
            OP => "Action=$Self->{Action};Subaction=SurveyEdit;SurveyID=$GetParam{SurveyID}#Question",
        );
    }

    # ------------------------------------------------------------ #
    # question up
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'QuestionUp' ) {

        # check if survey and question exists
        if ( $SurveyExists ne 'Yes' || $QuestionExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey or question!'),
                WithHeader => 'yes',
            );
        }
        $SurveyObject->QuestionSort(
            SurveyID => $GetParam{SurveyID},
        );
        $SurveyObject->QuestionUp(
            SurveyID   => $GetParam{SurveyID},
            QuestionID => $GetParam{QuestionID},
        );

        return $LayoutObject->Redirect(
            OP => "Action=$Self->{Action};Subaction=SurveyEdit;SurveyID=$GetParam{SurveyID}#Question",
        );
    }

    # ------------------------------------------------------------ #
    # question down
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'QuestionDown' ) {

        # check if survey and question exists
        if ( $SurveyExists ne 'Yes' || $QuestionExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey or question!'),
                WithHeader => 'yes',
            );
        }
        $SurveyObject->QuestionSort(
            SurveyID => $GetParam{SurveyID},
        );
        $SurveyObject->QuestionDown(
            SurveyID   => $GetParam{SurveyID},
            QuestionID => $GetParam{QuestionID},
        );

        return $LayoutObject->Redirect(
            OP => "Action=$Self->{Action};Subaction=SurveyEdit;SurveyID=$GetParam{SurveyID}#Question",
        );
    }

    # ------------------------------------------------------------ #
    # question edit
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'QuestionEdit' ) {

        # check if survey and question exists
        if ( $SurveyExists ne 'Yes' || $QuestionExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey or question!'),
                WithHeader => 'yes',
            );
        }

        return $Self->_MaskQuestionEdit(
            SurveyID   => $GetParam{SurveyID},
            QuestionID => $GetParam{QuestionID},
        );
    }

    # ------------------------------------------------------------ #
    # question save
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'QuestionSave' ) {

        my $Question       = $ParamObject->GetParam( Param => 'Question' );
        my $AnswerRequired = $ParamObject->GetParam( Param => 'AnswerRequired' );

        if ( $AnswerRequired && $AnswerRequired eq 'No' ) {
            $AnswerRequired = 0;
        }
        else {
            $AnswerRequired = 1;
        }

        # check if survey and question exists
        if ( $SurveyExists ne 'Yes' || $QuestionExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey or question!'),
                WithHeader => 'yes',
            );
        }

        my %ServerError;
        if ($Question) {
            $SurveyObject->QuestionUpdate(
                QuestionID     => $GetParam{QuestionID},
                SurveyID       => $GetParam{SurveyID},
                Question       => $Question,
                AnswerRequired => $AnswerRequired,
                UserID         => $Self->{UserID},
            );

            return $Self->_MaskQuestionEdit(
                SurveyID   => $GetParam{SurveyID},
                QuestionID => $GetParam{QuestionID},
            );
        }
        else {
            $ServerError{QuestionServerError} = 'ServerError';
        }

        return $Self->_MaskQuestionEdit(
            SurveyID    => $GetParam{SurveyID},
            QuestionID  => $GetParam{QuestionID},
            ServerError => \%ServerError,
        );
    }

    # ------------------------------------------------------------ #
    # answer add
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AnswerAdd' ) {

        my $Answer = $ParamObject->GetParam( Param => "Answer" );

        # check if survey and question exists
        if ( $SurveyExists ne 'Yes' || $QuestionExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey or question!'),
                WithHeader => 'yes',
            );
        }

        my %ServerError;
        if ($Answer) {
            $SurveyObject->AnswerAdd(
                SurveyID   => $GetParam{SurveyID},
                QuestionID => $GetParam{QuestionID},
                Answer     => $Answer,
                UserID     => $Self->{UserID},
            );

            return $Self->_MaskQuestionEdit(
                SurveyID   => $GetParam{SurveyID},
                QuestionID => $GetParam{QuestionID},
            );
        }
        else {
            $ServerError{AnswerServerError} = 'ServerError';
        }

        return $Self->_MaskQuestionEdit(
            SurveyID    => $GetParam{SurveyID},
            QuestionID  => $GetParam{QuestionID},
            ServerError => \%ServerError,
        );
    }

    # ------------------------------------------------------------ #
    # answer delete
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AnswerDelete' ) {

        # check if survey, question and answer exists
        if ( $SurveyExists ne 'Yes' || $QuestionExists ne 'Yes' || $AnswerExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey, question or answer!'),
                WithHeader => 'yes',
            );
        }
        $SurveyObject->AnswerDelete(
            QuestionID => $GetParam{QuestionID},
            AnswerID   => $GetParam{AnswerID},
        );
        $SurveyObject->AnswerSort(
            QuestionID => $GetParam{QuestionID},
        );

        return $LayoutObject->Redirect(
            OP =>
                "Action=$Self->{Action};Subaction=QuestionEdit;SurveyID=$GetParam{SurveyID};QuestionID=$GetParam{QuestionID}#Answer",
        );
    }

    # ------------------------------------------------------------ #
    # answer up
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AnswerUp' ) {

        # check if survey, question and answer exists
        if ( $SurveyExists ne 'Yes' || $QuestionExists ne 'Yes' || $AnswerExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey, question or answer!'),
                WithHeader => 'yes',
            );
        }
        $SurveyObject->AnswerSort(
            QuestionID => $GetParam{QuestionID},
        );
        $SurveyObject->AnswerUp(
            QuestionID => $GetParam{QuestionID},
            AnswerID   => $GetParam{AnswerID},
        );

        return $LayoutObject->Redirect(
            OP =>
                "Action=$Self->{Action};Subaction=QuestionEdit;SurveyID=$GetParam{SurveyID};QuestionID=$GetParam{QuestionID}#Answer",
        );
    }

    # ------------------------------------------------------------ #
    # answer down
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AnswerDown' ) {

        # check if survey, question and answer exists
        if ( $SurveyExists ne 'Yes' || $QuestionExists ne 'Yes' || $AnswerExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey, question or answer!'),
                WithHeader => 'yes',
            );
        }
        $SurveyObject->AnswerSort(
            QuestionID => $GetParam{QuestionID},
        );
        $SurveyObject->AnswerDown(
            QuestionID => $GetParam{QuestionID},
            AnswerID   => $GetParam{AnswerID},
        );

        return $LayoutObject->Redirect(
            OP =>
                "Action=$Self->{Action};Subaction=QuestionEdit;SurveyID=$GetParam{SurveyID};QuestionID=$GetParam{QuestionID}#Answer",
        );
    }

    # ------------------------------------------------------------ #
    # answer edit
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AnswerEdit' ) {

        # check if survey, question and answer exists
        if ( $SurveyExists ne 'Yes' || $QuestionExists ne 'Yes' || $AnswerExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey, question or answer!'),
                WithHeader => 'yes',
            );
        }

        return $Self->_MaskAnswerEdit(
            SurveyID   => $GetParam{SurveyID},
            QuestionID => $GetParam{QuestionID},
            AnswerID   => $GetParam{AnswerID},
        );
    }

    # ------------------------------------------------------------ #
    # answer save
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AnswerSave' ) {

        my $Answer = $ParamObject->GetParam( Param => "Answer" );

        # check if survey, question and answer exists
        if ( $SurveyExists ne 'Yes' || $QuestionExists ne 'Yes' || $AnswerExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey, question or answer!'),
                WithHeader => 'yes',
            );
        }

        my %ServerError;
        if ($Answer) {
            $SurveyObject->AnswerUpdate(
                AnswerID   => $GetParam{AnswerID},
                QuestionID => $GetParam{QuestionID},
                Answer     => $Answer,
                UserID     => $Self->{UserID},
            );

            return $LayoutObject->Redirect(
                OP =>
                    "Action=$Self->{Action};Subaction=QuestionEdit;SurveyID=$GetParam{SurveyID};QuestionID=$GetParam{QuestionID}#Answer"
            );
        }
        else {
            $ServerError{AnswerServerError} = 'SeverError';
        }

        return $Self->_MaskAnswerEdit(
            SurveyID    => $GetParam{SurveyID},
            QuestionID  => $GetParam{QuestionID},
            AnswerID    => $GetParam{AnswerID},
            ServerError => \%ServerError,
        );
    }

    # ------------------------------------------------------------ #
    # question overview
    # ------------------------------------------------------------ #
    if ( !$GetParam{SurveyID} ) {

        return $LayoutObject->ErrorScreen(
            Message => Translatable('No SurveyID is given!'),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # check if survey exists
    if ( $SurveyExists ne 'Yes' ) {

        return $LayoutObject->NoPermission(
            Message    => Translatable('You have no permission for this survey!'),
            WithHeader => 'yes',
        );
    }

    return $Self->_MaskQuestionOverview(
        SurveyID => $GetParam{SurveyID},
    );
}

sub _MaskQuestionOverview {
    my ( $Self, %Param ) = @_;

    my %ServerError;
    if ( $Param{ServerError} ) {
        %ServerError = %{ $Param{ServerError} };
    }

    my $Output;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    if ( !$Param{SurveyID} ) {

        return $LayoutObject->ErrorScreen(
            Message => Translatable('No SurveyID is given!'),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # output header
    $Output = $LayoutObject->Header(
        Title     => Translatable('Survey Edit Questions'),
        Type      => 'Small',
        BodyClass => 'Popup',
    );

    # get survey object
    my $SurveyObject = $Kernel::OM->Get('Kernel::System::Survey');

    # get all attributes of the survey
    my %Survey = $SurveyObject->SurveyGet(
        SurveyID => $Param{SurveyID},
    );

    $LayoutObject->Block(
        Name => 'SurveyEditQuestions',
        Data => \%Survey,
    );

    my @List = $SurveyObject->QuestionList(
        SurveyID => $Param{SurveyID},
    );

    if ( $Survey{Status} && $Survey{Status} eq 'New' ) {

        my $ArrayHashRef = [
            {
                Key      => 'YesNo',
                Value    => Translatable('Yes/No'),
                Selected => 1,
            },
            {
                Key   => 'Radio',
                Value => Translatable('Radio (List)'),
            },
            {
                Key   => 'Checkbox',
                Value => Translatable('Checkbox (List)'),
            },
            {
                Key   => 'Textarea',
                Value => Translatable('Textarea'),
            },
        ];

        my $SelectionType = $LayoutObject->BuildSelection(
            Data          => $ArrayHashRef,
            Name          => 'Type',
            ID            => 'Type',
            SelectedValue => 'Yes/No',
            Translation   => 1,
            Title         => $LayoutObject->{LanguageObject}->Translate('Question Type'),
            Class         => 'Modernize',
        );

        $ArrayHashRef = [
            {
                Key      => 'Yes',
                Value    => Translatable('Yes'),
                Selected => 1,
            },
            {
                Key   => 'No',
                Value => Translatable('No'),
            }
        ];

        my $AnswerRequiredSelect = $LayoutObject->BuildSelection(
            Data          => $ArrayHashRef,
            Name          => 'AnswerRequired',
            ID            => 'AnswerRequired',
            SelectedValue => 'Yes',
            Translation   => 1,
            Class         => 'Modernize',
        );

        my $QuestionErrorClass = '';
        if ( $ServerError{Question} ) {
            $QuestionErrorClass = 'ServerError';
        }

        $LayoutObject->Block(
            Name => 'SurveyAddQuestion',
            Data => {
                SurveyID             => $Param{SurveyID},
                SelectionType        => $SelectionType,
                AnswerRequiredSelect => $AnswerRequiredSelect,
                QuestionErrorClass   => $QuestionErrorClass,
            },
        );

        if ( scalar @List ) {
            $LayoutObject->Block(
                Name => 'SurveyQuestionsTable',
                Data => {},
            );
            $LayoutObject->Block(
                Name => 'SurveyStatusColumn',
                Data => {},
            );

            $LayoutObject->Block(
                Name => 'SurveyDeleteColumn',
                Data => {},
            );

            my $Counter = 0;

            for my $Question (@List) {
                my $AnswerCount = $SurveyObject->AnswerCount(
                    QuestionID => $Question->{QuestionID},
                );

                my $Class;
                my $ClassUp;
                my $ClassDown;

                if ( !$Counter ) {
                    $ClassUp = 'Disabled';
                }

                if ( $Counter == $#List ) {
                    $ClassDown = 'Disabled';
                }

                my $Status = Translatable('Complete');
                if ( $Question->{Type} eq 'Radio' || $Question->{Type} eq 'Checkbox' ) {
                    if ( $AnswerCount < 2 ) {
                        $Class  = 'Warning';
                        $Status = Translatable('Incomplete');
                    }
                }

                my $AnswerRequired = $Question->{AnswerRequired} ? 'Yes' : 'No';

                $LayoutObject->Block(
                    Name => 'SurveyQuestionsRow',
                    Data => {
                        %{$Question},
                        Status         => $Status,
                        AnswerRequired => $AnswerRequired,
                        Class          => $Class,
                        ClassUp        => $ClassUp,
                        ClassDown      => $ClassDown,
                    },
                );
                $LayoutObject->Block(
                    Name => 'SurveyQuestionsDeleteButton',
                    Data => $Question,
                );
                $Counter++;
            }
        }
        else {
            $LayoutObject->Block(
                Name => 'SurveyNoQuestionsSaved',
                Data => {
                    Columns => 5,
                },
            );
        }

    }
    else {
        $LayoutObject->Block(
            Name => 'SurveyQuestionsTable',
            Data => {},
        );
        my $Counter;
        for my $Question (@List) {

            my $ClassUp;
            my $ClassDown;

            if ( !$Counter ) {
                $ClassUp = 'Disabled';
            }

            if ( $Counter && $Counter == $#List ) {
                $ClassDown = 'Disabled';
            }

            my $AnswerRequired = $Question->{AnswerRequired} ? 'Yes' : 'No';

            $LayoutObject->Block(
                Name => 'SurveyQuestionsSaved',
                Data => {
                    %{$Question},
                    AnswerRequired => $AnswerRequired,
                    ClassUp        => $ClassUp,
                    ClassDown      => $ClassDown,
                },
            );

            $Counter++;
        }
    }

    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentSurveyEditQuestions',
        Data         => {
            SurveyID => $Param{SurveyID},
        },
    );

    $Output .= $LayoutObject->Footer( Type => 'Small' );

    return $Output;
}

sub _MaskQuestionEdit {
    my ( $Self, %Param ) = @_;

    my %ServerError;
    if ( $Param{ServerError} ) {
        %ServerError = %{ $Param{ServerError} };
    }

    my $Output;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # output header
    $Output = $LayoutObject->Header(
        Title     => Translatable('Question Edit'),
        Type      => 'Small',
        BodyClass => 'Popup',
    );

    # get survey object
    my $SurveyObject = $Kernel::OM->Get('Kernel::System::Survey');

    my %Survey = $SurveyObject->SurveyGet(
        SurveyID => $Param{SurveyID},
    );
    my %Question = $SurveyObject->QuestionGet(
        QuestionID => $Param{QuestionID},
    );

    my $ArrayHashRef = [
        {
            Key   => 'Yes',
            Value => Translatable('Yes'),
        },
        {
            Key   => 'No',
            Value => Translatable('No'),
        }
    ];

    if ( $Question{AnswerRequired} ) {
        $ArrayHashRef->[0]{Selected} = 1;
    }
    else {
        $ArrayHashRef->[1]{Selected} = 1;
    }

    my $AnswerRequiredSelect = $LayoutObject->BuildSelection(
        Data          => $ArrayHashRef,
        Name          => 'AnswerRequired',
        ID            => 'AnswerRequired',
        SelectedValue => 'Yes',
        Translation   => 1,
        Class         => 'Modernize',
    );

    # print the main body
    $LayoutObject->Block(
        Name => 'QuestionEdit',
        Data => {
            AnswerRequiredSelect => $AnswerRequiredSelect,
            %Question,
            %ServerError,
        },
    );

    if ( $Question{Type} eq 'YesNo' ) {
        $LayoutObject->Block(
            Name => 'QuestionEditTable',
            Data => {},
        );
        $LayoutObject->Block(
            Name => 'QuestionEditYesno',
            Data => {},
        );
    }
    elsif ( $Question{Type} eq 'Radio' || $Question{Type} eq 'Checkbox' ) {

        my $Type = $Question{Type};
        my @List = $SurveyObject->AnswerList(
            QuestionID => $Param{QuestionID},
        );
        if ( scalar @List ) {

            $LayoutObject->Block(
                Name => 'QuestionEditTable',
                Data => {},
            );
            if ( $Survey{Status} eq 'New' ) {

                $LayoutObject->Block(
                    Name => 'QuestionEditTableDelete',
                    Data => {},
                );

                my $Counter = 0;
                for my $Answer2 (@List) {
                    $Answer2->{SurveyID} = $Param{SurveyID};

                    my $ClassUp;
                    my $ClassDown;

                    # disable up action on first row
                    if ( !$Counter ) {
                        $ClassUp = 'Disabled';
                    }

                    # disable down action on last row
                    if ( $Counter == $#List ) {
                        $ClassDown = 'Disabled';
                    }

                    $LayoutObject->Block(
                        Name => "QuestionEdit" . $Type,
                        Data => {
                            %{$Answer2},
                            ClassUp   => $ClassUp,
                            ClassDown => $ClassDown,
                        },
                    );
                    $LayoutObject->Block(
                        Name => 'QuestionEdit' . $Type . 'Delete',
                        Data => $Answer2,
                    );
                    $Counter++;
                }

                $LayoutObject->Block(
                    Name => 'QuestionEditAddAnswer',
                    Data => {
                        %Question,
                        %ServerError,
                    },
                );
            }
            else {
                my $Counter;
                for my $Answer2 (@List) {
                    $Answer2->{SurveyID} = $Param{SurveyID};

                    my $ClassUp;
                    my $ClassDown;

                    if ( !$Counter ) {
                        $ClassUp = 'Disabled';
                    }

                    if ( $Counter && $Counter == $#List ) {
                        $ClassDown = 'Disabled';
                    }

                    $LayoutObject->Block(
                        Name => "QuestionEdit" . $Type,
                        Data => {
                            %{$Answer2},
                            ClassUp   => $ClassUp,
                            ClassDown => $ClassDown,
                        },
                    );
                    $Counter++;
                }
            }
        }
        else {
            $LayoutObject->Block(
                Name => 'NoAnswersSaved',
                Data => {
                    Columns => 3,
                },
            );
            $LayoutObject->Block(
                Name => 'QuestionEditAddAnswer',
                Data => {%Question},
            );
        }
    }
    elsif ( $Question{Type} eq 'Textarea' ) {
        $LayoutObject->Block(
            Name => 'QuestionEditTextArea',
            Data => {},
        );
    }
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentSurveyEditQuestions',
        Data         => {%Param},
    );
    $Output .= $LayoutObject->Footer(
        Type => 'Small',
    );

    return $Output;
}

sub _MaskAnswerEdit {
    my ( $Self, %Param ) = @_;

    my %ServerError;
    if ( $Param{ServerError} ) {
        %ServerError = %{ $Param{ServerError} };
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $Output;
    $Output = $LayoutObject->Header(
        Title     => Translatable('Answer Edit'),
        Type      => 'Small',
        BodyClass => 'Popup',
    );

    # get survey object
    my $SurveyObject = $Kernel::OM->Get('Kernel::System::Survey');

    my %Answer = $SurveyObject->AnswerGet(
        AnswerID => $Param{AnswerID},
    );
    $Answer{SurveyID} = $Param{SurveyID};

    my %Question = $SurveyObject->QuestionGet(
        QuestionID => $Param{QuestionID},
    );
    $Param{Question} = $Question{Question};

    # print the main table.
    $LayoutObject->Block(
        Name => 'AnswerEdit',
        Data => {
            %Answer,
            %Param,
            %ServerError,
        },
    );

    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentSurveyEditQuestions',
        Data         => {
            %Param,
        },
    );

    $Output .= $LayoutObject->Footer(
        Type => 'Small',
    );

    return $Output;
}

1;
