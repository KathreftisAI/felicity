# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::Layout::FAQ;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::AuthSession',
    'Kernel::System::HTMLUtils',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::Web::Request',
);

=head1 NAME

Kernel::Output::HTML::Layout::FAQ - all FAQ-related HTML functions

=head1 SYNOPSIS

All FAQ-related HTML functions

=head1 PUBLIC INTERFACE

=over 4

=cut

=item GetFAQItemVotingRateColor()
Returns a color depending on the FAQ rate

    my $VotingResultColor = $LayoutObject->GetFAQItemVotingRateColor(
        Rate => '20',
    );

Returns:

    $VotingResultColor = 'red'          # or 'orange' or 'green'

=cut

sub GetFAQItemVotingRateColor {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{Rate} ) {
        return $Self->FatalError(
            Message => Translatable('Need rate!'),
        );
    }
    my $CssTmp             = '';
    my $VotingResultColors = $Kernel::OM->Get('Kernel::Config')->Get('FAQ::Explorer::ItemList::VotingResultColors');

    for my $Key ( sort { $b <=> $a } keys %{$VotingResultColors} ) {
        if ( $Param{Rate} <= $Key ) {
            $CssTmp = $VotingResultColors->{$Key};
        }
    }
    return $CssTmp;
}

=item FAQListShow()

Returns a list of FAQ items as sortable list with pagination.

This function is similar to L<Kernel::Output::HTML::LayoutTicket::TicketListShow()>
in F<Kernel/Output/HTML/Layout/Ticket.pm>.

    my $Output = $LayoutObject->FAQListShow(
        FAQIDs     => $FAQIDsRef,                         # total list of FAQIDs, that can be listed
        Total      => scalar @{ $FAQIDsRef },             # total number of list items, in this case
        View       => $Self->{View},                      # optional, the default value is 'Small'
        Filter     => 'All',
        Filters    => \%NavBarFilter,
        FilterLink => $LinkFilter,
        TitleName  => 'Overview: FAQ',
        TitleValue => $Self->{Filter},
        Env        => $Self,
        LinkPage   => $LinkPage,
        LinkSort   => $LinkSort,
        Frontend   => 'Agent',                            # optional (Agent|Customer|Public), default: Agent, indicates from which frontend this function was called
    );

=cut

