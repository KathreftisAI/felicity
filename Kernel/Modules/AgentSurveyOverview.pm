# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentSurveyOverview;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get common objects
    %{$Self} = %Param;

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # ------------------------------------------------------------ #
    # show overview
    # ------------------------------------------------------------ #

    # get session object
    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

    # store last screen, used for back-links
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenView',
        Value     => $Self->{RequestedURL},
    );

    # store last screen overview
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenOverview',
        Value     => $Self->{RequestedURL},
    );

    # get config of frontend module
    my $Config = $Kernel::OM->Get('Kernel::Config')->Get("Survey::Frontend::$Self->{Action}");

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get sorting parameters
    my $SortBy = $ParamObject->GetParam( Param => 'SortBy' )
        || $Config->{'SortBy::Default'}
        || 'Number';

    # get ordering parameters
    my $OrderBy = $ParamObject->GetParam( Param => 'OrderBy' )
        || $Config->{'Order::Default'}
        || 'Down';

    # investigate refresh
    my $Refresh = $Self->{UserRefreshTime} ? 60 * $Self->{UserRefreshTime} : undef;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # output header
    my $Output = $LayoutObject->Header(
        Title   => Translatable('Overview'),
        Refresh => $Refresh,
    );
    $Output .= $LayoutObject->NavigationBar();

    # get survey list
    my @SurveyIDs = $Kernel::OM->Get('Kernel::System::Survey')->SurveySearch(
        OrderBy          => [$SortBy],
        OrderByDirection => [$OrderBy],
        UserID           => $Self->{UserID},
    );

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
    }

    # get default parameters
    my $Filter = $ParamObject->GetParam( Param => 'Filter' ) || '';
    my $View   = $ParamObject->GetParam( Param => 'View' )   || '';

    # show the list
    my $LinkPage =
        'Filter=' . $LayoutObject->Ascii2Html( Text => $Filter )
        . ';View=' . $LayoutObject->Ascii2Html( Text => $View )
        . ';SortBy=' . $LayoutObject->Ascii2Html( Text => $SortBy )
        . ';OrderBy=' . $LayoutObject->Ascii2Html( Text => $OrderBy )
        . ';';
    my $LinkSort =
        'Filter=' . $LayoutObject->Ascii2Html( Text => $Filter )
        . ';View=' . $LayoutObject->Ascii2Html( Text => $View )
        . ';';
    my $LinkFilter =
        'SortBy=' . $LayoutObject->Ascii2Html( Text => $SortBy )
        . ';OrderBy=' . $LayoutObject->Ascii2Html( Text => $OrderBy )
        . ';View=' . $LayoutObject->Ascii2Html( Text => $View )
        . ';';

    # show survey list
    $Output .= $LayoutObject->SurveyListShow(
        SurveyIDs   => \@SurveyIDs,
        Total       => scalar @SurveyIDs,
        View        => $View,
        FilterLink  => $LinkFilter,
        TitleName   => $LayoutObject->{LanguageObject}->Translate('Overview'),
        TitleValue  => $LayoutObject->{LanguageObject}->Translate('Survey'),
        Env         => $Self,
        LinkPage    => $LinkPage,
        LinkSort    => $LinkSort,
        ShowColumns => \@ShowColumns,
        SortBy      => $LayoutObject->Ascii2Html( Text => $SortBy ),
        OrderBy     => $LayoutObject->Ascii2Html( Text => $OrderBy ),
        Output      => 1,
    );

    $Output .= $LayoutObject->Footer();
    return $Output;
}

1;
