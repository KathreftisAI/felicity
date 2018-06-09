# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Survey::Request;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::System::Survey::Request - sub module of Kernel::System::Survey

=head1 SYNOPSIS

All survey request functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item RequestGet()

to get an array list of request elements

    my %RequestData = $SurveyObject->RequestGet(
        PublicSurveyKey => 'Aw5de3Xf5qA',
    );

=cut

sub RequestGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{PublicSurveyKey} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need PublicSurveyKey!',
        );

        return;
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get vote list
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id, ticket_id, survey_id, valid_id, public_survey_key, send_to, send_time,
                vote_time
            FROM survey_request
            WHERE public_survey_key = ?',
        Bind  => [ \$Param{PublicSurveyKey} ],
        Limit => 1,
    );

    # fetch the result
    my %RequestData;

    while ( my @Row = $DBObject->FetchrowArray() ) {
        $RequestData{RequestID}       = $Row[0];
        $RequestData{TicketID}        = $Row[1];
        $RequestData{SurveyID}        = $Row[2];
        $RequestData{ValidID}         = $Row[3];
        $RequestData{PublicSurveyKey} = $Row[4];
        $RequestData{SendTo}          = $Row[5];
        $RequestData{SendTime}        = $Row[6];
        $RequestData{VoteTime}        = $Row[7];
    }

    return %RequestData;
}

=item RequestSend()

to send a request to a customer (if master survey is set)

    $SurveyObject->RequestSend(
        TicketID => 123,
    );

=cut