sub FAQListShow {
    my ( $Self, %Param ) = @_;

    # take object ref to local, remove it from %Param (prevent memory leak)
    my $Env = $Param{Env};
    delete $Param{Env};

    # lookup latest used view mode
    if ( !$Param{View} && $Self->{ 'UserFAQOverview' . $Env->{Action} } ) {
        $Param{View} = $Self->{ 'UserFAQOverview' . $Env->{Action} };
    }

    # set default view mode to 'small'
    my $View = $Param{View} || 'Small';

    # store latest view mode
    $Kernel::OM->Get('Kernel::System::AuthSession')->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'UserFAQOverview' . $Env->{Action},
        Value     => $View,
    );

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get backend from config
    my $Backends = $ConfigObject->Get('FAQ::Frontend::Overview') || '';
    if ( !$Backends ) {
        return $Self->FatalError(
            Message => Translatable('Need config option FAQ::Frontend::Overview'),
        );
    }

    # check for hash-ref
    if ( ref $Backends ne 'HASH' ) {
        return $Self->FatalError(
            Message => Translatable('Config option FAQ::Frontend::Overview needs to be a HASH ref!'),
        );
    }

    # check for config key
    if ( !$Backends->{$View} ) {
        return $Self->FatalError(
            Message => $Self->{LanguageObject}->Translate( 'No config option found for the view "%s"!', $View ),
        );
    }

    # navigation bar
    my $StartHit = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam(
        Param => 'StartHit',
    ) || 1;

    # get personal page shown count
    my $PageShownPreferencesKey = 'UserFAQOverview' . $View . 'PageShown';
    my $PageShown               = $Self->{$PageShownPreferencesKey} || 10;
    my $Group                   = 'FAQOverview' . $View . 'PageShown';

    # check start option, if higher then elements available, set
    # it to the last overview page (Thanks to Stefan Schmidt!)
    if ( $StartHit > $Param{Total} ) {
        my $Pages = int( ( $Param{Total} / $PageShown ) + 0.99999 );
        $StartHit = ( ( $Pages - 1 ) * $PageShown ) + 1;
    }

    # get data selection
    my %Data;
    my $Config = $ConfigObject->Get('PreferencesGroups');
    if ( $Config && $Config->{$Group} && $Config->{$Group}->{Data} ) {
        %Data = %{ $Config->{$Group}->{Data} };
    }

    # set page limit and build page navigation
    my $Limit = $Param{Limit} || 20_000;
    my %PageNav = $Self->PageNavBar(
        Limit     => $Limit,
        StartHit  => $StartHit,
        PageShown => $PageShown,
        AllHits   => $Param{Total} || 0,
        Action    => 'Action=' . $Self->{Action},
        Link      => $Param{LinkPage},
    );

    # build shown FAQ articles on a page
    $Param{RequestedURL}    = "Action=$Self->{Action}";
    $Param{Group}           = $Group;
    $Param{PreferencesKey}  = $PageShownPreferencesKey;
    $Param{PageShownString} = $Self->BuildSelection(
        Name        => $PageShownPreferencesKey,
        SelectedID  => $PageShown,
        Data        => \%Data,
        Translation => 0,
    );

    # build navigation bar content
    $Self->Block(
        Name => 'OverviewNavBar',
        Data => \%Param,
    );

    my $LinkBackID = 'FAQSearch';
    if ( $Param{Nav} && $Param{Nav} eq 'None' ) {
        $LinkBackID .= 'Small';
    }

    # back link
    if ( $Param{LinkBack} ) {
        $Self->Block(
            Name => 'OverviewNavBarPageBack',
            Data => {
                LinkBackID => $LinkBackID,
                %Param,
            },
        );
    }

    # get filters
    if ( $Param{Filters} ) {

        # get given filters
        my @NavBarFilters;
        for my $Prio ( sort keys %{ $Param{Filters} } ) {
            push @NavBarFilters, $Param{Filters}->{$Prio};
        }

        # build filter content
        $Self->Block(
            Name => 'OverviewNavBarFilter',
            Data => {
                %Param,
            },
        );

        # loop over filters
        my $Count = 0;
        for my $Filter (@NavBarFilters) {

            # increment filter count and build filter item
            $Count++;
            $Self->Block(
                Name => 'OverviewNavBarFilterItem',
                Data => {
                    %Param,
                    %{$Filter},
                },
            );

            # filter is selected
            if ( $Filter->{Filter} eq $Param{Filter} ) {
                $Self->Block(
                    Name => 'OverviewNavBarFilterItemSelected',
                    Data => {
                        %Param,
                        %{$Filter},
                    },
                );

            }
            else {
                $Self->Block(
                    Name => 'OverviewNavBarFilterItemSelectedNot',
                    Data => {
                        %Param,
                        %{$Filter},
                    },
                );
            }
        }
    }

    # loop over configured back-ends
    for my $Backend ( sort keys %{$Backends} ) {

        # build navigation bar view mode
        $Self->Block(
            Name => 'OverviewNavBarViewMode',
            Data => {
                %Param,
                %{ $Backends->{$Backend} },
                Filter => $Param{Filter},
                View   => $Backend,
            },
        );

        # current view is configured in backend
        if ( $View eq $Backend ) {
            $Self->Block(
                Name => 'OverviewNavBarViewModeSelected',
                Data => {
                    %Param,
                    %{ $Backends->{$Backend} },
                    Filter => $Param{Filter},
                    View   => $Backend,
                },
            );
        }
        else {
            $Self->Block(
                Name => 'OverviewNavBarViewModeNotSelected',
                Data => {
                    %Param,
                    %{ $Backends->{$Backend} },
                    Filter => $Param{Filter},
                    View   => $Backend,
                },
            );
        }
    }

    # check if page navigation is available
    if (%PageNav) {
        $Self->Block(
            Name => 'OverviewNavBarPageNavBar',
            Data => \%PageNav,
        );

        # don't show context settings in AJAX case (e. g. in customer FAQ history),
        # because the submit with page reload will not work there
        if ( !$Param{AJAX} ) {
            $Self->Block(
                Name => 'ContextSettings',
                Data => {
                    %PageNav,
                    %Param,
                },
            );
        }
    }

    # build HTML content
    my $OutputNavBar = $Self->Output(
        TemplateFile => 'AgentFAQOverviewNavBar',
        Data         => {
            View => $View,
            %Param,
        },
    );

    # create output
    my $OutputRaw = '';
    if ( !$Param{Output} ) {
        $Self->Print(
            Output => \$OutputNavBar,
        );
    }
    else {
        $OutputRaw = $OutputNavBar;
    }

    # load module
    if ( !$Kernel::OM->Get('Kernel::System::Main')->Require( $Backends->{$View}->{Module} ) ) {
        return $Self->FatalError();
    }

    # check for backend object
    my $Object = $Backends->{$View}->{Module}->new( %{$Env} );
    return if !$Object;

    # run module
    my $Output = $Object->Run(
        %Param,
        Limit     => $Limit,
        StartHit  => $StartHit,
        PageShown => $PageShown,
        AllHits   => $Param{Total} || 0,
        Frontend  => $Param{Frontend} || 'Agent',
        Nav       => $Param{Nav} || '',
        TitleSize => $Param{FAQTitleSize},
    );

    # create output
    if ( !$Param{Output} ) {
        $Self->Print(
            Output => \$Output,
        );
    }
    else {
        $OutputRaw .= $Output;
    }

    # create overview navigation bar
    $Self->Block(
        Name => 'OverviewNavBar',
        Data => {%Param},
    );

    # return content if available
    return $OutputRaw;
}

