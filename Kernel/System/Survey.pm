# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Survey;

use strict;
use warnings;

use Digest::MD5;
use Mail::Address;

use Kernel::System::VariableCheck qw(:all);

use base qw(
    Kernel::System::Survey::Answer
    Kernel::System::Survey::Question
    Kernel::System::Survey::Request
    Kernel::System::Survey::Vote
);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::CustomerUser',
    'Kernel::System::DB',
    'Kernel::System::Email',
    'Kernel::System::HTMLUtils',
    'Kernel::System::Log',
    'Kernel::System::User',
    'Kernel::System::Ticket',
    'Kernel::System::Time',
    'Kernel::System::YAML',
);

=head1 NAME

Kernel::System::Survey - survey lib

=head1 SYNOPSIS

All survey functions. E. g. to add survey or and functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $SurveyObject = $Kernel::OM->Get('Kernel::System::Survey');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get like escape string needed for some databases (e.g. oracle)
    $Self->{LikeEscapeString} = $Kernel::OM->Get('Kernel::System::DB')->GetDatabaseFunction('LikeEscapeString');

    return $Self;
}

=item SurveyAdd()

to add a new survey

    my $SurveyID = $SurveyObject->SurveyAdd(
        UserID              => 1,
        Title               => 'A Title',
        Introduction        => 'The introduction of the survey',
        Description         => 'The internal description of the survey',
        NotificationSender  => 'quality@example.com',
        NotificationSubject => 'Help us with your feedback!',
        NotificationBody    => 'Dear customer...',
        Queues              => [2, 5, 9],  # (optional) survey is valid for these queues
        TicketTypeIDs       => [1, 2, 3],  # (optional) survey is valid for these ticket types
        ServiceIDs          => [1, 2, 3],  # (optional) survey is valid for these services
    );

=cut

sub SurveyAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (
        qw(
        UserID Title Introduction Description
        NotificationSender NotificationSubject NotificationBody
        )
        )
    {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # build send condition string
    my $SendConditionStrg = $Self->_BuildSendConditionStrg(%Param);

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # insert a new survey
    my $Status = 'New';
    return if !$DBObject->Do(
        SQL => '
            INSERT INTO survey (title, introduction, description, notification_sender,
                notification_subject, notification_body, status, send_conditions, create_time, create_by,
                change_time, change_by )
            VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$Param{Title},              \$Param{Introduction},        \$Param{Description},
            \$Param{NotificationSender}, \$Param{NotificationSubject}, \$Param{NotificationBody},
            \$Status, \$SendConditionStrg, \$Param{UserID},
            \$Param{UserID},
        ],
    );

    # get the id of the survey
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id
            FROM survey
            WHERE title = ?
                AND introduction = ?
                AND description = ?
            ORDER BY id DESC',
        Bind  => [ \$Param{Title}, \$Param{Introduction}, \$Param{Description}, ],
        Limit => 1,
    );

    # fetch the result
    my $SurveyID;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $SurveyID = $Row[0];
    }

    # set the survey number
    my $SurveyNumber = $SurveyID + 10000;
    return if !$DBObject->Do(
        SQL => '
            UPDATE survey
            SET surveynumber = ?
            WHERE id = ?',
        Bind => [ \$SurveyNumber, \$SurveyID, ],
    );

    return $SurveyID if !$Param{Queues};
    return $SurveyID if ref $Param{Queues} ne 'ARRAY';

    # insert new survey-queue relations
    $Self->SurveyQueueSet(
        SurveyID => $SurveyID,
        QueueIDs => $Param{Queues},
    );

    return $SurveyID;
}

=item SurveyGet()

to get all attributes of a survey

    my %Survey = $SurveyObject->SurveyGet(
        SurveyID => 123
    );

=cut

