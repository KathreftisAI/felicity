package Kernel::Modules::GetChangeWorkorderDetails;

use strict;
use warnings;
use Data::Dumper;   
our $ObjectManagerDisabled = 1;
use Kernel::System::VariableCheck qw(:all);

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
    my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');   
    my $ChangeID   = $ParamObject->GetParam( Param => 'ChangeID' );
    my $OrderBy   = $ParamObject->GetParam( Param => 'OrderBy' );
    my %Result;



    # check needed hashes
    if (  !$ChangeID ) {

        %Result=(
             ErrorCode    => 'GetChangeWorkorderDetails.MissingParameter',
             ErrorMessage => "GetChangeWorkorderDetails: ChangeID parameter is missing!",
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

    if (!$OrderBy) {
        $OrderBy='PlannedStartTime';
    }
   
    my $WorkOrderIDsRef = $WorkOrderObject->WorkOrderSearch(
        ChangeIDs         => [ $ChangeID ],
        OrderBy => [ $OrderBy ],
        OrderByDirection => [ 'Down' ],
        UserID => 1,
    );

    if (  !IsArrayRefWithData($WorkOrderIDsRef) ) {

        %Result=(
             ErrorCode    => 'GetChangeWorkorderDetails.InvalidParameter',
             ErrorMessage => "GetChangeWorkorderDetails: ChangeID parameter is invalid!",
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
    my %WorkOrdersAgents;
    my @WorkOrders;
    for my $keys (@{$WorkOrderIDsRef}){
        my $WorkOrderRef = $WorkOrderObject->WorkOrderGet(
            WorkOrderID => $keys,
            UserID      => $Self->{UserID},
        );
        my $UserObject = $Kernel::OM->Get('Kernel::System::User');
        my %UserFullName = (CreateBy => 'CreateBy' , WorkOrderAgentID => 'WorkOrderAgent');
        for my $Values (qw(CreateBy WorkOrderAgentID)){
           
            my %User = $UserObject->GetUserData(
                UserID => $WorkOrderRef->{$Values},
            );
            $WorkOrderRef->{$UserFullName{$Values}}="$User{UserFirstname} $User{UserLastname}" 
        }
        push @WorkOrders,$WorkOrderRef;
    }

    # build JSON output
    $JSON = $LayoutObject->JSONEncode(
        Data => \@WorkOrders,
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