=item FAQContentShow()

Outputs the necessary DTL blocks to display the FAQ item fields for the supplied FAQ item ID.
The fields displayed are also restricted by the permissions represented by the supplied interface

If exist ReturnContent parameter it returns the FAQ items fields on a HTML formated string

    $LayoutObject->FAQContentShow(
        FAQObject       => $FAQObject,                 # needed for core module interaction
        FAQData         => %{ $FAQData },
        InterfaceStates => $Self->{InterfaceStates},
        UserID          => 1,
    );

    my $Content = $LayoutObject->FAQContentShow(
        FAQObject       => $FAQObject,                 # needed for core module interaction
        FAQData         => %{ $FAQData },
        InterfaceStates => $Self->{InterfaceStates},
        UserID          => 1,
        ReturnContent   => 1,
    );

=cut

sub FAQContentShow {
    my ( $Self, %Param ) = @_;

    # check parameters
    for my $ParamName (qw(FAQObject FAQData InterfaceStates UserID)) {
        if ( !$Param{$ParamName} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $ParamName!",
            );
            return;
        }
    }

    # store FAQ object locally
    my $FAQObject = $Param{FAQObject};

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get the config of FAQ fields that should be shown
    my %Fields;
    FIELD:
    for my $Number ( 1 .. 6 ) {

        # get config of FAQ field
        my $Config = $ConfigObject->Get( 'FAQ::Item::Field' . $Number );

        # skip over not shown fields
        next FIELD if !$Config->{Show};

        # store only the config of fields that should be shown
        $Fields{"Field$Number"} = $Config;
    }

    my $FullContent;

    # sort shown fields by priority
    FIELD:
    for my $Field ( sort { $Fields{$a}->{Prio} <=> $Fields{$b}->{Prio} } keys %Fields ) {

        # get the state type data of this field
        my $StateTypeData = $FAQObject->StateTypeGet(
            Name   => $Fields{$Field}->{Show},
            UserID => $Param{UserID},
        );

        # do not show fields that are not allowed in the given interface
        next FIELD if !$Param{InterfaceStates}->{ $StateTypeData->{StateID} };

        my $Caption = $Fields{$Field}->{'Caption'};
        my $Content = $Param{FAQData}->{$Field} || '';

        # remove active HTML content (scripts, applets, etc...)
        my %SafeContent = $Kernel::OM->Get('Kernel::System::HTMLUtils')->Safety(
            String       => $Content,
            NoApplet     => 1,
            NoObject     => 1,
            NoEmbed      => 1,
            NoIntSrcLoad => 0,
            NoExtSrcLoad => 0,
            NoJavaScript => 1,
        );

        # take the safe content if necessary
        if ( $SafeContent{Replace} ) {
            $Content = $SafeContent{String};
        }

        # show the field
        $Self->Block(
            Name => 'FAQContent',
            Data => {
                ItemID    => $Param{FAQData}->{ItemID},
                Field     => $Field,
                Caption   => $Caption,
                StateName => $StateTypeData->{Name},
                Content   => $Content,
            },
        );

        if ( $ConfigObject->Get('FAQ::Item::HTML') && $Self->{BrowserRichText} ) {

            $Self->Block(
                Name => 'FAQContentHTML',
                Data => {
                    ItemID => $Param{FAQData}->{ItemID},
                    Field  => $Field,
                },
            );
        }
        else {

            # convert fields ASCII if needed
            if ( $Param{FAQData}->{ContentType} ne 'text/plain' ) {
                $Content = $Kernel::OM->Get('Kernel::System::HTMLUtils')->ToAscii(
                    String => $Content,
                ) || '';
            }

            $Self->Block(
                Name => 'FAQContentPlain',
                Data => {
                    Content => $Content,
                },
            );
        }

        # store the field to return all FAQ Body
        if ( $Param{ReturnContent} && $Content ) {

            # get the internal state type
            my $InternalStateType = $FAQObject->StateTypeGet(
                Name   => 'internal',
                UserID => $Param{UserID},
            );

            # check if current field is internal
            my $IsInternal;
            if ( $StateTypeData->{StateID} == $InternalStateType->{StateID} ) {
                $IsInternal = 1;
            }

            # get configuration options for Ticket Compose
            my $TicketComposeConfig = $ConfigObject->Get('FAQ::TicketCompose');

            # Check if field should be part of the returning string
            if ( $TicketComposeConfig->{IncludeInternal} || !$IsInternal ) {

                # Check if field name should be returned
                if ( $TicketComposeConfig->{ShowFieldNames} ) {
                    $FullContent .= $Self->{LanguageObject}->Translate($Caption) . ' <br/> ';
                }
                $FullContent .= $Content . ' <br/> ';
            }
        }
    }

    # return all the (permitted) FAQ body
    if ( $Param{ReturnContent} ) {
        if ($FullContent) {
            return $FullContent;
        }
        return $Self->{LanguageObject}->Translate('This article is empty!');
    }

    return 1;
}

