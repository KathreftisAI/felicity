# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

=c
#-----------------------------------------------#
#######   Escalation Matrix Module	#########
------------------------------------------------#
#---- Functionality of the Module..		#
1. Query and Sub Query is input.		#
2. User is selected from dropdown and saved.	#
------------------------------------------------#
#Note :- All the fields are mandatory		#
#-----------------------------------------------#
=cut

package Kernel::Modules::EscalationMatrix;

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

    $Self->{CacheType} = 'EscalationMatrix';
    $Self->{CacheTTL}  = 60 * 60 * 24 * 20;

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');

    # ------------------------------------------------------------ #
    # change
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'Change' ) {
        my $ID = $ParamObject->GetParam( Param => 'ID' ) || '';
        my %Data = $Self->GetData(ID => $ID);


        if ( !%Data ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('Need Data to Edit!'),
            );
        }
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Self->_Edit(
            Action => 'Change',
            %Data,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'EscalationMatrix',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # change action
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'ChangeAction' ) {
        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my $Note = '';
        my ( %GetParam, %Errors );
        for my $Parameter (qw(ID Time Queue Type TypeValue TypeValueEmail ValidID)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

	my $RecordExists;	
	if($GetParam{Type} eq 4){

	    for my $Needed (qw(ID Time Queue Type TypeValueEmail ValidID)) {
            	if ( !$GetParam{$Needed} ) {
                    $Errors{ $Needed . 'Invalid' } = 'ServerError';
            	}
            }
	    $RecordExists  = $Self->RecordExistsCheck(
            	ID            => $GetParam{ID},
            	Time          => $GetParam{Time},
            	Queue         => $GetParam{Queue},
            	Type          => $GetParam{Type},
            	TypeValueEmail=> $GetParam{TypeValueEmail},
            	ValidID       => $GetParam{ValidID},
            );
	}
	else{

	    for my $Needed (qw(ID Time Queue Type TypeValue ValidID)) {
            	if ( !$GetParam{$Needed} ) {
                    $Errors{ $Needed . 'Invalid' } = 'ServerError';
            	}
            }

	    $RecordExists  = $Self->RecordExistsCheck(
            	ID            => $GetParam{ID},
            	Time          => $GetParam{Time},
            	Queue         => $GetParam{Queue},
            	Type          => $GetParam{Type},
            	TypeValue     => $GetParam{TypeValue},
            	ValidID       => $GetParam{ValidID},
            );
	}

=c
        # check needed data
        for my $Needed (qw(ID Time Queue Type TypeValue ValidID)) {
            if ( !$GetParam{$Needed} ) {
                $Errors{ $Needed . 'Invalid' } = 'ServerError';
            }
        }
=cut

        my %Data = $Self->GetData( ID => $GetParam{ID} );
        if ( !%Data ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No Record Exist!'),
            );
        }

=c
        # check if a type exists with this name
        my $RecordExists  = $Self->RecordExistsCheck(
            ID 		  => $GetParam{ID},
            Time 	  => $GetParam{Time},
	    Queue 	  => $GetParam{Queue},
	    Type	  => $GetParam{Type},
	    TypeValue 	  => $GetParam{TypeValue},
	    ValidID 	  => $GetParam{ValidID},
        );
=cut

	# If record already exists
	$Errors{IDExists} = 1 if $RecordExists;
=c
	if ($RecordExists) {
            $Errors{IDExists} = 1;

            $Errors{'QueryInvalid'} = 'ServerError';

            $Errors{SubQueryExists} = 1;
            $Errors{'SubQueryInvalid'} = 'ServerError';

            $Errors{QueryValueExists} = 1;
            $Errors{'QueryValueInvalid'} = 'ServerError';

            $Errors{SubQueryValueExists} = 1;
            $Errors{'SubQueryValueInvalid'} = 'ServerError';

            $Errors{ValidIDExists} = 1;
            $Errors{'ValidIDInvalid'} = 'ServerError';
        }
=cut

        # if no errors occurred
        if ( !%Errors) {

            # update type
            my $Update = $Self->RecordUpdate(
                %GetParam,
            );
            if ($Update) {
                $Self->_Overview();
                my $Output = $LayoutObject->Header();
                $Output .= $LayoutObject->NavigationBar();
                $Output .= $LayoutObject->Notify( Info => Translatable('Matrix Updated Successfully!') );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'EscalationMatrix',
                    Data         => \%Param,
                );
                $Output .= $LayoutObject->Footer();
                return $Output;
            }
        }

        # something has gone wrong
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Output .= $LayoutObject->Notify( Priority => 'Error' );
        $Self->_Edit(
            Action => 'Change',
            Errors => \%Errors,
            %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'EscalationMatrix',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # add
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Add' ) {
        my %GetParam = ();
        $GetParam{ID} = $ParamObject->GetParam( Param => 'ID' );

        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        $Self->_Edit(
            Action => 'Add',
            %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'EscalationMatrix',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # add action
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AddAction' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my $Note = '';
        my ( %GetParam, %Errors );
        for my $Parameter (qw(Time Queue Type TypeValue TypeValueEmail ValidID)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

	my $RecordExists;

        # check needed data
        if($GetParam{Type} eq 4){

	    for my $Needed (qw(Time Queue Type TypeValueEmail ValidID)) {
            	if ( !$GetParam{$Needed} ) {
                    $Errors{ $Needed . 'Invalid' } = 'ServerError';
                }
            }
	    $RecordExists	= $Self->RecordExistsCheck(
            	ID          	=> $GetParam{ID},
            	Time        	=> $GetParam{Time},
            	Queue       	=> $GetParam{Queue},
            	Type        	=> $GetParam{Type},
            	TypeValueEmail  => $GetParam{TypeValueEmail},
            	ValidID     	=> $GetParam{ValidID},
            );

	}
	else{

            for my $Needed (qw(Time Queue Type TypeValue ValidID)) {
            	if ( !$GetParam{$Needed} ) {
                    $Errors{ $Needed . 'Invalid' } = 'ServerError';
            	}
            }

	    $RecordExists = $Self->RecordExistsCheck(
                ID	  => $GetParam{ID},
                Time      => $GetParam{Time},
                Queue     => $GetParam{Queue},
                Type      => $GetParam{Type},
                TypeValue => $GetParam{TypeValue},
                ValidID   => $GetParam{ValidID},
            );
	}

=c
        # check if this row exists in the system.
        my $RecordExists = $Self->RecordExistsCheck(
	    ID 		=> $GetParam{ID},
            Time 	=> $GetParam{Time},
            Queue 	=> $GetParam{Queue},
            Type 	=> $GetParam{Type},
            TypeValue 	=> $GetParam{TypeValue},
            ValidID 	=> $GetParam{ValidID},
        );
=cut
	# If record already exists
	$Errors{IDExists} = 1 if $RecordExists;
=c
	if ($RecordExists) {

            $Errors{IDExists} = 1;

            $Errors{'QueryInvalid'} = 'ServerError';

            $Errors{SubQueryExists} = 1;
            $Errors{'SubQueryInvalid'} = 'ServerError';

            $Errors{QueryValueExists} = 1;
            $Errors{'QueryValueInvalid'} = 'ServerError';

            $Errors{SubQueryValueExists} = 1;
            $Errors{'SubQueryValueInvalid'} = 'ServerError';

            $Errors{ValidIDExists} = 1;
            $Errors{'ValidIDInvalid'} = 'ServerError';

        }
=cut

        # if no errors occurred
        if ( !%Errors ) {

            # add type
            my $NewRecord = $Self->RecordAdd(
                %GetParam,
            );

            if ($NewRecord) {
                $Self->_Overview();
                my $Output = $LayoutObject->Header();
                $Output .= $LayoutObject->NavigationBar();
                $Output .= $LayoutObject->Notify( Info => Translatable('Matrix Added Successfully..!!') );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'EscalationMatrix',
                    Data         => \%Param,
                );
                $Output .= $LayoutObject->Footer();
                return $Output;
            }
        }

        # something has gone wrong
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Output .= $LayoutObject->Notify( Priority => 'Error' );
        $Self->_Edit(
            Action => 'Add',
            Errors => \%Errors,
            %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'EscalationMatrix',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }
    #------------------------------#
    # Check for QueryValue Request #
    #------------------------------#
    elsif ( $Self->{Subaction} eq 'GetQueue' ) {

        my $QueueName = $ParamObject->GetParam( Param => 'QueueName' ) || '';

#        my %QueryValues = $Self->GetDynamicFieldValue( DynamicFieldName => $QueryID );
        my %QueueValues = $Self->GetQueueList( QueueName => $QueueName );
        my $JSON = $LayoutObject->JSONEncode(

           Data => \%QueueValues,
        );

        return $LayoutObject->Attachment(
           ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
           Content     => $JSON,
           Type        => 'inline',
           NoCache     => 1,
       );

    }

    #---------------------------------#
    # Check for TypeValue Request #
    # --------------------------------#
    elsif ( $Self->{Subaction} eq 'GetTypeValue' ) {

        my $TypeID = $ParamObject->GetParam( Param	=> 'TypeID' ) || '';
	my %TypeValues = $Self->GetTypeValue( TypeID	=> $TypeID );

        my $JSON = $LayoutObject->JSONEncode(

           Data => \%TypeValues,
        );

        return $LayoutObject->Attachment(
           ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
           Content     => $JSON,
           Type        => 'inline',
           NoCache     => 1,
       );

    }

    # ------------------------------------------------------------
    # overview
    # ------------------------------------------------------------
    else {

        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # check if ticket type is enabled to use it here
        if ( !$Kernel::OM->Get('Kernel::Config')->Get('Ticket::Type') ) {
            $Output .= $LayoutObject->Notify(
                Priority => 'Error',
                Data     => $LayoutObject->{LanguageObject}->Translate( "Please activate %s first!", "Type" ),
                Link =>
                    $LayoutObject->{Baselink}
                    . 'Action=AdminSysConfig;Subaction=Edit;SysConfigGroup=Ticket;SysConfigSubGroup=Core::Ticket#Ticket::Type',
            );
        }

        $Self->_Overview();
        $Output .= $LayoutObject->Output(
            TemplateFile => 'EscalationMatrix',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

}

#Add New Record

sub RecordAdd {
    my ( $Self, %Param ) = @_;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $UserEmailList;

    if($Param{Type} eq '1'){

	$UserEmailList = $Self->GetUserEmailList( Group => $Param{TypeValue} );
    }
    elsif($Param{Type} eq '2'){

        $UserEmailList = $Self->GetUserEmailList( User => $Param{TypeValue} );
    }
    elsif($Param{Type} eq '3'){

        $UserEmailList = $Self->GetUserEmailList( Customer => $Param{TypeValue} );
    }
    else{

	$UserEmailList = $Param{TypeValueEmail};
	$Param{TypeValue} = -1;
    }

#    $UserEmailList = 'google@alphabet.xyz';

    my $Sql = 'INSERT INTO felicity_escalation_matrix (time, queue, type, type_value, user_emails, valid_id) '.
		'VALUES (?, ?, ?, ?, ?, ?)';

     return if !$DBObject->Do(
	SQL	=> $Sql,
        Bind	=> [ \$Param{Time}, \$Param{Queue}, \$Param{Type}, \$Param{TypeValue}, \$UserEmailList, \$Param{ValidID} ],
     );
	
    # get new record id
    return if !$DBObject->Prepare(
	SQL	=> "SELECT id FROM felicity_escalation_matrix WHERE time = ? AND queue = ? AND type = ? AND type_value = ? AND user_emails = ? AND valid_id = ?",
        Bind	=> [ \$Param{Time}, \$Param{Queue}, \$Param{Type}, \$Param{TypeValue}, \$UserEmailList, \$Param{ValidID} ],
    );

    # fetch the result
    my $ID;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $ID = $Row[0];
    }

    return if !$ID;
    return $ID;
}

#Update the record
sub RecordUpdate {
    my ( $Self, %Param ) = @_;

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $UserEmailList;

    if($Param{Type} eq '1'){

        $UserEmailList = $Self->GetUserEmailList( Group => $Param{TypeValue} );
    }
    elsif($Param{Type} eq '2'){

        $UserEmailList = $Self->GetUserEmailList( User => $Param{TypeValue} );
    }
    elsif($Param{Type} eq '3'){

        $UserEmailList = $Self->GetUserEmailList( Customer => $Param{TypeValue} );
    }
    else{

        $UserEmailList = $Param{TypeValueEmail};
	$Param{TypeValue} = -1;
    }

    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE felicity_escalation_matrix SET time = ?, queue = ?, type = ?, type_value = ?, user_emails = ?, valid_id=? WHERE id = ?',
        Bind	=> [ \$Param{Time}, \$Param{Queue} , \$Param{Type}, \$Param{TypeValue}, \$UserEmailList, \$Param{ValidID}, \$Param{ID} ],
    );

 return 1;
}


#Check Record already exist
sub RecordExistsCheck {
    my ( $Self, %Param ) = @_;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    
    if($Param{Type} eq 4){

	return if !$DBObject->Prepare(
            SQL => 'SELECT id FROM felicity_escalation_matrix 
                WHERE time = ? AND queue = ? AND type = ? AND user_emails = ? AND valid_id = ?',
            Bind => [ \$Param{Time}, \$Param{Queue}, \$Param{Type}, \$Param{TypeValueEmail}, \$Param{ValidID} ],
    	);
    }
    else{
    	return if !$DBObject->Prepare(
            SQL => 'SELECT id FROM felicity_escalation_matrix 
		WHERE time = ? AND queue = ? AND type = ? AND type_value = ? AND valid_id = ?',
            Bind => [ \$Param{Time}, \$Param{Queue}, \$Param{Type}, \$Param{TypeValue}, \$Param{ValidID} ],
    	);
    }

    #fetch the result
    my $Flag;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        if ( !$Param{ID} || $Param{ID} ne $Row[0] ) {
            $Flag = 1;
        }
    }

    if ($Flag) {
        return 1;
    }
    return 0;
}

