# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

=c
#-----------------------------------------------#
#######   Product Catalog Module    #########
------------------------------------------------#
#---- Functionality of the Module..     #
1. ProductID, Name as input.        #
2. Product will be create in master table   #
------------------------------------------------#
#Note :- All the fields are mandatory       #
#-----------------------------------------------#
=cut

package Kernel::Modules::AdminCatalogCategoryItem;

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
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    # get form id
    $Self->{FormID} = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'FormID' );

    # create form id
    if ( !$Self->{FormID} ) {
        $Self->{FormID} = $Kernel::OM->Get('Kernel::System::Web::UploadCache')->FormIDCreate();
    }
    $Self->{CacheType} = 'CatalogCategoryItem';
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
    my $CatalogObject = $Kernel::OM->Get('Kernel::System::Catalog');


    # -------------------------------------------------------------#
    # Category values
    #---------------------------------------------------------------#
    if ( $Self->{Subaction} eq 'GetCategoryValue' ) {

        my $CatalogID = $ParamObject->GetParam( Param => 'CatalogID' ) || '';
        my %CategoryDetails= $CatalogObject->GetCategoryByCatalogID(CatalogID=> $CatalogID);

        my %CategoryList;
        for my $keys (keys %CategoryDetails){
            $CategoryList{$CategoryDetails{$keys}{CategoryID}}=$CategoryDetails{$keys}{Title};
        }

        my $CategoryListJSON = $LayoutObject->JSONEncode(
            Data => \%CategoryList,
        );

        return $LayoutObject->Attachment(
           ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
           Content     => $CategoryListJSON,
           Type        => 'inline',
           NoCache     => 1,
       );

    }
    # ------------------------------------------------------------ #
    # change
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Change' ) {
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
            TemplateFile => 'AdminCatalogCategoryItem',
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
    
        for my $Parameter (qw(Queue ServiceID ID Name Catalog Category Workflow Price RecurringPrice RecurringPriceFrequency ItemImage ShortDescription Description Quantity Search  ApprovedBy AssociatedCategory ValidID FAQ FormID DeleteItemImage RequestCatalogQueue)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }
      
        for my $Needed (qw(ID Name ValidID)) {
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
        my $RecordExists; 
        $RecordExists  = $Self->RecordExistsCheck(
            ID      => $GetParam{ID},
            Name    => $GetParam{Name},
            ValidID => $GetParam{ValidID},
            UserID  => $Self->{UserID},
            ServiceID => $Data{ServiceID},
        );

        # If record already exists
        if($RecordExists && $RecordExists eq 1){
            $Errors{IDExists} = 1;
        }
        elsif($RecordExists && $RecordExists eq 2){
            $Errors{ServiceIDExists} = 1;
        }

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
        for my $ItemUploadStuff (@AttachmentData){
            my $ContentType = $ItemUploadStuff->{ContentType};
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

     # if something gone wrong
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
            TemplateFile => 'AdminCatalogCategoryItem',
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
            my $Item_path = $ImagePath.'/'.$Data{ContentPath}.'/'.$GetParam{ID};
        
        if(@AttachmentData){
          for my $ItemUploadStuff (@AttachmentData){
               my $FilePath = $Item_path.'/'.$Data{ItemImage};
#                Delete Previously uploaded file
            my $DeleteFile = $Self->DeleteFile( File => $FilePath, MasterID => $GetParam{ID}, Type => 'CategoryItem', ImageType => 2);
            my $Filename= $ItemUploadStuff->{Filename};
            my $Content = $ItemUploadStuff->{Content};
            my $ContentType = $ItemUploadStuff->{ContentType};
            my $UploadFile = $Self->UploadImage( ImagePath => $Item_path, FileName => $Filename, Content => $Content, MasterID => $GetParam{ID} , Type => 'CategoryItem', ContentType => $ContentType,ImageType => 2);
          }
        }  
        elsif(exists $GetParam{DeleteItemImage} && $GetParam{DeleteItemImage} eq '1'){
            my $FilePath = $Item_path.'/'.$Data{ItemImage};
            my $DeleteFile = $Self->DeleteFile( File => $FilePath, MasterID => $GetParam{ID}, Type => 'CategoryItem', ImageType => 2);
        }

            $Self->_Overview(ID=>16);
            my $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();
            $Output .= $LayoutObject->Notify( Info => Translatable('Category Item Updated Successfully!') );
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AdminCatalogCategoryItem',
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
            TemplateFile => 'AdminCatalogCategoryItem',
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
        for my $Parameter (qw(Queue Name Catalog Category Workflow Price RecurringPrice RecurringPriceFrequency ItemImage ShortDescription Description Quantity Search ApprovedBy AssociatedCategory ValidID FAQ AttachmentUpload FormID RequestCatalogQueue)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }
 
        # check needed data
        for my $Needed (qw(Name ValidID)) {
                if ( !$GetParam{$Needed} ) {
                    $Errors{ $Needed . 'Invalid' } = 'ServerError';
                }
        }
        
        my $RecordExists;
        $RecordExists   = $Self->RecordExistsCheck(
            ID            => $GetParam{ID},
            Name         => $GetParam{Name},
            ValidID   => $GetParam{ValidID},
            UserID => $Self->{UserID}
        );

        # If record already exists
        if($RecordExists && $RecordExists eq 1){
            $Errors{IDExists} = 1;
        }
        elsif($RecordExists && $RecordExists eq 2){
            $Errors{ServiceIDExists} = 1;
        }
                
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
         for my $ItemUploadStuff (@AttachmentData){
            my $ContentType = $ItemUploadStuff->{ContentType};
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
        
       # if something gone wrong
    if (%Error || %Errors) {
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        
        #$Output .= $LayoutObject->Notify( Priority => 'Error' );
        $Self->_Edit(
            Action => 'Add',
            Errors => \%Errors,
            Attachments  => \@AttachmentData,
               %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminCatalogCategoryItem',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
       }
   
    # if no errors occurred
    if ( !%Errors )  {
        my $ContentPath = $Self->GenerateFilePath(); 
        my $NewRecord = $Self->RecordAdd(
         %GetParam,
       ContentPath => $ContentPath,
           UserID  => $Self->{UserID},
        );
 

      if ($NewRecord )
      {
        my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
        my $ImagePath = $ConfigObject->Get('ServiceCatalogImagePath');
        if(@AttachmentData) { 
         for my $ItemUploadStuff (@AttachmentData){
             my $Filename= $ItemUploadStuff->{Filename};
             my $Content = $ItemUploadStuff->{Content};
             my $ContentType = $ItemUploadStuff->{ContentType};
             my $ItemImage_path = $ImagePath.'/'. $ContentPath.'/'.$NewRecord;
             my $UploadFile = $Self->UploadImage( ImagePath => $ItemImage_path, FileName => $Filename, Content => $Content, MasterID => $NewRecord , Type => 'CategoryItem', ContentType => $ContentType,ImageType => 2);
          }
        }
        
        $Self->_Overview();
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Output .= $LayoutObject->Notify( Info => Translatable('Category Item Added Successfully..!!') );
        $Output .= $LayoutObject->Output (
        TemplateFile => 'AdminCatalogCategoryItem',
        Data         => \%Param,
        );        
        $Output .= $LayoutObject->Footer();
        return $Output;
      }
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
            TemplateFile => 'AdminCatalogCategoryItem',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

}

sub ServiceAddUpdate {
    my ( $Self, %Param ) = @_;

    my $ServiceObject = $Kernel::OM->Get('Kernel::System::Service');
    my %ServiceData;
    $ServiceData{Name} = $Param{Name};
    $ServiceData{ValidID} = $Param{ValidID};
    $ServiceData{UserID} = $Self->{UserID};
    $ServiceData{TypeID} = '6'; # 6 means Back End
    $ServiceData{Criticality} = '1'; #1 means very low

     if($Param{Action} eq 'Add')
     {
        my $ServiceID = $ServiceObject->ServiceAdd(
            %ServiceData,
            UserID => $Self->{UserID},
        );
        if ( !$ServiceID ) {
            return;
        }
        else{
            return $ServiceID;
        }
     }
     elsif($Param{Action} eq 'Edit'){

       $ServiceData{ServiceID} = $Param{ServiceID}; 
       my $Success = $ServiceObject->ServiceUpdate(
            %ServiceData,
            UserID => $Self->{UserID},
        );
        if ( !$Success ) {
            return;
        }
        else{
            return 1;
        }
     }
}

#Add New Record

sub RecordAdd {
    my ( $Self, %Param ) = @_;
    my $ServiceID = $Self->ServiceAddUpdate(
        Name => $Param{Name},
        ValidID => $Param{ValidID},
        Action => 'Add',
        UserID  => $Self->{UserID},
    );

    my $QueueObject = $Kernel::OM->Get('Kernel::System::Queue');
    my $CatalogObject = $Kernel::OM->Get('Kernel::System::Catalog');

    if (!$Param{Queue}) {
        my %CatalogData= $CatalogObject->GetCatalog(
            Catalog_id => $Param{Catalog},
        );

        my %CategoryData= $CatalogObject->GetCategory(
            Category_id => $Param{Category},
        );

        my %QueueName = (
                CatalogName => "$CatalogData{Title}",
                CategoryName => "$CatalogData{Title}::$CategoryData{Title}",
                ItemName => "$CatalogData{Title}::$CategoryData{Title}::$Param{Name}"              
            );
        my $NewQueueID;



        for my $key (qw(CatalogName CategoryName ItemName)) {
            
            $NewQueueID = $QueueObject->QueueLookup( Queue => $QueueName{$key} );

            if (!$NewQueueID) {
                $NewQueueID = $QueueObject->QueueAdd(
                    Name                => $QueueName{$key},
                    ValidID             => 1,
                    GroupID             => $CategoryData{Group_id},
                    SystemAddressID     => 1,
                    SalutationID        => 1,
                    SignatureID         => 1,
                    UserID              => $Self->{UserID},
                );
            }

        }

        
        $Param{Queue}=$NewQueueID;
      
    }
    
    #Added code for restrict DB error
    $Param{Workflow} ||= undef;
    $Param{AssociatedCategory}     ||= undef;
    $Param{FAQ} ||= undef;

    if($ServiceID)
    {
        # get database object
       my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

       my $Sql = 'INSERT INTO felicity_catalog_category_item_master (name,catalog_id,category_id,workflow_id,price,recurring_price,recurring_price_frequency,short_description,description,no_quantity,no_search,approved_by,associated_category,valid_id,faq_id,service_id,content_path,create_time,create_by,change_time,change_by,queue_id,Request_catalog_queue_id) '.'VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,current_timestamp, ?, current_timestamp, ?, ?, ?)';

        return if !$DBObject->Do(
        SQL => $Sql,
        Bind    => [ \$Param{Name}, \$Param{Catalog},\$Param{Category},\$Param{Workflow},\$Param{Price},\$Param{RecurringPrice},\$Param{RecurringPriceFrequency},\$Param{ShortDescription},\$Param{Description},\$Param{Quantity},\$Param{Search},\$Param{ApprovedBy},\$Param{AssociatedCategory},\$Param{ValidID},\$Param{FAQ},\$ServiceID,\$Param{ContentPath},\$Param{UserID},\$Param{UserID},\$Param{Queue},\$Param{RequestCatalogQueue}],
        );
        
        # get new record id
        return if !$DBObject->Prepare(
        SQL => "SELECT id FROM felicity_catalog_category_item_master WHERE name = ? AND valid_id = ?",
        Bind    => [ \$Param{Name},\$Param{ValidID}],
        );
        # fetch the result
        my $ID;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $ID = $Row[0];
        }

        return if !$ID;
        return $ID;
    }
    else
    {
        return -1;
    }
}

#Update the record
sub RecordUpdate {
    my ( $Self, %Param ) = @_;

    my $Success = $Self->ServiceAddUpdate(
        Name => $Param{Name},
        ValidID => $Param{ValidID},
        ServiceID => $Param{ServiceID},
        Action => 'Edit',
        UserID  => $Self->{UserID},
    );
#Added code for restrict DB error
    $Param{Workflow} ||= undef;
    $Param{AssociatedCategory}  ||= undef;
    $Param{FAQ} ||= undef;
    $Param{Queue} ||= undef;

    my $QueueObject = $Kernel::OM->Get('Kernel::System::Queue');
    my $CatalogObject = $Kernel::OM->Get('Kernel::System::Catalog');

    if (!$Param{Queue}) {
        my %CatalogData= $CatalogObject->GetCatalog(
            Catalog_id => $Param{Catalog},
        );

        my %CategoryData= $CatalogObject->GetCategory(
            Category_id => $Param{Category},
        );

        my $QueueName="$CatalogData{Title}::$CategoryData{Title}::$Param{Name}";
        my $NewQueueID = $QueueObject->QueueLookup( Queue => $QueueName );

        if (!$NewQueueID) {
            $NewQueueID = $QueueObject->QueueAdd(
                Name                => $QueueName,
                ValidID             => 1,
                GroupID             => $CategoryData{Group_id},
                SystemAddressID     => 1,
                SalutationID        => 1,
                SignatureID         => 1,
                UserID              => $Self->{UserID},
            );
        }
        $Param{Queue}=$NewQueueID;
      
    }

    if($Success)
    {
     my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
     return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE felicity_catalog_category_item_master SET  name =?,catalog_id=?,category_id=?,workflow_id=?,price=?,recurring_price=?,recurring_price_frequency=?,short_description=? ,description=? ,no_quantity=?,no_search=?,approved_by =?,associated_category=? ,valid_id=?,faq_id=?,queue_id=?,Request_catalog_queue_id=?  WHERE id = ?',
        Bind    => [ \$Param{Name}, \$Param{Catalog},\$Param{Category},\$Param{Workflow},\$Param{Price},\$Param{RecurringPrice},\$Param{RecurringPriceFrequency},\$Param{ShortDescription},\$Param{Description},\$Param{Quantity},\$Param{Search},\$Param{ApprovedBy},\$Param{AssociatedCategory},\$Param{ValidID},\$Param{FAQ},\$Param{Queue},\$Param{RequestCatalogQueue} ,\$Param{ID} ],
    );

      return 1;
    }
    else{
      return -1;
    }

}

#Check Record already exist
sub RecordExistsCheck {
    my ( $Self, %Param ) = @_;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    return if !$DBObject->Prepare(
      SQL => 'SELECT id FROM felicity_catalog_category_item_master 
                WHERE name = ?',
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
    else{
        return if !$DBObject->Prepare(
          SQL => 'SELECT id FROM service 
                    WHERE name = ?',
          Bind => [\$Param{Name}],
        );
        #fetch the result
        my $ServiceFlag;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            if (!$Param{ServiceID} || $Param{ServiceID} ne $Row[0]) {
                $ServiceFlag = 1;
            }
        }
        if ($ServiceFlag) {
         return 2;
        }
    }
    return 0;
}

sub GetQueueList {
    my ( $Self, %Param ) = @_;
    my $QueueObject     = $Kernel::OM->Get('Kernel::System::Queue');  
    my %Queues          = $QueueObject->GetAllQueues( UserID => $Self->{UserID}, Type => 'ro' ); 
    $Queues{'-All Queues-'}='-All Queues-';
    return %Queues;
}

sub GetCatalogList {
    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $Sql = "SELECT id,title FROM felicity_catalog_master WHERE valid_id=1";
    return if !$DBObject->Prepare(
        SQL => $Sql,

    );
    my %CatalogList;
    $CatalogList{''} = '';
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $CatalogList{ $Data[0] } = $Data[1];
    }

    return %CatalogList;
}

sub GetApprovedList {
    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $Sql = "select concat(id,'_A'),concat(first_name,' (Agent)') as firstname from users where valid_id=1
             union
             select concat(id,'_C'),concat(first_name,' (Customer)') as firstname from customer_user where valid_id=1";

    return if !$DBObject->Prepare(
        SQL => $Sql,
    );

    my %ApprovedList;
    $ApprovedList{''} = '';
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $ApprovedList{ $Data[0] } = $Data[1];
    }
    return %ApprovedList;
}