sub SurveyGet {
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

    # get all attributes of a survey
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id, surveynumber, title, introduction, description, notification_sender,
                notification_subject, notification_body, status, send_conditions, create_time, create_by,
                change_time, change_by
            FROM survey
            WHERE id = ?',
        Bind  => [ \$Param{SurveyID} ],
        Limit => 1,
    );

    # fetch the result
    my %Data;
    while ( my @Row = $DBObject->FetchrowArray() ) {

        # get SendCondition as hash
        my $SendConditions = $Kernel::OM->Get('Kernel::System::YAML')->Load( Data => $Row[9] ) || {};

        # set data fields for send conditions
        ITEM:
        for my $Item (qw(TicketTypeIDs ServiceIDs)) {

            next ITEM if !IsArrayRefWithData( $SendConditions->{$Item} );

            $Data{$Item} = $SendConditions->{$Item};
        }

        $Data{SurveyID}            = $Row[0];
        $Data{SurveyNumber}        = $Row[1];
        $Data{Title}               = $Row[2];
        $Data{Introduction}        = $Row[3];
        $Data{Description}         = $Row[4];
        $Data{NotificationSender}  = $Row[5];
        $Data{NotificationSubject} = $Row[6];
        $Data{NotificationBody}    = $Row[7];
        $Data{Status}              = $Row[8];
        $Data{CreateTime}          = $Row[10];
        $Data{CreateBy}            = $Row[11];
        $Data{ChangeTime}          = $Row[12];
        $Data{ChangeBy}            = $Row[13];
    }

    if ( !%Data ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No such SurveyID $Param{SurveyID}!",
        );

        return;
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # set default values
    $Data{NotificationSender}  ||= $ConfigObject->Get('Survey::NotificationSender');
    $Data{NotificationSubject} ||= $ConfigObject->Get('Survey::NotificationSubject');
    $Data{NotificationBody}    ||= $ConfigObject->Get('Survey::NotificationBody');

    # get queues
    $Data{Queues} = $Self->SurveyQueueGet(
        SurveyID => $Param{SurveyID},
    );

    # added CreateBy
    if ( !$Param{Public} ) {

        # get user object
        my $UserObject = $Kernel::OM->Get('Kernel::System::User');

        my %CreateUserInfo = $UserObject->GetUserData(
            UserID => $Data{CreateBy},
            Cached => 1,
        );
        $Data{CreateUserLogin}     = $CreateUserInfo{UserLogin};
        $Data{CreateUserFirstname} = $CreateUserInfo{UserFirstname};
        $Data{CreateUserLastname}  = $CreateUserInfo{UserLastname};
        $Data{CreateUserFullname}  = $CreateUserInfo{UserFullname};

        # added ChangeBy
        my %ChangeUserInfo = $UserObject->GetUserData(
            UserID => $Data{ChangeBy},
            Cached => 1,
        );
        $Data{ChangeUserLogin}     = $ChangeUserInfo{UserLogin};
        $Data{ChangeUserFirstname} = $ChangeUserInfo{UserFirstname};
        $Data{ChangeUserLastname}  = $ChangeUserInfo{UserLastname};
        $Data{ChangeUserFullname}  = $ChangeUserInfo{UserFullname};
    }

    return %Data;
}

=item SurveyUpdate()

to update an existing survey

    $SurveyObject->SurveyUpdate(
        UserID              => 1,
        SurveyID            => 4,
        Title               => 'A Title',
        Introduction        => 'The introduction of the survey',
        Description         => 'The internal description of the survey',
        NotificationSender  => 'quality@example.com',
        NotificationSubject => 'Help us with your feedback!',
        NotificationBody    => 'Dear customer...',
        Queues              => [2, 5, 9],  # (optional) survey is valid for these queues
        TicketTypeIDs       => [1, 2, 3],  # (optional) survey is valid for these ticket types
        ServiceIDs          => [1, 2, 3],  # (optional) survey is valid for these services
    );

=cut

