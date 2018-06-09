# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::CustomerITSMChangeMyWorkOrders;

use strict;
use warnings;

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
  
    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

    # store last screen, used for backlinks
    $Kernel::OM->Get('Kernel::System::AuthSession')->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenWorkOrders',
        Value     => $Self->{RequestedURL},
    );

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # investigate refresh
    my $Refresh = $Self->{UserRefreshTime} ? 60 * $Self->{UserRefreshTime} : undef;

    # starting with page ...
    my $Output = $LayoutObject->CustomerHeader( Refresh => $Refresh );
    $Output .= $LayoutObject->CustomerNavigationBar();
    $LayoutObject->Print( Output => \$Output );
    $Output = '';

    my $PageShown = 15;
    my $StartHit = $ParamObject->GetParam( Param => 'StartHit' ) || '1';


    #Columns To Show
    my @ShowColumns=(
                 'Workorder#',
                 'Workorder Title#',
                 'Change Title',
                 'Workorder State',
                 'Planned Start',
                 'Planned End');


    for my $Key (@ShowColumns) {
       $LayoutObject->Block(
                Name => 'ShowColumns',
                Data => {
                    ColumnName => $Key
                },
            );
    }

    my $CustomerITSMWorkOrderObject = $Kernel::OM->Get('Kernel::System::CustomerITSMWorkOrder');

    my $WorkOrderIDsRef = $CustomerITSMWorkOrderObject->CustomerWorkOrderList(
        UserID =>  $ConfigObject->Get('CustomerPanelUserID'),
        CustomerLogin => $Self->{UserLogin}
    );

   
    #Total No WorkOrder
    my $WorkOrderIDsRefCount=  $#{ $WorkOrderIDsRef }++;

    #last workorder to show on page 
    my $LastHit=$StartHit+$PageShown-2;

    if ($LastHit > $WorkOrderIDsRefCount) {
        $LastHit= $WorkOrderIDsRefCount;
    }

    #Pagination of WorkOrder
    for (my $var = $StartHit-1; $var <= $LastHit ; $var++) {
        #Get Workorder No details
        my $WorkOrderRef = $WorkOrderObject->WorkOrderGet(
            WorkOrderID => $WorkOrderIDsRef->[$var],
            UserID      => $ConfigObject->Get('CustomerPanelUserID'),
        );

        #Get Change Details
        my $Change = $ChangeObject->ChangeGet(
            ChangeID => $WorkOrderRef->{ChangeID},
            UserID   => $ConfigObject->Get('CustomerPanelUserID'),
        );

        $LayoutObject->Block(
                Name => 'ColumnsData',
                Data => {
                    WorkOrderNumber => "<a href=customer.pl?Action=CustomerITSMWorkOrderZoom;WorkOrderID="
                    .$WorkOrderIDsRef->[$var].">".$Change->{ChangeNumber}."-".$WorkOrderRef->{WorkOrderNumber}."</a>",
                    WorkOrderTitle => $WorkOrderRef->{WorkOrderTitle},
                    ChangeTitle     => $Change->{ChangeTitle},
                    WorkOrderState => $WorkOrderRef->{WorkOrderState},
                    PlannedStartTime => $WorkOrderRef->{PlannedStartTime},
                    PlannedEndTime => $WorkOrderRef->{PlannedEndTime},
                },
        );
    }

    #creating page navbar
    my %PageNavBar = $LayoutObject->PageNavBar(
        Limit       => 100,        
        WindowSize  => 5,          
        StartHit    => $StartHit,           
        PageShown   => $PageShown,         
        AllHits     => $WorkOrderIDsRefCount+1,         
        Action      => 'Action=CustomerITSMChangeMyWorkOrders',  
    );

    $Param{PageNavBar}=\%PageNavBar;

    $LayoutObject->Block(
        Name => 'PageNavBar',
        Data => \%PageNavBar,
    );


    $Output .= $LayoutObject->Output(
        TemplateFile => 'CustomerITSMChangeMyWorkOrders',
        Data        => \%Param,
    );

    $Output .= $LayoutObject->CustomerFooter();
    return $Output;
}

1;
