# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::PublicFAQExplorer;

use strict;
use warnings;

use MIME::Base64 qw();

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # set UserID to root because in public interface there is no user
    $Self->{UserID} = 1;

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

    # get Item ID
    my $ItemID = $ParamObject->GetParam( Param => 'ItemID' ) || 0;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check if ItemID parameter was sent and redirect to FAQ article zoom screen
    if ($ItemID) {

        # redirect to FAQ zoom
        return $LayoutObject->Redirect( OP => 'Action=PublicFAQZoom;ItemID=' . $ItemID );
    }

    # get category ID
    my $CategoryID = $ParamObject->GetParam( Param => 'CategoryID' ) || 0;

    # check for non numeric CategoryID
    if ( $CategoryID !~ /\d+/ ) {
        $CategoryID = 0;
    }

    # get category by name
    my $Category = $ParamObject->GetParam( Param => 'Category' ) || '';

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # try to get the category ID from category name if no category ID
    if ( $Category && !$CategoryID ) {

        # get the category tree
        my $CategoryTree = $FAQObject->CategoryTreeList(
            UserID => 1,
        );

        # reverse the has for easy lookup
        my %ReverseCategoryTree = reverse %{$CategoryTree};

        $CategoryID = $ReverseCategoryTree{$Category} || 0;
    }

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
    }

    # add RSS feed link for new FAQ articles in the browser URL bar
    $LayoutObject->Block(
        Name => 'MetaLink',
        Data => {
            Rel  => 'alternate',
            Type => 'application/rss+xml',
            Title =>
                $LayoutObject->{LanguageObject}->Translate('FAQ Articles (new created)'),
            Href => $LayoutObject->{Baselink} . 'Action=PublicFAQRSS;Type=Created',
        },
    );

    # add RSS feed link for changed FAQ articles in the browser URL bar
    $LayoutObject->Block(
        Name => 'MetaLink',
        Data => {
            Rel  => 'alternate',
            Type => 'application/rss+xml',
            Title =>
                $LayoutObject->{LanguageObject}->Translate('FAQ Articles (recently changed)'),
            Href => $LayoutObject->{Baselink} . 'Action=PublicFAQRSS;Type=Changed',
        },
    );

    # add RSS feed link for Top-10 FAQ articles in the browser URL bar
    $LayoutObject->Block(
        Name => 'MetaLink',
        Data => {
            Rel   => 'alternate',
            Type  => 'application/rss+xml',
            Title => $LayoutObject->{LanguageObject}->Translate('FAQ Articles (Top 10)'),
            Href  => $LayoutObject->{Baselink} . 'Action=PublicFAQRSS;Type=Top10',
        },
    );

    # output header
    my $Output = $LayoutObject->CustomerHeader();

    # show FAQ path
    $LayoutObject->FAQPathShow(
        FAQObject  => $FAQObject,
        CategoryID => $CategoryID,
        UserID     => $Self->{UserID},
    );

    # get all direct subcategories of the selected category
    my $CategoryIDsRef = $FAQObject->PublicCategorySearch(
        ParentID => $CategoryID,
        Mode     => 'Public',
        UserID   => $Self->{UserID},
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

    # get interface state list
    my $InterfaceStates = $FAQObject->StateTypeList(
        Types  => $ConfigObject->Get('FAQ::Public::StateTypes'),
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
        Name   => 'public',
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

    # get multi language default option
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

        # create back link for FAQ Zoom screen
        my $ZoomBackLink = "Action=PublicFAQExplorer;CategoryID=$CategoryID;"
            . "SortBy=$SortBy;Order=$OrderBy;StartHit=$StartHit";

        # encode back link to Base64 for easy HTML transport
        $ZoomBackLink = MIME::Base64::encode_base64($ZoomBackLink);

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
                        ZoomBackLink => $ZoomBackLink,
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
        Action    => "Action=PublicFAQExplorer;CategoryID=$CategoryID",
        Link      => $Link,
        IDPrefix  => "PublicFAQExplorer",
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

    my $SearchBackLink = "Action=PublicFAQExplorer;CategoryID=$CategoryID";

    # encode back link to Base64 for easy HTML transport
    $SearchBackLink = MIME::Base64::encode_base64($SearchBackLink);

    # show QuickSearch
    $LayoutObject->FAQShowQuickSearch(
        Mode            => 'Public',
        Interface       => $Interface,
        InterfaceStates => $InterfaceStates,
        SearchBackLink  => $SearchBackLink,
        UserID          => $Self->{UserID},
    );

    # show last added and last updated articles
    for my $Type (qw(LastCreate LastChange)) {

        my $ShowOk = $LayoutObject->FAQShowLatestNewsBox(
            FAQObject       => $FAQObject,
            Type            => $Type,
            Mode            => 'Public',
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
        Mode            => 'Public',
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
        TemplateFile => 'PublicFAQExplorer',
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
