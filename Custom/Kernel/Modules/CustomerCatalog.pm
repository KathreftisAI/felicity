# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::CustomerCatalog;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;
  
    # get needed objects
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $Config = $Kernel::OM->Get('Kernel::Config')->Get("Ticket::Frontend::CustomerTicketMessage");
    my $CatalogObject = $Kernel::OM->Get('Kernel::System::Catalog');

    #header and navigation bar
    my $Output = $LayoutObject->CustomerHeader();
    $Output .= $LayoutObject->CustomerNavigationBar();  

    #To Create New Ticket
    if ($Self->{Subaction} eq 'Request') {
 
        my $Body = $ParamObject->GetParam( Param => 'Body' );
        my $ItemName = $ParamObject->GetParam( Param => 'ItemName' );
        my $ItemID = $ParamObject->GetParam( Param => 'ItemID' );
        my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
        my %ItemData= $CatalogObject->GetCatalogCategoryItem(ItemID=> $ItemID);
        my $QueueObject = $Kernel::OM->Get('Kernel::System::Queue');
        my $Queue = $QueueObject->QueueLookup( QueueID => $ItemData{Queue_id} );
        my $TypeObject = $Kernel::OM->Get('Kernel::System::Type');
        my %Type = $TypeObject->TypeGet(
            Name => 'Service Request',
        );



        my $TicketID = $TicketObject->TicketCreate(
            Title        => 'Request for '.$ItemName,
            Lock         => 'unlock',
            PriorityID     => '1',       # or PriorityID => 2,
            State        => 'new',            # or StateID => 5,
            CustomerID   => $Self->{UserCustomerID},
            CustomerUser => $Self->{UserLogin},
            OwnerID      => $ConfigObject->Get('CustomerPanelUserID'),
            UserID       => $ConfigObject->Get('CustomerPanelUserID'),
            QueueID      => $ItemData{Queue_id},
            TypeID      =>  $Type{ID},
        );

        my $FullName = $Kernel::OM->Get('Kernel::System::CustomerUser')->CustomerName(
            UserLogin => $Self->{UserLogin},
            );
        my $From      = "\"$FullName\" <$Self->{UserEmail}>";

        my $ArticleID = $TicketObject->ArticleCreate(
            TicketID         => $TicketID,
            ArticleType      => $Config->{ArticleType},                        # email-external|email-internal|phone|fax|...
            SenderType       => $Config->{SenderType},                                # agent|system|customer
            From             => $From ,       # not required but useful
            To               => $Queue, # not required but useful
            Subject          => 'Request for '.$ItemName,              # required
            Body             => $Body,                     # required
            Charset          => 'ISO-8859-15',
            MimeType         => 'text/html',
            HistoryType      => $Config->{HistoryType},
            HistoryComment   => $Config->{HistoryComment} || '%%',
            AutoResponseType => ( $ConfigObject->Get('AutoResponseForWebTickets') )
            ? 'auto reply'
            : '',
            UserID           => $ConfigObject->Get('CustomerPanelUserID'),
            OrigHeader => {
                From             => $From ,       # not required but useful
                To               => 'Request', # not required but useful
                Subject          => 'Request for '.$ItemName,              # required
                Body             => $Body,    
            },                                     # Unlock ticket if owner is away
        );


        my $ProcessDBObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::DB::Process');
        my $ProcessObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::Process');   
        my $Process = $ProcessDBObject->ProcessGet(
            ID              => $ItemData{Workflow_id},          # ID or EntityID is needed
            UserID          => $ConfigObject->Get('CustomerPanelUserID'),   
        );

        #link process to ticket
        $ProcessObject->ProcessTicketProcessSet(
            ProcessEntityID => $Process->{EntityID},
            TicketID        => $TicketID,
            UserID          => $ConfigObject->Get('CustomerPanelUserID'),
        );
        # set Activity to to process    
        my $Success = $ProcessObject->ProcessTicketActivitySet(
            ProcessEntityID => $Process->{EntityID},
            TicketID        => $TicketID,
            UserID          => $ConfigObject->Get('CustomerPanelUserID'),
            ActivityEntityID => $Process->{Config}->{StartActivity},
        );


        my $TicketNumber = $TicketObject->TicketNumberLookup(
            TicketID => $TicketID,
            UserID   =>  $ConfigObject->Get('CustomerPanelUserID'),
        );

        return $LayoutObject->Redirect(
            OP => "Action=CustomerTicketZoom;TicketNumber=$TicketNumber",
        );


    }elsif ($Self->{Subaction} eq 'CatalogCategoryItemDetails') {
      
        my $Category = $ParamObject->GetParam( Param => 'CatalogCategory' );
        my $Item = $ParamObject->GetParam( Param => 'CatalogCategoryItem' );
        my $Catalog = $ParamObject->GetParam( Param => 'Catalog' );
        
        my %CatalogData= $CatalogObject->GetCatalog(
        Catalog_id => $Catalog,
        );
        my %CategoryData= $CatalogObject->GetCategory(
        Category_id => $Category,
        );
        my %ItemData= $CatalogObject->GetItem(
            Item_id => $Item,
        );

        $Param{CatalogData}= \%CatalogData; 
        $Param{CategoryData}= \%CategoryData;
        $Param{ItemData}= \%ItemData;



        my $SQL = "select fcc.title as category_name, fci.id,fci.name,fci.catalog_id,fci.short_description,fci.description,fci.faq_id,fc.title as catalog_name,fci.recurring_price,fci.recurring_price_frequency,fci.service_id,fci.Price from felicity_catalog_category_item_master as fci left JOIN felicity_catalog_category_master as fcc on fci.category_id=fcc.id left join felicity_catalog_master as fc on fc.id = fci.catalog_id where fci.category_id = ? and fci.id=? and fci.valid_id=1";

        return if !$DBObject->Prepare(
        SQL => $SQL,
        Bind  => [ \$Category ,\$Item ]
        );


        my %CatalogCategoryItem;
        my $i = 0;  
        
        while ( my @Row = $DBObject->FetchrowArray() ) 
        {   
            $CatalogCategoryItem{$i} = 
            {
            'Category Name' => $Row[0] ,  
            'id' => $Row[1],
            'Name' => $Row[2],
            'catalog_id' => $Row[3],
            'short_description' => $Row[4],
            'description' => $Row[5],
            'faq_id' => $Row[6],
            'Catalog Name' => $Row[7],
            'category_id' => $Category,
            'Recurring Price' => $Row[8],
            'Recurring Price Frequency' => $Row[9],
            'service_id' => $Row[10],
            'Price'      => $Row[11]
            };
            
            $i++;       
        }
         my $CatalogObject = $Kernel::OM->Get('Kernel::System::Catalog'); 
         my %ItemData= $CatalogObject->GetCatalogCategoryItem(ItemID=>  $Item);       
         my %ImageData= $CatalogObject->GetCatalogImages(
            Master_id => $Item ,
            Master_type => 'CategoryItem' #CategoryItem or Catalog or Category
         ); 

         if (%ImageData) {
                $CatalogCategoryItem{ImagePath}=my $ImagePath = $ConfigObject->Get('ServiceCatalogImageAccessPath')."/$ItemData{Content_path}/$ImageData{Master_id}/$ImageData{Filename}";  
            } else {
                $CatalogCategoryItem{ImagePath}=$ConfigObject->Get('Frontend::WebPath').'skins/Agent/img/report1.jpg';
            }   
         $CatalogCategoryItem{ItemData} = \%ItemData;     
         $Param{CatalogCategoryItemDetails}=\%CatalogCategoryItem;   


     


    }elsif ($Self->{Subaction} eq 'CatalogCategoryItem') {
        
        my $Category = $ParamObject->GetParam( Param => 'CatalogCategory' );
        my $Catalog = $ParamObject->GetParam( Param => 'Catalog' );
        my %CatalogData= $CatalogObject->GetCatalog(
            Catalog_id => $Catalog,
        );
        my %CategoryData= $CatalogObject->GetCategory(
            Category_id => $Category,
        );
        $Param{CatalogData}= \%CatalogData; 
        $Param{CategoryData}= \%CategoryData;
        
        my $SQL = "select fcc.title as category_name, fci.id,fci.name,fci.catalog_id,fci.short_description,fci.description,fci.faq_id,fc.title as catalog_name,fci.recurring_price,fci.recurring_price_frequency,fci.service_id from felicity_catalog_category_item_master as fci left JOIN felicity_catalog_category_master as fcc on fci.category_id=fcc.id left join felicity_catalog_master as fc on fc.id = fci.catalog_id where fci.category_id = ? and fci.valid_id=1 and fc.id = ?";

        return if !$DBObject->Prepare(
        SQL => $SQL,
        Bind  => [ \$Category , \$Catalog ]
        );


        my %CatalogCategoryItem;
        my $i = 0;  
        
        while ( my @Row = $DBObject->FetchrowArray() ) 
        {   
            $CatalogCategoryItem{$i} = 
            {
            'category_name' => $Row[0] ,  
            'id' => $Row[1],
            'CatalogCategoryItem_name' => $Row[2],
            'catalog_id' => $Row[3],
            'short_description' => $Row[4],
            'description' => $Row[5],
            'faq_id' => $Row[6],
            'catalog_name' => $Row[7],
            'category_id' => $Category,
            'recurring_price' => $Row[8],
            'recurring_price_frequency' => $Row[9],
            'service_id' => $Row[10]
            };
            
            $i++;       
        }

         $Param{CatalogCategoryItemList}=\%CatalogCategoryItem;  


    }elsif ($Self->{Subaction} eq 'CatalogCategory') {
        
        my $Catalog = $ParamObject->GetParam( Param => 'Catalog' );
        my $result;   

        my $SQL = "select c.title as catalog_name,cc.id,cc.content_path,cc.title,cc.description,ct1.filename as category_img,ct1.content_type as category_content_type,c.id,ct2.filename as category_home_img,ct2.content_type as category_home_content_type from felicity_catalog_category_master as cc left join felicity_service_catalog_images as ct1 on cc.id=ct1.master_id and ct1.master_type='Category' and ct1.image_type=2 left join felicity_service_catalog_images as ct2 on cc.id=ct2.master_id and ct2.master_type='Category' and ct2.image_type=1 left join 
        felicity_catalog_master as c on cc.catalog_id=c.id where cc.catalog_id=? and cc.valid_id=1";

        $result=$DBObject->Prepare(
        SQL => $SQL,
        Bind  => [ \$Catalog ]
        );
    
        my $ImagePath = $ConfigObject->Get('ServiceCatalogImageAccessPath');
 
        my %Category;
        if($result){    
            my $i = 0;  
            while ( my @Row = $DBObject->FetchrowArray() ) 
            {   
                my $Filename ;
                my $image_content = "";

                if($Row[5])
                {
                    $Filename = $ImagePath.'/'.$Row[2].'/'.$Row[1]."/".$Row[5];
                }else{
                    $Filename = $ConfigObject->Get('Frontend::WebPath').'img/catalog.png';
                }


                $Category{$i} = 
                {
                'catalog_name' => $Row[0],
                'catalog_id'   =>$Row[7],
                'id' => $Row[1],
                'title' => $Row[3],
                'description' => $Row[4],
                'filepath' => $Filename,
                'content_type' => $Row[6],
                };
                $i++;       
            }
        }

        $Param{CategoryList}=\%Category;  


    } else {
     
        
        my $SQL ="SELECT c.id,c.title,c.description,i.filename,c.content_path,i.content_type FROM felicity_catalog_master as c LEFT JOIN felicity_service_catalog_images as i ON c.id=i.master_id and i.master_type='Catalog' where c.valid_id=1";
        
        return if !$DBObject->Prepare(
        SQL => $SQL,
        );

        my $ImagePath =$ConfigObject->Get('ServiceCatalogImageAccessPath');
        
        my %CatalogList;
        my $i = 0;  
        while ( my @Row = $DBObject->FetchrowArray() ) 
        {
            my $FilePath ;
            if($Row[3])
            {
                $FilePath = $ImagePath.'/'.$Row[4].'/'.$Row[0]."/".$Row[3];   
            }else{
                $FilePath = $ConfigObject->Get('Frontend::WebPath').'img/catalog.png';
            }           

            $CatalogList{$i} = 
            {
            'id' => $Row[0],
            'title' => $Row[1],
            'description' => $Row[2],
            'filepath'=> $FilePath,
            'content_type' => $Row[5]
            };
            
            $i++;       
        }

        $Param{CatalogList}=\%CatalogList;

    }

    $Output .= $LayoutObject->Output(
        TemplateFile => $Self->{Action},
        Data         => \%Param
    );
    $Output .= $LayoutObject->CustomerFooter();

    return $Output;

}

1;