# Get Queue List
sub GetQueueList {
    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

#    my $Sql = "SELECT id, name FROM queue WHERE name ILIKE '". $Param{QueueName}. "%' ORDER BY id LIMIT 10";
    my $Sql = "SELECT id, name FROM queue WHERE valid_id=1";

    return if !$DBObject->Prepare(
        SQL => $Sql,
#        Bind => [ \$Param{QueueName} ],
    );

    my %QueueList;
    $QueueList{''} = '-';
    while ( my @Data = $DBObject->FetchrowArray() ) {

        $QueueList{ $Data[0] } = $Data[1];
     }

    return %QueueList;
}

sub GetCustomerList {
    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $Sql = "SELECT id, CONCAT_WS(' ', first_name, last_name) FROM customer_user WHERE valid_id=1";

    return if !$DBObject->Prepare(
        SQL => $Sql,
    );

    my %QueueList;
    $QueueList{''} = '-';
    while ( my @Data = $DBObject->FetchrowArray() ) {

        $QueueList{ $Data[0] } = $Data[1];
     }

    return %QueueList;
}


# Get Dynamic Field Values
sub GetDynamicFieldValue {
   my ( $Self, %Param ) = @_;
   my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
   my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');
   my %ValueList;
    $ValueList{''} = '-';

   if($Param{DynamicFieldName})
   {
        $Self->{DynamicFieldName} = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldGet(
		Name => $Param{DynamicFieldName},
        );

           my %DynamicFieldValues;
           DYNAMICFIELD:
           for my $DynamicFieldConfig (  $Self->{DynamicFieldName}  ) {
                if ( IsHashRefWithData( $DynamicFieldConfig->{Config} ) ) {
                       if ( IsHashRefWithData( $DynamicFieldConfig->{Config}->{PossibleValues} ) ) {
                             $DynamicFieldValues{ $DynamicFieldConfig->{Name} } = $DynamicFieldConfig->{Config}->{PossibleValues};
                       }
                }
           }

	   my $hashCount = keys %DynamicFieldValues;
            if($hashCount > 0){

           	while( my ( $key, $val ) = each $DynamicFieldValues{ $Param{ DynamicFieldName }}){

           		$ValueList{$key} = $val;
            	}
	    }
   }
   return %ValueList;
}

