# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMTemplateOverview;

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

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMChange::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $Kernel::OM->Get('Kernel::System::ITSMChange')->Permission(
        Type   => $Self->{Config}->{Permission},
        Action => $Self->{Action},
        UserID => $Self->{UserID},
    );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # error screen
    #if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'You need %s permissions!', $Self->{Config}->{Permission} ),
            WithHeader => 'yes',
        );
    #}

    # store last screen, used for backlinks
    $Kernel::OM->Get('Kernel::System::AuthSession')->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenTemplates',
        Value     => $Self->{RequestedURL},
    );

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get sorting parameters
    my $SortBy = $ParamObject->GetParam( Param => 'SortBy' )
        || $Self->{Config}->{'SortBy::Default'}
        || 'TemplateID';

    # get ordering parameters
    my $OrderBy = $ParamObject->GetParam( Param => 'OrderBy' )
        || $Self->{Config}->{'Order::Default'}
        || 'Up';

    my @SortByArray  = ($SortBy);
    my @OrderByArray = ($OrderBy);

    # investigate refresh
    my $Refresh = $Self->{UserRefreshTime} ? 60 * $Self->{UserRefreshTime} : undef;

    # starting with page ...
    my $Output = $LayoutObject->Header( Refresh => $Refresh );
    $Output .= $LayoutObject->NavigationBar();
    $LayoutObject->Print( Output => \$Output );
    $Output = '';

    # find out which columns should be shown
    my @ShowColumns;
    if ( $Self->{Config}->{ShowColumns} ) {

        # get all possible columns from config
        my %PossibleColumn = %{ $Self->{Config}->{ShowColumns} };

        # get the column names that should be shown
        @ShowColumns = grep { $PossibleColumn{$_} } keys %PossibleColumn;
    }

    # to store the filters
    my %Filters;

    # get template object
    my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template');

    # set other filters based on template type
    if ( $Self->{Config}->{'Filter::TemplateTypes'} ) {

        # define position of the filter in the frontend
        my $PrioCounter = 1000;

        # get all template types that should be used as filters
        TEMPLATETYPE:
        for my $TemplateType ( @{ $Self->{Config}->{'Filter::TemplateTypes'} } ) {

            # do not use empty template types
            next TEMPLATETYPE if !$TemplateType;

            # check if the template type is valid by looking up the id
            my $TemplateTypeID = $TemplateObject->TemplateTypeLookup(
                TemplateType => $TemplateType,
            );

            # do not use invalid template types
            next TEMPLATETYPE if !$TemplateTypeID;

            # increase the PrioCounter
            $PrioCounter++;

            # add filter with params for the search method
            $Filters{$TemplateType} = {
                Name   => $TemplateType,
                Prio   => $PrioCounter,
                Search => {
                    TemplateTypes    => [$TemplateType],
                    OrderBy          => \@SortByArray,
                    OrderByDirection => \@OrderByArray,
                    Limit            => 1000,
                    UserID           => $Self->{UserID},
                },
            };
        }
    }

    # get filter params
    $Self->{Filter} = $ParamObject->GetParam( Param => 'Filter' ) || 'All';

    # if only one filter exists
    if ( scalar keys %Filters == 1 ) {

        # get the name of the only filter
        my ($FilterName) = keys %Filters;

        # activate this filter
        $Self->{Filter} = $FilterName;
    }
    else {

        # add default filter, which shows all items
        $Filters{All} = {
            Name   => 'All',
            Prio   => 1000,
            Search => {
                OrderBy          => \@SortByArray,
                OrderByDirection => \@OrderByArray,
                Limit            => 1000,
                UserID           => $Self->{UserID},
            },
        };
    }

    # check if filter is valid
    if ( !$Filters{ $Self->{Filter} } ) {
        $LayoutObject->FatalError(
            Message => $LayoutObject->{LanguageObject}->Translate( 'Invalid Filter: %s!', $Self->{Filter} ),
        );
    }

    # search templates which match the selected filter
    my $IDsRef = $TemplateObject->TemplateSearch(
        %{ $Filters{ $Self->{Filter} }->{Search} },
    );

    # display all navbar filters
    my %NavBarFilter;
    for my $Filter ( sort keys %Filters ) {

        # count the number of items for each filter
        my $Count = $TemplateObject->TemplateSearch(
            %{ $Filters{$Filter}->{Search} },
            Result => 'COUNT',
        );

        # display the navbar filter
        $NavBarFilter{ $Filters{$Filter}->{Prio} } = {
            Count  => $Count,
            Filter => $Filter,
            %{ $Filters{$Filter} },
        };
    }

    # show the list
    my $LinkPage = 'Filter='
        . $LayoutObject->Ascii2Html( Text => $Self->{Filter} )
        . ';SortBy=' . $LayoutObject->Ascii2Html( Text => $SortBy )
        . ';OrderBy=' . $LayoutObject->Ascii2Html( Text => $OrderBy )
        . ';';
    my $LinkSort = 'Filter='
        . $LayoutObject->Ascii2Html( Text => $Self->{Filter} )
        . ';';
    my $LinkFilter = 'SortBy='
        . $LayoutObject->Ascii2Html( Text => $SortBy )
        . ';OrderBy=' . $LayoutObject->Ascii2Html( Text => $OrderBy )
        . ';';
    $Output .= $LayoutObject->ITSMTemplateListShow(

        TemplateIDs => $IDsRef,
        Total       => scalar @{$IDsRef},
        Filter      => $Self->{Filter},
        Filters     => \%NavBarFilter,
        FilterLink  => $LinkFilter,

        TitleName => $LayoutObject->{LanguageObject}->Translate('Overview: Template'),

        TitleValue => $Filters{ $Self->{Filter} }->{Name},

        Env      => $Self,
        LinkPage => $LinkPage,
        LinkSort => $LinkSort,

        ShowColumns => \@ShowColumns,
        OrderBy     => $OrderBy,
        SortBy      => $SortBy,
    );

    $Output .= $LayoutObject->Footer();

    return $Output;
}

1;
