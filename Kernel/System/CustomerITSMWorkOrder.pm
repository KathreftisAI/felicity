
package Kernel::System::CustomerITSMWorkOrder;


use strict;
use warnings;
use Data::Dumper;
use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Encode',
    'Kernel::System::HTMLUtils',
    'Kernel::System::Log',
    'Kernel::System::Time',
);

=head1 NAME

Kernel::System::CustomerITSMWorkOrder

=head1 SYNOPSIS

Global module CustomerITSMWorkOrder.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CustomerITSMWorkOrderObject = $Kernel::OM->Get('Kernel::System::CustomerITSMWorkOrder');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # debug level
    $Self->{Debug} = $Param{Debug} || 0;

    return $Self;
}


=item CustomerWorkOrderAdd()

Add a new Customer workorder.


    my $WorkOrderID = $CustomerITSMWorkOrderObject->CustomerWorkOrderAdd(
        ChangeID           => 123,
        WorkOrderID        => 123,
        CustomerLogin      => 'abc',
        UserID             => 1,
    );

=cut



sub CustomerWorkOrderAdd{
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ChangeID WorkOrderID CustomerLogin UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # add WorkOrder to database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'INSERT INTO customer_workorder '
            . '(change_id, workorder_id, customer_login, valid_id, created_by, '
            . 'created_time, change_by, change_time) '
            . 'VALUES (?, ?, ?, 1, ?, current_timestamp, ?, current_timestamp)',
        Bind => [
            \$Param{ChangeID}, \$Param{WorkOrderID}, \$Param{CustomerLogin},
            \$Param{UserID}, \$Param{UserID},
        ],
    );

    # get WorkOrderID
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL   => 'SELECT id FROM customer_workorder WHERE change_id = ? AND workorder_id = ?',
        Bind  => [ \$Param{ChangeID}, \$Param{WorkOrderID} ],
        Limit => 1,
    );

    # fetch the result
    my $CustomerWorkOrderID;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $CustomerWorkOrderID = $Row[0];
    }

    # check error
    if ( !$CustomerWorkOrderID ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "CustomerWorkOrderAdd() failed!",
        );
        return;
    }

    return $CustomerWorkOrderID;
}


=item CustomerWorkOrderList()

Return a list of all valid workorder ids of the given Customer as array reference.
The workorders are ordered by workorder ids.

    my $CustomerWorkOrderIDsRef = $CustomerITSMWorkOrderObject->CustomerWorkOrderList(
        CustomerLogin   => 'abc',
        UserID          => 1,
    );

=cut


sub CustomerWorkOrderList{
    my ($Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(CustomerLogin UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my @CustomerWorkOrderIDs;
    my $SQL;
    my @Bind;

    $SQL = 'SELECT workorder_id from customer_workorder WHERE customer_login = ? ';
    push @Bind, \$Param{CustomerLogin};

    if ( $Param{ValidID} ){
        $SQL .= "AND valid_id = $Param{ValidID} ";
    }

    $SQL .= 'ORDER by workorder_id DESC';


    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => $SQL,
        Bind => \@Bind,
    );

    # fetch the result
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        push @CustomerWorkOrderIDs, $Row[0];
    }

    return \@CustomerWorkOrderIDs;

}


=item CustomerWorkOrderGet()

Return a CustomerWorkOrder as hash reference.
When the workorder does not exist, a false value is returned.

    my $WorkOrderRef = $CustomerITSMWorkOrderObject->CustomerWorkOrderGet(
        WorkOrderID => 123,
        UserID      => 1,
    );

The returned hash reference contains following elements:

    $CustomerWorkOrder{CustomerWorkOrderID} 
    $CustomerWorkOrder{ChangeID}            
    $CustomerWorkOrder{WorkOrderID}         
    $CustomerWorkOrder{CustomerLogin}       
    $CustomerWorkOrder{ValidID}             
    $CustomerWorkOrder{CreateBy}            
    $CustomerWorkOrder{CreateTime}          
    $CustomerWorkOrder{ChangeBy}            
    $CustomerWorkOrder{ChangeTime}          


=cut

