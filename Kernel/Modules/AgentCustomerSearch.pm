# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentCustomerSearch;
## nofilter(TidyAll::Plugin::OTRS::Perl::DBObject)

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );
    $Self->{DBObject} = $Kernel::OM->Get('Kernel::System::DB');

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $JSON = '';

    # get needed objects
    my $ParamObject        = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $EncodeObject       = $Kernel::OM->Get('Kernel::System::Encode');
    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');
    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
    my $TicketObject       = $Kernel::OM->Get('Kernel::System::Ticket');
    # get config for frontend
    $Self->{Config} = $ConfigObject->Get("Ticket::Frontend::$Self->{Action}");

    # search customers
    if ( !$Self->{Subaction} ) {

        # get needed params
        my $Search = $ParamObject->GetParam( Param => 'Term' ) || '';
        my $MaxResults = int( $ParamObject->GetParam( Param => 'MaxResults' ) || 20 );
        my $IncludeUnknownTicketCustomers
            = int( $ParamObject->GetParam( Param => 'IncludeUnknownTicketCustomers' ) || 0 );

        my $UnknownTicketCustomerList;

        if ($IncludeUnknownTicketCustomers) {

            # add customers that are not saved in any backend
            $UnknownTicketCustomerList = $TicketObject->SearchUnknownTicketCustomers(
                SearchTerm => $Search,
            );
        }

        # get customer list
        my %CustomerUserList = $CustomerUserObject->CustomerSearch(
            Search => $Search,
        );
        map { $CustomerUserList{$_} = $UnknownTicketCustomerList->{$_} } keys %{$UnknownTicketCustomerList};

        # build data
        my @Data;
        CUSTOMERUSERID:
        for my $CustomerUserID ( sort keys %CustomerUserList )
        {

            my $CustomerValue = $CustomerUserList{$CustomerUserID};

            # replace new lines with one space (see bug#11133)
            $CustomerValue =~ s/\n/ /gs;
            $CustomerValue =~ s/\r/ /gs;

            if ( !( grep { $_->{CustomerValue} eq $CustomerValue } @Data ) ) {
                push @Data, {
                    CustomerKey   => $CustomerUserID,
                    CustomerValue => $CustomerValue,
                };
            }
            last CUSTOMERUSERID if scalar @Data >= $MaxResults;
        }

        # build JSON output
        $JSON = $LayoutObject->JSONEncode(
            Data => \@Data,
        );
    }

    ##Start Custom Code by Shrinivas A.
    # Search All Users

    elsif ($Self->{Subaction} eq 'AllUserSearch'){
        my $Search = $ParamObject->GetParam( Param => 'Term' ) || '';
        my $MaxResults = int( $ParamObject->GetParam( Param => 'MaxResults' ) || 20 );

        $Search =~ s/\*/%/g;
        $Search = $Self->{DBObject}->Quote( $Search, 'Like' );

        my $SQL = "SELECT id,first_name,last_name,login FROM users WHERE first_name LIKE '${Search}%' OR last_name LIKE '${Search}%' OR login LIKE '${Search}%' AND valid_id = 1";

        $Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL   => $SQL,
            Limit => $MaxResults,
        );
        my @Data;
            while (my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray()){
                my %user;
                $user{id} = $Row[0];
                $user{first_name} = ucfirst($Row[1]);
                $user{last_name} = ucfirst($Row[2]);
                $user{login} = $Row[3];
                push @Data,\%user;
            }


        $JSON = $LayoutObject->JSONEncode(
            Data => \@Data,
        );

    }
    ##End Custom Code by Shrinivas A.

    # get customer info
    elsif ( $Self->{Subaction} eq 'CustomerInfo' ) {

        # get params
        my $CustomerUserID = $ParamObject->GetParam( Param => 'CustomerUserID' ) || '';

        my $CustomerID              = '';
        my $CustomerTableHTMLString = '';

        # get customer data
        my %CustomerData = $CustomerUserObject->CustomerUserDataGet(
            User => $CustomerUserID,
        );

        # get customer id
        if ( $CustomerData{UserCustomerID} ) {
            $CustomerID = $CustomerData{UserCustomerID};
        }

        # build html for customer info table
        if ( $ConfigObject->Get('Ticket::Frontend::CustomerInfoCompose') ) {

            $CustomerTableHTMLString = $LayoutObject->AgentCustomerViewTable(
                Data => {%CustomerData},
                Max  => $ConfigObject->Get('Ticket::Frontend::CustomerInfoComposeMaxSize'),
            );
        }

        # build JSON output
        $JSON = $LayoutObject->JSONEncode(
            Data => {
                CustomerID              => $CustomerID,
                CustomerTableHTMLString => $CustomerTableHTMLString,
            },
        );
    }

    # get customer tickets
    elsif ( $Self->{Subaction} eq 'CustomerTickets' ) {

        # get params
        my $CustomerUserID = $ParamObject->GetParam( Param => 'CustomerUserID' ) || '';
        my $CustomerID     = $ParamObject->GetParam( Param => 'CustomerID' )     || '';

        # get secondary customer ids
        my @CustomerIDs;
        if ($CustomerUserID) {
            @CustomerIDs = $CustomerUserObject->CustomerIDs(
                User => $CustomerUserID,
            );
        }

        # add own customer id
        if ($CustomerID) {
            push @CustomerIDs, $CustomerID;
        }

        my $View    = $ParamObject->GetParam( Param => 'View' )    || '';
        my $SortBy  = $ParamObject->GetParam( Param => 'SortBy' )  || 'Age';
        my $OrderBy = $ParamObject->GetParam( Param => 'OrderBy' ) || 'Down';

        my @ViewableTickets;
        if (@CustomerIDs) {
            @ViewableTickets = $TicketObject->TicketSearch(
                Result        => 'ARRAY',
                Limit         => 250,
                SortBy        => [$SortBy],
                OrderBy       => [$OrderBy],
                CustomerIDRaw => \@CustomerIDs,
                UserID        => $Self->{UserID},
                Permission    => 'ro',
            );
        }

        my $LinkSort = 'Subaction=' . $Self->{Subaction}
            . ';View=' . $LayoutObject->Ascii2Html( Text => $View )
            . ';CustomerUserID=' . $LayoutObject->Ascii2Html( Text => $CustomerUserID )
            . ';CustomerID=' . $LayoutObject->Ascii2Html( Text => $CustomerID )
            . '&';
        my $LinkPage = 'Subaction=' . $Self->{Subaction}
            . ';View=' . $LayoutObject->Ascii2Html( Text => $View )
            . ';SortBy=' . $LayoutObject->Ascii2Html( Text => $SortBy )
            . ';OrderBy=' . $LayoutObject->Ascii2Html( Text => $OrderBy )
            . ';CustomerUserID=' . $LayoutObject->Ascii2Html( Text => $CustomerUserID )
            . ';CustomerID=' . $LayoutObject->Ascii2Html( Text => $CustomerID )
            . '&';
        my $LinkFilter = 'Subaction=' . $Self->{Subaction}
            . ';CustomerUserID=' . $LayoutObject->Ascii2Html( Text => $CustomerUserID )
            . ';CustomerID=' . $LayoutObject->Ascii2Html( Text => $CustomerID )
            . '&';

        my $CustomerTicketsHTMLString = '';
        if (@ViewableTickets) {
            $CustomerTicketsHTMLString .= $LayoutObject->TicketListShow(
                TicketIDs  => \@ViewableTickets,
                Total      => scalar @ViewableTickets,
                Env        => $Self,
                View       => $View,
                TitleName  => Translatable('Customer History'),
                LinkPage   => $LinkPage,
                LinkSort   => $LinkSort,
                LinkFilter => $LinkFilter,
                Output     => 'raw',

                OrderBy => $OrderBy,
                SortBy  => $SortBy,
                AJAX    => 1,
            );
        }

        # build JSON output
        $JSON = $LayoutObject->JSONEncode(
            Data => {
                CustomerTicketsHTMLString => $CustomerTicketsHTMLString,
            },
        );
    }

    # send JSON response
    return $LayoutObject->Attachment(
        ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
        Content     => $JSON || '',
        Type        => 'inline',
        NoCache     => 1,
    );
}

1;
