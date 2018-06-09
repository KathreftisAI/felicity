# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Ticket::ArticleSearchIndex::StaticDB;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DB',
    'Kernel::System::Log',
);

sub ArticleIndexBuild {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(ArticleID UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # get article data
    my %Article = $Self->ArticleGet(
        ArticleID     => $Param{ArticleID},
        UserID        => $Param{UserID},
        DynamicFields => 0,
    );

    my $SearchIndexAttributes = $Kernel::OM->Get('Kernel::Config')->Get('Ticket::SearchIndex::Attribute');
    for my $Key (qw(From To Cc Subject)) {
        if ( $Article{$Key} ) {
            $Article{$Key} = $Self->_ArticleIndexString(
                String        => $Article{$Key},
                WordLengthMin => $SearchIndexAttributes->{WordLengthMin} || 3,
                WordLengthMax => $SearchIndexAttributes->{WordLengthMax} || 30,
            );
        }
    }

    if ( $Article{Body} ) {
        $Article{Body} = $Self->_ArticleIndexString(
            String => $Article{Body},
        );
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # update search index table
    $DBObject->Do(
        SQL  => 'DELETE FROM article_search WHERE id = ?',
        Bind => [ \$Article{ArticleID}, ],
    );

    # return if no content exists
    return 1 if !$Article{Body};

    # insert search index
    $DBObject->Do(
        SQL => '
            INSERT INTO article_search (id, ticket_id, article_type_id,
                article_sender_type_id, a_from, a_to,
                a_cc, a_subject, a_body,
                incoming_time)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        Bind => [
            \$Article{ArticleID},    \$Article{TicketID}, \$Article{ArticleTypeID},
            \$Article{SenderTypeID}, \$Article{From},     \$Article{To},
            \$Article{Cc},           \$Article{Subject},  \$Article{Body},
            \$Article{IncomingTime},
        ],
    );

    return 1;
}

sub ArticleIndexDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(ArticleID UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    # delete articles
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL  => 'DELETE FROM article_search WHERE id = ?',
        Bind => [ \$Param{ArticleID} ],
    );

    return 1;
}

sub ArticleIndexDeleteTicket {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(TicketID UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    # delete articles
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL  => 'DELETE FROM article_search WHERE ticket_id = ?',
        Bind => [ \$Param{TicketID} ],
    );

    return 1;
}

sub _ArticleIndexQuerySQL {
    my ( $Self, %Param ) = @_;

    if ( !$Param{Data} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need Data!"
        );
        return;
    }

    # use also article table if required
    for (
        qw(
        From To Cc Subject Body
        ArticleCreateTimeOlderMinutes ArticleCreateTimeNewerMinutes
        ArticleCreateTimeOlderDate ArticleCreateTimeNewerDate
        )
        )
    {
        if ( $Param{Data}->{$_} ) {
            return ' INNER JOIN article_search art ON st.id = art.ticket_id ';
        }
    }

    return '';
}

sub _ArticleIndexQuerySQLExt {
    my ( $Self, %Param ) = @_;

    if ( !$Param{Data} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need Data!"
        );
        return;
    }

    my %FieldSQLMapFullText = (
        From    => 'art.a_from',
        To      => 'art.a_to',
        Cc      => 'art.a_cc',
        Subject => 'art.a_subject',
        Body    => 'art.a_body',
    );

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $SQLExt      = '';
    my $FullTextSQL = '';
    KEY:
    for my $Key ( sort keys %FieldSQLMapFullText ) {

        next KEY if !$Param{Data}->{$Key};

        # replace * by % for SQL like
        $Param{Data}->{$Key} =~ s/\*/%/gi;

        # check search attribute, we do not need to search for *
        next KEY if $Param{Data}->{$Key} =~ /^\%{1,3}$/;

        if ($FullTextSQL) {
            $FullTextSQL .= ' ' . $Param{Data}->{ContentSearch} . ' ';
        }

        # check if search condition extension is used
        if ( $Param{Data}->{ConditionInline} ) {
            $FullTextSQL .= $DBObject->QueryCondition(
                Key          => $FieldSQLMapFullText{$Key},
                Value        => lc $Param{Data}->{$Key},
                SearchPrefix => $Param{Data}->{ContentSearchPrefix},
                SearchSuffix => $Param{Data}->{ContentSearchSuffix},
                Extended     => 1,
                CaseSensitive => 1,    # data in article_search are already stored in lower cases
            );
        }
        else {

            my $Field = $FieldSQLMapFullText{$Key};
            my $Value = $Param{Data}->{$Key};

            if ( $Param{Data}->{ContentSearchPrefix} ) {
                $Value = $Param{Data}->{ContentSearchPrefix} . $Value;
            }
            if ( $Param{Data}->{ContentSearchSuffix} ) {
                $Value .= $Param{Data}->{ContentSearchSuffix};
            }

            # replace %% by % for SQL
            $Param{Data}->{$Key} =~ s/%%/%/gi;

            # replace * with % (for SQL)
            $Value =~ s/\*/%/g;

            # db quote
            $Value = lc $DBObject->Quote( $Value, 'Like' );

            # Lower conversion is already done, don't use LOWER()/LCASE()
            $FullTextSQL .= " $Field LIKE '$Value'";
        }
    }

    if ($FullTextSQL) {
        $SQLExt = ' AND (' . $FullTextSQL . ')';
    }

    return $SQLExt;
}

