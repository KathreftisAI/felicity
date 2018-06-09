# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Ticket::ArticleSearchIndex::RuntimeDB;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::DB',
    'Kernel::System::Log',
);

sub ArticleIndexBuild {
    my ( $Self, %Param ) = @_;

    return 1;
}

sub ArticleIndexDelete {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(ArticleID UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    # Make sure any stale entries from a previously used StaticDB are cleaned up,
    #   they might otherwise prevent the ticket from being deleted.
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL  => 'DELETE FROM article_search WHERE id = ?',
        Bind => [ \$Param{ArticleID} ],
    );

    return 1;
}

sub ArticleIndexDeleteTicket {
    my ( $Self, %Param ) = @_;

    return 1;
}

sub _ArticleIndexQuerySQL {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Data)) {
        if ( !$Param{$_} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $_!"
            );
            return;
        }
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
            return ' INNER JOIN article art ON st.id = art.ticket_id ';
        }
    }

    return '';
}

sub _ArticleIndexQuerySQLExt {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Data)) {
        if ( !$Param{$_} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $_!"
            );
            return;
        }
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
                Value        => $Param{Data}->{$Key},
                SearchPrefix => $Param{Data}->{ContentSearchPrefix},
                SearchSuffix => $Param{Data}->{ContentSearchSuffix},
                Extended     => 1,
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
            $Value = $DBObject->Quote( $Value, 'Like' );

            # check if database supports LIKE in large text types (in this case for body)
            if ( !$DBObject->GetDatabaseFunction('CaseSensitive') ) {
                $FullTextSQL .= " $Field LIKE '$Value'";
            }
            elsif ( $DBObject->GetDatabaseFunction('LcaseLikeInLargeText') ) {
                $FullTextSQL .= " LCASE($Field) LIKE LCASE('$Value')";
            }
            else {
                $FullTextSQL .= " LOWER($Field) LIKE LOWER('$Value')";
            }
        }
    }
    if ($FullTextSQL) {
        $SQLExt = ' AND (' . $FullTextSQL . ')';
    }
    return $SQLExt;
}

1;