sub RequestSend {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{TicketID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need TicketID!',
        );

        return;
    }

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    # create PublicSurveyKey
    my $PublicSurveyKey;
    if ( !$Param{PublicSurveyKey} ) {
        my $MD5 = Digest::MD5->new();
        $MD5->add( $TimeObject->SystemTime() . int( rand(999999999) ) );
        $PublicSurveyKey = $MD5->hexdigest();
    }
    else {
        $PublicSurveyKey = $Param{PublicSurveyKey};
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # find master survey
    my $Status = 'Master';
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id
            FROM survey
            WHERE status = ?',
        Bind  => [ \$Status ],
        Limit => 1,
    );

    # fetch the result
    my $SurveyID;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $SurveyID = $Row[0];
    }

    # return, no master survey found
    return if !$SurveyID;

    # get the survey
    my %Survey = $Self->SurveyGet(
        SurveyID => $SurveyID,
    );
    my $Subject = $Survey{NotificationSubject};
    my $Body    = $Survey{NotificationBody};

    # fix new lines
    $Body =~ s/(\n\r|\r\r\n|\r\n)/\n/g;

    # get ticket object
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # ticket data
    my %Ticket = $TicketObject->TicketGet(
        TicketID => $Param{TicketID},
    );

    # check if ticket is in a send queue
    if ( $Survey{Queues} && ref $Survey{Queues} eq 'ARRAY' && @{ $Survey{Queues} } ) {
        my $Found;

        QUEUE:
        for my $QueueID ( @{ $Survey{Queues} } ) {
            next QUEUE if $Ticket{QueueID} != $QueueID;
            $Found = 1;
            last QUEUE;
        }

        return if !$Found;
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # check if the for send condition ticket type check is enabled
    if ( $ConfigObject->Get('Survey::CheckSendConditionTicketType') ) {

        # check if ticket is in a send ticket type id
        if ( IsArrayRefWithData( $Survey{TicketTypeIDs} ) ) {

            return if !$Ticket{TypeID};

            my $Found;

            TICKETTYPE:
            for my $TicketTypeID ( @{ $Survey{TicketTypeIDs} } ) {
                next TICKETTYPE if $Ticket{TypeID} != $TicketTypeID;
                $Found = 1;
                last TICKETTYPE;
            }

            return if !$Found;
        }
    }

    # check if the send condition service check is enabled
    if ( $ConfigObject->Get('Survey::CheckSendConditionService') ) {

        # check if ticket is in a send service
        if ( IsArrayRefWithData( $Survey{ServiceIDs} ) ) {

            return if !$Ticket{ServiceID};

            my $Found;

            SERVICE:
            for my $ServiceID ( @{ $Survey{ServiceIDs} } ) {
                next SERVICE if $Ticket{ServiceID} != $ServiceID;
                $Found = 1;
                last SERVICE;
            }

            return if !$Found;
        }
    }

    for my $Data ( sort keys %Ticket ) {
        if ( defined $Ticket{$Data} ) {
            $Subject =~ s/<OTRS_TICKET_$Data>/$Ticket{$Data}/gi;
            $Body =~ s/<OTRS_TICKET_$Data>/$Ticket{$Data}/gi;

            # filter for new rich text content
            $Body =~ s/&lt;OTRS_TICKET_$Data&gt;/$Ticket{$Data}/g;
        }
    }

    # cleanup
    $Subject =~ s/<OTRS_TICKET_.+?>/-/gi;
    $Body =~ s/<OTRS_TICKET_.+?>/-/gi;

    # replace config options
    $Subject =~ s{<OTRS_CONFIG_(.+?)>}{$ConfigObject->Get($1)}egx;
    $Body =~ s{<OTRS_CONFIG_(.+?)>}{$ConfigObject->Get($1)}egx;

    # filter for new rich text content
    $Body =~ s{&lt;OTRS_CONFIG_(.+?)&gt;}{$ConfigObject->Get($1)}egx;

    # cleanup
    $Subject =~ s/<OTRS_CONFIG_.+?>/-/gi;
    $Body =~ s/<OTRS_CONFIG_.+?>/-/gi;

    # filter for new rich text content
    $Body =~ s/&lt;OTRS_CONFIG_.+?&gt;/-/gi;

    # get customer data and replace it with <OTRS_CUSTOMER_DATA_...
    my %CustomerUser;
    if ( $Ticket{CustomerUserID} ) {
        %CustomerUser = $Kernel::OM->Get('Kernel::System::CustomerUser')->CustomerUserDataGet(
            User => $Ticket{CustomerUserID},
        );

        # replace customer stuff with tags
        CUSTOMER:
        for my $Data ( sort keys %CustomerUser ) {
            next CUSTOMER if !$CustomerUser{$Data};

            $Subject =~ s/<OTRS_CUSTOMER_DATA_$Data>/$CustomerUser{$Data}/gi;
            $Body =~ s/<OTRS_CUSTOMER_DATA_$Data>/$CustomerUser{$Data}/gi;

            # filter for new rich text content
            $Body =~ s/&lt;OTRS_CUSTOMER_DATA_$Data&gt;/$CustomerUser{$Data}/gi;
        }
    }

    # cleanup all not needed <OTRS_CUSTOMER_DATA_ tags
    $Subject =~ s/<OTRS_CUSTOMER_DATA_.+?>/-/gi;
    $Body =~ s/<OTRS_CUSTOMER_DATA_.+?>/-/gi;

    # filter for new rich text content
    $Body =~ s/&lt;OTRS_CUSTOMER_DATA_.+?&gt;/-/gi;

    # replace key
    $Subject =~ s/<OTRS_PublicSurveyKey>/$PublicSurveyKey/gi;
    $Body =~ s/<OTRS_PublicSurveyKey>/$PublicSurveyKey/gi;

    # filter for new rich text content
    $Body =~ s/&lt;OTRS_PublicSurveyKey&gt;/$PublicSurveyKey/gi;

    # Get request recipient.
    my $To = $Self->_GetRequestRecipient(
        UserEmail => $CustomerUser{UserEmail} // '',
        TicketID => $Param{TicketID},
    );

    return if !$To;

    # check if not survey should be send
    my $SendNoSurveyRegExp = $ConfigObject->Get('Survey::SendNoSurveyRegExp');

    return if $SendNoSurveyRegExp && $To =~ /$SendNoSurveyRegExp/i;

    # Only if we haven't been called by CRON
    if ( !$Param{TriggerSendRequests} ) {
        my $AmountOfSurveysPer30Days = $ConfigObject->Get('Survey::AmountOfSurveysPer30Days');

        # if we should just send a certain amount of surveys per 30 days & recipient
        if ($AmountOfSurveysPer30Days) {
            my $Now = $TimeObject->SystemTime();

            # Find all surveys that were created in the last 30 days
            my $ThirtyDaysAgo = $Now - 30 * 86400;
            $ThirtyDaysAgo = $TimeObject->SystemTime2TimeStamp( SystemTime => $ThirtyDaysAgo );
            my $LastSentTime = 0;

            return if !$DBObject->Prepare(
                SQL => '
                    SELECT create_time
                    FROM survey_request
                    WHERE LOWER(send_to) = ?
                        AND create_time >= ?
                    ORDER BY create_time DESC',
                Bind => [ \$To, \$ThirtyDaysAgo, ],
            );

            # fetch the result
            my @Rows;
            while ( my @Row = $DBObject->FetchrowArray() ) {
                push @Rows, $Row[0];
            }

            # If we have reached the maximum amount of surveys per month
            if ( scalar @Rows >= $AmountOfSurveysPer30Days ) {

                return;
            }
        }
    }

    # check if a survey is sent in the last time
    my $SendPeriod = $ConfigObject->Get('Survey::SendPeriod');
    if ($SendPeriod) {
        my $LastSentTime = 0;

        # get send time
        return if !$DBObject->Prepare(
            SQL => '
                SELECT send_time
                FROM survey_request
                WHERE LOWER(send_to) = ?
                ORDER BY send_time DESC',
            Bind  => [ \$To ],
            Limit => 1,
        );

        # fetch the result
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $LastSentTime = $Row[0];
        }
        if ($LastSentTime) {
            my $Now = $TimeObject->SystemTime();
            $LastSentTime = $TimeObject->TimeStamp2SystemTime( String => $LastSentTime );

            return if ( $LastSentTime + $SendPeriod * 60 * 60 * 24 ) > $Now;

        }
    }
    my $SendInHoursAfterClose = $ConfigObject->Get('Survey::SendInHoursAfterClose');

    # If no Delayed Sending is configured
    # send immediately, log it to Ticket History and insert it to survey_requests
    # including sent_time
    if ( !$SendInHoursAfterClose && !$Param{TriggerSendRequests} ) {

        # insert request
        return if !$DBObject->Do(
            SQL => '
                INSERT INTO survey_request (ticket_id, survey_id, valid_id, public_survey_key,
                    send_to, send_time, create_time)
                VALUES (?, ?, 1, ?, ?, current_timestamp, current_timestamp)',
            Bind => [ \$Param{TicketID}, \$SurveyID, \$PublicSurveyKey, \$To ],
        );

        # log action on ticket
        $TicketObject->HistoryAdd(
            TicketID     => $Param{TicketID},
            CreateUserID => 1,
            HistoryType  => 'Misc',
            Name         => "Sent customer survey to '$To'.",
        );
    }

    # If we should send delayed just CRON jobs deliver "TriggerSendRequests",
    # so we were called by a closed ticket
    # and have to create the survey_request record with no send_time
    # (will be filled in by CRON job as soon as it really got delivered)
    # additionally no Ticket History yet, cause no send has happened
    elsif ( $SendInHoursAfterClose && !$Param{TriggerSendRequests} ) {

        # insert request
        return if !$DBObject->Do(
            SQL => '
                INSERT INTO survey_request (ticket_id, survey_id, valid_id, public_survey_key,
                    send_to, create_time)
                VALUES (?, ?, 1, ?, ?, current_timestamp)',
            Bind => [ \$Param{TicketID}, \$SurveyID, \$PublicSurveyKey, \$To, ],
        );

    }

    # here we got called by CRON, and no matter if SendInHoursAfterClose is configured
    # or not, we have to send the survey requests that weren't sent yet
    # this time we have to update the survey_request line
    # to fill in the send_time and create the Ticket History entry
    elsif (
        $Param{TriggerSendRequests}
        && $Param{SurveyRequestID}
        && $Param{SurveyRequestID} =~ /^\d+$/
        )
    {
        return if !$DBObject->Do(
            SQL => '
                UPDATE survey_request
                SET send_time = current_timestamp
                WHERE id = ?',
            Bind => [ \$Param{SurveyRequestID} ],
        );

        # log action on ticket
        $TicketObject->HistoryAdd(
            TicketID     => $Param{TicketID},
            CreateUserID => 1,
            HistoryType  => 'Misc',
            Name         => "Sent customer survey to '$To'.",
        );
    }

    # get charset
    my $Charset = $ConfigObject->Get('DefaultCharset') || 'utf-8';

    # get HTMLUtils object
    my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');

    # clean HTML and convert the Field in HTML (\n --><br>)
    $Body =~ s{\A\$html\/text\$\s(.*)}{$1}xms;
    if ( !$1 ) {

        # convert body to HTML
        $Body = $HTMLUtilsObject->ToHTML(
            String => $Body,
        );
    }

    # prepare HTML links
    $HTMLUtilsObject->LinkQuote(
        String => \$Body,
    );

    # complete HTML document
    $Body = $HTMLUtilsObject->DocumentComplete(
        String  => $Body,
        Charset => $Charset,
    );

    # send survey
    if ( !$SendInHoursAfterClose || $Param{TriggerSendRequests} ) {
        return $Kernel::OM->Get('Kernel::System::Email')->Send(
            From     => $Survey{NotificationSender},
            To       => $To,
            Subject  => $Subject,
            MimeType => 'text/html',
            Charset  => $Charset,
            Body     => $Body,
        );
    }

    return 1;
}