sub _ArticleIndexString {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{String} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need String!",
        );
        return;
    }

    my $SearchIndexAttributes = $Kernel::OM->Get('Kernel::Config')->Get('Ticket::SearchIndex::Attribute');

    my $WordCountMax = $SearchIndexAttributes->{WordCountMax} || 1000;

    # get words (use eval to prevend exits on damaged utf8 signs)
    my $ListOfWords = eval {
        $Self->_ArticleIndexStringToWord(
            String        => \$Param{String},
            WordLengthMin => $Param{WordLengthMin} || $SearchIndexAttributes->{WordLengthMin} || 3,
            WordLengthMax => $Param{WordLengthMax} || $SearchIndexAttributes->{WordLengthMax} || 30,
        );
    };

    return if !$ListOfWords;

    # find ranking of words
    my %List;
    my $IndexString = '';
    my $Count       = 0;
    WORD:
    for my $Word ( @{$ListOfWords} ) {

        $Count++;

        # only index the first 1000 words
        last WORD if $Count > $WordCountMax;

        if ( $List{$Word} ) {

            $List{$Word}++;

            next WORD;
        }
        else {

            $List{$Word} = 1;

            if ($IndexString) {
                $IndexString .= ' ';
            }

            $IndexString .= $Word
        }
    }

    return $IndexString;
}

sub _ArticleIndexStringToWord {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !defined $Param{String} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need String!",
        );
        return;
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $SearchIndexAttributes = $ConfigObject->Get('Ticket::SearchIndex::Attribute');
    my @Filters               = @{ $ConfigObject->Get('Ticket::SearchIndex::Filters') || [] };
    my $StopWordRaw           = $ConfigObject->Get('Ticket::SearchIndex::StopWords') || {};

    # error handling
    if ( !$StopWordRaw || ref $StopWordRaw ne 'HASH' ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Invalid config option Ticket::SearchIndex::StopWords! "
                . "Please reset the search index options to reactivate the factory defaults.",
        );

        return;
    }

    my %StopWord;
    LANGUAGE:
    for my $Language ( sort keys %{$StopWordRaw} ) {

        if ( !$Language || !$StopWordRaw->{$Language} || ref $StopWordRaw->{$Language} ne 'ARRAY' ) {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid config option Ticket::SearchIndex::StopWords###$Language! "
                    . "Please reset this option to reactivate the factory defaults.",
            );

            next LANGUAGE;
        }

        WORD:
        for my $Word ( @{ $StopWordRaw->{$Language} } ) {

            next WORD if !defined $Word || !length $Word;

            $Word = lc $Word;

            $StopWord{$Word} = 1;
        }
    }

    # get words
    my $LengthMin = $Param{WordLengthMin} || $SearchIndexAttributes->{WordLengthMin} || 3;
    my $LengthMax = $Param{WordLengthMax} || $SearchIndexAttributes->{WordLengthMax} || 30;
    my @ListOfWords;

    WORD:
    for my $Word ( split /\s+/, ${ $Param{String} } ) {

        # apply filters
        FILTER:
        for my $Filter (@Filters) {
            next FILTER if !defined $Word || !length $Word;
            $Word =~ s/$Filter//g;
        }

        next WORD if !defined $Word || !length $Word;

        # convert to lowercase to avoid LOWER()/LCASE() in the DB query
        $Word = lc $Word;

        next WORD if $StopWord{$Word};

        # only index words/strings within length boundaries
        my $Length = length $Word;

        next WORD if $Length < $LengthMin;
        next WORD if $Length > $LengthMax;

        push @ListOfWords, $Word;
    }

    return \@ListOfWords;
}

1;
