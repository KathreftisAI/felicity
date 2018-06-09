# --
# Author : Shrinivas R. Ambat
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::Customer::GetTicketGrid;
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

    my $Results = $Self->Init( WebserviceID => $Self->{WebserviceID}, );

    if ( !$Results->{Success} ) {
        return $Self->ReturnError(
            ErrorCode    => 'Webservice.InvalidConfiguration',
            ErrorMessage => $Results->{ErrorMessage},
        );
    }

    # Objects
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $UserObject   = $Kernel::OM->Get('Kernel::System::CustomerUser');
    my $AgentObject   = $Kernel::OM->Get('Kernel::System::User');

    my ( $UserID, $UserType ) = $Self->Auth( %Param, );
    my $ReturnData = { Success => 1, };
    my %GetParam;

    my $SortBy  = $Param{Data}->{SortBy}  || "Age";
    my $OrderBy = $Param{Data}->{OrderBy} || "Down";

    my $PageSize   = $Param{Data}->{PageSize}   || 10;
    my $PageNumber = $Param{Data}->{PageNumber} || 1;

    if ( $Param{Data}->{CreatedTime} ) {
        $GetParam{TicketCreateTimeNewerMinutes} = $Param{Data}->{CreatedTime};
    }

    if ( $Param{Data}->{TicketNumber} ) {
        $GetParam{TicketNumber} =
          "%" . $Param{Data}->{TicketNumber} . "%" || '';
    }

  ARGUMENT:
    for my $key (qw(StateIDs PriorityIDs)) {
        next ARGUMENT if !$Param{Data}->{$key};
        my $Array = $Param{Data}->{$key};

        if (@$Array) {
            $GetParam{$key} = $Array;
        }
    }

    my %Filters = (
        MyTickets => {
            All => {
                Name   => 'All',
                Prio   => 1000,
                Search => {
                    CustomerUserLoginRaw => $UserID,
                    OrderBy              => $OrderBy,
                    SortBy               => $SortBy,
                    CustomerUserID       => $UserID,
                    Permission           => 'ro',
                },
            },
            Open => {
                Name   => 'Open',
                Prio   => 1100,
                Search => {
                    CustomerUserLoginRaw => $UserID,
                    StateType            => 'Open',
                    OrderBy              => $OrderBy,
                    SortBy               => $SortBy,
                    CustomerUserID       => $UserID,
                    Permission           => 'ro',
                },
            },
            Closed => {
                Name   => 'Closed',
                Prio   => 1200,
                Search => {
                    CustomerUserLoginRaw => $UserID,
                    StateType            => 'Closed',
                    OrderBy              => $OrderBy,
                    SortBy               => $SortBy,
                    CustomerUserID       => $UserID,
                    Permission           => 'ro',
                },
            },
        },
    );

    my $FilterCurrent = $ParamObject->GetParam( Param => 'Filter' ) || 'All';

    # check if filter is valid
    if ( !$Filters{MyTickets}->{$FilterCurrent} ) {

        # Throw Invalid Filter Error;
    }

    my %SearchInArchive;
    if ( $ConfigObject->Get('Ticket::ArchiveSystem')
        && !$ConfigObject->Get('Ticket::CustomerArchiveSystem') )
    {
        $SearchInArchive{ArchiveFlags} = [ 'y', 'n' ];
    }

    my $Limit = $PageSize * $PageNumber;
    my $Index = $Limit - $PageSize + 1;

    my @ViewableTickets = $TicketObject->TicketSearch(
        %{ $Filters{MyTickets}->{$FilterCurrent}->{Search} },
        %SearchInArchive,
        Result => 'ARRAY',
        %GetParam,
    );

    my @TicketArray;

    my @SelectedColumns = (
      "TicketNumber",
      "Title",
      "Owner",
      "State",
      "Age",
      "Type"
    );

    my $Count = 0;
  TICKETID:
    for my $TicketID (@ViewableTickets) {
        $Count++;
        next TICKETID if $Count < $Index;
        next TICKETID if $Count > $Limit;

        my %Ticket = $TicketObject->TicketGet(
            TicketID      => $TicketID,
            UserID        => $UserID,
            DynamicFields => 0,
            Silent        => 1
        );

        next TICKETID if !%Ticket;

        if ( $Ticket{Age} ) {
            $Ticket{Age} = $LayoutObject->CustomerAge(
                Age   => $Ticket{Age},
                Space => ' ',
            );
        }

        if ( $Ticket{Owner} ) {
            my %OwnerInfo
                = $AgentObject->GetUserData( UserID => $Ticket{OwnerID}, );
            $Ticket{Owner} = $OwnerInfo{'UserFirstname'} . ' '
                . $OwnerInfo{'UserLastname'};
        }

        my $CustomerName;
        if ( $Ticket{CustomerUserID} ) {
            $CustomerName = $Kernel::OM->Get('Kernel::System::CustomerUser')
              ->CustomerName( UserLogin => $Ticket{CustomerUserID}, );
        }
        $Ticket{CustomerName} = $CustomerName;

        # Add only columns specified in UserColumns Preferences;
        my %NewTicket;
        $NewTicket{TicketID} = $TicketID;
        @NewTicket{@SelectedColumns} = @Ticket{@SelectedColumns};
        push @TicketArray, \%NewTicket;
    }

    $ReturnData->{Data}->{Total} = @ViewableTickets;
    $ReturnData->{Data}->{Tickets} = \@TicketArray;
    $ReturnData->{Data}->{PageSize} = $PageSize;

    return $ReturnData;
}

1;