=item FAQPathShow()

if its allowed by the configuration, outputs the necessary DTL blocks to display the FAQ item path,
and returns the value 1.

    my $ShowPathOk = $LayoutObject->FAQPathShow(
        FAQObject   => $FAQObject,                   # needed for core module interaction
        CategoryID  => 5,
        UserID      => 1,
        PathForItem => 1,                            # optional (default 0)
        Nav         => 'none',                       # optional
    );

=cut

sub FAQPathShow {
    my ( $Self, %Param ) = @_;

    # check parameters
    for my $ParamName (qw(FAQObject UserID)) {
        if ( !$Param{$ParamName} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $ParamName!",
            );
            return;
        }
    }

    $Param{PathForItem} ||= 0;

    # check parameters
    if ( !defined $Param{CategoryID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need CategoryID!',
        );
        return;
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $Block = 'FAQPathCategoryElement';
    if ( $Param{CategoryID} eq '0' ) {
        $Block = 'FAQPathCategoryElementNoLink';
    }

    # output category root
    $Self->Block(
        Name => $Block,
        Data => {
            Name       => $ConfigObject->Get('FAQ::Default::RootCategoryName'),
            CategoryID => 0,
            Nav        => $Param{Nav},
        },
    );

    # get Show FAQ Path setting
    my $ShowPath = $ConfigObject->Get('FAQ::Explorer::Path::Show');

    # do not display the path if setting is off
    return if !$ShowPath;

    # store FAQ object locally
    my $FAQObject = $Param{FAQObject};

    # get category list to construct the path
    my $CategoryList = $FAQObject->FAQPathListGet(
        CategoryID => $Param{CategoryID},
        UserID     => $Param{UserID},
    );

    # output subcategories
    for my $CategoryData ( @{$CategoryList} ) {

        $Block = 'FAQPathCategoryElement';
        if (
            $CategoryData->{CategoryID} == $CategoryList->[-1]->{CategoryID}
            && !$Param{PathForItem}
            )
        {
            $Block = 'FAQPathCategoryElementNoLink';
        }

        $Self->Block(
            Name => $Block,
            Data => {
                Nav => $Param{Nav},
                %{$CategoryData},
            },
        );
    }
    return 1;
}

