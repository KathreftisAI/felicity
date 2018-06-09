# --
# Author : Geeta Suryawanshi ~GS
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::Ticket::GetJsonData;

use strict;
use warnings;
use JSON;
use Kernel::System::DB;
use MIME::Base64;
use Kernel::System::VariableCheck qw(:all);
use Data::Dumper;

use base qw(
    Kernel::GenericInterface::Operation::Common
    Kernel::GenericInterface::Operation::ConfigItem::Common
);

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::GenericInterface::Operation::Ticket::GetJsonData - GenericInterface Ticket Get Operation backend

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

    my ( $UserID, $UserType ) = $Self->Auth(
        %Param
    );

    if ( !$UserID ) {
        return $Self->ReturnError(
            ErrorCode    => '$Self->{OperationName}.AuthFail',
            ErrorMessage => "$Self->{OperationName}: Authorization failing!",
        );
    }

	my $treeJSON = $Param{Data}->{data};
	
    my $ReturnData = {
        Success => "Got the data",
    };
 
    my $dir='./API';      
    mkdir $dir unless -d $dir;      
    open my $fh,">>","$dir/JSON_Data.txt" or die      
    "Can't open '$dir/check.txt\n'";       
    print $fh "JSON Data : ".Dumper(\$treeJSON)."\n";   
    print $fh "my data...\n";    
    print $fh "\n*******************************************************************************************************************\n\n\n\n\n\n";       
    close $fh;
   
    
    print encode_json($ReturnData);
    return encode_json($ReturnData);
	
	
}

1;


