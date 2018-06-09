# --
# Copyright (C) 2001-2016 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# -- 

package Kernel::Modules::AgentDFFileAttachment;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

# use Kernel::System::FileTemp;
# use Kernel::System::DynamicFieldFileValue;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # # check needed objects
    # for (qw(ParamObject DBObject TicketObject LayoutObject LogObject EncodeObject ConfigObject)) {
        # if ( !$Self->{$_} ) {
            # $Self->{LayoutObject}->FatalError( Message => "Got no $_!" );
        # }
    # }
	
    # $Self->{DynamicFieldFileValueObject} =  Kernel::System::DynamicFieldFileValue->new( %{$Self} );
    # $Self->{LoadExternalImages} = $Self->{ParamObject}->GetParam(
        # Param => 'LoadExternalImages'
    # ) || 0;

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;
	
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $DynamicFieldFileValueObject = $Kernel::OM->Get('Kernel::System::DynamicFieldFileValue');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    
	$Self->{FieldID} = $ParamObject->GetParam( Param => 'FieldID' );
    $Self->{ObjectID} =  $ParamObject->GetParam( Param => 'ObjectID' );
    $Self->{Subaction} =  $ParamObject->GetParam( Param => 'Subaction' );
    $Self->{BaseAction} =  $ParamObject->GetParam( Param => 'BaseAction' );
    $Self->{TicketID} =  $ParamObject->GetParam( Param => 'TicketID' );

    # check params
    if ( !$Self->{ObjectID} || !$Self->{FieldID} ) {
        $LogObject->Log(
            Message  => 'ObjectID and FieldID are needed!',
            Priority => 'error',
        );
        return $LayoutObject->ErrorScreen();
    }
	
	if($Self->{Subaction} && $Self->{Subaction} eq 'Delete'){
		my $DFValue = $DynamicFieldFileValueObject->ValueDelete(
			ObjectID => $Self->{ObjectID},
			FieldID  => $Self->{FieldID},
			FileID  => $Self->{FileID},
			UserID  => $Self->{UserID},
		);

		 return $LayoutObject->Redirect( OP => ";Action=$Self->{BaseAction};TicketID=$Self->{TicketID}" );
	}else{
		# get a attachment
		my %Data;
		my $DFValue = $DynamicFieldFileValueObject->ValueGetFile(
			ObjectID => $Self->{ObjectID},
			FieldID  => $Self->{FieldID},
		);
		
		$Data{Content} = $DFValue->[0]->{Content};
		$Data{ContentType} = $DFValue->[0]->{ContentType};
		$Data{Filename} = $DFValue->[0]->{Filename};

		return $LayoutObject->Attachment(%Data);
	}
}

1;