sub SurveyUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (
        qw(
        UserID SurveyID Title Introduction Description
        NotificationSender NotificationSubject NotificationBody
        )
        )
    {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # check queues
    if ( $Param{Queues} && ref $Param{Queues} ne 'ARRAY' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Queues must be an array reference.',
        );

        return;
    }

    # set default value
    $Param{Queues} ||= [];

    # build send condition string
    my $SendConditionStrg = $Self->_BuildSendConditionStrg(%Param);

    # update the survey
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => '
            UPDATE survey
            SET title = ?, introduction = ?, description = ?, notification_sender = ?,
                notification_subject = ?, notification_body = ?, send_conditions = ?, change_time = current_timestamp,
                change_by = ?
            WHERE id = ?',
        Bind => [
            \$Param{Title},              \$Param{Introduction},        \$Param{Description},
            \$Param{NotificationSender}, \$Param{NotificationSubject}, \$Param{NotificationBody},
            \$SendConditionStrg, \$Param{UserID}, \$Param{SurveyID},
        ],
    );

    # insert new survey-queue relations
    return $Self->SurveyQueueSet(
        SurveyID => $Param{SurveyID},
        QueueIDs => $Param{Queues},
    );
}

=item SurveyList()

to get a array list of all survey items

    my @List = $SurveyObject->SurveyList();

=cut

sub SurveyList {
    my ( $Self, %Param ) = @_;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get survey list
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id
            FROM survey
            ORDER BY create_time DESC',
    );

    # fetch the results
    my @List;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @List, $Row[0];
    }

    return @List;
}

=item SurveySearch()

search in surveys

    my @IDs = $SurveyObject->SurveySearch(

        Number              => '134',                                         # (optional)
        Title               => 'some title',                                  # (optional)
        Introduction        => 'some introduction',                           # (optional)
        Description         => 'some description',                            # (optional)
        NotificationSender  => 'user@domain',                                 # (optional)
        NotificationSubject => 'some notification subject',                   # (optional)
        NotificationBody    => 'some notification body',                      # (optional)

        # is searching in Number, Title, Introduction, Description, NotificationSender,
        # NotificationSubject and NotificationBody
        What   => 'some text',                                                # (optional)

        Status => 'some status',                                              # (optional)

        CreateTimeNewerDate => '2012-01-01 12:00:00',
        CreateTimeOlderDate => '2012-01-31 12:00:00',
        CreateBy            => '123',            #UserID
        ChangeTimeNewerDate => '2012-01-01 12:00:00',
        ChangeTimeOlderDate => '2012-12-31 12:00:00',
        ChangeBy            => '123',            #UserID

        OrderBy => [ 'SurveyID', 'Title' ],                                     # (optional)
        # default: [ 'SurveyID' ],
        # ()SurveyID, Number, Title, Introduction, Description,
        # NotificationSender, NotificationSubject, NotificationBody,
        # Status, CreateTime, CreateBy, ChangeTime, ChangeBy)

        # Additional information for OrderBy:
        # The OrderByDirection can be specified for each OrderBy attribute.
        # The pairing is made by the array indexes.

        OrderByDirection => [ 'Down', 'Up' ],                                   # (optional)
        # default: [ 'Down' ]
        # (Down | Up)

        Limit     => 150,                                                       # (optional)
        UserID    => 1,
    );

=cut