# Get IDs
sub GetIDs{

    my ( $Self, %Param ) = @_;
    
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $Sql = 'SELECT id, valid_id FROM felicity_escalation_matrix';

    return if !$DBObject->Prepare(
	SQL => $Sql,
    );

    my %List;
    while( my @Row = $DBObject->FetchrowArray() ){

        $List{ $Row[0] } = $Row[1];
    }

    return %List;
}

# Function which displays Entry Detail page
sub _Edit {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    $LayoutObject->Block(
        Name => 'Overview',
        Data => \%Param,
    );

    $LayoutObject->Block( Name => 'ActionList' );
    $LayoutObject->Block( Name => 'ActionOverview' ); 
    
    # Get All Dynamic Fields
    my %ValidList	= $Kernel::OM->Get( 'Kernel::System::Valid' )->ValidList();
    my %TypeList	= $Self->GetDynamicFieldValue( DynamicFieldName => 'EscalationMatrix' );
    my %QueueList	= $Self->GetQueueList( ValidID => 1 );
    my %TypeValueList	= $Self->GetTypeValue( TypeID => $Param{Type} );

    $TypeValueList{''}	= '-';

    delete $Param{TypeValueEmail} if ($Param{Type} ne 4);

    $Param{ValidOption} = $LayoutObject->BuildSelection(
        Data       => \%ValidList,
        Name       => 'ValidID',
        SelectedID => $Param{ValidID} || 1,
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'ValidIDInvalid'} || '' ),
    );

    $Param{Queue} = $LayoutObject->BuildSelection(
        Data       => \%QueueList,
        Name       => 'Queue',
        SelectedID => $Param{Queue},
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'QueueInvalid'} || '' ),
    );


    $Param{TypeValue} = $LayoutObject->BuildSelection(
        Data       => \%TypeValueList,
        Name       => 'TypeValue',
        SelectedID => $Param{TypeValue},
#        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'QueueInvalid'} || '' ),
        Class      => 'Modernize' . ( $Param{Errors}->{'TypeValueInvalid'} || '' ),
    );

    $Param{Type} = $LayoutObject->BuildSelection(
        Data       => \%TypeList,
        Name       => 'Type',
        SelectedID => $Param{Type},
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'TypeInvalid'} || '' ),
    );

    $LayoutObject->Block(
        Name => 'OverviewUpdate',
        Data => {
            %Param,
            %{ $Param{Errors} },
        },
    );

    # shows header
    if ( $Param{Action} eq 'Change' ) {
        $LayoutObject->Block( Name => 'HeaderEdit' );
    }
    else {
        $LayoutObject->Block( Name => 'HeaderAdd' );
    }

    # shows appropriate message if error

    if ( defined $Param{Errors}->{IDExists} && $Param{Errors}->{IDExists} == 1 ) {
        $LayoutObject->Block( Name => 'ExistIDServerError' );
    }
    else {
        $LayoutObject->Block( Name => 'IDServerError' );
    }


    return 1;

}

