# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentFAQExplorer;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

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

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # permission check
    if ( !$Self->{AccessRo} ) {
        return $LayoutObject->NoPermission(
            Message    => Translatable('You need ro permission!'),
            WithHeader => 'yes',
        );
    }

    # get needed objects
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get config of frontend module
    my $Config = $ConfigObject->Get("FAQ::Frontend::$Self->{Action}");

    # get config data
    my $StartHit = int( $ParamObject->GetParam( Param => 'StartHit' ) || 1 );
    my $SearchLimit = $Config->{SearchLimit} || 500;
    my $Filter = $ParamObject->GetParam( Param => 'Filter' ) || '';
    my $View   = $ParamObject->GetParam( Param => 'View' )   || '';
    my $SortBy = $ParamObject->GetParam( Param => 'SortBy' )
        || $Config->{'SortBy::Default'}
        || 'FAQID';
    my $OrderBy = $ParamObject->GetParam( Param => 'OrderBy' )
        || $Config->{'Order::Default'}
        || 'Down';

    # get category id
    my $CategoryID = $ParamObject->GetParam( Param => 'CategoryID' ) || 0;

    # check for non numeric CategoryID
    if ( $CategoryID !~ /\d+/ ) {
        $CategoryID = 0;
    }

    # get category by name
    my $Category = $ParamObject->GetParam( Param => 'Category' ) || '';

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

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

    # get navigation bar option
    my $Nav = $ParamObject->GetParam( Param => 'Nav' ) || '';

    # get session object
    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

    # save category id to session, to be used in FAQ add screen
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastViewedCategory',
        Value     => $CategoryID,
    );

    # store last overview screen (for back menu action)
    # but only if the FAQ explorer is not shown as overlay
    if ( !$Nav || $Nav ne 'None' ) {

        my $URL = "Action=AgentFAQExplorer;SortBy=$SortBy"
            . ";CategoryID=$CategoryID;Nav=$Nav"
            . ";OrderBy=$OrderBy;StartHit=$StartHit";
        $SessionObject->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => 'LastScreenOverview',
            Value     => $URL,
        );
        $SessionObject->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => 'LastScreenView',
            Value     => $URL,
        );
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
            return $LayoutObject->ErrorScreen(
                Message => $LayoutObject->{LanguageObject}->Translate( 'The CategoryID %s is invalid.', $CategoryID ),
                Comment => Translatable('Please contact the administrator.'),
            );
        }

        # check user permission
        my $Permission = $FAQObject->CheckCategoryUserPermission(
            UserID     => $Self->{UserID},
            CategoryID => $CategoryID,
        );

        # show error message
        if ( !$Permission ) {
            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this category!'),
                WithHeader => 'yes',
            );
        }
    }

    my $Output;
    if ( $Nav && $Nav eq 'None' ) {

        # output header small and no Navigation bar
        $Output = $LayoutObject->Header(
            Type => 'Small',
        );
    }
    else {

        # output header and navigation bar
        $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
    }

    # show FAQ path
    $LayoutObject->FAQPathShow(
        FAQObject  => $FAQObject,
        CategoryID => $CategoryID,
        UserID     => $Self->{UserID},
        Nav        => $Nav,
    );

    # get all direct subcategories of the selected category
    my $CategoryIDsRef = $FAQObject->AgentCategorySearch(
        ParentID => $CategoryID,
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

    # set default interface settings
    my $Interface = $FAQObject->StateTypeGet(
        Name   => 'internal',
        UserID => $Self->{UserID},
    );
    my $InterfaceStates = $FAQObject->StateTypeList(
        Types  => $ConfigObject->Get('FAQ::Agent::StateTypes'),
        UserID => $Self->{UserID},
    );

    # get all items (valid and invalid) if SySConfig is set
    my $ValidObject = $Kernel::OM->Get('Kernel::System::Valid');
    my @ValidIDs;
    my $Valid = 1;
    if ( $Config->{ShowInvalidFAQItems} ) {
        my %ValidList = $ValidObject->ValidList();
        @ValidIDs = keys %ValidList;
        $Valid    = 0;
    }
    else {
        @ValidIDs = ( $ValidObject->ValidLookup( Valid => 'valid' ) );
    }

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
                OnlyApproved => 0,
                Valid        => $Valid,
                UserID       => $Self->{UserID},
            );

            # output the category data
            $LayoutObject->Block(
                Name => 'OverviewResultRow',
                Data => {
                    Nav => $Nav,
                    %SubCategoryData,
                },
            );
        }
    }

    # otherwise a no data found message is displayed
    else {
        $LayoutObject->Block(
            Name => 'NoDataFoundMsg',
        );
    }

    # search all FAQ articles within the given category
    my @ViewableFAQIDs = $FAQObject->FAQSearch(
        OrderBy          => [$SortBy],
        OrderByDirection => [$OrderBy],
        Limit            => $SearchLimit,
        UserID           => $Self->{UserID},
        States           => $InterfaceStates,
        Interface        => $Interface,
        CategoryIDs      => [$CategoryID],
        ValidIDs         => \@ValidIDs,
    );

    # build necessary stuff for the FAQ article list
    my $LinkPage = 'Filter='
        . $LayoutObject->LinkEncode($Filter)
        . ';View=' . $LayoutObject->LinkEncode($View)
        . ';Nav=' . $Nav
        . ';SortBy=' . $LayoutObject->LinkEncode($SortBy)
        . ';OrderBy=' . $LayoutObject->LinkEncode($OrderBy)
        . ';CategoryID=' . $CategoryID
        . ';';
    my $LinkSort = 'Filter='
        . $LayoutObject->LinkEncode($Filter)
        . ';View=' . $LayoutObject->LinkEncode($View)
        . ';Nav=' . $Nav
        . ';CategoryID=' . $CategoryID
        . ';';
    my $FilterLink = 'SortBy=' . $LayoutObject->LinkEncode($SortBy)
        . ';OrderBy=' . $LayoutObject->LinkEncode($OrderBy)
        . ';View=' . $LayoutObject->LinkEncode($View)
        . ';Nav=' . $Nav
        . ';CategoryID=' . $CategoryID
        . ';';

    # find out which columns should be shown
    my @ShowColumns;
    if ( $Config->{ShowColumns} ) {

        # get all possible columns from config
        my %PossibleColumn = %{ $Config->{ShowColumns} };

        # get the column names that should be shown
        COLUMNNAME:
        for my $Name ( sort keys %PossibleColumn ) {
            next COLUMNNAME if !$PossibleColumn{$Name};
            push @ShowColumns, $Name;
        }

        # enforce FAQ number column since is the link MasterAction hook
        if ( !$PossibleColumn{'Number'} ) {
            push @ShowColumns, 'Number';
        }
    }

    # build the title value (on top of the article list)
    my $Title = $CategoryData{Name}
        || $ConfigObject->Get('FAQ::Default::RootCategoryName')
        || '';

    # build the HTML for the list of FAQ articles in the given category
    my $FAQItemListHTML = $LayoutObject->FAQListShow(
        FAQIDs     => \@ViewableFAQIDs,
        Total      => scalar @ViewableFAQIDs,
        View       => $View,
        Env        => $Self,
        LinkPage   => $LinkPage,
        LinkSort   => $LinkSort,
        LinkFilter => $FilterLink,

        TitleName  => Translatable('FAQ Articles'),
        TitleValue => $Title,

        Limit        => $SearchLimit,
        Filter       => $Filter,
        FilterLink   => $FilterLink,
        OrderBy      => $OrderBy,
        SortBy       => $SortBy,
        ShowColumns  => \@ShowColumns,
        Output       => 1,
        Nav          => $Nav,
        FAQTitleSize => $Config->{TitleSize},
    );

    # show the FAQ article list
    $LayoutObject->Block(
        Name => 'FAQItemList',
        Data => {
            FAQItemListHTML => $FAQItemListHTML,
        },
    );

    # set QuickSearch mode
    my $Mode = 'Agent';
    if ( $Nav eq 'None' ) {
        $Mode = 'AgentSmall';
    }

    # show QuickSearch
    $LayoutObject->FAQShowQuickSearch(
        Mode            => $Mode,
        Interface       => $Interface,
        InterfaceStates => $InterfaceStates,
        UserID          => $Self->{UserID},
        Nav             => $Nav,
    );

    my %InfoBoxResults;

    # show last added and last updated articles
    for my $Type (qw(LastCreate LastChange)) {

        my $ShowOk = $LayoutObject->FAQShowLatestNewsBox(
            FAQObject       => $FAQObject,
            Type            => $Type,
            Mode            => 'Agent',
            CategoryID      => $CategoryID,
            Interface       => $Interface,
            InterfaceStates => $InterfaceStates,
            UserID          => $Self->{UserID},
            Nav             => $Nav,
        );

        # check error
        if ( !$ShowOk ) {
            return $LayoutObject->ErrorScreen();
        }

        # store the NewsBoxResult
        $InfoBoxResults{$Type} = $ShowOk;
    }

    # show top ten articles
    my $ShowOk = $LayoutObject->FAQShowTop10(
        FAQObject       => $FAQObject,
        Mode            => 'Agent',
        CategoryID      => $CategoryID,
        Interface       => $Interface,
        InterfaceStates => $InterfaceStates,
        UserID          => $Self->{UserID},
        Nav             => $Nav,
    );

    # check error
    if ( !$ShowOk ) {
        return $LayoutObject->ErrorScreen();
    }

    # store the NewsBoxResult
    $InfoBoxResults{Top10} = $ShowOk;

    # set the Sidebar width
    my $SidebarClass = 'Large';

    # check if all InfoBoxes are empty and hide the Sidebar
    if (
        $InfoBoxResults{LastCreate} eq -1
        && $InfoBoxResults{LastChange} eq -1
        && $InfoBoxResults{Top10} eq -1
        )
    {
        $SidebarClass = 'Hidden';
    }

    if ( $Nav && $Nav eq 'None' ) {
        $SidebarClass = 'Medium';
    }

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentFAQExplorer',
        Data         => {
            %Param,
            CategoryID   => $CategoryID,
            SidebarClass => $SidebarClass,
            %CategoryData,
        },
    );

    # add footer
    if ( $Nav && $Nav eq 'None' ) {
        $Output .= $LayoutObject->Footer(
            Type => 'Small',
        );
    }
    else {
        $Output .= $LayoutObject->Footer();
    }

    return $Output;
}

1;
