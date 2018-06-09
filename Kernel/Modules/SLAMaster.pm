# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::SLAMaster;

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

#    $Self->{CacheType} = 'DynamicFieldExtend';
    $Self->{CacheType} = 'SLAMaster';
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
        my %Data = $Self->SLAGet(ID => $ID);
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
            TemplateFile => 'SLAMaster',
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
        for my $Parameter (qw(ID Name Dest DynamicFieldID DynamicFieldValue ValidID SLAID FirstResponseTime FirstResponseNotify UpdateTime UpdateNotify SolutionTime SolutionNotify)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

        # check needed data
        for my $Needed (qw(ID Name Dest DynamicFieldID DynamicFieldValue ValidID SLAID)) {
            if ( !$GetParam{$Needed} ) {
                $Errors{ $Needed . 'Invalid' } = 'ServerError';
            }
        }

        my %Data = $Self->SLAGet( ID => $GetParam{ID} );
        if ( !%Data ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('Need Record Exist!'),
            );
        }

        # check if a type exists with this name
        my $RecordExists = $Self->RecordExistsCheck(
            Name => $GetParam{Name},
            ID   => $GetParam{ID}
        );

        if ($RecordExists) {
            $Errors{NameExists} = 1;
#            $Errors{'NameInvalid'} = 'ServerError';
        }

        
	# if no errors occurred
        if ( !%Errors ) {
	

        my $Update = $Self->RecordUpdate(
                %GetParam,
                UserID => $Self->{UserID}
        );
        my $LogObject = $Kernel::OM->Get('Kernel::System::Log');
        if ( !$Update ) {
            $Errors{Message} = $LogObject->GetLogEntry(
                   Type => 'Error',
                   What => 'Message',
            );
        }


            if ($Update) {
                $Self->_Overview();
                my $Output = $LayoutObject->Header();
                $Output .= $LayoutObject->NavigationBar();
                $Output .= $LayoutObject->Notify( Info => Translatable('SLA record updated!') );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'SLAMaster',
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
	$Output .= $Errors{Message}
            ? $LayoutObject->Notify(
            Priority => 'Error',
            Info     => $Errors{Message},
            )
            : '';

        $Self->_Edit(
            Action => 'Change',
            Errors => \%Errors,
            %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'SLAMaster',
            Data         => \%GetParam,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # add
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Add' ) {
        my %GetParam = ();
        $GetParam{TypeID} = $ParamObject->GetParam( Param => 'TypeID' );
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Self->_Edit(
            Action => 'Add',
            %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'SLAMaster',
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
        for my $Parameter (qw(Name Dest DynamicFieldID DynamicFieldValue ValidID FirstResponseTime FirstResponseNotify UpdateTime UpdateNotify SolutionTime SolutionNotify)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

        # check needed data
        for my $Needed (qw(Name Dest DynamicFieldID DynamicFieldValue ValidID)) {
            if ( !$GetParam{$Needed} ) {
                $Errors{ $Needed . 'Invalid' } = 'ServerError';
            }
        }

	my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        # check if a type exists with this name
        my $RecordExists = $Self->RecordExistsCheck(
            Name => $GetParam{Name},
        );


	if ($RecordExists) {
            $Errors{NameExists} = 1;
#            $Errors{'NameInvalid'} = 'ServerError';

            $Errors{DestExists} = 1;
#            $Errors{'DestInvalid'} = 'ServerError';

            $Errors{DynamicFieldIDExists} = 1;
#            $Errors{'DynamicFieldIDInvalid'} = 'ServerError';

            $Errors{ValidIDExists} = 1;
#            $Errors{'ValidIDInvalid'} = 'ServerError';

        }

        if ( !%Errors ) {

            # add type
            my $NewRecord = $Self->RecordAdd(
                %GetParam,
                UserID => $Self->{UserID}
            );

	    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');
            if ( !$NewRecord ) {
            $Errors{Message} = $LogObject->GetLogEntry(
                   Type => 'Error',
                   What => 'Message',
             );
            }


            if ($NewRecord) {
                $Self->_Overview();
                my $Output = $LayoutObject->Header();
                $Output .= $LayoutObject->NavigationBar();
                $Output .= $LayoutObject->Notify( Info => Translatable('SLA record added!') );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'SLAMaster',
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
	$Output .= $Errors{Message}
            ? $LayoutObject->Notify(
            Priority => 'Error',
            Info     => $Errors{Message},
            )
            : '';

        $Self->_Edit(
            Action => 'Add',
            Errors => \%Errors,
            %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'SLAMaster',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }
    elsif ( $Self->{Subaction} eq 'GetDynamicFieldValue' ) {
     my $DynamicFieldID = $ParamObject->GetParam( Param => 'DynamicFieldID' ) || '';
     my %DynamicFieldValues = $Self->GetDynamicFieldValue(DynamicFieldID => $DynamicFieldID);
     $DynamicFieldValues{''} = '-';
     my $JSON = $LayoutObject->JSONEncode(
            Data => \%DynamicFieldValues,
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
            TemplateFile => 'SLAMaster',
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

    # set default values
    $Param{ServiceIDs}          ||= [];
    $Param{Calendar}            ||= '';
    $Param{Comment}             ||= '';
    $Param{FirstResponseTime}   ||= 0;
    $Param{FirstResponseNotify} ||= 0;
    $Param{UpdateTime}          ||= 0;
    $Param{UpdateNotify}        ||= 0;
    $Param{SolutionTime}        ||= 0;
    $Param{SolutionNotify}      ||= 0;
    $Param{MinTimeBetweenIncidents} ||= 0;
    $Param{TypeID} = 15; 
  
    return if !$DBObject->Do(
        SQL => 'INSERT INTO sla '
            . '(name, calendar_name, first_response_time, first_response_notify, '
            . 'update_time, update_notify, solution_time, solution_notify, '
            . 'valid_id, comments, create_time, create_by, change_time, change_by, '
            . 'type_id, min_time_bet_incidents) VALUES '
            . '(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, current_timestamp, ?, current_timestamp, ?, ?, ?)',
        Bind => [
            \$Param{Name}, \$Param{Calendar}, \$Param{FirstResponseTime},
            \$Param{FirstResponseNotify}, \$Param{UpdateTime}, \$Param{UpdateNotify},
            \$Param{SolutionTime}, \$Param{SolutionNotify}, \$Param{ValidID}, \$Param{Comment},
            \$Param{UserID}, \$Param{UserID}, \$Param{TypeID}, \$Param{MinTimeBetweenIncidents},
        ],
    );

    return if !$DBObject->Prepare(
        SQL   => 'SELECT id FROM sla WHERE name = ?',
        Bind  => [ \$Param{Name} ],
        Limit => 1,
    );

    my $SLAID;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $SLAID = $Row[0];
    }

    if ( !$SLAID ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't find SLAID for '$Param{Name}'!",
        );
        return;
    }

    $Param{SLAID} = $SLAID; 
   return if !$DBObject->Do(
        SQL => 'INSERT INTO felicity_sla_master (name,queue,field_name,field_value,valid_id,sla_id)'
            . ' VALUES (?, ?, ?, ?, ?, ?)',
        Bind => [ \$Param{Name}, \$Param{Dest}, \$Param{DynamicFieldID}, \$Param{DynamicFieldValue} , \$Param{ValidID}, \$Param{SLAID} ],
    );

	
    # get new record id
    return if !$DBObject->Prepare(
        SQL => 'SELECT id FROM felicity_sla_master 
                WHERE name = ? and valid_id =?',
        Bind => [\$Param{Name},\$Param{ValidID}],
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
	
     return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE felicity_sla_master SET name = ?, queue = ?, '
            . ' field_name = ?, field_value = ?, valid_id = ? WHERE id = ?',
        Bind => [
            \$Param{Name}, \$Param{Dest}, \$Param{DynamicFieldID}, \$Param{DynamicFieldValue},\$Param{ValidID},\$Param{ID},
        ],
     );

 # set default values
	$Param{ServiceIDs}          ||= [];
        $Param{Calendar}            ||= '';
        $Param{Comment}             ||= '';
        $Param{FirstResponseTime}   ||= 0;
        $Param{FirstResponseNotify} ||= 0;
        $Param{UpdateTime}          ||= 0;
        $Param{UpdateNotify}        ||= 0;
        $Param{SolutionTime}        ||= 0;
        $Param{SolutionNotify}      ||= 0;
        $Param{TypeID} = 15; 

	return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
	SQL => 'UPDATE sla SET name = ?, calendar_name = ?, '
            . 'first_response_time = ?, first_response_notify = ?, '
            . 'update_time = ?, update_notify = ?, solution_time = ?, solution_notify = ?, '
            . 'valid_id = ?, comments = ?, change_time = current_timestamp, change_by = ?, '
            . 'type_id = ? '
            . 'WHERE id = ?',
        Bind => [
            \$Param{Name}, \$Param{Calendar}, \$Param{FirstResponseTime},
            \$Param{FirstResponseNotify}, \$Param{UpdateTime}, \$Param{UpdateNotify},
            \$Param{SolutionTime}, \$Param{SolutionNotify}, \$Param{ValidID}, \$Param{Comment},
            \$Param{UserID}, \$Param{TypeID}, \$Param{SLAID},
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
        SQL => 'SELECT id FROM felicity_sla_master WHERE name =?',
        Bind => [\$Param{Name}],
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

#Fetch the queue list
sub QueueList {
    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    return if !$DBObject->Prepare(
        SQL => 'SELECT id, name FROM queue WHERE valid_id  = ?',
        Bind => [ \$Param{ValidID} ],
    );

    my %Queues;
    $Queues{''} = '-';
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Queues{ $Row[0]} = $Row[1];
    }

    return %Queues;
}


#Get the admin's dyamic field list
sub DynamicFieldsGet {
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

#Single record based on ID
sub SLAGet {
    my ( $Self, %Param ) = @_;

	#ID must be passed
    if ( !$Param{ID}) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ID!',
        );
        return;
    }

	#get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

	#ask the database
    return if !$DBObject->Prepare(
        SQL => 'SELECT id,name,queue,field_name,field_value,valid_id,sla_id FROM felicity_sla_master WHERE id = ?',
        Bind => [ \$Param{ID} ],
    );

	#fetch the result
    my %SLAList;
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $SLAList{ID}         = $Data[0];
        $SLAList{Name}       = $Data[1];
        $SLAList{Dest}    = $Data[2];
        $SLAList{DynamicFieldID} = $Data[3];
	$SLAList{DynamicFieldValue} = $Data[4];
	$SLAList{ValidID} = $Data[5];
	$SLAList{SLAID} = $Data[6];
    }

	#no data found
    if ( !%SLAList ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "SLA '$Param{ID}' not found!",
        );
        return;
    }
	my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
        my %LinkedData = $Self->LinkedSLAGet(ID => $SLAList{SLAID});
        if ( !%LinkedData ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('Need Data to Edit!'),
            );
        }

        $SLAList{FirstResponseTime}  = $LinkedData{FirstResponseTime};
        $SLAList{FirstResponseNotify} = $LinkedData{FirstResponseNotify};
        $SLAList{UpdateTime}    = $LinkedData{UpdateTime};
        $SLAList{UpdateNotify} = $LinkedData{UpdateNotify};
        $SLAList{SolutionTime} = $LinkedData{SolutionTime};
        $SLAList{SolutionNotify} = $LinkedData{SolutionNotify};

    return %SLAList;
}

#Get the linked SLA Details based on ID
sub LinkedSLAGet {
    my ( $Self, %Param ) = @_;
   
    if ( !$Param{ID}) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ID!',
        );
        return;
    }

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    return if !$DBObject->Prepare(
        SQL => 'SELECT first_response_time,first_response_notify,update_time,update_notify,solution_time,solution_notify FROM sla WHERE id = ?',
        Bind => [ \$Param{ID} ],
    );

    my %LinkedSLAList;
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $LinkedSLAList{FirstResponseTime}         = $Data[0];
        $LinkedSLAList{FirstResponseNotify}       = $Data[1];
        $LinkedSLAList{UpdateTime}    = $Data[2];
        $LinkedSLAList{UpdateNotify} = $Data[3];
        $LinkedSLAList{SolutionTime} = $Data[4];
        $LinkedSLAList{SolutionNotify} = $Data[5];
    }

    if ( !%LinkedSLAList ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "DynamicFieldID '$Param{ID}' not found!",
        );
        return;
    }

    return %LinkedSLAList;
}