sub SurveySearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );

        return;
    }

    # verify that all passed array parameters contain an array reference
    ARGUMENT:
    for my $Argument (qw(OrderBy OrderByDirection)) {

        if ( !defined $Param{$Argument} ) {
            $Param{$Argument} ||= [];

            next ARGUMENT;
        }

        if ( ref $Param{$Argument} ne 'ARRAY' ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Argument must be an array reference!",
            );

            return;
        }
    }

    # define order table
    my %OrderByTable = (

        # Survey item attributes
        SurveyID            => 's.id',
        Number              => 's.surveynumber',
        Title               => 's.title',
        Introduction        => 's.introduction',
        Description         => 's.description',
        NotificationSender  => 's.notification_sender',
        NotificationSubject => 's.notification_subject',
        NotificationBody    => 's.notification_body',
        Status              => 's.status',
        CreateTime          => 's.create_time',
        CreateBy            => 's.create_by',
        ChangeTime          => 's.change_time',
        ChangeBy            => 's.change_by',
    );

    # check if OrderBy contains only unique valid values
    my %OrderBySeen;
    for my $OrderBy ( @{ $Param{OrderBy} } ) {

        if ( !$OrderBy || !$OrderByTable{$OrderBy} || $OrderBySeen{$OrderBy} ) {

            # found an error
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "OrderBy contains invalid value '$OrderBy' "
                    . 'or the value is used more than once!',
            );

            return;
        }

        # remember the value to check if it appears more than once
        $OrderBySeen{$OrderBy} = 1;

    }

    # check if OrderByDirection array contains only 'Up' or 'Down'
    DIRECTION:
    for my $Direction ( @{ $Param{OrderByDirection} } ) {

        # only 'Up' or 'Down' allowed
        next DIRECTION if $Direction eq 'Up';
        next DIRECTION if $Direction eq 'Down';

        # found an error
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "OrderByDirection can only contain 'Up' or 'Down'!",
        );

        return;
    }

    # assemble the ORDER BY clause
    my @SQLOrderBy;
    my @OrderByFields;
    my $Count = 0;
    for my $OrderBy ( @{ $Param{OrderBy} } ) {

        # set the default order direction
        my $Direction = 'DESC';

        # add the given order direction
        if ( $Param{OrderByDirection}->[$Count] ) {
            if ( $Param{OrderByDirection}->[$Count] eq 'Up' ) {
                $Direction = 'ASC';
            }
            elsif ( $Param{OrderByDirection}->[$Count] eq 'Down' ) {
                $Direction = 'DESC';
            }
        }

        # add SQL
        push @SQLOrderBy,    "$OrderByTable{$OrderBy} $Direction";
        push @OrderByFields, $OrderByTable{$OrderBy};

        $Count++;
    }

    # if there is a possibility that the ordering is not determined
    # we add an descending ordering by id
    if ( !grep { $_ eq 'SurveyID' } ( @{ $Param{OrderBy} } ) ) {
        push @SQLOrderBy, "$OrderByTable{SurveyID} DESC";
    }

    # SQL
    my $SQL = 'SELECT s.id ';

    # extended SQL
    my $Ext = '';

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # full-text search
    if ( $Param{What} && $Param{What} ne '*' ) {

        # define the search fields for full-text search
        my @SearchFields = (
            's.surveynumber',
            's.title',
            's.introduction',
            's.description',
            's.notification_sender',
            's.notification_subject',
            's.notification_body',
            's.status',
        );

        # add the SQL for the full-text search
        $Ext .= $DBObject->QueryCondition(
            Key          => \@SearchFields,
            Value        => $Param{What},
            SearchPrefix => '*',
            SearchSuffix => '*',
        );
    }

    # search for the number
    if ( $Param{Number} ) {
        $Param{Number} =~ s/\*/%/g;
        $Param{Number} =~ s/%%/%/g;
        $Param{Number} = $DBObject->Quote( $Param{Number}, 'Like' );
        if ($Ext) {
            $Ext .= ' AND';
        }
        $Ext .= " LOWER(s.number) LIKE LOWER('" . $Param{Number} . "') $Self->{LikeEscapeString}";
    }

    # search for the title
    if ( $Param{Title} ) {
        $Param{Title} = "\%$Param{Title}\%";
        $Param{Title} =~ s/\*/%/g;
        $Param{Title} =~ s/%%/%/g;
        $Param{Title} = $DBObject->Quote( $Param{Title}, 'Like' );
        if ($Ext) {
            $Ext .= ' AND';
        }
        $Ext .= " LOWER(s.title) LIKE LOWER('" . $Param{Title} . "') $Self->{LikeEscapeString}";
    }

    # search for the introduction
    if ( $Param{Introduction} ) {
        $Param{Introduction} = "\%$Param{Introduction}\%";
        $Param{Introduction} =~ s/\*/%/g;
        $Param{Introduction} =~ s/%%/%/g;
        $Param{Introduction} = $DBObject->Quote( $Param{Introduction}, 'Like' );
        if ($Ext) {
            $Ext .= ' AND';
        }
        $Ext
            .= " LOWER(s.introduction) LIKE LOWER('"
            . $Param{Introduction}
            . "') $Self->{LikeEscapeString}";
    }

    # search for the description
    if ( $Param{Description} ) {
        $Param{Description} = "\%$Param{Description}\%";
        $Param{Description} =~ s/\*/%/g;
        $Param{Description} =~ s/%%/%/g;
        $Param{Description} = $DBObject->Quote( $Param{Description}, 'Like' );
        if ($Ext) {
            $Ext .= ' AND';
        }
        $Ext
            .= " LOWER(s.description) LIKE LOWER('"
            . $Param{Description}
            . "') $Self->{LikeEscapeString}";
    }

    # search for the notification sender
    if ( $Param{NotificationSender} ) {
        $Param{NotificationSender} = "\%$Param{NotificationSender}\%";
        $Param{NotificationSender} =~ s/\*/%/g;
        $Param{NotificationSender} =~ s/%%/%/g;
        $Param{NotificationSender} = $DBObject->Quote( $Param{NotificationSender}, 'Like' );
        if ($Ext) {
            $Ext .= ' AND';
        }
        $Ext
            .= " LOWER(s.notification_sender) LIKE LOWER('"
            . $Param{NotificationSender}
            . "') $Self->{LikeEscapeString}";
    }

    # search for the notification subject
    if ( $Param{NotificationSubject} ) {
        $Param{NotificationSubject} = "\%$Param{NotificationSubject}\%";
        $Param{NotificationSubject} =~ s/\*/%/g;
        $Param{NotificationSubject} =~ s/%%/%/g;
        $Param{NotificationSubject} = $DBObject->Quote( $Param{NotificationSubject}, 'Like' );
        if ($Ext) {
            $Ext .= ' AND';
        }
        $Ext
            .= " LOWER(s.notification_subject) LIKE LOWER('"
            . $Param{NotificationSubject}
            . "') $Self->{LikeEscapeString}";
    }

    # search for the notification body
    if ( $Param{NotificationBody} ) {
        $Param{NotificationBody} = "\%$Param{NotificationBody}\%";
        $Param{NotificationBody} =~ s/\*/%/g;
        $Param{NotificationBody} =~ s/%%/%/g;
        $Param{NotificationBody} = $DBObject->Quote( $Param{NotificationBody}, 'Like' );
        if ($Ext) {
            $Ext .= ' AND';
        }
        $Ext
            .= " LOWER(s.notification_body) LIKE LOWER('"
            . $Param{NotificationBody}
            . "') $Self->{LikeEscapeString}";
    }

    # search for the status
    if ( $Param{Status} ) {
        $Param{Status} = "\%$Param{Status}\%";
        $Param{Status} =~ s/\*/%/g;
        $Param{Status} =~ s/%%/%/g;
        $Param{Status} = $DBObject->Quote( $Param{Status}, 'Like' );
        if ($Ext) {
            $Ext .= ' AND';
        }
        $Ext .= " LOWER(s.status) LIKE LOWER('" . $Param{Status} . "') $Self->{LikeEscapeString}";
    }

    # search for the create by
    if ( $Param{CreateBy} ) {
        if ($Ext) {
            $Ext .= ' AND';
        }
        $Ext .= " s.create_by = " . $Param{CreateBy};
    }

    # search for the change by
    if ( $Param{ChangeBy} ) {
        if ($Ext) {
            $Ext .= ' AND';
        }
        $Ext .= " s.change_by = " . $Param{ChangeBy};
    }

    # set time params
    my %TimeParams = (

        # times in change_item
        CreateTimeNewerDate => 's.create_time >=',
        CreateTimeOlderDate => 's.create_time <=',
        ChangeTimeNewerDate => 's.change_time >=',
        ChangeTimeOlderDate => 's.change_time <=',
    );

    # check and add time params to WHERE
    TIMEPARAM:
    for my $TimeParam ( sort keys %TimeParams ) {

        next TIMEPARAM if !$Param{$TimeParam};

        # check format
        if ( $Param{$TimeParam} !~ m{ \A \d\d\d\d-\d\d-\d\d \s \d\d:\d\d:\d\d \z }xms ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "The parameter $TimeParam has an invalid date format!",
            );

            return;
        }

        $Param{$TimeParam} = $DBObject->Quote( $Param{$TimeParam} );

        # add time parameter to WHERE
        if ($Ext) {
            $Ext .= ' AND';
        }
        $Ext .= "$TimeParams{$TimeParam} '$Param{$TimeParam}'";
    }

    # add WHERE statement
    if ($Ext) {
        $Ext = ' WHERE ' . $Ext;
    }

    # add the ORDER BY clause
    if (@SQLOrderBy) {
        $Ext .= 'ORDER BY ';
        $Ext .= join ', ', @SQLOrderBy;
        $Ext .= ' ';
        if (@OrderByFields) {
            $SQL .= ', ' . join ', ', @OrderByFields;
        }
    }

    # add extended SQL
    $SQL .= ' FROM survey s ';
    $SQL .= $Ext;

    # ask database
    return if !$DBObject->Prepare(
        SQL   => $SQL,
        Limit => $Param{Limit},
    );

    # fetch the result
    my @List;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @List, $Row[0];
    }

    return @List;
}