sub GetCategoryList {
    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $Sql = "SELECT id,title FROM felicity_catalog_category_master WHERE valid_id=1";
    return if !$DBObject->Prepare(
        SQL => $Sql,

    );
    my %CategoryList;
    $CategoryList{''} = '';
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $CategoryList{ $Data[0] } = $Data[1];
    }
    return %CategoryList;
}


sub GetAssociatedCategoryList {
    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $Sql = "SELECT id,title FROM felicity_catalog_category_master WHERE valid_id=1";
    return if !$DBObject->Prepare(
        SQL => $Sql,

    );
    my %AssociatedCategoryList;
    $AssociatedCategoryList{''} = '';
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $AssociatedCategoryList{ $Data[0] } = $Data[1];
    }
    return %AssociatedCategoryList;
}


sub GetWorkList {
    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $Sql = "select id,name from pm_process where State_entity_id='S1'";
    return if !$DBObject->Prepare(
        SQL => $Sql,
    );

    my %WorkList;
    $WorkList{''} = '';
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $WorkList{ $Data[0] } = $Data[1];
    }

    return %WorkList;
}
 
sub GetFaqList {
    my ( $Self, %Param ) = @_;

    my %FaqList;
    $FaqList{''} = '';
    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

     # set default interface settings
    my $Interface = $FAQObject->StateTypeGet(
        Name   => 'public',
        UserID => $Self->{UserID},
    );

    my $InterfaceStates = $FAQObject->StateTypeList(
        Types  => $Kernel::OM->Get('Kernel::Config')->Get('FAQ::Public::StateTypes'),
        UserID => $Self->{UserID},
    );

        # perform FAQ search
    my @ViewableFAQIDs = $FAQObject->FAQSearch(
        UserID           => $Self->{UserID},
        States           => $InterfaceStates,
        Interface        => $Interface,
    );

        # start main loop
    for my $keys (@ViewableFAQIDs) {

        # get the FAQ entry
        my %FAQEntry = $FAQObject->FAQGet(
            ItemID     => $keys,
            ItemFields => 1,
            UserID     =>$Self->{UserID},
        );
        $FaqList{$keys} = $FAQEntry{Title};

    }

    return %FaqList;
}


