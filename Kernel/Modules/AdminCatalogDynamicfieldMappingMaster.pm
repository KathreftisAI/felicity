# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

=c
#-----------------------------------------------#
#######   Product Catalog Module	#########
------------------------------------------------#
#---- Functionality of the Module..		#
1. ProductID, Name as input.		#
2. Product will be create in master table	#
------------------------------------------------#
#Note :- All the fields are mandatory		#
#-----------------------------------------------#
=cut

package Kernel::Modules::AdminCatalogDynamicfieldMappingMaster;

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

    $Self->{CacheType} = 'CatalogDynamicMappingMaster';
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
            TemplateFile => 'AdminCatalogDynamicfieldMappingMaster',
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
        for my $Parameter (qw(ID DynamicField Content ValidID)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

	my $RecordExists;	
        for my $Needed (qw(ID DynamicField Content ValidID)) {
            	if ( !$GetParam{$Needed} ) {
                    $Errors{ $Needed . 'Invalid' } = 'ServerError';
            	}
        }


        $RecordExists  = $Self->RecordExistsCheck(
            ID            => $GetParam{ID},
            DynamicField   => $GetParam{DynamicField},
            Content   => $GetParam{Content},
            ValidID   => $GetParam{ValidID},
	        UserID => $Self->{UserID}
        );


        my %Data = $Self->GetData( ID => $GetParam{ID} );
        if ( !%Data ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No Record Exist!'),
            );
        }

	# If record already exists
	$Errors{IDExists} = 1 if $RecordExists;

        # if no errors occurred
        if ( !%Errors) {

            # update type
            my $Update = $Self->RecordUpdate(
                %GetParam,
                UserID          => $Self->{UserID},
            );
            if ($Update) {
                $Self->_Overview();
                my $Output = $LayoutObject->Header();
                $Output .= $LayoutObject->NavigationBar();
                $Output .= $LayoutObject->Notify( Info => Translatable('Catalog Updated Successfully!') );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'AdminCatalogDynamicfieldMappingMaster',
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
            TemplateFile => 'AdminCatalogDynamicfieldMappingMaster',
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
            TemplateFile => 'AdminCatalogDynamicfieldMappingMaster',
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
        for my $Parameter (qw(DynamicField Content ValidID)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

	my $RecordExists;

        # check needed data
	for my $Needed (qw(DynamicField Content ValidID)) {
            	if ( !$GetParam{$Needed} ) {
                    $Errors{ $Needed . 'Invalid' } = 'ServerError';
                }
        }

	$RecordExists	= $Self->RecordExistsCheck(
            ID            => $GetParam{ID},
            DynamicField   => $GetParam{DynamicField},
            Content   => $GetParam{Content},
            ValidID   => $GetParam{ValidID},
    	    UserID => $Self->{UserID}
        );

	# If record already exists
	$Errors{IDExists} = 1 if $RecordExists;

        # if no errors occurred
        if ( !%Errors ) {

            # add type
            my $NewRecord = $Self->RecordAdd(
                %GetParam,
                UserID          => $Self->{UserID},
            );

            if ($NewRecord) {
                $Self->_Overview();
                my $Output = $LayoutObject->Header();
                $Output .= $LayoutObject->NavigationBar();
                $Output .= $LayoutObject->Notify( Info => Translatable('Catalog Added Successfully..!!') );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'AdminCatalogDynamicfieldMappingMaster',
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
            TemplateFile => 'AdminCatalogDynamicfieldMappingMaster',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
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
            TemplateFile => 'AdminCatalogDynamicfieldMappingMaster',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

}

#Add New Record

sub RecordAdd {
    my ( $Self, %Param ) = @_;

    $Param{Content} = substr( $Param{Content}, 0, 1);
    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

   my $Sql = 'INSERT INTO felicity_catalog_dynamicfield_mapping (dynamicfield_id,content,valid_id,create_time,create_by,change_time,change_by) '.
		'VALUES (?, ?, ?, current_timestamp, ?, current_timestamp, ?)';
    return if !$DBObject->Do(
	SQL	=> $Sql,
        Bind	=> [ \$Param{DynamicField}, \$Param{Content},\$Param{ValidID},\$Param{UserID},\$Param{UserID} ],
    );
	
    # get new record id

    return if !$DBObject->Prepare(
	SQL	=> "SELECT id FROM felicity_catalog_dynamicfield_mapping WHERE dynamicfield_id = ? AND  valid_id = ?",
        Bind	=> [ \$Param{DynamicField},\$Param{ValidID}],
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

    $Param{Content} = substr( $Param{Content}, 0, 1);
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE felicity_catalog_dynamicfield_mapping SET dynamicfield_id=?,content=?,valid_id=?,change_time = current_timestamp, change_by = ? WHERE id = ?',
        Bind	=> [ \$Param{DynamicField}, \$Param{Content}, \$Param{ValidID}, \$Param{UserID}, \$Param{ID} ],
    );

 return 1;
}


#Check Record already exist
sub RecordExistsCheck {
    my ( $Self, %Param ) = @_;


    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    return if !$DBObject->Prepare(
      SQL => 'SELECT id FROM felicity_catalog_dynamicfield_mapping 
                WHERE dynamicfield_id =? AND valid_id = ?',
      Bind => [\$Param{DynamicField}, \$Param{ValidID} ],
    );

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


sub GetDynamicFieldList {
    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    return if !$DBObject->Prepare(
        SQL => "SELECT id,name FROM dynamic_field WHERE valid_id = ?",
        Bind => [ \$Param{ValidID} ],
    );

    my %DynamicFields;
    while ( my @Data = $DBObject->FetchrowArray() ) {

        $DynamicFields{ $Data[0] } = $Data[1];
     }


    return %DynamicFields;
}

# Get IDs
sub GetIDs{

    my ( $Self, %Param ) = @_;
    
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $Sql = 'SELECT id ,content FROM felicity_catalog_dynamicfield_mapping';

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
     my %DynamicFieldList = $Self->GetDynamicFieldList(ValidID => 1);
    
    $Param{ValidOption} = $LayoutObject->BuildSelection(
        Data       => \%ValidList,
        Name       => 'ValidID',
        SelectedID => $Param{ValidID} || 1,
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'ValidIDInvalid'} || '' ),
    );
     $Param{DynamicField} = $LayoutObject->BuildSelection(
        Data       => \%DynamicFieldList,
        Name       => 'DynamicField',
        SelectedID => $Param{DynamicField},
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'DynamicFieldInvalid'} || '' ),
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
    my %DynamicList = $Self->GetDynamicFieldList( ValidID => 1);
    #if list exists, it'll be rendered
    if (%List) {

        my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();

        for my $RecordID ( sort { $List{$a} cmp $List{$b} } keys %List ) {
            my %Data = $Self->GetData(
                ID => $RecordID,
            );

    $Data{DynamicField} = $DynamicList{$Data{DynamicField}};  
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

    my $Sql = 'SELECT id,dynamicfield_id,content,valid_id,create_time,change_time FROM felicity_catalog_dynamicfield_mapping WHERE id = ?';

    # Query Database
    return if !$DBObject->Prepare(
	SQL => $Sql,
	Bind => [ \$Param{ID} ],
    );

    # Fetch Result
    my %FetchData;
    while ( my @Data = $DBObject->FetchrowArray() ) {
    $FetchData{ID}         	= $Data[0];
    $FetchData{DynamicField}    = $Data[1];
    $FetchData{Content}   =  $Data[2];
	$FetchData{ValidID}    	= $Data[3];
	$FetchData{CreateTime}     = $Data[4];
	$FetchData{ChangeTime}     = $Data[5];
    
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