=item SurveyStatusSet()

to set a new survey status (Valid, Invalid, Master)

    $StatusSet = $SurveyObject->SurveyStatusSet(
        SurveyID  => 123,
        NewStatus => 'Master'
    );

=cut

sub SurveyStatusSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(SurveyID NewStatus)) {
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

    # get current status
    return if !$DBObject->Prepare(
        SQL => '
            SELECT status
            FROM survey
            WHERE id = ?',
        Bind  => [ \$Param{SurveyID} ],
        Limit => 1,
    );

    # fetch the result
    my $Status = '';
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Status = $Row[0];
    }

    # the current status
    if ( $Status eq 'New' || $Status eq 'Invalid' ) {

        # get the question ids
        return if !$DBObject->Prepare(
            SQL => '
                SELECT id
                FROM survey_question
                WHERE survey_id = ?',
            Bind  => [ \$Param{SurveyID} ],
            Limit => 1,
        );

        # fetch the result
        my $Quest;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $Quest = $Row[0];
        }

        return 'NoQuestion' if !$Quest;

        my %QuestionType = (
            Radio    => 'Radio',
            Checkbox => 'Checkbox',
        );

        # get all questions (type radio and check-box)
        return if !$DBObject->Prepare(
            SQL => '
                SELECT id
                FROM survey_question
                WHERE survey_id = ?
                    AND (question_type = ? OR question_type = ?)',
            Bind => [ \$Param{SurveyID}, \$QuestionType{Radio}, \$QuestionType{Checkbox}, ],
        );

        # fetch the result
        my @QuestionIDs;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            push( @QuestionIDs, $Row[0] );
        }
        for my $OneID (@QuestionIDs) {

            # get all answer ids of a question
            return if !$DBObject->Prepare(
                SQL => '
                    SELECT COUNT(id)
                    FROM survey_answer
                    WHERE question_id = ?',
                Bind  => [ \$OneID ],
                Limit => 1,
            );

            # fetch the result
            my $Counter;
            while ( my @Row = $DBObject->FetchrowArray() ) {
                $Counter = $Row[0];
            }

            return 'IncompleteQuestion' if $Counter < 2;
        }

        # set new status
        if ( $Param{NewStatus} eq 'Master' ) {
            my $ValidStatus = 'Valid';
            return if !$DBObject->Do(
                SQL => '
                    UPDATE survey
                    SET status = ?
                    WHERE status = ?',
                Bind => [ \$ValidStatus, \$Param{NewStatus}, ],
            );

        }
        if ( $Param{NewStatus} eq 'Valid' || $Param{NewStatus} eq 'Master' ) {
            return if !$DBObject->Do(
                SQL => '
                    UPDATE survey SET status = ?
                    WHERE id = ?',
                Bind => [ \$Param{NewStatus}, \$Param{SurveyID}, ],
            );

            return 'StatusSet';
        }
    }
    elsif ( $Status eq 'Valid' ) {

        # set status Master
        if ( $Param{NewStatus} eq 'Master' ) {

            # set any 'Master' survey to 'Valid'
            return if !$DBObject->Do(
                SQL => '
                    UPDATE survey
                    SET status = ?
                    WHERE status = ?',
                Bind => [ \$Status, \$Param{NewStatus}, ],
            );

            # set 'Master' to given survey
            return if !$DBObject->Do(
                SQL => '
                    UPDATE survey
                    SET status = ?
                    WHERE id = ?',
                Bind => [ \$Param{NewStatus}, \$Param{SurveyID}, ],
            );

            return 'StatusSet';
        }

        # set status Invalid
        elsif ( $Param{NewStatus} eq 'Invalid' ) {
            return if !$DBObject->Do(
                SQL => '
                    UPDATE survey
                    SET status = ?
                    WHERE id = ?',
                Bind => [ \$Param{NewStatus}, \$Param{SurveyID}, ],
            );

            return 'StatusSet';
        }
    }
    elsif ( $Status eq 'Master' ) {

        # set status Valid
        if ( $Param{NewStatus} eq 'Valid' || $Param{NewStatus} eq 'Invalid' ) {
            return if !$DBObject->Do(
                SQL => '
                    UPDATE survey
                    SET status = ?
                    WHERE id = ?',
                Bind => [ \$Param{NewStatus}, \$Param{SurveyID}, ],
            );

            return 'StatusSet';
        }
    }
}

