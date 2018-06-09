# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminDynamicFieldExtend;

use strict;
use warnings;
use Data::Dumper;
use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    $Self->{CacheType} = 'DynamicFieldExtend';
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
        my %Data = $Self->DynamicFieldExtendGet(ID => $ID);
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
            TemplateFile => 'AdminDynamicFieldExtend',
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
        for my $Parameter (qw(ID TypeID Dest DynamicFieldID ContentID ValidID)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

        # check needed data
        for my $Needed (qw(ID TypeID Dest DynamicFieldID ContentID ValidID)) {
            if ( !$GetParam{$Needed} ) {
                $Errors{ $Needed . 'Invalid' } = 'ServerError';
            }
        }

        my %Data = $Self->DynamicFieldExtendGet( ID => $GetParam{ID} );
        if ( !%Data ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('Need Record Exist!'),
            );
        }

        # check if a type exists with this name
        my $RecordExists = $Self->RecordExistsCheck(
            TypeID => $GetParam{TypeID},
	    Dest => $GetParam{Dest},
	    DynamicFieldID => $GetParam{DynamicFieldID},
	    ContentID => $GetParam{ContentID},
            ValidID => $GetParam{ValidID},
            ID   => $GetParam{ID}
        );

        if ($RecordExists) {
            $Errors{TypeIDExists} = 1;
            $Errors{'TypeIDInvalid'} = 'ServerError';

#            $Errors{DestExists} = 1;
#            $Errors{'DestInvalid'} = 'ServerError';

#	    $Errors{DynamicFieldIDExists} = 1;
#            $Errors{'DynamicFieldIDInvalid'} = 'ServerError';

#	    $Errors{ContentIDExists} = 1;
#            $Errors{'ContentIDInvalid'} = 'ServerError';

#	    $Errors{ValidIDExists} = 1;
#            $Errors{'ValidIDInvalid'} = 'ServerError';

        }

        # if no errors occurred
        if ( !%Errors ) {


            # update type
            my $Update = $Self->RecordUpdate(
                %GetParam,
                UserID => $Self->{UserID}
            );
            if ($Update) {
                $Self->_Overview();
                my $Output = $LayoutObject->Header();
                $Output .= $LayoutObject->NavigationBar();
                $Output .= $LayoutObject->Notify( Info => Translatable('Dynamic Field Record updated!') );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'AdminDynamicFieldExtend',
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
            TemplateFile => 'AdminDynamicFieldExtend',
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
        $GetParam{TypeID} = $ParamObject->GetParam( Param => 'TypeID' );
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Self->_Edit(
            Action => 'Add',
            %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminDynamicFieldExtend',
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
	for my $Parameter (qw(TypeID Dest DynamicFieldID ContentID ValidID)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

        # check needed data
        for my $Needed (qw(TypeID Dest DynamicFieldID ContentID ValidID)) {
            if ( !$GetParam{$Needed} ) {
                $Errors{ $Needed . 'Invalid' } = 'ServerError';
            }
        }

#Start Bulk insert code
	#Checking if Insert record for all Type or all Dest.
	my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
	if($GetParam{TypeID} < 0 && $GetParam{Dest} < 0)
	{
	   my %Types = $Kernel::OM->Get('Kernel::System::Type')->TypeList( Valid => 1 );
	   my %QueueList = $Self->QueueList(ValidID => 1);
	   foreach my $tkey ( keys %Types ) { 
	       	 foreach my $qkey ( keys %QueueList ) { 
		    if($qkey !=""){
			 my $RecordExists = $Self->RecordExistsCheck(
                 	   TypeID => $tkey,
	                    Dest => $qkey,
        	            DynamicFieldID => $GetParam{DynamicFieldID}
                	);
	                if (!$RecordExists)
        	        {
                	     return if !$DBObject->Do(
	                       SQL => 'INSERT INTO dynamic_custom_content (type,queue,field_name,content,valid_id)'
        	               . ' VALUES (?, ?, ?, ?, ?)',
                	     Bind => [ \$tkey, \$qkey, \$GetParam{DynamicFieldID}, \$GetParam{ContentID} , \$GetParam{ValidID}],
	                     );
        	        }
                    }
		 }
	   }
	   
	        $Self->_Overview();
                my $Output = $LayoutObject->Header();
                $Output .= $LayoutObject->NavigationBar();
                $Output .= $LayoutObject->Notify( Info => Translatable('Dynamic Field Records added by skipping duplicate records!') );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'AdminDynamicFieldExtend',
                    Data         => \%Param,
                );
                $Output .= $LayoutObject->Footer();
                return $Output;


	}
	elsif($GetParam{TypeID} < 0)
	{

	  my %Types = $Kernel::OM->Get('Kernel::System::Type')->TypeList( Valid => 1 );
	  my $Dest = $GetParam{Dest};
	  my $sql = "INSERT INTO dynamic_custom_content (type,queue,field_name,content,valid_id) VALUES (?, ?, ?, ?, ?)";
	  foreach my $tkey ( keys %Types )
	  { 
		my $RecordExists = $Self->RecordExistsCheck(
		    TypeID => $tkey,
		    Dest => $Dest,
		    DynamicFieldID => $GetParam{DynamicFieldID}
		);
		if (!$RecordExists)
		{
		     return if !$DBObject->Do(
		       SQL => 'INSERT INTO dynamic_custom_content (type,queue,field_name,content,valid_id)'
		       . ' VALUES (?, ?, ?, ?, ?)',
	             Bind => [ \$tkey, \$Dest, \$GetParam{DynamicFieldID}, \$GetParam{ContentID} , \$GetParam{ValidID}],
	 	     );
		}
	   }
	   
	        $Self->_Overview();
                my $Output = $LayoutObject->Header();
                $Output .= $LayoutObject->NavigationBar();
                $Output .= $LayoutObject->Notify( Info => Translatable('Dynamic Field Records added by skipping duplicate records!') );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'AdminDynamicFieldExtend',
                    Data         => \%Param,
                );
                $Output .= $LayoutObject->Footer();
                return $Output;

	}
	elsif($GetParam{Dest} < 0)
	{
	  my %QueueList = $Self->QueueList(ValidID => 1);
	  my $TypeID = $GetParam{TypeID};
          my $sql = "INSERT INTO dynamic_custom_content (type,queue,field_name,content,valid_id) VALUES (?, ?, ?, ?, ?)";
          foreach my $dkey ( keys %QueueList )
          {
	      if($dkey !=""){
                my $RecordExists = $Self->RecordExistsCheck(
                    TypeID => $TypeID,
                    Dest => $dkey,
                    DynamicFieldID => $GetParam{DynamicFieldID}
                );
                if (!$RecordExists)
                {
                     return if !$DBObject->Do(
                       SQL => 'INSERT INTO dynamic_custom_content (type,queue,field_name,content,valid_id)'
                       . ' VALUES (?, ?, ?, ?, ?)',
                     Bind => [ \$TypeID, \$dkey, \$GetParam{DynamicFieldID}, \$GetParam{ContentID} , \$GetParam{ValidID}],
                     );
                }
             }
           }

                $Self->_Overview();
                my $Output = $LayoutObject->Header();
                $Output .= $LayoutObject->NavigationBar();
                $Output .= $LayoutObject->Notify( Info => Translatable('Dynamic Field Records added by skipping duplicate records!') );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'AdminDynamicFieldExtend',
                    Data         => \%Param,
                );
                $Output .= $LayoutObject->Footer();
                return $Output;
	}	

#End bulk insert code
	

        # check if a type exists with this name
        my $RecordExists = $Self->RecordExistsCheck(
            TypeID => $GetParam{TypeID},
            Dest => $GetParam{Dest},
            DynamicFieldID => $GetParam{DynamicFieldID},
            ContentID => $GetParam{ContentID},
            ValidID => $GetParam{ValidID},
        );


	if ($RecordExists) {
            $Errors{TypeIDExists} = 1;
            $Errors{'TypeIDInvalid'} = 'ServerError';

            $Errors{DestExists} = 1;
            $Errors{'DestInvalid'} = 'ServerError';

            $Errors{DynamicFieldIDExists} = 1;
            $Errors{'DynamicFieldIDInvalid'} = 'ServerError';

            $Errors{ContentIDExists} = 1;
            $Errors{'ContentIDInvalid'} = 'ServerError';

            $Errors{ValidIDExists} = 1;
            $Errors{'ValidIDInvalid'} = 'ServerError';

        }



        # if no errors occurred
        if ( !%Errors ) {

            # add type
            my $NewRecord = $Self->RecordAdd(
                %GetParam,
                UserID => $Self->{UserID}
            );
            if ($NewRecord) {
                $Self->_Overview();
                my $Output = $LayoutObject->Header();
                $Output .= $LayoutObject->NavigationBar();
                $Output .= $LayoutObject->Notify( Info => Translatable('Dynamic Field Record added!') );
                $Output .= $LayoutObject->Output(
                    TemplateFile => 'AdminDynamicFieldExtend',
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
            TemplateFile => 'AdminDynamicFieldExtend',
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
            TemplateFile => 'AdminDynamicFieldExtend',
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
        SQL => 'INSERT INTO dynamic_custom_content (type,queue,field_name,content,valid_id)'
            . ' VALUES (?, ?, ?, ?, ?)',
        Bind => [ \$Param{TypeID}, \$Param{Dest}, \$Param{DynamicFieldID}, \$Param{ContentID} , \$Param{ValidID}],
    );

	
    # get new record id
    return if !$DBObject->Prepare(
        SQL => 'SELECT id FROM dynamic_custom_content 
                WHERE type = ? and queue =? and field_name =? and content =? and valid_id =?',
        Bind => [\$Param{TypeID},\$Param{Dest}, \$Param{DynamicFieldID},\$Param{ContentID} , \$Param{ValidID}],
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
        SQL => 'UPDATE dynamic_custom_content SET type = ?, queue = ?, '
            . ' field_name = ?, content = ?, valid_id = ? WHERE id = ?',
        Bind => [
            \$Param{TypeID}, \$Param{Dest}, \$Param{DynamicFieldID}, \$Param{ContentID},\$Param{ValidID},\$Param{ID},
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
        SQL => 'SELECT id FROM dynamic_custom_content 
		WHERE type = ? and queue =? and field_name =?',
        Bind => [\$Param{TypeID},\$Param{Dest}, \$Param{DynamicFieldID}],
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
        SQL => 'SELECT id,name FROM dynamic_field WHERE valid_id = ?',
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
sub DynamicFieldExtendGet {
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
        SQL => 'SELECT id,type,queue,field_name,content,valid_id FROM dynamic_custom_content WHERE id = ?',
        Bind => [ \$Param{ID} ],
    );

	#fetch the result
    my %DynamicField;
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $DynamicField{ID}         = $Data[0];
        $DynamicField{TypeID}       = $Data[1];
        $DynamicField{Dest}    = $Data[2];
        $DynamicField{DynamicFieldID} = $Data[3];
	$DynamicField{ContentID} = $Data[4];
	$DynamicField{ValidID} = $Data[5];
    }

	#no data found
    if ( !%DynamicField ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "DynamicFieldID '$Param{ID}' not found!",
        );
        return;
    }

    return %DynamicField;
}


sub DynamicFieldList {
    my ( $Self, %Param ) = @_;

	#check needed stuff
    my $Valid = 1;
    if ( !$Param{Valid} && defined $Param{Valid} ) {
        $Valid = 0;
    }


	#create the valid list
    my $ValidIDs = join ', ', $Kernel::OM->Get('Kernel::System::Valid')->ValidIDsGet();

	#build SQL
    my $SQL = 'SELECT id,type FROM dynamic_custom_content ';

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
    my %DynamicFieldList;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $DynamicFieldList{ $Row[0] } = $Row[1];
    }


    return %DynamicFieldList;
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
    my %ContentList = ('-1' => 'Non Mandatory','3' =>'Mandatory');
    my %DynamicFieldsList = $Self->DynamicFieldsGet(ValidID => 1);
    my %QueueList = $Self->QueueList(ValidID => 1);
    %QueueList->{'-1'}= "-- All --";

   # build type string	
   if ( $ConfigObject->Get('Ticket::Type') ) {
	my %Types = $Kernel::OM->Get('Kernel::System::Type')->TypeList( Valid => 1 );
        %Types->{'-1'}= "-- All --"; 
        $Param{TypeStrg} = $LayoutObject->BuildSelection(
            Class => 'Modernize Validate_Required' . ( $Param{Errors}->{TypeIDInvalid} || ' ' ),
            Data  => \%Types,
            Name  => 'TypeID',
            SelectedID   => $Param{TypeID},
            PossibleNone => 1,
            Sort         => 'AlphanumericValue',
            Translation  => 0,
        );
    }



    
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

    $Param{ContentOption} = $LayoutObject->BuildSelection(
        Data       => \%ContentList,
        Name       => 'ContentID',
        SelectedID => $Param{ContentID} || -1,
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'ContentIDInvalid'} || '' ),
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
    if ( defined $Param{Errors}->{TypeIDExists} && $Param{Errors}->{TypeIDExists} == 1 ) {
        $LayoutObject->Block( Name => 'ExistTypeIDServerError' );
    }
    else {
        $LayoutObject->Block( Name => 'TypeIDServerError' );
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
	
    my %List = $Self->DynamicFieldList( Valid => 0 );

	#if there are any types, they are shown
    if (%List) {

	#get valid list
        my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();
	my %ContentList = ('-1' => 'Non Mandatory','3' =>'Mandatory');
        my %DynamicFieldsList = $Self->DynamicFieldsGet(ValidID => 1);
	my %Types = $Kernel::OM->Get('Kernel::System::Type')->TypeList( Valid => 1 );
        my %QueueList = $Self->QueueList(ValidID => 1);

        for my $RecordID ( sort { $List{$a} cmp $List{$b} } keys %List ) {

            my %Data = $Self->DynamicFieldExtendGet(
                ID => $RecordID,
            );
            $Data{TypeID}= ($Data{TypeID}=='-1')?'All':$Types{$Data{TypeID}};
	    $Data{Dest} = ($Data{Dest}=='-1')?'All':$QueueList{$Data{Dest}};
	    $Data{ContentID}= $ContentList{$Data{ContentID}};
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
