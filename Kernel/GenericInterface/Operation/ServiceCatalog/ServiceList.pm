# --
# Copyright (C) 2015-2017 Unotech Software
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::ServiceCatalog::ServiceList;

use strict;
use warnings;

use MIME::Base64;

use Kernel::System::Service;

use Kernel::System::VariableCheck
    qw(IsArrayRefWithData IsHashRefWithData IsStringWithData);

use base qw(
    Kernel::GenericInterface::Operation::Common
    Kernel::GenericInterface::Operation::Ticket::Common
);

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::GenericInterface::Operation::ServiceCatalog::ServiceGetList - GenericInterface Ticket Get Operation backend

=head1 SYNOPSIS

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

usually, you want to create an instance of this
by using Kernel::GenericInterface::Operation->new();

=cut

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
    $Self->{ServiceObject} = $Kernel::OM->Get("Kernel::System::Service");
    return $Self;
}

=item Run()

perform ServiceListGet Operation. This function is able to return
one or more ticket entries in one call.
    
     my $Result = $OperationObject->Run(
        Valid  => 0,   # (optional) default 1 (0|1)
        UserID => 1,
    );

    returns

    $ServiceList = 
    my $Result = $OperationObject->Run(
        Data => {
            Valid  => 0,   # (optional) default 1 (0|1)
        UserID => 1
        },
    );

    $Result = {
        Success      => 1,                                # 0 or 1
        ErrorMessage => '',                               # In case of an error
        Data         => [
        {
            ServiceID  => 1,
            ParentID   => 0,
            Name       => 'MyService',
            NameShort  => 'MyService',
            ValidID    => 1,
            Comment    => 'Some Comment'
            CreateTime => '2011-02-08 15:08:00',
            ChangeTime => '2011-06-11 17:22:00',
            CreateBy   => 1,
            ChangeBy   => 1,
# ---
# ITSMCore
# ---
            TypeID           => 16,
            Type             => 'Backend',
            Criticality      => '3 normal',
            CurInciStateID   => 1,
            CurInciState     => 'Operational',
            CurInciStateType => 'operational',
# ---
        },
        {
            ServiceID  => 2,
            ParentID   => 1,
            Name       => 'MyService::MySubService',
            NameShort  => 'MySubService',
            ValidID    => 1,
            Comment    => 'Some Comment'
            CreateTime => '2011-02-08 15:08:00',
            ChangeTime => '2011-06-11 17:22:00',
            CreateBy   => 1,
            ChangeBy   => 1,
# ---
# ITSMCore
# ---
            TypeID           => 16,
            Type             => 'Backend',
            Criticality      => '3 normal',
            CurInciStateID   => 1,
            CurInciState     => 'Operational',
            CurInciStateType => 'operational',
# ---
        },
        # ...
    ];
    };

=cut

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

    my $ReturnData = { Success => 1, };

    return $Self->ReturnError(
        ErrorCode    => 'ServiceGetList.AuthFail',
        ErrorMessage => "ServiceGetList: Authorization failing!",
    ) if !$UserID;

    my $ErrorMessage = '';

    # Get the list of dynamic fields for object article.
    # add
    my @Item;

    #Get the ServiceList for given UserID

    my $serviceListObject = $Self->{ServiceObject}->ServiceListGet($UserID);
    push @Item, $serviceListObject;

    if ( !scalar @Item ) {
        $ErrorMessage = 'Could not get Service List'
            . ' in Kernel::GenericInterface::Operation::ServiceCatalog::ServiceListGet::Run()';

        return $Self->ReturnError(
            ErrorCode    => 'ServiceListGet.NotServiceData',
            ErrorMessage => "ServiceListGet: $ErrorMessage",
        );

    }

    # set ticket data into return structure
    $ReturnData->{Data}->{ServiceCatalog} = \@Item;

    # return result
    return $ReturnData;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the Felicity Project (L<http://unotechsoft.com/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