=item SurveyQueueGet()

get a survey_queue relation as an array reference

my $QueuesRef = $SurveyObject->SurveyQueueGet(
    SurveyID => 3,
);

=cut

sub SurveyQueueGet {
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

    # get queue ids from database
    $DBObject->Prepare(
        SQL => '
            SELECT queue_id
            FROM survey_queue
            WHERE survey_id = ?
            ORDER BY queue_id ASC',
        Bind => [ \$Param{SurveyID} ],
    );

    # fetch the result
    my @QueueList;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @QueueList, $Row[0];
    }

    return \@QueueList;
}

=item SurveyQueueSet()

add a survey_queue relation

my $Result = $SurveyObject->SurveyQueueSet(
    SurveyID => 3,
    QueueIDs => [1, 7],
);

=cut

sub SurveyQueueSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(SurveyID QueueIDs)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );

            return;
        }
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # remove all existing relations
    return if !$DBObject->Do(
        SQL => '
            DELETE FROM survey_queue
            WHERE survey_id = ?',
        Bind => [ \$Param{SurveyID} ],
    );

    # add all survey_queue relations to database
    for my $QueueID ( @{ $Param{QueueIDs} } ) {

        # add survey_queue relation to database
        return if !$DBObject->Do(
            SQL => '
                INSERT INTO survey_queue (survey_id, queue_id)
                VALUES (?, ?)',
            Bind => [ \$Param{SurveyID}, \$QueueID, ],
        );
    }

    return 1;
}