sub CustomerWorkOrderGet{
    my ($Self, %Param) = @_;

    # check needed stuff
    for my $Argument (qw(WorkOrderID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my %CustomerWorkOrderData;


    #get data from database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT * '
            . 'FROM customer_workorder '
            . 'WHERE workorder_id = ?',
        Bind  => [ \$Param{WorkOrderID} ],
        Limit => 1,
    );

    # fetch the result
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $CustomerWorkOrderData{CustomerWorkOrderID} = $Row[0];
        $CustomerWorkOrderData{ChangeID}            = $Row[1];
        $CustomerWorkOrderData{WorkOrderID}         = $Row[2];
        $CustomerWorkOrderData{CustomerLogin}       = $Row[3];
        $CustomerWorkOrderData{ValidID}             = $Row[4];
        $CustomerWorkOrderData{CreateBy}            = $Row[5];
        $CustomerWorkOrderData{CreateTime}          = $Row[6];
        $CustomerWorkOrderData{ChangeBy}            = $Row[7];
        $CustomerWorkOrderData{ChangeTime}          = $Row[8];
    }

    # check error
    if ( !%CustomerWorkOrderData ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "CustomerWorkOrderID $Param{WorkOrderID} does not exist!",
        );

        return;
    }   

    return \%CustomerWorkOrderData;

}



=item CustomerWorkOrderUpdate()

Update a workorder.

This function upadates Customer Workorder entry from customer_workorder.

    my $Success = $CustomerITSMWorkOrderObject->CustomerWorkOrderUpdate(
        WorkOrderID     => 123,
        CustomerLogin   => 'abc',               # (optional) | New Customer Login for WorkOrder
        ValidID         => 1 || 2 || 3,         $ (optional) | Change Valid id of Customer Workorder
        UserID          => 1,
    );

=cut


sub CustomerWorkOrderUpdate{
    my ($Self, %Param) = @_;


    # check needed stuff
    for my $Argument (qw( WorkOrderID UserID )) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    #Check if Customer workorder already exist
    my $CustomerWorkOrderData = $Self->CustomerWorkOrderGet(
        WorkOrderID         => $Param{WorkOrderID},
        UserID              => $Param{UserID}
    );

    if( $CustomerWorkOrderData ){

        my $SQL = 'UPDATE customer_workorder SET ';
        my @Bind;

        if( defined $Param{CustomerLogin} ){
            $SQL .= 'customer_login = ?, ';
            push @Bind, \$Param{CustomerLogin};
        }

        if( defined $Param{ValidID} ){
            $SQL .= "valid_id = $Param{ValidID}, ";
        }

        $SQL .= 'change_time = current_timestamp, change_by =? ';
        push @Bind, \$Param{UserID};

        $SQL .= 'WHERE workorder_id = ?';
        push @Bind, \$Param{WorkOrderID};

        # update workorder
        return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
            SQL  => $SQL,
            Bind => \@Bind,
        );

    } else {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "CustomerWorkOrderID $Param{WorkOrderID} does not exist!",
        );
        return;
    }

    return 1;

}



=item DeleteCustomerWorkOrder()

Delete a workorder.

This function removes Customer Workorder entry from customer_workorder.

    my $Success = $CustomerITSMWorkOrderObject->DeleteCustomerWorkOrder(
        WorkOrderID  => 123,
        UserID       => 1,
    );

=cut

sub DeleteCustomerWorkOrder{
    my ($Self, %Param) = @_;

    # check needed stuff
    for my $Attribute (qw(WorkOrderID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    #Check if Customer workorder already exist
    my $CustomerWorkOrderData = $Self->CustomerWorkOrderGet(
        WorkOrderID         => $Param{WorkOrderID},
        UserID              => $Param{UserID}
    );

    if(!$CustomerWorkOrderData){
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "CustomerWorkOrderID $Param{WorkOrderID} does not exist!",
        );
        return;
    }

    # update workorder
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL  => 'DELETE FROM customer_workorder WHERE workorder_id = ?',
        Bind => [ \$Param{WorkOrderID} ],
    );

    return 1;

}



sub CustomerWorkOrderExist{
    my ($Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(WorkOrderID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL  => 'SELECT workorder_id from customer_workorder WHERE workorder_id = ?',
        Bind => [ \$Param{WorkOrderID} ],
    );        

    my %CustomerWorkOrderData;
    # fetch the result
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $CustomerWorkOrderData{CustomerWorkOrderID} = $Row[0];
    }

    return $CustomerWorkOrderData{CustomerWorkOrderID};
   
}