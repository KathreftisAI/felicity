
package Kernel::System::Catalog;
## nofilter(TidyAll::Plugin::OTRS::Perl::Require)

use strict;
use warnings;
use Data::Dumper;
use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Encode',
    'Kernel::System::HTMLUtils',
    'Kernel::System::Log',
    'Kernel::System::Time',
);

=head1 NAME

Kernel::System::Catalog

=head1 SYNOPSIS

Global module Catalog, Category and item.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CatalogObject = $Kernel::OM->Get('Kernel::System::Catalog');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # debug level
    $Self->{Debug} = $Param{Debug} || 0;

    return $Self;
}


=item GetCategoryByCatalogID()

 %CategoryList= $CatalogObject->GetCategoryByCatalogID(CatalogID=> 2)

=cut

sub GetCategoryByCatalogID{
    my ( $Self, %Param ) = @_;

    if (!$Param{CatalogID}) {
         $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need CatalogID!'
        );
        return;  
    }

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $SQL= "SELECT * FROM felicity_catalog_category_master where Catalog_id=?";

    return if !$DBObject->Prepare(
    SQL => $SQL,
    Bind  => [ \$Param{CatalogID} ]
    );

    my %CategoryDetails;
    my $i = 0;  

    while ( my @Row = $DBObject->FetchrowArray() ) { 
        $CategoryDetails{$i} = 
        {
        'CategoryID' => $Row[0],
        'Title'   =>$Row[1],
        'Description' => $Row[2],
        'CatalogID' => $Row[3],
        'Location' => $Row[4],
        'Content_path' => $Row[5],
        'GroupID' => $Row[6],
        'Valid_id' => $Row[7],
        'Create_time'   =>$Row[8],
        'Create_by' => $Row[9],
        'Change_time' => $Row[10],
        'Change_by' => $Row[11]
        };
        $i++;
    }

    return %CategoryDetails;

}


=item GetCategoryByCatalogID()

 %ItemData= $CatalogObject->GetCatalogCategoryItem(ItemID=> 2)

=cut

sub GetCatalogCategoryItem{
    my ( $Self, %Param ) = @_;

    if (!$Param{ItemID}) {
         $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ItemID!'
        );
        return;  
    }

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $SQL= "SELECT * FROM felicity_catalog_category_item_master where Id=?";

    return if !$DBObject->Prepare(
    SQL => $SQL,
    Bind  => [ \$Param{ItemID} ]
    );

    my %ItemDetails;
    my $i=0;
    while ( my @Row = $DBObject->FetchrowArray() ) { 

        for my $Key (
            qw(
            Id Name Catalog_id Category_id Workflow_id Price Recurring_price Recurring_price_frequency
            Short_description Description No_quantity No_search Approved_by Associated_category Valid_id Create_time Create_by Change_time
            Change_by Faq_id Service_id Content_path Queue_id Request_catalog_queue_id
            )
            )
        {
            $ItemDetails{$Key} = $Row[$i];
            $i++;
        }
       
       
    }

    return %ItemDetails;

}



=item GetCatalogImages()

 %ImageData= $CatalogObject->GetCatalogImages(
    Master_id => 2,
    Master_type => 'CategoryItem' #CategoryItem or Catalog or Category
 );

=cut

sub GetCatalogImages{
    my ( $Self, %Param ) = @_;

    if (!$Param{Master_id} && !$Param{Master_type} ) {
         $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Master_id or Master_type!'
        );
        return;  
    }

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $SQL= "SELECT * FROM felicity_service_catalog_images where Master_id=? and Master_type=?";

    return if !$DBObject->Prepare(
    SQL => $SQL,
    Bind  => [ \$Param{Master_id}, \$Param{Master_type} ]
    );

    my %ImageDetails;
    my $i=0;
    while ( my @Row = $DBObject->FetchrowArray() ) { 

        for my $Key (
            qw(
            Id Master_id Master_type Image_type Content_type Filename
            )
            )
        {
            $ImageDetails{$Key} = $Row[$i];
            $i++;
        }
       
       
    }

    return %ImageDetails;

}

=item GetCatalog()

 %CatalogData= $CatalogObject->GetCatalog(
    Catalog_id => 2,
 );

=cut

sub GetCatalog{
    my ( $Self, %Param ) = @_;

    if (!$Param{Catalog_id}) {
         $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Catalog_id!'
        );
        return;  
    }

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $SQL= "SELECT * FROM felicity_catalog_master where Id=?";

    return if !$DBObject->Prepare(
    SQL => $SQL,
    Bind  => [ \$Param{Catalog_id} ]
    );

    my %CatalogData;
    my $i=0;
    while ( my @Row = $DBObject->FetchrowArray() ) { 

        for my $Key (
            qw(
            Id Title Description Catalog_next_page Valid_id Create_time Create_by Change_time Change_by Content_path     
            )
            )
        {
            $CatalogData{$Key} = $Row[$i];
            $i++;
        }
       
       
    }

    return %CatalogData;

}


=item GetCategory()

 %CategoryData= $CatalogObject->GetCategory(
    Category_id => 2,
 );

=cut

sub GetCategory{
    my ( $Self, %Param ) = @_;

    if (!$Param{Category_id}) {
         $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Category_id!'
        );
        return;  
    }

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $SQL= "SELECT * FROM felicity_catalog_category_master where Id=?";

    return if !$DBObject->Prepare(
    SQL => $SQL,
    Bind  => [ \$Param{Category_id} ]
    );

    my %CategoryData;
    my $i=0;
    while ( my @Row = $DBObject->FetchrowArray() ) { 

        for my $Key (
            qw(
            Id Title Description Catalog_id Location Content_path Group_id Valid_id 
            Create_time Create_by Change_time Change_by     
            )
            )
        {
            $CategoryData{$Key} = $Row[$i];
            $i++;
        }
       
       
    }

    return %CategoryData;

}

=item GetItem()

 %ItemData= $CatalogObject->GetItem(
    Item_id => 2,
 );

=cut

sub GetItem{
    my ( $Self, %Param ) = @_;

    if (!$Param{Item_id}) {
         $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Item_id!'
        );
        return;  
    }

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $SQL= "SELECT * FROM felicity_catalog_category_item_master where Id=?";

    return if !$DBObject->Prepare(
    SQL => $SQL,
    Bind  => [ \$Param{Item_id} ]
    );

    my %ItemData;
    my $i=0;
    while ( my @Row = $DBObject->FetchrowArray() ) { 

        for my $Key (
            qw(
            Id Name Catalog_id Category_id Workflow_id Price Recurring_price 
            Recurring_price_frequency Short_description Description No_quantity No_search 
            Approved_by Associated_category Valid_id Create_time Create_by Change_time
            Change_by Faq_id Service_id Content_path Queue_id Request_catalog_queue_id                
            )
            )
        {
            $ItemData{$Key} = $Row[$i];
            $i++;
        }
       
       
    }

    return %ItemData;

}