=item PublicSurveyGet()

to get all public attributes of a survey

    my %PublicSurvey = $SurveyObject->PublicSurveyGet(
            PublicSurveyKey => 'Aw5de3Xf5qA',
            Invalid         => 1, # optional to know if one key was already used.
    );

=cut

sub PublicSurveyGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !defined $Param{PublicSurveyKey} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need SurveyID!',
        );

        return;
    }

    my $SQL = '
        SELECT survey_id
        FROM survey_request
        WHERE public_survey_key = ?';

    my $ValidStrg = ' AND valid_id = 1';

    # if not invalid show just valid keys
    if ( $Param{Invalid} ) {
        $ValidStrg = ' AND valid_id = 0';
    }
    $SQL .= $ValidStrg;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get request
    return if !$DBObject->Prepare(
        SQL   => $SQL,
        Bind  => [ \$Param{PublicSurveyKey} ],
        Limit => 1,
    );

    # fetch the result
    my $SurveyID;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $SurveyID = $Row[0];
    }

    return () if !$SurveyID;

    # get survey
    my $MasterStatus = 'Master';
    my $ValidStatus  = 'Valid';
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id, surveynumber, title, introduction
            FROM survey
            WHERE id = ?
                AND (status = ? OR status = ?)',
        Bind  => [ \$SurveyID, \$MasterStatus, \$ValidStatus, ],
        Limit => 1,
    );

    # fetch the result
    my %Data;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Data{SurveyID}     = $Row[0];
        $Data{SurveyNumber} = $Row[1];
        $Data{Title}        = $Row[2];
        $Data{Introduction} = $Row[3];
    }

    return %Data;
}