sub SLAList {
    my ( $Self, %Param ) = @_;

	#check needed stuff
    my $Valid = 1;
    if ( !$Param{Valid} && defined $Param{Valid} ) {
        $Valid = 0;
    }


	#create the valid list
    my $ValidIDs = join ', ', $Kernel::OM->Get('Kernel::System::Valid')->ValidIDsGet();

	#build SQL
    my $SQL = 'SELECT id,name FROM felicity_sla_master';

	#add WHERE statement
    if ($Valid) {
        $SQL .= ' WHERE valid_id IN (' . $ValidIDs . ')';
    }

	#get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

	#ask database
    return if !$DBObject->Prepare(
        SQL => $SQL,
    );

	#fetch the result
    my %SLAList;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $SLAList{ $Row[0] } = $Row[1];
    }

    return %SLAList;
}

#Get Dynamic Field Values Based on Dynamic Field ID
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

    # get valid list
    my %ValidList        = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();
    my %DynamicFieldsList = $Self->DynamicFieldsGet(ValidID => 1);
    my %QueueList = $Self->QueueList(ValidID => 1);

    my %DynamicFieldValues = $Self->GetDynamicFieldValue(DynamicFieldID => $Param{DynamicFieldID});
  
    
    $Param{QueueList} = $LayoutObject->BuildSelection(
        Data       => \%QueueList,
        Name       => 'Dest',
        SelectedID => $Param{Dest},
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'DestInvalid'} || '' ),
    );


    $Param{DynamicFieldOption} = $LayoutObject->BuildSelection(
        Data       => \%DynamicFieldsList,
        Name       => 'DynamicFieldID',
        SelectedID => $Param{DynamicFieldID},
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'DynamicFieldInvalid'} || '' ),
    );


    $Param{ValidOption} = $LayoutObject->BuildSelection(
        Data       => \%ValidList,
        Name       => 'ValidID',
        SelectedID => $Param{ValidID} || 1,
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'ValidIDInvalid'} || '' ),
    );

    $Param{DynamicFieldValueOption} = $LayoutObject->BuildSelection(
        Data       => \%DynamicFieldValues,
        Name       => 'DynamicFieldValue',
        SelectedID => $Param{DynamicFieldValue} || -1,
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'DynamicFieldValueInvalid'} || '' ),
    );

    my %NotifyLevelList = (
        10 => '10%',
        20 => '20%',
        30 => '30%',
        40 => '40%',
        50 => '50%',
        60 => '60%',
        70 => '70%',
        80 => '80%',
        90 => '90%',
    );
    $Param{FirstResponseNotifyOptionStrg} = $LayoutObject->BuildSelection(
        Data         => \%NotifyLevelList,
        Name         => 'FirstResponseNotify',
        SelectedID   => $Param{FirstResponseNotify},
        Translation  => 0,
        PossibleNone => 1,
    );
    $Param{UpdateNotifyOptionStrg} = $LayoutObject->BuildSelection(
        Data         => \%NotifyLevelList,
        Name         => 'UpdateNotify',
        SelectedID   => $Param{UpdateNotify},
        Translation  => 0,
        PossibleNone => 1,
    );
    $Param{SolutionNotifyOptionStrg} = $LayoutObject->BuildSelection(
        Data         => \%NotifyLevelList,
        Name         => 'SolutionNotify',
        SelectedID   => $Param{SolutionNotify},
        Translation  => 0,
        PossibleNone => 1,
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


    # show appropriate messages for ServerError
    if ( defined $Param{Errors}->{NameExists} && $Param{Errors}->{NameExists} == 1 ) {
        $LayoutObject->Block( Name => 'ExistNameServerError' );
    }
    else {
        $LayoutObject->Block( Name => 'NameServerError' );
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
	
    my %List = $Self->SLAList( Valid => 0 );
    #if there are any types, they are shown
    if (%List) {

	#get valid list
        my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();
        my %DynamicFieldsList = $Self->DynamicFieldsGet(ValidID => 1);
        my %QueueList = $Self->QueueList(ValidID => 1);

        for my $RecordID ( sort { $List{$a} cmp $List{$b} } keys %List ) {

            my %Data = $Self->SLAGet(
                ID => $RecordID,
            );
            $Data{Dest} = $QueueList{$Data{Dest}};
	    $Data{DynamicFieldID}= $DynamicFieldsList{$Data{DynamicFieldID}};
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

1;
