# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::Session::SessionUserDetails;

use strict;
use warnings;
use JSON;
use Kernel::System::ObjectManager;
use Kernel::System::VariableCheck qw(:all);
use base qw(
    Kernel::GenericInterface::Operation::Common
    Kernel::GenericInterface::Operation::ConfigItem::Common
);


our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::GenericInterface::Operation::Session::Common - Base class for Session Operations

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
    for my $Needed (qw( DebuggerObject WebserviceID )) {
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

    my $Result = $Self->Init(
        WebserviceID => $Self->{WebserviceID},
    );

    if ( !$Result->{Success} ) {
        $Self->ReturnError(
            ErrorCode    => 'Webservice.InvalidConfiguration',
            ErrorMessage => $Result->{ErrorMessage},
        );
    }
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

    #my ( $UserID, $UserType ) = $Self->Auth(
    #    %Param
    #);

    my $Ok = $SessionObject->CheckSessionID(
        SessionID => $Param{Data}->{SessionID},
        #%Param
    );
    if ( !$Ok ) {
        return $Self->ReturnError(
            ErrorCode    => '$Self->{OperationName}.AuthFail',
            ErrorMessage => "$Self->{OperationName}: Authorization failing!",
        );
    }

    return {
        Success => 1,
        Data    => {
            SessionID => $Param{Data}->{SessionID},
            UserID => 1,
        },
    };

}
1;	
