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

package Kernel::Modules::AdminCatalogCategoryMaster;

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
      #get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    # get form id
    $Self->{FormID} = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'FormID' );

    # create form id
    if ( !$Self->{FormID} ) {
        $Self->{FormID} = $Kernel::OM->Get('Kernel::System::Web::UploadCache')->FormIDCreate();
    }

    $Self->{CacheType} = 'CatalogCategoryMaster';
    $Self->{CacheTTL}  = 60 * 60 * 24 * 20;
    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my %GetParam;    
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $IsUpload = ( $ParamObject->GetParam( Param => 'AttachmentUpload' ) ? 1 : 0 );
    my $UploadCacheObject = $Kernel::OM->Get('Kernel::System::Web::UploadCache');
    my $TicketObject  = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ConfigObject   = $Kernel::OM->Get('Kernel::Config');
    my $Config = $ConfigObject->Get("Ticket::Frontend::$Self->{Action}");
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
            TemplateFile => 'AdminCatalogCategoryMaster',
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
        my %Error;
        my $Note = '';
        my ( %GetParam, %Errors );
        for my $Parameter (qw(ID Title Description Catalog Location GroupID ValidID FormID DeleteCategoryImage)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

        my $RecordExists;	
        for my $Needed (qw(ID Title ValidID)) {
            	if ( !$GetParam{$Needed} ) {
                    $Errors{ $Needed . 'Invalid' } = 'ServerError';
            	}
        }


        $RecordExists  = $Self->RecordExistsCheck(
            ID            => $GetParam{ID},
            Title         => $GetParam{Title},
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

         # attachment delete
        my @AttachmentIDs = map {
            my ($ID) = $_ =~ m{ \A AttachmentDelete (\d+) \z }xms;
            $ID ? $ID : ();
        } $ParamObject->GetParamNames();

        COUNT:
        for my $Count ( reverse sort @AttachmentIDs ) {
            my $Delete = $ParamObject->GetParam( Param => "AttachmentDelete$Count" );
            next COUNT if !$Delete;
            $Error{AttachmentDelete} = 1;
            $UploadCacheObject->FormIDRemoveFile(
                FormID => $Self->{FormID},
                FileID => $Count,
            );
            $IsUpload = 1;
        }

        # attachment upload
        if ( $ParamObject->GetParam( Param => 'AttachmentUpload' ) ) {
            $IsUpload                = 1;
            %Error                   = ();
            $Error{AttachmentUpload} = 1;
            my %UploadStuff = $ParamObject->GetUploadAll(
                Param => 'FileUpload',
            );
            $UploadCacheObject->FormIDAddFile(
                FormID      => $Self->{FormID},
                Disposition => 'attachment',
                %UploadStuff,
            );
        }
      # get pre loaded attachment
        my @AttachmentData = $UploadCacheObject->FormIDGetAllFilesData(
            FormID => $Self->{FormID},
        );
        
        #for validation of image upload
           my $i=0;
           for my $CategoryUploadStuff (@AttachmentData){
                my $ContentType = $CategoryUploadStuff->{ContentType};
                if (!($ContentType =~ m{image}i ))
                   {
                    $Errors{ExistImageInvalid} = 1;
                   }
                  $i++;
            }
           if($i > 1)
               {
                $Errors{ExistMoreImageInvalid} = 1;  
               }

        if (%Error || %Errors) {

        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        # $Output .= $LayoutObject->Notify( Priority => 'Error' );
        $Self->_Edit(
            Action => 'Change',
            Errors => \%Errors,
            Attachments  => \@AttachmentData,
            %GetParam,
            %Data,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminCatalogCategoryMaster',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output; 
       }
        # if no errors occurred
        if ( !%Errors) {
         # update type
        my $Update = $Self->RecordUpdate(
            %GetParam,
            UserID          => $Self->{UserID},
        );

        if ($Update) {
         	my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
	        my $ImagePath = $ConfigObject->Get('ServiceCatalogImagePath');
	        my $Category_path = $ImagePath.'/'.$Data{ContentPath}.'/'.$GetParam{ID};
           
	    if(@AttachmentData){
              for my $CategoryUploadStuff (@AttachmentData){
                my $FilePath = $Category_path.'/'.$Data{CategoryImage};
                #Delete Previously uploaded file
             	my $DeleteFile = $Self->DeleteFile( File => $FilePath, MasterID => $GetParam{ID}, Type => 'Category', ImageType => 2);
                my $Filename= $CategoryUploadStuff->{Filename};
                my $Content = $CategoryUploadStuff->{Content};
                my $ContentType = $CategoryUploadStuff->{ContentType};
             	my $UploadFile = $Self->UploadImage( ImagePath => $Category_path, FileName => $Filename, Content => $Content, MasterID => $GetParam{ID} , Type => 'Category', ContentType => $ContentType,ImageType => 2);
	        }
            }
	    elsif(exists $GetParam{DeleteCategoryImage} && $GetParam{DeleteCategoryImage} eq '1'){
    	        my $FilePath = $Category_path.'/'.$Data{CategoryImage};
    		my $DeleteFile = $Self->DeleteFile( File => $FilePath, MasterID => $GetParam{ID}, Type => 'Category', ImageType => 2);
            }	

            $Self->_Overview();
            my $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();
            $Output .= $LayoutObject->Notify( Info => Translatable('Category Updated Successfully!') );
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AdminCatalogCategoryMaster',
                Data         => \%Param,
            );
            $Output .= $LayoutObject->Footer();
            return $Output;
            }
        }

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
            TemplateFile => 'AdminCatalogCategoryMaster',
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
        my %Error;
        my $Note = '';
        my ( %GetParam, %Errors );
        for my $Parameter (qw(Title Description Catalog Location GroupID ValidID AttachmentUpload FormID)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

    	my $RecordExists;
            # check needed data
    	for my $Needed (qw(Title ValidID)) {
                if ( !$GetParam{$Needed} ) {
                        $Errors{ $Needed . 'Invalid' } = 'ServerError';
                }
        }
    	$RecordExists	 = $Self->RecordExistsCheck(
                ID           => $GetParam{ID},
                Title        => $GetParam{Title},
                ValidID      => $GetParam{ValidID},
        	UserID       => $Self->{UserID}
        );

    	# If record already exists
    	$Errors{IDExists} = 1 if $RecordExists;
    	# attachment delete
        my @AttachmentIDs = map {
            my ($ID) = $_ =~ m{ \A AttachmentDelete (\d+) \z }xms;
            $ID ? $ID : ();
        } $ParamObject->GetParamNames();

        COUNT:
        for my $Count ( reverse sort @AttachmentIDs ) {
            my $Delete = $ParamObject->GetParam( Param => "AttachmentDelete$Count" );
            next COUNT if !$Delete;
            $Error{AttachmentDelete} = 1;
            $UploadCacheObject->FormIDRemoveFile(
                FormID => $Self->{FormID},
                FileID => $Count,
            );
            $IsUpload = 1;
        }

        # attachment upload
        if ( $ParamObject->GetParam( Param => 'AttachmentUpload' ) ) {
            $IsUpload                = 1;
            %Error                   = ();
            $Error{AttachmentUpload} = 1;
            my %UploadStuff = $ParamObject->GetUploadAll(
                Param => 'FileUpload',
            );
            $UploadCacheObject->FormIDAddFile(
                FormID      => $Self->{FormID},
                Disposition => 'attachment',
                %UploadStuff,
            );
        }

         # get pre loaded attachment
        my @AttachmentData = $UploadCacheObject->FormIDGetAllFilesData(
            FormID => $Self->{FormID},
        );

        #for validation of image upload
           my $i=0;
           for my $CategoryUploadStuff (@AttachmentData){
                my $ContentType = $CategoryUploadStuff->{ContentType};
                if (!($ContentType =~ m{image}i ))
                   {
                    $Errors{ExistImageInvalid} = 1;
                   }
                  $i++;
           }
            if($i > 1)
               {
                $Errors{ExistMoreImageInvalid} = 1;  
               }
        # if some errors occurs
        if (%Error || %Errors) {

        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        
        # $Output .= $LayoutObject->Notify( Priority => 'Error' );
        $Self->_Edit(
            Action => 'Add',
            Errors => \%Errors,
            Attachments  => \@AttachmentData,
               %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminCatalogCategoryMaster',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }
 
        # if no errors occurred
        if ( !%Errors ) {
	    my $ContentPath = $Self->GenerateFilePath();
            # add type
            my $NewRecord = $Self->RecordAdd(
                %GetParam,
                ContentPath => $ContentPath,
                UserID     => $Self->{UserID},
            );

        if ($NewRecord) {
            my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
            my $ImagePath = $ConfigObject->Get('ServiceCatalogImagePath');

            for my $CategoryUploadStuff (@AttachmentData){
            if(@AttachmentData) { 
                 my $Filename= $CategoryUploadStuff->{Filename};
                 my $Content = $CategoryUploadStuff->{Content};
                 my $ContentType = $CategoryUploadStuff->{ContentType};
                 my $CategoryImage_path = $ImagePath.'/'. $ContentPath.'/'.$NewRecord;
                 my $UploadFile = $Self->UploadImage( ImagePath => $CategoryImage_path, FileName => $Filename, Content => $Content, MasterID => $NewRecord , Type => 'Category', ContentType => $ContentType,ImageType => 2);   
            
             }
            }
        }   
            $Self->_Overview();
            my $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();
            $Output .= $LayoutObject->Notify( Info => Translatable('Category Added Successfully..!!') );
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AdminCatalogCategoryMaster',
                Data         => \%Param,
            );
            $Output .= $LayoutObject->Footer();
            return $Output;
        }
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
            TemplateFile => 'AdminCatalogCategoryMaster',
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

    my $Sql = 'INSERT INTO felicity_catalog_category_master (title,description,catalog_id,location,group_id,valid_id,content_path,create_time,create_by,change_time,change_by) '.'VALUES (?,?,?,?,?,?,?, current_timestamp, ?, current_timestamp, ?)';
   
    return if !$DBObject->Do(
	SQL	=> $Sql,
        Bind	=> [ \$Param{Title}, \$Param{Description},\$Param{Catalog},\$Param{Location},\$Param{GroupID},\$Param{ValidID},\$Param{ContentPath},\$Param{UserID},\$Param{UserID} ],
    );
	
    # get new record id
    return if !$DBObject->Prepare(
	SQL	=> "SELECT id FROM felicity_catalog_category_master WHERE title = ? AND valid_id = ?",
        Bind	=> [ \$Param{Title},\$Param{ValidID}],
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
        SQL => 'UPDATE felicity_catalog_category_master SET title = ?,description=?, catalog_id = ?,location = ?,group_id = ?, valid_id=?,change_time = current_timestamp, change_by = ? WHERE id = ?',
        Bind	=> [ \$Param{Title}, \$Param{Description} , \$Param{Catalog}, \$Param{Location},\$Param{GroupID}, \$Param{ValidID},\$Param{UserID}, \$Param{ID} ],
    );

 return 1;
}

#Check Record already exist
sub RecordExistsCheck {
    my ( $Self, %Param ) = @_;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    return if !$DBObject->Prepare(
      SQL => 'SELECT id FROM felicity_catalog_category_master 
                WHERE title = ?',
      Bind => [\$Param{Title}],
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

sub GetCatalogList {
    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $Sql = "SELECT id,title FROM felicity_catalog_master WHERE valid_id=1";
    return if !$DBObject->Prepare(
        SQL => $Sql,
    );

    my %CatalogList;
    $CatalogList{''} = '-';
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $CatalogList{ $Data[0] } = $Data[1];
    }
    return %CatalogList;
}

sub GetGroupIDList {
    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $Sql = "SELECT id, name FROM groups WHERE valid_id=1";
    return if !$DBObject->Prepare(
        SQL => $Sql,
    );

    my %GroupIDList;
    $GroupIDList{''} = '-';
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $GroupIDList{ $Data[0] } = $Data[1];
    }
    return %GroupIDList;
}

# Get IDs
sub GetIDs{
    my ( $Self, %Param ) = @_;
    
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $Sql = 'SELECT id,title FROM felicity_catalog_category_master';

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

    $Param{FormID} = $Self->{FormID};
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
    my %CatalogList   = $Self->GetCatalogList( ValidID => 1 );
    my %GroupIDList   = $Self->GetGroupIDList( ValidID => 1 );
    
    $Param{ValidOption} = $LayoutObject->BuildSelection(
        Data       => \%ValidList,
        Name       => 'ValidID',
        SelectedID => $Param{ValidID} || 1,
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'ValidIDInvalid'} || '' ),
    );

    $Param{Catalog} = $LayoutObject->BuildSelection(
        Data       => \%CatalogList,
        Name       => 'Catalog',
        SelectedID => $Param{Catalog},
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'CatalogInvalid'} || '' ),
    );

    $Param{GroupID} = $LayoutObject->BuildSelection(
        Data       => \%GroupIDList,
        Name       => 'GroupID',
        SelectedID => $Param{GroupID},
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'GroupIDInvalid'} || '' ),
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

        # prepare errors!
    if ( $Param{Errors} ) {
        for my $KeyError ( sort keys %{ $Param{Errors} } ) {
            $Param{$KeyError} = '* ' . $LayoutObject->Ascii2Html( Text => $Param{Errors}->{$KeyError} );
        }
    }

    ATTACHMENT:
    for my $CategoryUploadStuff ( @{ $Param{Attachments} } ) {
        if (
            $CategoryUploadStuff->{ContentID}
            && $LayoutObject->{BrowserRichText}
            && ( $CategoryUploadStuff->{ContentType} =~ /image/i )
            && ( $CategoryUploadStuff->{Disposition} eq 'inline' )
            )
        {
            next ATTACHMENT;
        }
        $LayoutObject->Block(
            Name => 'Attachment',
            Data => $CategoryUploadStuff,
        );
    }

    # shows appropriate message if error

    if ( defined $Param{Errors}->{IDExists} && $Param{Errors}->{IDExists} == 1 ) {
        $LayoutObject->Block( Name => 'ExistIDServerError' );
    }
    elsif (defined $Param{Errors}->{ExistImageInvalid} && $Param{Errors}->{ExistImageInvalid} == 1){
        $LayoutObject->Block( Name => 'ExistImageInvalidServerError' );
    } 
    elsif ( defined $Param{Errors}->{ExistMoreImageInvalid} && $Param{Errors}->{ExistMoreImageInvalid} == 1 )
    {
       $LayoutObject->Block( Name => 'ExistMoreImageInvalidServerError' );
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
   
    #if list exists, it'll be rendered
    if (%List) {
        my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();
	my %CatalogList   = $Self->GetCatalogList( ValidID => 1 );
        my %GroupIDList   = $Self->GetGroupIDList( ValidID => 1 );
        for my $RecordID ( sort { $List{$a} cmp $List{$b} } keys %List ) {
            my %Data = $Self->GetData(
                ID => $RecordID,
            );
 	    $Data{Catalog} = $CatalogList{$Data{Catalog}};
	    $Data{GroupID} = $GroupIDList{$Data{GroupID}};
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

#File Write Code
sub UploadImage {
    my ( $Self, %Param ) = @_;
  
    my $Catalog_path = $Param{ImagePath};
    File::Path::mkpath( [$Catalog_path], 0, 0770 );
    my $SuccessContent = $Kernel::OM->Get('Kernel::System::Main')->FileWrite(
                Directory  => $Catalog_path,
                Filename   => $Param{FileName},
                Mode       => 'binmode',
                Content    => \$Param{Content},
                Permission => 660,
    );
    if($SuccessContent){
     my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
     my $Sql = 'INSERT INTO felicity_service_catalog_images(master_id,master_type,content_type,filename,image_type) '.
                'VALUES (?,?,?,?,?)';

     return if !$DBObject->Do(
        SQL     => $Sql,
        Bind    => [ \$Param{MasterID}, \$Param{Type},\$Param{ContentType},\$Param{FileName},\$Param{ImageType}],
     );

     return 1;
   }
return;
}

#Delete already exist file
sub DeleteFile {
    my ( $Self, %Param ) = @_;
    my $File = $Param{File};
    if ( -f $File ) {
        if ( !unlink $File ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Can't remove: $File: $!!",
            );
            return;
        }

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'Delete from felicity_service_catalog_images WHERE master_id = ? AND master_type = ? AND image_type=?',
        Bind => [ \$Param{MasterID}, \$Param{Type},\$Param{ImageType} ],
    );
    return 1;
  }
}

#Generate path for category image file write
sub GenerateFilePath {
    my ( $Self, %Param ) = @_;
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');
    my ( $Sec, $Min, $Hour, $Day, $Month, $Year ) = $TimeObject->SystemTime2Date(
        SystemTime => $TimeObject->SystemTime(),
    );

    my $Catalog_path = $Year . '/' . $Month . '/' . $Day . '/Category';
    return $Catalog_path;
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

    my $Sql = "SELECT cc.id,cc.title,cc.description,cc.catalog_id,cc.location,(select filename from felicity_service_catalog_images where master_id=? and master_type='Category' and image_type=2) as category_img,(select filename from felicity_service_catalog_images where master_id=? and master_type='Category' and image_type=1) as category_home_img,cc.group_id,cc.valid_id,cc.create_time,cc.change_time,cc.content_path FROM felicity_catalog_category_master as cc WHERE cc.id =?";

    # Query Database
    return if !$DBObject->Prepare(
	SQL => $Sql,
	Bind => [ \$Param{ID},\$Param{ID},\$Param{ID} ],
    );

    # Fetch Result
    my %FetchData;
    while ( my @Data = $DBObject->FetchrowArray() ) {
     $FetchData{ID}         	= $Data[0];
     $FetchData{Title}      	= $Data[1];
     $FetchData{Description}   =  $Data[2];
     $FetchData{Catalog}       = $Data[3];
     $FetchData{Location}       = $Data[4];
     $FetchData{CategoryImage}   =  $Data[5];
     $FetchData{CategoryHomeImage}   = $Data[6];
     $FetchData{GroupID}     =        $Data[7];
     $FetchData{ValidID}    	= $Data[8];
     $FetchData{CreateTime}     = $Data[9];
     $FetchData{ChangeTime}     = $Data[10];
     $FetchData{ContentPath}     = $Data[11];
    
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