=item FAQRatingStarsShow()

Outputs the necessary DTL blocks to represent the FAQ item rating
as "Stars" in the scale from 1 to 5.

    $LayoutObject->FAQRatingStarsShow(
        VoteResult => $FAQData->{VoteResult},
        Votes      => $FAQData ->{Votes},
    );

=cut

sub FAQRatingStarsShow {
    my ( $Self, %Param ) = @_;

    # check parameters
    for my $ParamName (qw(VoteResult Votes)) {
        if ( !defined $Param{$ParamName} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $ParamName!",
            );
            return;
        }
    }

    # get stars by multiply by 5 and divide by 100
    # 100 because Vote result is a %
    # 5 because we have only 5 stars
    my $StarCounter = int( $Param{VoteResult} * 0.05 );
    if ( $StarCounter < 5 ) {

        # add 1 because lowest value should be 1
        $StarCounter++;
    }

    # the number of stars can't be grater that 5
    elsif ( $StarCounter > 5 ) {
        $StarCounter = 5;
    }

    # output rating block
    $Self->Block(
        Name => 'ViewRating',
        Data => {
            %Param,
        },
    );

    # do not output any star if this FAQ has been not voted
    if ( $Param{Votes} eq '0' ) {
        $StarCounter = 0;
    }

    # show stars only if the FAQ item has been voted at least once even if the $VoteResult is 0
    else {

        # output stars
        for ( 1 .. $StarCounter ) {
            $Self->Block(
                Name => 'RateStars',
            );
        }
    }

    # output stars text
    $Self->Block(
        Name => 'RateStarsCount',
        Data => { Stars => $StarCounter },
    );

    return 1;
}

=item FAQShowLatestNewsBox()

Shows an info box with the last updated or last created FAQ articles.
Depending on the uses interface (agent, customer, public) only the appropriate
articles are shown here.

    $LayoutObject->FAQShowLatestNewsBox(
        FAQObject       => $FAQObject,                 # needed for core module interaction
        Type            => 'LastCreate',               # (LastCreate | LastChange)
        Mode            => 'Public',                   # (Agent, Customer, Public)
        CategoryID      => 5,
        Interface       => $Self->{Interface},
        InterfaceStates => $Self->{InterfaceStates},
        UserID          => 1,
        Nav             => 'none',                     # optional
    );

=cut

