# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

=c
#-----------------------------------------------#
#######   Dependent Dropdown Module	#########
------------------------------------------------#
#---- Functionality of the Module..		#
1. Query and Sub Query is input.		#
2. User is selected from dropdown and saved.	#
------------------------------------------------#
#Note :- All the fields are mandatory		#
#-----------------------------------------------#
=cut

package Kernel::Modules::DependentDropdown;

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

    $Self->{CacheType} = 'DependentDropdown';
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
            TemplateFile => 'DependentDropdown',
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
        for my $Parameter (qw(ID Query SubQuery QueryValue SubQueryValue ValidID)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

        # check needed data
        for my $Needed (qw(ID Query SubQuery QueryValue SubQueryValue ValidID)) {
            if ( !$GetParam{$Needed} ) {
                $Errors{ $Needed . 'Invalid' } = 'ServerError';
            }
        }

        my %Data = $Self->GetData( ID => $GetParam{ID} );
        if ( !%Data ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No Record Exist!'),
            );
        }

        # check if a type exists with this name
        my $RecordExists  = $Self->RecordExistsCheck(
            Query 	  => $GetParam{Query},
	    SubQuery 	  => $GetParam{SubQuery},
	    QueryValue	  => $GetParam{QueryValue},
	    SubQueryValue => $GetParam{SubQueryValue},
	    ValidID 	  => $GetParam{ValidID},
            ID 		  => $GetParam{ID}
        );

	# If record already exists
	if ($RecordExists) {
            $Errors{QueryExists} = 1;
#            $Errors{'QueryInvalid'} = 'ServerError';

            $Errors{SubQueryExists} = 1;
#            $Errors{'SubQueryInvalid'} = 'ServerError';

            $Errors{QueryValueExists} = 1;
#            $Errors{'QueryValueInvalid'} = 'ServerError';

            $Errors{SubQueryValueExists} = 1;
#            $Errors{'SubQueryValueInvalid'} = 'ServerError';

            $Errors{ValidIDExists} = 1;
#            $Errors{'ValidIDInvalid'} = 'ServerError';

        }

        # if no errors occurred
        elsif ( !%Errors) {

            # update type
            my $Update = $Self->RecordUpdate(
                %GetParam,
            );
            if ($Update) {
                $Self->_Overview();
                my $Output = $LayoutObject->Header();
                $Output .= $LayoutObject->NavigationBar();
                $Output .= $LayoutObject->Notify( Info => Translatable('Dependency Updated Successfully!') );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'DependentDropdown',
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
            TemplateFile => 'DependentDropdown',
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
            TemplateFile => 'DependentDropdown',
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
	for my $Parameter (qw(Query SubQuery QueryValue SubQueryValue ValidID)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

        # check needed data
        for my $Needed (qw(Query SubQuery QueryValue SubQueryValue ValidID)) {
            if ( !$GetParam{$Needed} ) {
                $Errors{ $Needed . 'Invalid' } = 'ServerError';
            }
        }

        # check if this row exists in the system.
        my $RecordExists = $Self->RecordExistsCheck(
            Query => $GetParam{Query},
            SubQuery => $GetParam{SubQuery},
            QueryValue => $GetParam{QueryValue},
            SubQueryValue => $GetParam{SubQueryValue},
            ValidID => $GetParam{ValidID},
	    ID => $GetParam{ID},
        );

	# If record already exists
	if ($RecordExists) {

            $Errors{QueryExists} = 1;
#            $Errors{'QueryInvalid'} = 'ServerError';

            $Errors{SubQueryExists} = 1;
#            $Errors{'SubQueryInvalid'} = 'ServerError';

            $Errors{QueryValueExists} = 1;
#            $Errors{'QueryValueInvalid'} = 'ServerError';

            $Errors{SubQueryValueExists} = 1;
#            $Errors{'SubQueryValueInvalid'} = 'ServerError';

            $Errors{ValidIDExists} = 1;
#            $Errors{'ValidIDInvalid'} = 'ServerError';
        }

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
                $Output .= $LayoutObject->Notify( Info => Translatable('Dependency Added Successfully..!!') );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'DependentDropdown',
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
            TemplateFile => 'DependentDropdown',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }
    #------------------------------#
    # Check for QueryValue Request #
    #------------------------------#
    elsif ( $Self->{Subaction} eq 'GetQueryValue' ) {

        my $QueryID = $ParamObject->GetParam( Param => 'QueryID' ) || '';

        my %QueryValues = $Self->GetDynamicFieldValue( DynamicFieldID => $QueryID );
        my $JSON = $LayoutObject->JSONEncode(

           Data => \%QueryValues,
        );

        return $LayoutObject->Attachment(
           ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
           Content     => $JSON,
           Type        => 'inline',
           NoCache     => 1,
       );

    }

    #---------------------------------#
    # Check for SubQueryValue Request #
    # --------------------------------#
    elsif ( $Self->{Subaction} eq 'GetSubQueryValue' ) {

        my $SubQueryID = $ParamObject->GetParam( Param => 'SubQueryID' ) || '';
        my %SubQueryValues = $Self->GetDynamicFieldValue( DynamicFieldID => $SubQueryID );
        my $JSON = $LayoutObject->JSONEncode(

           Data => \%SubQueryValues,
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
            TemplateFile => 'DependentDropdown',
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

     return if !$DBObject->Do(
        SQL => 'INSERT INTO dependent_query_dropdown (parent_id, child_id, parent_value, child_value, valid_id)'.
		' VALUES (?, ?, ?, ?, ?)',
        Bind => [ \$Param{Query} , \$Param{SubQuery}, \$Param{QueryValue}, \$Param{SubQueryValue}, \$Param{ValidID}],
     );
	
    # get new record id
    return if !$DBObject->Prepare(
	SQL => "SELECT id FROM dependent_query_dropdown WHERE parent_id =? AND child_id = ? AND parent_value = ? AND child_value = ?",
        Bind => [ \$Param{Query} , \$Param{SubQuery}, \$Param{QueryValue}, \$Param{SubQueryValue}],
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

    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE dependent_query_dropdown SET parent_id = ?, child_id = ?, parent_value = ?, child_value = ?, valid_id=? WHERE id = ?',
        Bind => [
            \$Param{Query}, \$Param{SubQuery}, \$Param{QueryValue}, \$Param{SubQueryValue}, \$Param{ValidID}, \$Param{ID},
        ],
    );


 return 1;
}


#Check Record already exist
sub RecordExistsCheck {
    my ( $Self, %Param ) = @_;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    

    return if !$DBObject->Prepare(
        SQL => 'SELECT id FROM dependent_query_dropdown 
		WHERE parent_id = ? AND child_id = ? AND parent_value = ? AND child_value = ? AND valid_id = ?',
        Bind => [ \$Param{Query}, \$Param{SubQuery}, \$Param{QueryValue}, \$Param{SubQueryValue}, \$Param{ValidID} ],
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


#Get Dynamic Fields List
sub GetDynamicFieldList {
    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    return if !$DBObject->Prepare(
        SQL => "SELECT id,name FROM dynamic_field WHERE valid_id = ? and field_type='Dropdown'",
        Bind => [ \$Param{ValidID} ],
    );

    my %DynamicFields;
    $DynamicFields{''} = '-';
    while ( my @Data = $DBObject->FetchrowArray() ) {

        $DynamicFields{ $Data[0] } = $Data[1];
     }


    return %DynamicFields;
}

# Get Dynamic Field Values
sub GetDynamicFieldValue {
   my ( $Self, %Param ) = @_;
   my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
   my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');
   my %ValueList;
   if($Param{DynamicFieldID})
   {
        $Self->{DynamicField} = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldGet(
               ID   => $Param{DynamicFieldID},
        );


           my %DynamicFieldValues;
           DYNAMICFIELD:
           for my $DynamicFieldConfig (  $Self->{DynamicField}  ) {
                if ( IsHashRefWithData( $DynamicFieldConfig->{Config} ) ) {
                       if ( IsHashRefWithData( $DynamicFieldConfig->{Config}->{PossibleValues} ) ) {
                             $DynamicFieldValues{ $DynamicFieldConfig->{ID} } = $DynamicFieldConfig->{Config}->{PossibleValues};
                       }
                }
           }

	   my $hashCount = keys %DynamicFieldValues;
            if($hashCount > 0)
            {

           	while(my ($key,$val)= each $DynamicFieldValues{$Param{DynamicFieldID}}){
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

    return if !$DBObject->Prepare(
        SQL => "SELECT id, valid_id FROM dependent_query_dropdown ORDER BY id"
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
    my %ValidList        = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();
    #my %QueryList = $Self->GetDynamicFieldValue(DynamicFieldID => 72);
    my %QueryList = $Self->GetDynamicFieldList(ValidID => 1);
    my %SubQueryList = $Self->GetDynamicFieldList(ValidID => 1);
    my %QueryValueList = $Self->GetDynamicFieldValue( DynamicFieldID => $Param{Query} );
    my %SubQueryValueList = $Self->GetDynamicFieldValue( DynamicFieldID => $Param{SubQuery} );

    $Param{ValidOption} = $LayoutObject->BuildSelection(
        Data       => \%ValidList,
        Name       => 'ValidID',
        SelectedID => $Param{ValidID} || 1,
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'ValidIDInvalid'} || '' ),
    );

    $Param{Query} = $LayoutObject->BuildSelection(
        Data       => \%QueryList,
        Name       => 'Query',
        SelectedID => $Param{Query},
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'QueryInvalid'} || '' ),
    );


    $Param{SubQuery} = $LayoutObject->BuildSelection(
        Data       => \%SubQueryList,
        Name       => 'SubQuery',
        SelectedID => $Param{SubQuery},
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'SubQueryInvalid'} || '' ),
    );

    $Param{QueryValue} = $LayoutObject->BuildSelection(
        Data       => \%QueryValueList,
        Name       => 'QueryValue',
        SelectedID => $QueryValueList{ $Param{QueryValue} },
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'QueryValueInvalid'} || '' ),
    );

    $Param{SubQueryValue} = $LayoutObject->BuildSelection(
        Data       => \%SubQueryValueList,
        Name       => 'SubQueryValue',
        SelectedID => $SubQueryValueList{ $Param{SubQueryValue} },
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'SubQueryValueInvalid'} || '' ),
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

    if ( defined $Param{Errors}->{QueryExists} && $Param{Errors}->{QueryExists} == 1 ) {
        $LayoutObject->Block( Name => 'ExistIDServerError' );
    }
    else {
        $LayoutObject->Block( Name => 'QueryServerError' );
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
#	    next if !%Data;
	    $Data{Query} = $DynamicList{$Data{Query}};	
	    $Data{SubQuery} = $DynamicList{$Data{SubQuery}};
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

    my $Sql = 'SELECT id, parent_id, parent_value, child_id, child_value, valid_id FROM dependent_query_dropdown WHERE id=?';


    # Query Database
    return if !$DBObject->Prepare(
	SQL => $Sql,
	Bind => [ \$Param{ID} ],
    );

    # Fetch Result
    my %AgentAssignment;
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $AgentAssignment{ID}         	= $Data[0];
        $AgentAssignment{Query}      	= $Data[1];
        $AgentAssignment{QueryValue} 	= $Data[2];
        $AgentAssignment{SubQuery}   	= $Data[3];
        $AgentAssignment{SubQueryValue} = $Data[4];
	$AgentAssignment{ValidID}    	= $Data[5];
    }

        #Here no data found
    if ( !%AgentAssignment ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "AgentAssignmentID '$Param{ID}' not found!",
        );
        return;
    }

    return %AgentAssignment;
}

1;