sub GetServiceName {
    my ( $Self, %Param ) = @_;
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $Sql = "select name from service where id=?";
    return if !$DBObject->Prepare(
        SQL => $Sql,
        Bind => [ \$Param{ID} ]   
    );
    my $ServiceName;
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $ServiceName = $Data[0];
    }

    return $ServiceName;
}

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
    my $Sql = 'SELECT id,name FROM felicity_catalog_category_item_master';
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
    my $CatalogObject = $Kernel::OM->Get('Kernel::System::Catalog');

    $LayoutObject->Block(
        Name => 'Overview',
        Data => \%Param,
    );

    $LayoutObject->Block( Name => 'ActionList' );
    $LayoutObject->Block( Name => 'ActionOverview' ); 
    
    # Get All Dynamic Fields
    my %ValidList       = $Kernel::OM->Get( 'Kernel::System::Valid' )->ValidList();
    my %CatalogList     = $Self->GetCatalogList( ValidID => 1 );
    my %AssociatedCategoryList  = $Self->GetAssociatedCategoryList( ValidID => 1 );
    my %CategoryList    = $Self->GetCategoryList( ValidID => 1 );
    my %WorkList        = $Self->GetWorkList( ValidID => 1 );
    my %FaqList         = $Self->GetFaqList( ValidID => 1 );
    my %ApprovedList    = $Self->GetApprovedList( ValidID => 1 );
    my %PriceList       = $Self->GetDynamicFieldValue( DynamicFieldName => 'PriceFrequency' );
    my %QuantityList    = $Self->GetDynamicFieldValue( DynamicFieldName => 'ItemQuantity' );
    my %SearchList      = %QuantityList;
    my %Queues          = $Self->GetQueueList(); 
    my %ItemData;

    if ($Param{ID}) {
        %ItemData= $CatalogObject->GetItem(
           Item_id => $Param{ID},
        );
    }
    

    $Param{RequestCatalogQueue}= $ItemData{Request_catalog_queue_id};

    $Param{Queue} = $LayoutObject->AgentQueueListOption(
        Name           => 'Queue',
        Data           => \%Queues,
        Class          => 'Modernize Validate_Required ' . ( $Param{Errors}->{'QueueInvalid'} || '' ),
        SelectedID     =>  $Param{Queue}
    );
    #To remove defaul queue
    my $Find="-All Queues-";
    my $Replace="";
    $Param{Queue} =~ s/$Find/$Replace/g;
    my %RequestCatalogQueue;
    $RequestCatalogQueue{''}='';
    $RequestCatalogQueue{1}='Select from system Queues.';
    $RequestCatalogQueue{2}='Queue on the Basis of catalog.';

    $Param{ServiceName}  = $Self->GetServiceName( ID => $Param{ServiceID} );
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

    $Param{Category} = $LayoutObject->BuildSelection(
        Data       => \%CategoryList,
        Name       => 'Category',
        SelectedID => $Param{Category},
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'CategoryInvalid'} || '' ),
        );

    $Param{RequestCatalogQueue} = $LayoutObject->BuildSelection(
        Data       => \%RequestCatalogQueue,
        Name       => 'RequestCatalogQueue',
        SelectedID => $Param{RequestCatalogQueue},
        Class      => 'Modernize Validate_Required ' . ( $Param{Errors}->{'RequestCatalogQueue'} || '' ),
    );

    $Param{AssociatedCategory} = $LayoutObject->BuildSelection(
        Data       => \%AssociatedCategoryList,
        Name       => 'AssociatedCategory',
        SelectedID => $Param{AssociatedCategory},
        Class      => 'Modernize',
        );

    $Param{Workflow} = $LayoutObject->BuildSelection(
        Data       => \%WorkList,
        Name       => 'Workflow',
        SelectedID => $Param{Workflow},
        Class      => 'Modernize',
    );

    $Param{FAQ} = $LayoutObject->BuildSelection(
        Data       => \%FaqList,
        Name       => 'FAQ',
        SelectedID => $Param{FAQ},
        Class      => 'Modernize',
    );

    $Param{ApprovedBy} = $LayoutObject->BuildSelection(
        Data       => \%ApprovedList,
        Name       => 'ApprovedBy',
        SelectedID => $Param{ApprovedBy},
        Class      => 'Modernize',
    );

    $Param{Quantity} = $LayoutObject->BuildSelection(
        Data       => \%QuantityList,
        Name       => 'Quantity',
        SelectedID => $Param{Quantity},
        Class      => 'Modernize',
    );

    $Param{Search} = $LayoutObject->BuildSelection(
        Data       => \%SearchList,
        Name       => 'Search',
        SelectedID => $Param{Search},
        Class      => 'Modernize',
    );

    $Param{RecurringPriceFrequency} = $LayoutObject->BuildSelection(
        Data       => \%PriceList,
        Name       => 'RecurringPriceFrequency',
        SelectedID => $Param{RecurringPriceFrequency} || 'Monthly',
        Class      => 'Modernize',
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
    for my $ItemUploadStuff ( @{ $Param{Attachments} } ) {
        if (
            $ItemUploadStuff->{ContentID}
            && $LayoutObject->{BrowserRichText}
            && ( $ItemUploadStuff->{ContentType} =~ /image/i )
            && ( $ItemUploadStuff->{Disposition} eq 'inline' )
            )
        {
            next ATTACHMENT;
        }
        $LayoutObject->Block(
            Name => 'Attachment',
            Data => $ItemUploadStuff,
        );
    }

   
    # shows appropriate message if error

    if ( defined $Param{Errors}->{IDExists} && $Param{Errors}->{IDExists} == 1 ) {
        $LayoutObject->Block( Name => 'ExistIDServerError' );
    }
    elsif( defined $Param{Errors}->{ServiceIDExists} && $Param{Errors}->{ServiceIDExists} == 1 ) {
        $LayoutObject->Block( Name => 'ServiceIDExistsServerError' );
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
   
    my %PriceList   = $Self->GetDynamicFieldValue( DynamicFieldName => 'PriceFrequency' );
    my %CatalogList   = $Self->GetCatalogList( ValidID => 1 );
    my %AssociatedCategoryList   = $Self->GetAssociatedCategoryList( ValidID => 1 );
    my %CategoryList   = $Self->GetCategoryList( ValidID => 1 );
    my %WorkList   = $Self->GetWorkList( ValidID => 1 );
    my %FaqList   = $Self->GetFaqList( ValidID => 1 );
    my %ApprovedList   = $Self->GetApprovedList( ValidID => 1 );
    my %Queues    = $Self->GetQueueList();
    my $CatalogObject = $Kernel::OM->Get('Kernel::System::Catalog');
    my %RequestCatalogQueue = (
        1 => 'Select from system Queues.',
        2 => 'Queue on the Basis of catalog.',
    );
    

    if (%List) {
        my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();
        for my $RecordID ( sort { $List{$a} cmp $List{$b} } keys %List ) {
            my %Data = $Self->GetData(
                ID => $RecordID,
            );
            $Data{ServiceName}  = $Self->GetServiceName( ID => $Data{ServiceID} );
            
            my %DataList=(
                RecurringPriceFrequency => \%PriceList,
                Catalog => \%CatalogList,
                Category => \%CategoryList,
                AssociatedCategory => \%AssociatedCategoryList,
                Workflow =>  \%WorkList,
                FAQ => \%FaqList,
                Queue => \%Queues);
            
            for my $keys (keys %DataList) {
                if ($Data{$keys}) {
                    $Data{$keys}= $DataList{$keys}{$Data{$keys}};
                }
            }

            my %ItemData= $CatalogObject->GetItem(
                Item_id => $RecordID,
            );
            $Data{RequestCatalogQueue}= $RequestCatalogQueue{$ItemData{Request_catalog_queue_id}};
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

#File write
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

#Generate path for catalog image file write
sub GenerateFilePath {
    my ( $Self, %Param ) = @_;
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');
    my ( $Sec, $Min, $Hour, $Day, $Month, $Year ) = $TimeObject->SystemTime2Date(
        SystemTime => $TimeObject->SystemTime(),
    );

    my $Catalog_path = $Year . '/' . $Month . '/' . $Day . '/CategoryItem';
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

    my $Sql = "SELECT id, name,catalog_id,category_id,workflow_id,price,recurring_price,recurring_price_frequency,(select filename from felicity_service_catalog_images where master_id=? and master_type='CategoryItem' and image_type=2) as item_img,(select filename from felicity_service_catalog_images where master_id=? and master_type='CategoryItem' and image_type=1) as item_home_img,short_description,description,no_quantity,no_search,approved_by,associated_category,valid_id,faq_id,service_id,content_path, queue_id FROM felicity_catalog_category_item_master WHERE id=?";    

    # Query Database
    return if !$DBObject->Prepare(
    SQL => $Sql,
    Bind => [ \$Param{ID}, \$Param{ID}, \$Param{ID} ],
    );

    # Fetch Result
    my %FetchData;
    while ( my @Data = $DBObject->FetchrowArray() ) {
    $FetchData{ID}             = $Data[0];
    $FetchData{Name}           = $Data[1];
    $FetchData{Catalog}        = $Data[2];
    $FetchData{Category}       = $Data[3];
    $FetchData{Workflow}       = $Data[4];
    $FetchData{Price}          = $Data[5];
    $FetchData{RecurringPrice} = $Data[6];
    $FetchData{RecurringPriceFrequency}  =  $Data[7];
    $FetchData{ItemImage}      = $Data[8];
    $FetchData{ItemHomeImage}  = $Data[9];
    $FetchData{ShortDescription} = $Data[10];
    $FetchData{Description}    = $Data[11];
    $FetchData{Quantity}       = $Data[12];
    $FetchData{Search}         = $Data[13];
    $FetchData{ApprovedBy}     = $Data[14];
    $FetchData{AssociatedCategory} = $Data[15];
    $FetchData{ValidID}        = $Data[16];
    $FetchData{FAQ}            = $Data[17];
    $FetchData{ServiceID}      = $Data[18];
    $FetchData{ContentPath}    = $Data[19];
    $FetchData{Queue}    = $Data[20];
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