sub FAQShowLatestNewsBox {
    my ( $Self, %Param ) = @_;

    # check parameters
    for my $ParamName (qw(FAQObject Type Mode Interface InterfaceStates UserID)) {
        if ( !$Param{$ParamName} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $ParamName!",
            );
            return;
        }
    }

    # check needed stuff
    if ( !defined $Param{CategoryID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need CategoryID!",
        );
        return;
    }

    # check type
    if ( $Param{Type} !~ m{ LastCreate | LastChange }xms ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Type must be either LastCreate or LastChange!',
        );
        return;
    }

    # check mode
    if ( $Param{Mode} !~ m{ Agent | Customer | Public }xms ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Mode must be either Agent, Customer or Public!',
        );
        return;
    }

    # check CustomerUser
    if ( $Param{Mode} eq 'Customer' && !$Param{CustomerUser} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need CustomerUser!',
        );
        return;
    }

    # set order by search parameter and header based on type
    my $OrderBy;
    my $Header;
    my $RSSTitle;
    if ( $Param{Type} eq 'LastCreate' ) {
        $OrderBy  = 'Created';
        $Header   = Translatable('Latest created FAQ articles');
        $RSSTitle = Translatable('FAQ Articles (new created)');
    }
    elsif ( $Param{Type} eq 'LastChange' ) {
        $OrderBy  = 'Changed';
        $Header   = Translatable('Latest updated FAQ articles');
        $RSSTitle = Translatable('FAQ Articles (recently changed)');
    }

    my $Result = -1;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # show last added/updated articles
    my $Show = $ConfigObject->Get("FAQ::Explorer::$Param{Type}::Show");
    if ( $Show->{ $Param{Interface}->{Name} } ) {

        # store FAQ object locally
        my $FAQObject = $Param{FAQObject};

        # to store search param for categories
        my %CategorySearchParam;

        # if subcategories should also be shown
        if ( $ConfigObject->Get("FAQ::Explorer::$Param{Type}::ShowSubCategoryItems") ) {

            # find the subcategories of this category
            my $SubCategoryIDsRef = $FAQObject->CategorySubCategoryIDList(
                ParentID     => $Param{CategoryID},
                Mode         => $Param{Mode},
                ItemStates   => $Param{InterfaceStates},
                CustomerUser => $Param{CustomerUser} || '',
                UserID       => $Param{UserID},
            );

            # search in the given category and add the subcategory
            $CategorySearchParam{CategoryIDs} = [ $Param{CategoryID}, @{$SubCategoryIDsRef} ];
        }

        # a category is given and subcategories should not be shown
        elsif ( $Param{CategoryID} ) {

            # search only in the given category
            $CategorySearchParam{CategoryIDs} = [ $Param{CategoryID} ];
        }

        # search the FAQ articles
        my @ItemIDs = $FAQObject->FAQSearch(
            States           => $Param{InterfaceStates},
            OrderBy          => [$OrderBy],
            OrderByDirection => ['Down'],
            Interface        => $Param{Interface},
            Limit            => $ConfigObject->Get("FAQ::Explorer::$Param{Type}::Limit") || 5,
            UserID           => $Param{UserID},
            %CategorySearchParam,
        );

        # there is something to show
        if (@ItemIDs) {

            $Result = 1;

            # show the info box
            $Self->Block(
                Name => 'InfoBoxFAQMiniList',
                Data => {
                    Header => $Header,
                },
            );

            # show the RSS Feed icon
            if ( $Param{Mode} eq 'Public' ) {

                $Self->Block(
                    Name => 'InfoBoxFAQMiniListNewsRSS',
                    Data => {
                        Type  => $OrderBy,
                        Title => $RSSTitle,
                    },
                );
            }

            for my $ItemID (@ItemIDs) {

                # get FAQ data
                my %FAQData = $FAQObject->FAQGet(
                    ItemID     => $ItemID,
                    ItemFields => 1,
                    UserID     => $Param{UserID},
                );

                # show the article row
                $Self->Block(
                    Name => 'InfoBoxFAQMiniListItemRow',
                    Data => {
                        Nav => $Param{Nav},
                        %FAQData,
                    },
                );
            }
        }
    }

    return $Result;
}

=item FAQShowTop10()

Shows an info box with the Top 10 FAQ articles.
Depending on the uses interface (agent, customer, public) only the appropriate
articles are shown here.

    $LayoutObject->FAQShowTop10(
        FAQObject       => $FAQObject,                 # needed for core module interaction
        Mode            => 'Public',                   # (Agent, Customer, Public)
        CategoryID      => 5,
        Interface       => $Self->{Interface},
        InterfaceStates => $Self->{InterfaceStates},
        UserID          => 1,
        Nav             => 'none',                     # optional
    );

=cut

