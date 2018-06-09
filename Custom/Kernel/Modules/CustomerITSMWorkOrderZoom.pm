# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::CustomerITSMWorkOrderZoom;

use strict;
use warnings;
use Data::Dumper;
use Kernel::Language qw(Translatable);
use Kernel::System::VariableCheck qw(:all);


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

    #get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get needed object
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get needed WorkOrderID
    my $WorkOrderID = $ParamObject->GetParam( Param => 'WorkOrderID' );
    my $CustomerITSMWorkOrderObject = $Kernel::OM->Get('Kernel::System::CustomerITSMWorkOrder');

    # check needed stuff
    if ( !$WorkOrderID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No WorkOrderID is given!'),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get needed objects
    my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');
  

    my $CustomerWorkOrderIDsRef = $CustomerITSMWorkOrderObject->CustomerWorkOrderList(
        CustomerLogin   => $Self->{UserLogin},
        UserID          => $ConfigObject->Get('CustomerPanelUserID'),
    );

    my $match= grep $_ eq $WorkOrderID, @{$CustomerWorkOrderIDsRef};

     # error screen, don't show ticket
    return $LayoutObject->CustomerNoPermission(
        Message => Translatable(
            'We are sorry, you do not have permissions anymore to access this WorkOrder.'
        ),
        WithHeader => 'yes',
    ) if !$match;
    

    # get workorder data
    my $WorkOrder = $WorkOrderObject->WorkOrderGet(
        WorkOrderID => $WorkOrderID,
        UserID      => $Self->{UserID},
    );

    # check error
    if ( !$WorkOrder ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'WorkOrder "%s" not found in database!', $WorkOrderID ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get dynamic field backend object
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
    # define the dynamic fields to show based on the object type
    my $ObjectType = ['ITSMWorkOrder'];

    # get the dynamic fields for this screen
    my $DynamicField = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldGet(
        Name       => 'WorkOrderApproval',
    );

    # get field value
    my $Value = $DynamicFieldBackendObject->ValueGet(
        DynamicFieldConfig => $DynamicField,
        ObjectID           => $WorkOrderID,
    );

    $Param{ApprovalValue} = $Value;

    if ($Self->{Subaction} eq 'Approval' && !$Value) {

        # get needed Params
        my $Approval = $ParamObject->GetParam( Param => 'Approval' );
        my $Report = $ParamObject->GetParam( Param => 'Report' );
           

        # set the value
        my $DynamicFieldSuccess = $DynamicFieldBackendObject->ValueSet(
            DynamicFieldConfig => $DynamicField,
            FileID             => $DynamicField->{ID},
            ObjectID           => $WorkOrderID,
            Value              => $DynamicField->{Config}->{PossibleValues}->{$Approval},
            UserID             => $ConfigObject->Get('CustomerPanelUserID'),
        );   

        my $WorkorderSuccess = $WorkOrderObject->WorkOrderUpdate(
            WorkOrderID        => $WorkOrderID,
            Report              => $Report,
            WorkOrderStateID     => 125,#Accepted State ID
            UserID             => $ConfigObject->Get('CustomerPanelUserID'),
        );


        my $HistoryObject = $Kernel::OM->Get('Kernel::System::ITSMChange::History');
        my $HistorySuccess = $HistoryObject->HistoryAdd(
            ChangeID    => $WorkOrder->{ChangeID},
            WorkOrderID   => $WorkOrderID,                    
            HistoryType   => 'WorkOrderUpdate',           
            Fieldname     => "WorkOrder $Approval by Customer $Self->{UserFirstname} $Self->{UserLastname}",         
            UserID        => $ConfigObject->Get('CustomerPanelUserID'),
        );

        # get field value
        my $Value = $DynamicFieldBackendObject->ValueGet(
            DynamicFieldConfig => $DynamicField,
            ObjectID           => $WorkOrderID,
        );

        $Param{ApprovalValue} = $Value;

    }   

 


    # get log object
    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

   
    # get the change that workorder belongs to
    my $Change = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
        ChangeID => $WorkOrder->{ChangeID},
        UserID   => $Self->{UserID},
    );

    # output header
    my $Output = $LayoutObject->CustomerHeader(
        Title => $WorkOrder->{WorkOrderTitle},
    );
    $Output .= $LayoutObject->CustomerNavigationBar();

    # get user object
    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # get create user data
    my %CreateUser = $UserObject->GetUserData(
        UserID => $WorkOrder->{CreateBy},
        Cached => 1,
    );

    # get CreateBy user information
    for my $Postfix (qw(UserLogin UserFirstname UserLastname)) {
        $WorkOrder->{ 'Create' . $Postfix } = $CreateUser{$Postfix};
    }

    # get change user data
    my %ChangeUser = $UserObject->GetUserData(
        UserID => $WorkOrder->{ChangeBy},
        Cached => 1,
    );

    # get ChangeBy user information
    for my $Postfix (qw(UserLogin UserFirstname UserLastname)) {
        $WorkOrder->{ 'Change' . $Postfix } = $ChangeUser{$Postfix};
    }

       
    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'CustomerITSMWorkOrderZoom',
        Data         => {
            %Param,
            %{$Change},
            %{$WorkOrder},
        },
    );

    # add footer
    $Output .= $LayoutObject->CustomerFooter();

    return $Output;
}

1;
