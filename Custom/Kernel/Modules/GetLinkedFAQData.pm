# --
# Author : Rohit Ambre


package Kernel::Modules::GetLinkedFAQData;

use strict;
use warnings;

use MIME::Base64;
use Kernel::System::VariableCheck qw(IsArrayRefWithData IsHashRefWithData IsStringWithData);


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

    my $JSON = '';

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $TicketID   = $ParamObject->GetParam( Param => 'TicketID' );
    my $PageSize   = $ParamObject->GetParam( Param => 'PageSize' ) || 10;
    my $PageNumber = $ParamObject->GetParam( Param => 'PageNumber' ) || 0;
    my $Limit      = $PageSize * $PageNumber;
    my $Index      = $Limit - $PageSize + 1;

    my $TicketCountSQL
        = "Select count(source_key) from link_relation where (source_key=? OR target_key=?) AND (target_object_id=5 OR source_object_id=5)";
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

#     my $SQL = "
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
#        AND lr.target_object_id = 5
#      UNION SELECT cast(lr.source_key AS bigint)
#      FROM link_relation lr
#      LEFT JOIN link_object lo ON lr.target_object_id = lo.id
#      WHERE lr.target_key=?
#        AND lr.source_object_id = 5
#        AND lr.target_object_id = 1)
# ORDER BY create_time DESC";



    # MYSQL Query
    my $SQL = "
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
       AND lr.target_object_id = 5
     UNION SELECT lr.source_key
     FROM link_relation lr
     LEFT JOIN link_object lo ON lr.target_object_id = lo.id
     WHERE lr.target_key=?
       AND lr.source_object_id = 5
       AND lr.target_object_id = 1)
ORDER BY create_time DESC";

    return
        if !$DBObject->Prepare(
        SQL  => $SQL,
        Bind => [
            \$TicketID, \$TicketID
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

    my %Result;
    $Result{Item}=\@ItemList;
    $Result{TotalCount}=$TotalCount;
    # build JSON output
    $JSON = $LayoutObject->JSONEncode(
        Data => \%Result,
    );

    # send JSON response
    return $LayoutObject->Attachment(
        ContentType => 'text/plain; charset=' . $LayoutObject->{Charset},
        Content     => $JSON || '',
        Type        => 'inline',
        NoCache     => 1,
    );

}

1;
