package Kernel::Modules::GetTicketDetails;

use strict;
use warnings;
use Data::Dumper;
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
    my $TicketID   = $ParamObject->GetParam( Param => 'TicketID' );
    my $TicketNumber   = $ParamObject->GetParam( Param => 'TicketNumber' );
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my %Result;



    # check needed hashes
    if (  !$TicketID && !$TicketNumber  ) {

        %Result=(
             ErrorCode    => 'GetTicketDetails.MissingParameter',
             ErrorMessage => "GetTicketDetails: TicketID or TicketNumber parameter is missing!",
         );
        # build JSON output
        $JSON = $LayoutObject->JSONEncode(
        Data => \%Result,
        );

        return $LayoutObject->Attachment(
            ContentType => 'text/plain; charset=' . $LayoutObject->{Charset},
            Content     => $JSON || '',
            Type        => 'inline',
            NoCache     => 1,
        );
    }


    if (!$TicketID) {
        $TicketID = $TicketObject->TicketIDLookup(
            TicketNumber => $TicketNumber,
            UserID       => $Self->{UserID},
        );
    }


    my %Ticket= $TicketObject->TicketGet(
                TicketID => $TicketID,
                UserID   => $Self->{UserID},
    );



    # check needed hashes
    if (  !%Ticket  ) {

        %Result=(
             ErrorCode    => 'GetTicketDetails.InvalidParameter',
             ErrorMessage => "GetTicketDetails: TicketID or TicketNumber parameter is not valid!",
         );
        # build JSON output
        $JSON = $LayoutObject->JSONEncode(
        Data => \%Result,
        );

        return $LayoutObject->Attachment(
            ContentType => 'text/plain; charset=' . $LayoutObject->{Charset},
            Content     => $JSON || '',
            Type        => 'inline',
            NoCache     => 1,
        );
    }


    my $UserObject = $Kernel::OM->Get('Kernel::System::User');
    my %UserFullName = (CreateBy => 'CreateBy' , OwnerID => 'Owner');
    for my $keys (qw(CreateBy OwnerID)){
        my %User = $UserObject->GetUserData(
            UserID => $Ticket{$keys},
        );
        $Ticket{$UserFullName{$keys}}="$User{UserFirstname} $User{UserLastname}" 
    }

    my @ArticleBox = $TicketObject->ArticleContentIndex(
        TicketID      => $TicketID,
        UserID        => $Self->{UserID},
    );
    $Ticket{Articles}=\@ArticleBox;


    # build JSON output
    $JSON = $LayoutObject->JSONEncode(
        Data => \%Ticket,
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
