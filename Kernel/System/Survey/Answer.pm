# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Survey::Answer;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::System::Survey::Answer - sub module of Kernel::System::Survey

=head1 SYNOPSIS

All survey answer functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item AnswerAdd()

to add a new answer to a question

    $SurveyObject->AnswerAdd(
        UserID => 1,
        QuestionID => 10,
        Answer => 'The Answer',
    );

=cut

sub AnswerAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID QuestionID Answer)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # insert answer
    return $Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => '
            INSERT INTO survey_answer (question_id, answer, position, create_time, create_by,
                change_time, change_by)
            VALUES ( ?, ?, 255, current_timestamp, ?, current_timestamp, ?)',
        Bind => [ \$Param{QuestionID}, \$Param{Answer}, \$Param{UserID}, \$Param{UserID}, ],
    );
}

=item AnswerDelete()

to delete a answer from a question

    $SurveyObject->AnswerDelete(
        QuestionID => 10,
        AnswerID => 4,
    );

=cut

sub AnswerDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(QuestionID AnswerID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # delete answer
    return $Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => '
            DELETE FROM survey_answer
            WHERE id = ?
                AND question_id = ?',
        Bind => [ \$Param{AnswerID}, \$Param{QuestionID}, ],
    );
}

=item AnswerGet()

to get all attributes of a answer

    my %Answer = $SurveyObject->AnswerGet(
        AnswerID => 123
    );

=cut

sub AnswerGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{AnswerID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need QuestionID!',
        );

        return;
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get answer
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id, question_id, answer, position, create_time, create_by, change_time, change_by
            FROM survey_answer
            WHERE id = ?',
        Bind  => [ \$Param{AnswerID} ],
        Limit => 1,
    );

    # fetch the result
    my %Data;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Data{AnswerID}   = $Row[0];
        $Data{QuestionID} = $Row[1];
        $Data{Answer}     = $Row[2];
        $Data{Position}   = $Row[3];
        $Data{CreateTime} = $Row[4];
        $Data{CreateBy}   = $Row[5];
        $Data{ChangeTime} = $Row[6];
        $Data{ChangeBy}   = $Row[7];
    }

    return %Data;
}

=item AnswerUpdate()

to update an existing answer

    $SurveyObject->AnswerUpdate(
        UserID => 1,
        AnswerID => 6,
        QuestionID => 4,
        Answer => 'The Answer',
    );

=cut

sub AnswerUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID AnswerID QuestionID Answer)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # update answer
    return $Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => '
            UPDATE survey_answer
            SET answer = ?, change_time = current_timestamp, change_by = ?
            WHERE id = ?
                AND question_id = ?',
        Bind => [ \$Param{Answer}, \$Param{UserID}, \$Param{AnswerID}, \$Param{QuestionID}, ],
    );
}

=item AnswerList()

to get a array list of all answer items

    my @List = $SurveyObject->AnswerList(
        QuestionID => 1
    );

=cut

sub AnswerList {
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

    # get answer list
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id, question_id, answer
            FROM survey_answer
            WHERE question_id = ?
            ORDER BY position',
        Bind => [ \$Param{QuestionID} ],
    );

    # fetch the result
    my @List;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        my %Data;
        $Data{AnswerID}   = $Row[0];
        $Data{QuestionID} = $Row[1];
        $Data{Answer}     = $Row[2];

        push @List, \%Data;
    }

    return @List;
}

=item AnswerSort()

to sort all answers from a question

    $SurveyObject->AnswerSort(
        QuestionID => 1,
    );

=cut

sub AnswerSort {
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

    # get answer list
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id
            FROM survey_answer
            WHERE question_id = ?
            ORDER BY position',
        Bind => [ \$Param{QuestionID} ],
    );

    # fetch the result
    my @List;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @List, $Row[0];
    }

    my $Counter = 1;
    for my $AnswerID (@List) {

        # update position
        return if !$DBObject->Do(
            SQL => '
                UPDATE survey_answer
                SET position = ?
                WHERE id = ?',
            Bind => [ \$Counter, \$AnswerID ],
        );

        $Counter++;
    }

    return 1;
}

=item AnswerUp()

to move a answer up

    $SurveyObject->AnswerUp(
        QuestionID => 4,
        AnswerID => 1,
    );

=cut