sub FAQShowTop10 {
    my ( $Self, %Param ) = @_;

    # check parameters
    for my $ParamName (qw(FAQObject Mode Interface InterfaceStates UserID)) {
        if ( !$Param{$ParamName} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $ParamName!",
            );
            return;
        }
    }

    # check needed stuff
    if ( !defined $Param{CategoryID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need CategoryID!",
        );
        return;
    }

    # check mode
    if ( $Param{Mode} !~ m{ Agent | Customer | Public }xms ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Mode must be either Agent, Customer or Public!',
        );
        return;
    }

    # check CustomerUser
    if ( $Param{Mode} eq 'Customer' && !$Param{CustomerUser} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need CustomerUser!',
        );
        return;
    }

    my $Result = -1;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # show last added/updated articles
    my $Show = $ConfigObject->Get('FAQ::Explorer::Top10::Show');
    if ( $Show->{ $Param{Interface}->{Name} } ) {

        # store FAQ object locally
        my $FAQObject = $Param{FAQObject};

        # to store search param for categories
        my %CategorySearchParam;

        # if subcategories should also be shown
        if ( $ConfigObject->Get('FAQ::Explorer::Top10::ShowSubCategoryItems') ) {

            # find the subcategories of this category
            my $SubCategoryIDsRef = $FAQObject->CategorySubCategoryIDList(
                ParentID     => $Param{CategoryID},
                Mode         => $Param{Mode},
                ItemStates   => $Param{InterfaceStates},
                CustomerUser => $Param{CustomerUser} || '',
                UserID       => $Param{UserID},
            );

            # search in the given category and add the subcategory
            $CategorySearchParam{CategoryIDs} = [ $Param{CategoryID}, @{$SubCategoryIDsRef} ];
        }

        # get the top 10 articles for categories with at least ro permissions
        my $Top10ItemIDsRef = $FAQObject->FAQTop10Get(
            Interface => $Param{Interface}->{Name},
            Limit     => $ConfigObject->Get('FAQ::Explorer::Top10::Limit') || 10,
            UserID    => $Param{UserID},
            %CategorySearchParam,
        ) || [];

        # there is something to show
        if ( $Top10ItemIDsRef && ref $Top10ItemIDsRef eq 'ARRAY' && @{$Top10ItemIDsRef} ) {

            $Result = 1;

            # show the info box
            $Self->Block(
                Name => 'InfoBoxFAQMiniList',
                Data => {
                    Header => Translatable('Top 10 FAQ articles'),
                },
            );

            # show the RSS Feed icon
            if ( $Param{Mode} eq 'Public' ) {

                $Self->Block(
                    Name => 'InfoBoxFAQMiniListNewsRSS',
                    Data => {
                        Type  => 'Top10',
                        Title => Translatable('FAQ Articles (Top 10)'),
                    },
                );
            }

            my $Number;
            for my $Top10Item ( @{$Top10ItemIDsRef} ) {

                # increase the number
                $Number++;

                # get FAQ data
                my %FAQData = $FAQObject->FAQGet(
                    ItemID     => $Top10Item->{ItemID},
                    ItemFields => 1,
                    UserID     => $Param{UserID},
                );

                # show the article row
                $Self->Block(
                    Name => 'InfoBoxFAQMiniListItemRow',
                    Data => {
                        Nav => $Param{Nav},
                        %FAQData,
                    },
                );

                # show the Top-10 position number
                $Self->Block(
                    Name => 'InfoBoxFAQMiniListItemRowPositionNumber',
                    Data => {
                        Number => $Number,
                    },
                );
            }
        }
    }

    return $Result;
}

=item FAQShowQuickSearch()

Shows an info box with the Quick Search.

    $LayoutObject->FAQShowQuickSearch(
        Mode            => 'Public',                   # (Agent, Customer, Public)
        Interface       => $Self->{Interface},
        InterfaceStates => $Self->{InterfaceStates},
        UserID          => 1,
        Nav             => 'none',                     # optional
        SearchBackLink  => $Base64EncodedUrl,          # optional
    );

=cut

sub FAQShowQuickSearch {
    my ( $Self, %Param ) = @_;

    # check parameters
    for my $ParamName (qw(Mode Interface InterfaceStates UserID)) {
        if ( !$Param{$ParamName} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $ParamName!",
            );
            return;
        }
    }

    # check mode
    if ( $Param{Mode} !~ m{ Agent | AgentSmall | Customer | Public }xms ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Mode must be either Agent, Customer or Public!',
        );
        return;
    }

    # set action module
    my $Action;
    if ( $Param{Mode} eq 'AgentSmall' ) {
        $Action = 'AgentFAQSearchSmall';
    }
    else {
        $Action = $Param{Mode} . 'FAQSearch';
    }

    # check CustomerUser
    if ( $Param{Mode} eq 'Customer' && !$Param{CustomerUser} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need CustomerUser!',
        );
        return;
    }

    # show quick search
    my $Show = $Kernel::OM->Get('Kernel::Config')->Get('FAQ::Explorer::QuickSearch::Show');
    if ( $Show->{ $Param{Interface}->{Name} } || $Param{Mode} eq 'AgentSmall' ) {

        # call QuickSearch block
        $Self->Block(
            Name => 'QuickSearch',
            Data => {
                Action         => $Action,
                Nav            => $Param{Nav} || '',
                SearchBackLink => $Param{SearchBackLink} || '',
            },
        );
    }

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