=item RequestCount()

to count all requests of a survey

    my $RequestCount = $SurveyObject->RequestCount(
        QuestionID => 123,
        ValidID => 0,       # (0|1|all)
    );

=cut

sub RequestCount {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(SurveyID ValidID)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # count requests
    my $SQL = '
        SELECT COUNT(id)
        FROM survey_request
        WHERE survey_id = ?';

    # add valid part
    if ( !$Param{ValidID} ) {
        $SQL .= " AND valid_id = 0";
    }
    elsif ( $Param{ValidID} eq 1 ) {
        $SQL .= " AND valid_id = 1";
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # ask database
    return if !$DBObject->Prepare(
        SQL   => $SQL,
        Bind  => [ \$Param{SurveyID} ],
        Limit => 1,
    );

    # fetch the result
    my $RequestCount;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $RequestCount = $Row[0];
    }

    return $RequestCount;
}

=begin Internal:

=cut

=item _GetRequestRecipient()

Extracts and checks the recipient for the request.

    my $Recipient = $SurveyObject->_GetRequestRecipient(
        UserEmail => 'User <user@example.com>',     # optional
        TicketID  => 123,                           # optional
    )

Returns:

    $Recipient = 'user@example.com';    # or false in case of an error.

=cut

sub _GetRequestRecipient {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserEmail} && !$Param{TicketID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need UserEmail or TicketID",
        );

        return;
    }

    my $ToString = $Param{UserEmail};

    if ( !$ToString ) {
        my %Article = $Kernel::OM->Get('Kernel::System::Ticket')->ArticleLastCustomerArticle(
            TicketID => $Param{TicketID},
        );
        if ( %Article && $Article{SenderType} eq 'customer' ) {
            $ToString = $Article{From};
        }
        else {
            $ToString = $Article{To};
        }
    }

    # parse the to string
    my $To;
    for my $ToParser ( Mail::Address->parse($ToString) ) {
        $To = $ToParser->address();
    }

    # return if no to is found
    return if !$To;

    # check if it's a valid email address (min is needed)
    return if $To !~ /@/;

    # convert to lower cases
    $To = lc $To;

    # check recipient blacklist
    my $RecipientBlacklist = $Kernel::OM->Get('Kernel::Config')->Get('Survey::NotificationRecipientBlacklist');
    if (
        defined $RecipientBlacklist
        && ref $RecipientBlacklist eq 'ARRAY'
        && @{$RecipientBlacklist}
        )
    {
        for my $Recipient ( @{$RecipientBlacklist} ) {
            return if defined $Recipient && length $Recipient && $To eq lc $Recipient;
        }
    }

    return $To;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