=item PublicSurveyInvalidSet()

to set a request invalid

    $SurveyObject->PublicSurveyInvalidSet(
        PublicSurveyKey => 'aVkdE82Dw2qw6erCda',
    );

=cut

sub PublicSurveyInvalidSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{PublicSurveyKey} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need SurveyID!'
        );
        return;
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get request
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id
            FROM survey_request
            WHERE public_survey_key = ?',
        Bind  => [ \$Param{PublicSurveyKey} ],
        Limit => 1,
    );

    # fetch the result
    my $RequestID;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $RequestID = $Row[0];
    }

    return if !$RequestID;

    # update request
    return if !$DBObject->Do(
        SQL => '
            UPDATE survey_request
            SET valid_id = 0, vote_time = current_timestamp
            WHERE id = ?',
        Bind => [ \$RequestID ],
    );

    return 1;
}

=item ElementExists()

exists an survey-, question-, answer- or request-element

    my $ElementExists = $SurveyObject->ElementExists(
        ID => 123,           # SurveyID, QuestionID, AnswerID, RequestID
        Element => 'Survey'  # Survey, Question, Answer, Request
    );

=cut

sub ElementExists {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ElementID Element)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    my %LookupTable = (
        Survey   => 'survey',
        Question => 'survey_question',
        Answer   => 'survey_answer',
        Request  => 'survey_request',
    );

    my $Table = $LookupTable{ $Param{Element} };
    if ( !$Table ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Element: '$Param{Element}' is not valid!",
        );

        return;
    }

    my $SQL = '
            SELECT COUNT(id)
            FROM ';
    $SQL .= $Table;
    $SQL .= ' WHERE id = ?';

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # count element
    return if !$DBObject->Prepare(
        SQL   => $SQL,
        Bind  => [ \$Param{ElementID} ],
        Limit => 1,
    );

    # fetch the result
    my $ElementExists = 'No';
    while ( my @Row = $DBObject->FetchrowArray() ) {
        if ( $Row[0] ) {
            $ElementExists = 'Yes';
        }
    }

    return $ElementExists;
}

=item GetRichTextDocumentComplete()

get some text ready to show as rich-text attachment in-line

    my $RichTextDocumentComplete = $SurveyObject->GetRichTextDocumentComplete(
        Text => $RichText,
    );

=cut

sub GetRichTextDocumentComplete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Text)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument parameter!",
            );

            return;
        }
    }

    # clean HTML string
    my $Text = $Param{Text};
    $Text =~ s{\A\$html\/text\$\s(.*)}{$1}xms;

    # get document complete
    my $HTMLDocumentComplete = $Kernel::OM->Get('Kernel::System::HTMLUtils')->DocumentComplete(
        String  => $Text,
        Charset => 'utf-8',
    );

    return $HTMLDocumentComplete;
}

=item _BuildSendConditionStrg()

build send condition string with the single items

    my %SendConditions = $SurveyObject->_BuildSendConditionStrg(
        TicketTypeIDs => [1, 2, 3], # (optional)
        ServiceIDs    => [1, 2, 3], # (optional)
    );

=cut

sub _BuildSendConditionStrg {
    my ( $Self, %Param ) = @_;

    # build send condition hash
    my %SendConditions;

    ITEM:
    for my $Item (qw(TicketTypeIDs ServiceIDs)) {

        next ITEM if !IsArrayRefWithData( $Param{$Item} );

        $SendConditions{$Item} = $Param{$Item};
    }

    # dump send conditions as string
    my $SendConditionStrg = $Kernel::OM->Get('Kernel::System::YAML')->Dump( Data => \%SendConditions );

    # Make sure the resulting string has the UTF-8 flag. YAML only sets it if
    #   part of the data already had it.
    utf8::upgrade($SendConditionStrg);

    return $SendConditionStrg;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