sub _Overview {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    $LayoutObject->Block(
        Name => 'Overview',
        Data => \%Param,
    );

    $LayoutObject->Block( Name => 'ActionList' );
    $LayoutObject->Block( Name => 'ActionAdd' );

    $LayoutObject->Block(
        Name => 'OverviewResult',
        Data => \%Param,
    );
	
    my %List = $Self->GetIDs();
    #my %DynamicList = $Self->GetDynamicFieldList( ValidID => 1 );
    my %QueueList = $Self->GetQueueList();
    my %TypeList = $Self->GetDynamicFieldValue( DynamicFieldName => 'EscalationMatrix' );

    #if list exists, it'll be rendered
    if (%List) {

        my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();

        for my $RecordID ( sort { $List{$a} cmp $List{$b} } keys %List ) {
            my %Data = $Self->GetData(
                ID => $RecordID,
            );

	    my %TypeValueList   = $Self->GetTypeValue( TypeID => $Data{Type} );
#	    delete $Data{TypeValueEmail};

#	    next if !%Data;
	    $Data{Queue}	= $QueueList{ $Data{Queue} };	
	    $Data{Type}		= $TypeList{ $Data{Type} };
	    $Data{TypeValue}	= $TypeValueList{ $Data{TypeValue} };
	    $Data{TypeValue}	= $Data{TypeValueEmail} if $Data{TypeValue} eq '';
	    $LayoutObject->Block(
                Name => 'OverviewResultRow',
                Data => {
                    Valid => $ValidList{ $Data{ValidID} },
                    %Data,
                },
            );
        }
    }

    #otherwise a no data found msg is displayed
    else {
        $LayoutObject->Block(
            Name => 'NoDataFoundMsg',
            Data => {},
        );
    }


    return 1;
}

