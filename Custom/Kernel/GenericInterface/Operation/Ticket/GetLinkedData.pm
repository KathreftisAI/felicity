# --
# Author : Shrinivas R. Ambat
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::Ticket::GetLinkedData;

use strict;
use warnings;

use MIME::Base64;
use Kernel::System::VariableCheck
    qw(IsArrayRefWithData IsHashRefWithData IsStringWithData);

use base qw(
    Kernel::GenericInterface::Operation::Common
    Kernel::GenericInterface::Operation::Ticket::Common
);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Needed (qw(DebuggerObject WebserviceID)) {
        if ( !$Param{$Needed} ) {
            return {
                Success      => 0,
                ErrorMessage => "Got no $Needed!",
            };
        }

        $Self->{$Needed} = $Param{$Needed};
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Result = $Self->Init( WebserviceID => $Self->{WebserviceID}, );

    if ( !$Result->{Success} ) {
        return $Self->ReturnError(
            ErrorCode    => 'Webservice.InvalidConfiguration',
            ErrorMessage => $Result->{ErrorMessage},
        );
    }

    my ( $UserID, $UserType ) = $Self->Auth( %Param, );

    return $Self->ReturnError(
        ErrorCode    => 'GetLinkedData.AuthFail',
        ErrorMessage => "GetLinkedData: Authorization failing!",
    ) if !$UserID;

    my $ReturnData = { Success => 1, };

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $TicketID   = $Param{Data}->{TicketID};
    my $PageSize   = $Param{Data}->{PageSize} || 10;
    my $PageNumber = $Param{Data}->{PageNumber} || 0;
    my $Limit      = $PageSize * $PageNumber;
    my $Index      = $Limit - $PageSize + 1;

    my $TicketCountSQL
        = "Select count(source_key) from link_relation where source_key=? or target_key=?";
    return
        if !$DBObject->Prepare(
        SQL  => $TicketCountSQL,
        Bind => [ \$TicketID, \$TicketID ]
        );
    my $TotalCount;

    while ( my @Row = $DBObject->FetchrowArray() ) {
        $TotalCount = $Row[0];
    }

    # POSTGRES QUERY

#     my $SQL = "SELECT ci.id,
#        ci.configitem_number AS number,
#        cv.name AS title,
#        ci.create_time,
#        'Config Item' AS TYPE
# FROM configitem ci
# LEFT JOIN configitem_version cv ON ci.id = cv.configitem_id
# WHERE ci.id IN
#     (SELECT cast(lr.target_key AS bigint) AS id
#      FROM link_relation lr
#      LEFT JOIN link_object lo ON lr.target_object_id = lo.id
#      WHERE lr.source_key=?
#        AND lr.source_object_id = 1
#        AND lr.target_object_id = 5
#      UNION SELECT cast(lr.source_key AS bigint) AS id
#      FROM link_relation lr
#      LEFT JOIN link_object lo ON lr.target_object_id = lo.id
#      WHERE lr.target_key=?
#        AND lr.source_object_id = 5
#        AND lr.target_object_id = 1)
# UNION
# SELECT t.id,
#        t.tn AS number,
#        t.title AS title,
#        t.create_time,
#        'Ticket' AS TYPE
# FROM ticket t
# WHERE t.id IN
#     (SELECT cast(lr.target_key AS bigint) AS id
#      FROM link_relation lr
#      LEFT JOIN link_object lo ON lr.target_object_id = lo.id
#      WHERE lr.source_key=?
#        AND lr.source_object_id = 1
#        AND lr.target_object_id = 1
#      UNION SELECT cast(lr.source_key AS bigint) AS id
#      FROM link_relation lr
#      LEFT JOIN link_object lo ON lr.target_object_id = lo.id
#      WHERE lr.target_key=?
#        AND lr.source_object_id = 1
#        AND lr.target_object_id = 1)
# UNION
# SELECT c.id,
#        c.change_number AS number,
#        c.title AS title,
#        c.create_time,
#        'Change' AS TYPE
# FROM change_item c
# WHERE c.id IN
#     (SELECT cast(lr.target_key AS bigint)
#      FROM link_relation lr
#      LEFT JOIN link_object lo ON lr.target_object_id = lo.id
#      WHERE lr.source_key=?
#        AND lr.source_object_id = 1
#        AND lr.target_object_id = 3
#      UNION SELECT cast(lr.source_key AS bigint)
#      FROM link_relation lr
#      LEFT JOIN link_object lo ON lr.target_object_id = lo.id
#      WHERE lr.target_key=?
#        AND lr.source_object_id = 3
#        AND lr.target_object_id = 1)
# UNION
# SELECT cw.change_id,
#        concat(cgi.change_number,'-',cast(cw.workorder_number AS character varying(255))) AS number,
#        cw.title,
#        cw.create_time,
#        'Work Order' AS TYPE
# FROM change_workorder cw
# LEFT JOIN change_item cgi ON cw.change_id = cgi.id
# WHERE cw.id IN
#     (SELECT cast(lr.target_key AS bigint)
#      FROM link_relation lr
#      LEFT JOIN link_object lo ON lr.target_object_id = lo.id
#      WHERE lr.source_key=?
#        AND lr.source_object_id = 1
#        AND lr.target_object_id = 4
#      UNION SELECT cast(lr.source_key AS bigint)
#      FROM link_relation lr
#      LEFT JOIN link_object lo ON lr.target_object_id = lo.id
#      WHERE lr.target_key=?
#        AND lr.source_object_id = 4
#        AND lr.target_object_id = 1)
# UNION
# SELECT fi.id,
#        fi.f_number,
#        fi.f_subject,
#        fi.created as create_time,
#        'FAQ' AS TYPE
# FROM faq_item fi
# WHERE fi.id IN
#     (SELECT cast(lr.target_key AS bigint)
#      FROM link_relation lr
#      LEFT JOIN link_object lo ON lr.target_object_id = lo.id
#      WHERE lr.source_key=?
#        AND lr.source_object_id = 1
#        AND lr.target_object_id = 6
#      UNION SELECT cast(lr.source_key AS bigint)
#      FROM link_relation lr
#      LEFT JOIN link_object lo ON lr.target_object_id = lo.id
#      WHERE lr.target_key=?
#        AND lr.source_object_id = 6
#        AND lr.target_object_id = 1)
# ORDER BY create_time DESC";

    # MYSQL Query
    my $SQL = "SELECT ci.id,
       ci.configitem_number AS number,
       cv.name AS title,
       ci.create_time,
       'Config Item' AS TYPE
FROM configitem ci
LEFT JOIN configitem_version cv ON ci.id = cv.configitem_id
WHERE ci.id IN
    (SELECT lr.target_key AS id
     FROM link_relation lr
     LEFT JOIN link_object lo ON lr.target_object_id = lo.id
     WHERE lr.source_key=?
       AND lr.source_object_id = 1
       AND lr.target_object_id = 5
     UNION SELECT lr.source_key AS id
     FROM link_relation lr
     LEFT JOIN link_object lo ON lr.target_object_id = lo.id
     WHERE lr.target_key=?
       AND lr.source_object_id = 5
       AND lr.target_object_id = 1)
UNION
SELECT t.id,
       t.tn AS number,
       t.title AS title,
       t.create_time,
       'Ticket' AS TYPE
FROM ticket t
WHERE t.id IN
    (SELECT lr.target_key AS id
     FROM link_relation lr
     LEFT JOIN link_object lo ON lr.target_object_id = lo.id
     WHERE lr.source_key=?
       AND lr.source_object_id = 1
       AND lr.target_object_id = 1
     UNION SELECT lr.source_key AS id
     FROM link_relation lr
     LEFT JOIN link_object lo ON lr.target_object_id = lo.id
     WHERE lr.target_key=?
       AND lr.source_object_id = 1
       AND lr.target_object_id = 1)
UNION
SELECT c.id,
       c.change_number AS number,
       c.title AS title,
       c.create_time,
       'Change' AS TYPE
FROM change_item c
WHERE c.id IN
    (SELECT lr.target_key
     FROM link_relation lr
     LEFT JOIN link_object lo ON lr.target_object_id = lo.id
     WHERE lr.source_key=?
       AND lr.source_object_id = 1
       AND lr.target_object_id = 3
     UNION SELECT lr.source_key
     FROM link_relation lr
     LEFT JOIN link_object lo ON lr.target_object_id = lo.id
     WHERE lr.target_key=?
       AND lr.source_object_id = 3
       AND lr.target_object_id = 1)
UNION
SELECT cw.change_id,
       concat(cgi.change_number,'-',cw.workorder_number) AS number,
       cw.title,
       cw.create_time,
       'Work Order' AS TYPE
FROM change_workorder cw
LEFT JOIN change_item cgi ON cw.change_id = cgi.id
WHERE cw.id IN
    (SELECT lr.target_key
     FROM link_relation lr
     LEFT JOIN link_object lo ON lr.target_object_id = lo.id
     WHERE lr.source_key=?
       AND lr.source_object_id = 1
       AND lr.target_object_id = 4
     UNION SELECT lr.source_key
     FROM link_relation lr
     LEFT JOIN link_object lo ON lr.target_object_id = lo.id
     WHERE lr.target_key=?
       AND lr.source_object_id = 4
       AND lr.target_object_id = 1)
UNION
SELECT fi.id,
       fi.f_number,
       fi.f_subject,
       fi.created as create_time,
       'FAQ' AS TYPE
FROM faq_item fi
WHERE fi.id IN
    (SELECT lr.target_key
     FROM link_relation lr
     LEFT JOIN link_object lo ON lr.target_object_id = lo.id
     WHERE lr.source_key=?
       AND lr.source_object_id = 1
       AND lr.target_object_id = 6
     UNION SELECT lr.source_key
     FROM link_relation lr
     LEFT JOIN link_object lo ON lr.target_object_id = lo.id
     WHERE lr.target_key=?
       AND lr.source_object_id = 6
       AND lr.target_object_id = 1)
ORDER BY create_time DESC";

    return
        if !$DBObject->Prepare(
        SQL  => $SQL,
        Bind => [
            \$TicketID, \$TicketID, \$TicketID, \$TicketID, \$TicketID,
            \$TicketID, \$TicketID, \$TicketID, \$TicketID, \$TicketID
        ]
        );

    my @ItemList;
    my $Counter = 0;
    my $Count   = 1;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        if($Row[0]){
          $Counter++;
        }
        if ( $Counter >= $Index && $Count <= $PageSize ) {
            my %Item;
            $Item{id}          = $Row[0];
            $Item{number}      = $Row[1];
            $Item{title}       = $Row[2];
            $Item{create_time} = $Row[3];
            $Item{type}        = $Row[4];
            push @ItemList, \%Item;
            $Count++;
        }
    }
    $ReturnData->{Data}->{Item}       = \@ItemList;
    $ReturnData->{Data}->{TotalCount} = $TotalCount;
    return $ReturnData;

}
