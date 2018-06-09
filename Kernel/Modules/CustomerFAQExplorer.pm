# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::CustomerFAQExplorer;

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

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get config of frontend module
    my $Config = $ConfigObject->Get("FAQ::Frontend::$Self->{Action}");

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get config data
    my $StartHit = int( $ParamObject->GetParam( Param => 'StartHit' ) || 1 );
    my $SearchLimit     = $Config->{SearchLimit}     || 200;
    my $SearchPageShown = $Config->{SearchPageShown} || 3;
    my $SortBy = $ParamObject->GetParam( Param => 'SortBy' )
        || $Config->{'SortBy::Default'}
        || 'FAQID';
    my $OrderBy = $ParamObject->GetParam( Param => 'Order' )
        || $Config->{'Order::Default'}
        || 'Down';

    # get category id
    my $CategoryID = $ParamObject->GetParam( Param => 'CategoryID' ) || 0;

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # check for non numeric CategoryID
    if ( $CategoryID !~ /\d+/ ) {
        $CategoryID = 0;
    }

    # get category by name
    my $Category = $ParamObject->GetParam( Param => 'Category' ) || '';

    # try to get the Category ID from category name if no Category ID
    if ( $Category && !$CategoryID ) {

        # get the category tree
        my $CategoryTree = $FAQObject->CategoryTreeList(
            UserID => $Self->{UserID},
        );

        # reverse the has for easy lookup
        my %ReverseCategoryTree = reverse %{$CategoryTree};

        $CategoryID = $ReverseCategoryTree{$Category} || 0;
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # try to get the category data
    my %CategoryData;
    if ($CategoryID) {

        # get category data
        %CategoryData = $FAQObject->CategoryGet(
            CategoryID => $CategoryID,
            UserID     => $Self->{UserID},
        );
        if ( !%CategoryData ) {
            return $LayoutObject->CustomerNoPermission(
                WithHeader => 'yes',
            );
        }

        # check user permission
        my $Permission = $FAQObject->CheckCategoryCustomerPermission(
            CustomerUser => $Self->{UserLogin},
            CategoryID   => $CategoryID,
            UserID       => $Self->{UserID},
        );

        # permission check
        if ( !$Permission ) {
            return $LayoutObject->CustomerNoPermission(
                WithHeader => 'yes',
            );
        }
    }

    # store the last screen overview in session
    $Kernel::OM->Get('Kernel::System::AuthSession')->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenOverview',
        Value     => $Self->{RequestedURL},
    );

    # output header
    my $Output = $LayoutObject->CustomerHeader(
        Value => '',
    );
    $Output .= $LayoutObject->CustomerNavigationBar();

    # show FAQ path
    $LayoutObject->FAQPathShow(
        FAQObject  => $FAQObject,
        CategoryID => $CategoryID,
        UserID     => $Self->{UserID},
    );

    # get all direct subcategories of the selected category
    my $CategoryIDsRef = $FAQObject->CustomerCategorySearch(
        ParentID     => $CategoryID,
        CustomerUser => $Self->{UserLogin},
        Mode         => 'Customer',
        UserID       => $Self->{UserID},
    );

    # show subcategories list
    $LayoutObject->Block(
        Name => 'Subcategories',
        Data => {},
    );
    $LayoutObject->Block(
        Name => 'OverviewResult',
        Data => {},
    );

    # get interface states list
    my $InterfaceStates = $FAQObject->StateTypeList(
        Types  => $ConfigObject->Get('FAQ::Customer::StateTypes'),
        UserID => $Self->{UserID},
    );

    # check if there are subcategories
    if ( $CategoryIDsRef && ref $CategoryIDsRef eq 'ARRAY' && @{$CategoryIDsRef} ) {

        # show data for each subcategory
        for my $SubCategoryID ( @{$CategoryIDsRef} ) {

            # get the category data
            my %SubCategoryData = $FAQObject->CategoryGet(
                CategoryID => $SubCategoryID,
                UserID     => $Self->{UserID},
            );

            # get the number of subcategories of this subcategory
            $SubCategoryData{SubCategoryCount} = $FAQObject->CategoryCount(
                ParentIDs => [$SubCategoryID],
                UserID    => $Self->{UserID},
            );

            # get the number of FAQ articles in this category
            $SubCategoryData{ArticleCount} = $FAQObject->FAQCount(
                CategoryIDs  => [$SubCategoryID],
                ItemStates   => $InterfaceStates,
                OnlyApproved => 1,
                Valid        => 1,
                UserID       => $Self->{UserID},
            );

            # output the category data
            $LayoutObject->Block(
                Name => 'OverviewResultRow',
                Data => {%SubCategoryData},
            );
        }
    }

    # otherwise a no data found message is displayed
    else {
        $LayoutObject->Block(
            Name => 'NoCategoryDataFoundMsg',
        );
    }

    # set default interface settings
    my $Interface = $FAQObject->StateTypeGet(
        Name   => 'external',
        UserID => $Self->{UserID},
    );

    # search all FAQ articles within the given category
    my @ViewableFAQIDs = $FAQObject->FAQSearch(
        OrderBy          => [$SortBy],
        OrderByDirection => [$OrderBy],
        Limit            => $SearchLimit,
        UserID           => $Self->{UserID},
        States           => $InterfaceStates,
        Interface        => $Interface,
        CategoryIDs      => [$CategoryID],
    );

    # set the SortBy Class
    my $SortClass;

    # this sets the opposite to the OrderBy parameter
    if ( $OrderBy eq 'Down' ) {
        $SortClass = 'SortAscending';
    }
    elsif ( $OrderBy eq 'Up' ) {
        $SortClass = 'SortDescending';
    }

    # set the SortBy Class to the correct field
    my %CSSSort;
    my $CSSSortBy = $SortBy . 'Sort';
    $CSSSort{$CSSSortBy} = $SortClass;

    my %NewOrder = (
        Down => 'Up',
        Up   => 'Down',
    );

    # show the FAQ article list
    $LayoutObject->Block(
        Name => 'FAQItemList',
        Data => {
            CategoryID => $CategoryID,
            %CSSSort,
            Order => $NewOrder{$OrderBy},
        },
    );

    my $MultiLanguage = $ConfigObject->Get('FAQ::MultiLanguage');

    # show language header
    if ($MultiLanguage) {
        $LayoutObject->Block(
            Name => 'HeaderLanguage',
            Data => {
                CategoryID => $CategoryID,
                %CSSSort,
                Order => $NewOrder{$OrderBy},
            },
        );
    }

    my $Counter = 0;
    if (@ViewableFAQIDs) {

        for my $FAQID (@ViewableFAQIDs) {

            $Counter++;

            # build search result
            if (
                $Counter >= $StartHit
                && $Counter < ( $SearchPageShown + $StartHit )
                )
            {

                # get FAQ data details
                my %FAQData = $FAQObject->FAQGet(
                    ItemID     => $FAQID,
                    ItemFields => 0,
                    UserID     => $Self->{UserID},
                );

                $FAQData{CleanTitle} = $FAQObject->FAQArticleTitleClean(
                    Title => $FAQData{Title},
                    Size  => $Config->{TitleSize},
                );

                # add blocks to template
                $LayoutObject->Block(
                    Name => 'Record',
                    Data => {
                        %FAQData,
                    },
                );

                # add language data
                if ($MultiLanguage) {
                    $LayoutObject->Block(
                        Name => 'RecordLanguage',
                        Data => {
                            %FAQData,
                        },
                    );
                }
            }
        }
    }

    # otherwise a no data found message is displayed
    else {
        $LayoutObject->Block(
            Name => 'NoFAQDataFoundMsg',
        );
    }

    my $Link = 'SortBy=' . $LayoutObject->LinkEncode($SortBy) . ';';
    $Link .= 'Order=' . $LayoutObject->LinkEncode($OrderBy) . ';';

    # build search navigation bar
    my %PageNav = $LayoutObject->PageNavBar(
        Limit     => $SearchLimit,
        StartHit  => $StartHit,
        PageShown => $SearchPageShown,
        AllHits   => $Counter,
        Action    => "Action=CustomerFAQExplorer;CategoryID=$CategoryID",
        Link      => $Link,
        IDPrefix  => "CustomerFAQExplorer",
    );

    # show footer filter - show only if more the one page is available
    if ( defined $PageNav{TotalHits} && ( $PageNav{TotalHits} > $SearchPageShown ) ) {
        $LayoutObject->Block(
            Name => 'Pagination',
            Data => {
                %Param,
                %PageNav,
            },
        );
    }

    # show QuickSearch
    $LayoutObject->FAQShowQuickSearch(
        Mode            => 'Customer',
        CustomerUser    => $Self->{UserLogin},
        Interface       => $Interface,
        InterfaceStates => $InterfaceStates,
        UserID          => $Self->{UserID},
    );

    # show last added and last updated articles
    for my $Type (qw(LastCreate LastChange)) {

        my $ShowOk = $LayoutObject->FAQShowLatestNewsBox(
            FAQObject       => $FAQObject,
            Type            => $Type,
            Mode            => 'Customer',
            CustomerUser    => $Self->{UserLogin},
            CategoryID      => $CategoryID,
            Interface       => $Interface,
            InterfaceStates => $InterfaceStates,
            UserID          => $Self->{UserID},
        );

        # check error
        if ( !$ShowOk ) {
            return $LayoutObject->ErrorScreen();
        }
    }

    # show top ten articles
    my $ShowOk = $LayoutObject->FAQShowTop10(
        FAQObject       => $FAQObject,
        Mode            => 'Customer',
        CustomerUser    => $Self->{UserLogin},
        CategoryID      => $CategoryID,
        Interface       => $Interface,
        InterfaceStates => $InterfaceStates,
        UserID          => $Self->{UserID},
    );

    # check error
    if ( !$ShowOk ) {
        return $LayoutObject->ErrorScreen();
    }

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'CustomerFAQExplorer',
        Data         => {
            %Param,
            CategoryID => $CategoryID,
            %CategoryData,
        },
    );

    # add footer
    $Output .= $LayoutObject->CustomerFooter();

    return $Output;
}

1;
