# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Survey::Question;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::System::Survey::Question - sub module of Kernel::System::Survey

=head1 SYNOPSIS

All survey question functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item QuestionAdd()

to add a new question to a survey

    $SurveyObject->QuestionAdd(
        UserID => 1,
        SurveyID => 10,
        Question => 'The Question',
        AnswerRequired => 1, # or 0
        Type => 'Radio',
    );

=cut

sub QuestionAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID SurveyID Question Type)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    return if !$Param{Question};

    # insert a new question
    # if we didn't get an Answer Parameter (e.g. just undefined)
    # or it was something else than 0 or 1
    # we assume it's a required answer
    if (
        !defined $Param{AnswerRequired}
        ||
        ( $Param{AnswerRequired} ne '0' && $Param{AnswerRequired} ne '1' )
        )
    {
        $Param{AnswerRequired} = 1;
    }

    return $Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => '
            INSERT INTO survey_question (survey_id, question, question_type, position,
                answer_required, create_time, create_by, change_time, change_by)
            VALUES (?, ?, ?, 255, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$Param{SurveyID}, \$Param{Question}, \$Param{Type}, \$Param{AnswerRequired},
            \$Param{UserID}, \$Param{UserID},
        ],
    );
}

=item QuestionDelete()

to delete a question from a survey

    $SurveyObject->QuestionDelete(
        SurveyID => 1,
        QuestionID => 10,
    );

=cut

sub QuestionDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(SurveyID QuestionID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # delete all answers of a question
    return if !$DBObject->Do(
        SQL => '
            DELETE FROM survey_answer
            WHERE question_id = ?',
        Bind => [ \$Param{QuestionID} ],
    );

    # delete the question
    return if !$DBObject->Do(
        SQL => '
            DELETE FROM survey_question
            WHERE id = ?
                AND survey_id = ?',
        Bind => [ \$Param{QuestionID}, \$Param{SurveyID}, ],
    );

    return 1;
}

=item QuestionGet()

to get all attributes of a question

    my %Question = $SurveyObject->QuestionGet(
        QuestionID => 123
    );

=cut

sub QuestionGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{QuestionID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need QuestionID!',
        );

        return;
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get question
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id, survey_id, question, question_type, position, answer_required, create_time,
                create_by, change_time, change_by
            FROM survey_question
            WHERE id = ?',
        Bind  => [ \$Param{QuestionID} ],
        Limit => 1,
    );

    # fetch the result
    my %Data;

    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Data{QuestionID}     = $Row[0];
        $Data{SurveyID}       = $Row[1];
        $Data{Question}       = $Row[2];
        $Data{Type}           = $Row[3];
        $Data{Position}       = $Row[4];
        $Data{AnswerRequired} = $Row[5];
        $Data{CreateTime}     = $Row[6];
        $Data{CreateBy}       = $Row[7];
        $Data{ChangeTime}     = $Row[8];
        $Data{ChangeBy}       = $Row[9];
    }

    return %Data;
}

=item QuestionUpdate()

to update an existing question

    $SurveyObject->QuestionUpdate(
        UserID => 1,
        QuestionID => 4,
        SurveyID => 3,
        AnswerRequired => '1', # or '0'
        Question => 'The Question',
    );

=cut

sub QuestionUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID QuestionID SurveyID Question)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    my $AnswerRequired = 1;
    if (
        defined $Param{AnswerRequired}
        && ( $Param{AnswerRequired} eq '1' || $Param{AnswerRequired} eq '0' )
        )
    {
        $AnswerRequired = $Param{AnswerRequired};
    }

    # update question
    return $Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => '
            UPDATE survey_question
            SET question = ?, answer_required = ?, change_time = current_timestamp,
                change_by = ?
            WHERE id = ?
                AND survey_id = ?',
        Bind => [
            \$Param{Question}, \$AnswerRequired, \$Param{UserID}, \$Param{QuestionID},
            \$Param{SurveyID},
        ],
    );
}

=item QuestionList()

to get a array list of all question items

    my @List = $SurveyObject->QuestionList(
        SurveyID => 1
    );

=cut

sub QuestionList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{SurveyID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need SurveyID!',
        );

        return;
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get all questions of a survey
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id, survey_id, question, question_type, answer_required
            FROM survey_question
            WHERE survey_id = ?
            ORDER BY position',
        Bind => [ \$Param{SurveyID} ],
    );

    # fetch the result
    my @List;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        my %Data;
        $Data{QuestionID}     = $Row[0];
        $Data{SurveyID}       = $Row[1];
        $Data{Question}       = $Row[2];
        $Data{Type}           = $Row[3];
        $Data{AnswerRequired} = $Row[4] || 0;

        push @List, \%Data;
    }

    return @List;
}