#Get Type Value

sub GetTypeValue{

    my ( $Self, %Param ) = @_;

    my %TypeValues;
    $TypeValues{''} = '-';

    my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');
    my $GroupObject	   = $Kernel::OM->Get('Kernel::System::Group');
    my $UserObject	   = $Kernel::OM->Get('Kernel::System::User');

    if( $Param{ TypeID } ){

	if( $Param{ TypeID } eq 1){

	    %TypeValues = $GroupObject->GroupList(
        	Valid	=> 1,   # (optional) default 0
	    );
	}
	elsif( $Param{ TypeID } eq 2){

            %TypeValues = $UserObject->UserList(
		Type	=> 'Short', #Short is default
		Valid	=> 1
            );
        }
	elsif( $Param{ TypeID } eq 3){

	    %TypeValues = $Self->GetCustomerList();
        }
    }
    return %TypeValues;
}


sub GetUserEmailList{

    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $UserEmailList = '';

    if( $Param{User} ){
	
	my $Sql = "SELECT preferences_value FROM user_preferences WHERE preferences_key = 'UserEmail' AND user_id = ?";

	return if !$DBObject->Prepare(
            SQL => $Sql,
            Bind => [ \$Param{User} ],
        );
	
	my @Data = $DBObject->FetchrowArray();
	$UserEmailList = $Data[0];
	    
    }
    elsif( $Param{Group}){

	my $Sql = "SELECT preferences_value FROM user_preferences WHERE preferences_key = 'UserEmail' AND user_id IN (SELECT user_id FROM group_user WHERE group_id = ?)";

	return if !$DBObject->Prepare(
	    SQL => $Sql,
            Bind => [ \$Param{Group} ],
	);
	my @emails;
#	my @Data = $DBObject->FetchrowArray();
	my $counter = 0;
	while ( my @Data = $DBObject->FetchrowArray() ) {
	    $emails[$counter] = $Data[0];
	    $counter++;
	}
	$UserEmailList = join(',', @emails); 

    }
    elsif( $Param{Customer}){

	my $Sql = "SELECT email FROM customer_user WHERE id = ?";
 
        return if !$DBObject->Prepare(
            SQL => $Sql,
            Bind => [ \$Param{Customer} ],
        );

	my @Data = $DBObject->FetchrowArray();
        $UserEmailList = $Data[0];
            
    }

    return $UserEmailList;
}

#Single record based on ID
sub GetData {
    my ( $Self, %Param ) = @_;

        #Here ID must be passed
    if ( !$Param{ID}) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ID!',
        );
        return;
    }

    # Database Object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $Sql = 'SELECT id, queue, type, type_value, valid_id, time, user_emails FROM felicity_escalation_matrix WHERE id = ?';

    # Query Database
    return if !$DBObject->Prepare(
	SQL => $Sql,
	Bind => [ \$Param{ID} ],
    );

    # Fetch Result
    my %FetchData;
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $FetchData{ID}         	= $Data[0];
        $FetchData{Queue}      	= $Data[1];
        $FetchData{Type} 	= $Data[2];
        $FetchData{TypeValue} 	= $Data[3];
#        $FetchData{UserEmails} 	= $Data[4];
	$FetchData{ValidID}    	= $Data[4];
	$FetchData{Time}    	= $Data[5];
	$FetchData{TypeValueEmail} = $Data[6];
    }

        #Here no data found
    if ( !%FetchData ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Given '$Param{ID}' not found!",
        );
        return;
    }

    return %FetchData;
}

1;