sub AnswerUp {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(QuestionID AnswerID)) {
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
            FROM survey_answer
            WHERE id = ?
                AND question_id = ?',
        Bind  => [ \$Param{AnswerID}, \$Param{QuestionID}, ],
        Limit => 1,
    );

    # fetch the result
    my $Position;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Position = $Row[0];
    }

    return if $Position < 2;

    my $PositionUp = $Position - 1;

    # get answer
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id
            FROM survey_answer
            WHERE question_id = ? AND position = ?',
        Bind  => [ \$Param{QuestionID}, \$PositionUp, ],
        Limit => 1,
    );

    # fetch the result
    my $AnswerIDDown;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $AnswerIDDown = $Row[0];
    }

    return if !$AnswerIDDown;

    # update position
    return if !$DBObject->Do(
        SQL => '
            UPDATE survey_answer
            SET position = ?
            WHERE id = ?',
        Bind => [ \$Position, \$AnswerIDDown, ],
    );

    # update position
    return if !$DBObject->Do(
        SQL => '
            UPDATE survey_answer
            SET position = ?
            WHERE id = ?',
        Bind => [ \$PositionUp, \$Param{AnswerID}, ],
    );

    return 1;
}

=item AnswerDown()

to move a answer down

    $SurveyObject->AnswerDown(
        QuestionID => 4,
        AnswerID => 1,
    );

=cut

sub AnswerDown {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(QuestionID AnswerID)) {
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
            FROM survey_answer
            WHERE id = ?
                AND question_id = ?',
        Bind  => [ \$Param{AnswerID}, \$Param{QuestionID}, ],
        Limit => 1,
    );

    # fetch the result
    my $Position;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Position = $Row[0];
    }

    return if !$Position;

    my $PositionDown = $Position + 1;

    # get answer
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id
            FROM survey_answer
            WHERE question_id = ?
                AND position = ?',
        Bind  => [ \$Param{QuestionID}, \$PositionDown, ],
        Limit => 1,
    );

    # fetch the result
    my $AnswerIDUp;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $AnswerIDUp = $Row[0];
    }

    return if !$AnswerIDUp;

    # update position
    return if !$DBObject->Do(
        SQL => '
            UPDATE survey_answer
            SET position = ?
            WHERE id = ?',
        Bind => [ \$Position, \$AnswerIDUp, ],
    );

    # update position
    return if !$DBObject->Do(
        SQL => '
            UPDATE survey_answer
            SET position = ?
            WHERE id = ?',
        Bind => [ \$PositionDown, \$Param{AnswerID}, ],
    );

    return 1;
}

=item AnswerCount()

to count all answers of a question

    my $CountAnswer = $SurveyObject->AnswerCount(
        QuestionID => 123
    );

=cut

sub AnswerCount {
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

    # count answers
    return if !$DBObject->Prepare(
        SQL => '
            SELECT COUNT(id)
            FROM survey_answer
            WHERE question_id = ?',
        Bind  => [ \$Param{QuestionID} ],
        Limit => 1,
    );

    # fetch the result
    my $CountAnswer;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $CountAnswer = $Row[0];
    }

    return $CountAnswer;
}

=item PublicAnswerSet()

to save a public vote

    $SurveyObject->PublicAnswerSet(
        PublicSurveyKey => 'aVkdE82Dw2qw6erCda',
        QuestionID => 4,
        VoteValue => 'The Value',
    );

=cut

sub PublicAnswerSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(PublicSurveyKey QuestionID VoteValue)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get request
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id
            FROM survey_request
            WHERE public_survey_key = ?
                AND valid_id = 1',
        Bind  => [ \$Param{PublicSurveyKey} ],
        Limit => 1,
    );

    # fetch the result
    my $RequestID;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $RequestID = $Row[0];
    }

    return if !$RequestID;

    # Prevent to write something that oracle store as NULL in database.
    # See bug #9575.
    if ( ( $DBObject->{'DB::Type'} eq 'oracle' ) && ( $Param{VoteValue} eq '' ) ) {
        $Param{VoteValue} = 0;
    }

    # insert vote
    return if !$DBObject->Do(
        SQL => '
            INSERT INTO survey_vote (request_id, question_id, vote_value, create_time)
            VALUES ( ?, ?, ?, current_timestamp)',
        Bind => [ \$RequestID, \$Param{QuestionID}, \$Param{VoteValue}, ],
    );

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