=item QuestionSort()

to sort all questions from a survey

    $SurveyObject->QuestionSort(
        SurveyID => 1,
    );

=cut

sub QuestionSort {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{SurveyID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need SurveyID!'
        );

        return;
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get all question of a survey (sorted by position)
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id FROM survey_question
            WHERE survey_id = ?
            ORDER BY position',
        Bind => [ \$Param{SurveyID} ],
    );

    my @List;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @List, $Row[0];
    }

    my $Counter = 1;
    for my $QuestionID (@List) {
        return if !$DBObject->Do(
            SQL => '
                UPDATE survey_question
                SET position = ?
                WHERE id = ?',
            Bind => [ \$Counter, \$QuestionID ],
        );

        $Counter++;
    }

    return 1;
}

=item QuestionUp()

to move a question up

    $SurveyObject->QuestionUp(
        SurveyID => 1,
        QuestionID => 4,
    );

=cut

sub QuestionUp {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(SurveyID QuestionID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get position
    return if !$DBObject->Prepare(
        SQL => '
            SELECT position
            FROM survey_question
            WHERE id = ?
                AND survey_id = ?',
        Bind  => [ \$Param{QuestionID}, \$Param{SurveyID}, ],
        Limit => 1,
    );

    # fetch the result
    my $Position = 0;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Position = $Row[0];
    }

    return if $Position < 2;

    my $PositionUp = $Position - 1;

    # get question
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id
            FROM survey_question
            WHERE survey_id = ?
                AND position = ?',
        Bind  => [ \$Param{SurveyID}, \$PositionUp ],
        Limit => 1,
    );

    # fetch the result
    my $QuestionIDDown;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $QuestionIDDown = $Row[0];
    }

    return if !$QuestionIDDown;

    # update position
    return if !$DBObject->Do(
        SQL => '
            UPDATE survey_question
            SET position = ?
            WHERE id = ?',
        Bind => [ \$Position, \$QuestionIDDown, ],
    );

    # update position
    return if !$DBObject->Do(
        SQL => '
            UPDATE survey_question
            SET position = ?
            WHERE id = ?',
        Bind => [ \$PositionUp, \$Param{QuestionID}, ],
    );

    return 1;
}

=item QuestionDown()

to move a question down

    $SurveyObject->QuestionDown(
        SurveyID => 1,
        QuestionID => 4,
    );

=cut

sub QuestionDown {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(SurveyID QuestionID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get position
    return if !$DBObject->Prepare(
        SQL => '
            SELECT position
            FROM survey_question
            WHERE id = ?
                AND survey_id = ?',
        Bind  => [ \$Param{QuestionID}, \$Param{SurveyID}, ],
        Limit => 1,
    );

    # fetch the result
    my $Position;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Position = $Row[0];
    }

    return if !$Position;

    my $PositionDown = $Position + 1;

    # get question
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id
            FROM survey_question
            WHERE survey_id = ?
                AND position = ?',
        Bind  => [ \$Param{SurveyID}, \$PositionDown, ],
        Limit => 1,
    );

    # fetch the result
    my $QuestionIDUp;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $QuestionIDUp = $Row[0];
    }

    return if !$QuestionIDUp;

    # update position
    return if !$DBObject->Do(
        SQL => '
            UPDATE survey_question
            SET position = ?
            WHERE id = ?',
        Bind => [ \$Position, \$QuestionIDUp, ],
    );

    # update position
    return if !$DBObject->Do(
        SQL => '
            UPDATE survey_question
            SET position = ?
            WHERE id = ?',
        Bind => [ \$PositionDown, \$Param{QuestionID}, ],
    );

    return 1;
}

=item QuestionCount()

to count all questions of a survey

    my $CountQuestion = $SurveyObject->QuestionCount(
        SurveyID => 123
    );

=cut

sub QuestionCount {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{SurveyID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need SurveyID!',
        );

        return;
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # count questions
    return if !$DBObject->Prepare(
        SQL => '
            SELECT COUNT(id)
            FROM survey_question
            WHERE survey_id = ?',
        Bind  => [ \$Param{SurveyID} ],
        Limit => 1,
    );

    # fetch the result
    my $CountQuestion;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $CountQuestion = $Row[0];
    }

    return $CountQuestion;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
