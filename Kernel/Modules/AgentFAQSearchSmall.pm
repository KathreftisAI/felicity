# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentFAQSearchSmall;

use strict;
use warnings;

use Kernel::Language qw(Translatable);
use Kernel::System::VariableCheck qw(:all);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # get config for frontend
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("FAQ::Frontend::AgentFAQSearch");

    # get the dynamic fields for FAQ object
    $Self->{DynamicField} = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => 'FAQ',
        FieldFilter => $Self->{Config}->{DynamicField} || {},
    );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Output;

    # get needed object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get config from the constructor
    my $Config = $Self->{Config};

    # get config data
    my $StartHit = int( $ParamObject->GetParam( Param => 'StartHit' ) || 1 );
    my $SearchLimit = $Config->{SearchLimit} || 500;
    my $SortBy = $ParamObject->GetParam( Param => 'SortBy' )
        || $Config->{'SortBy::Default'}
        || 'FAQID';
    my $OrderBy = $ParamObject->GetParam( Param => 'OrderBy' )
        || $Config->{'Order::Default'}
        || 'Down';
    my $Profile        = $ParamObject->GetParam( Param => 'Profile' )        || '';
    my $SaveProfile    = $ParamObject->GetParam( Param => 'SaveProfile' )    || '';
    my $TakeLastSearch = $ParamObject->GetParam( Param => 'TakeLastSearch' ) || '';
    my $EraseTemplate  = $ParamObject->GetParam( Param => 'EraseTemplate' )  || '';
    my $Nav            = $ParamObject->GetParam( Param => 'Nav' )            || '';

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # search with a saved template
    if ( $ParamObject->GetParam( Param => 'SearchTemplate' ) && $Profile ) {
        return $LayoutObject->Redirect(
            OP =>
                "Action=AgentFAQSearchSmall;Subaction=Search;TakeLastSearch=1;SaveProfile=1;Profile=$Profile;Nav=$Nav"
        );
    }

    # get single params
    my %GetParam;

    # get dynamic field backend object
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    # get search profile object
    my $SearchProfileObject = $Kernel::OM->Get('Kernel::System::SearchProfile');

    # load profiles string params (press load profile)
    if ( ( $Self->{Subaction} eq 'LoadProfile' && $Profile ) || $TakeLastSearch ) {
        %GetParam = $SearchProfileObject->SearchProfileGet(
            Base      => 'FAQSearch',
            Name      => $Profile,
            UserLogin => $Self->{UserLogin},
        );
    }

    # get search string params (get submitted params)
    else {

        # get scalar search params
        for my $ParamName (
            qw(Number Title Keyword Fulltext ResultForm VoteSearch VoteSearchType VoteSearchOption
            RateSearch RateSearchType RateSearchOption ApprovedSearch
            TimeSearchType ChangeTimeSearchType
            ItemCreateTimePointFormat ItemCreateTimePoint
            ItemCreateTimePointStart
            ItemCreateTimeStart ItemCreateTimeStartDay ItemCreateTimeStartMonth
            ItemCreateTimeStartYear
            ItemCreateTimeStop ItemCreateTimeStopDay ItemCreateTimeStopMonth
            ItemCreateTimeStopYear
            ItemChangeTimePointFormat ItemChangeTimePoint
            ItemChangeTimePointStart
            ItemChangeTimeStart ItemChangeTimeStartDay ItemChangeTimeStartMonth
            ItemChangeTimeStartYear
            ItemChangeTimeStop ItemChangeTimeStopDay ItemChangeTimeStopMonth
            ItemChangeTimeStopYear
            )
            )
        {
            $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );

            # remove whitespace on the start and end
            if ( $GetParam{$ParamName} ) {
                $GetParam{$ParamName} =~ s{ \A \s+ }{}xms;
                $GetParam{$ParamName} =~ s{ \s+ \z }{}xms;
            }
        }

        # get array search params
        for my $SearchParam (
            qw(CategoryIDs LanguageIDs ValidIDs StateIDs CreatedUserIDs LastChangedUserIDs)
            )
        {
            my @Array = $ParamObject->GetArray( Param => $SearchParam );
            if (@Array) {
                $GetParam{$SearchParam} = \@Array;
            }
        }

        # get Dynamic fields from param object
        # cycle trough the activated Dynamic Fields for this screen
        DYNAMICFIELD:
        for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
            next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

            # get search field preferences
            my $SearchFieldPreferences = $DynamicFieldBackendObject->SearchFieldPreferences(
                DynamicFieldConfig => $DynamicFieldConfig,
            );

            next DYNAMICFIELD if !IsArrayRefWithData($SearchFieldPreferences);

            PREFERENCE:
            for my $Preference ( @{$SearchFieldPreferences} ) {

                # extract the dynamic field value from the web request
                my $DynamicFieldValue = $DynamicFieldBackendObject->SearchFieldValueGet(
                    DynamicFieldConfig     => $DynamicFieldConfig,
                    ParamObject            => $ParamObject,
                    ReturnProfileStructure => 1,
                    LayoutObject           => $LayoutObject,
                    Type                   => $Preference->{Type},
                );

                # set the complete value structure in GetParam to store it later in the search profile
                if ( IsHashRefWithData($DynamicFieldValue) ) {
                    %GetParam = ( %GetParam, %{$DynamicFieldValue} );
                }
            }
        }
    }

    # get approved option
    if ( $GetParam{ApprovedSearch} && $GetParam{ApprovedSearch} eq 'Yes' ) {
        $GetParam{Approved} = 1;
    }
    elsif ( $GetParam{ApprovedSearch} && $GetParam{ApprovedSearch} eq 'No' ) {
        $GetParam{Approved} = 0;
    }

    # get vote option
    if ( !$GetParam{VoteSearchOption} ) {
        $GetParam{'VoteSearchOption::None'} = 'checked="checked"';
    }
    elsif ( $GetParam{VoteSearchOption} eq 'VotePoint' ) {
        $GetParam{'VoteSearchOption::VotePoint'} = 'checked="checked"';
    }

    # get rate option
    if ( !$GetParam{RateSearchOption} ) {
        $GetParam{'RateSearchOption::None'} = 'checked="checked"';
    }
    elsif ( $GetParam{RateSearchOption} eq 'RatePoint' ) {
        $GetParam{'RateSearchOption::RatePoint'} = 'checked="checked"';
    }

    # get create time option
    if ( !$GetParam{TimeSearchType} ) {
        $GetParam{'TimeSearchType::None'} = 'checked="checked"';
    }
    elsif ( $GetParam{TimeSearchType} eq 'TimePoint' ) {
        $GetParam{'TimeSearchType::TimePoint'} = 'checked="checked"';
    }
    elsif ( $GetParam{TimeSearchType} eq 'TimeSlot' ) {
        $GetParam{'TimeSearchType::TimeSlot'} = 'checked="checked"';
    }

    # get change time option
    if ( !$GetParam{ChangeTimeSearchType} ) {
        $GetParam{'ChangeTimeSearchType::None'} = 'checked="checked"';
    }
    elsif ( $GetParam{ChangeTimeSearchType} eq 'TimePoint' ) {
        $GetParam{'ChangeTimeSearchType::TimePoint'} = 'checked="checked"';
    }
    elsif ( $GetParam{ChangeTimeSearchType} eq 'TimeSlot' ) {
        $GetParam{'ChangeTimeSearchType::TimeSlot'} = 'checked="checked"';
    }

    # set result form ENV
    if ( !$GetParam{ResultForm} ) {
        $GetParam{ResultForm} = '';
    }

    # show result site
    if ( $Self->{Subaction} eq 'Search' && !$EraseTemplate ) {

        # fill up profile name (e.g. with last-search)
        if ( !$Profile || !$SaveProfile ) {
            $Profile = 'last-search';
        }

        # get session object
        my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

        # store last overview screen
        my $URL = "Action=AgentFAQSearchSmall;Subaction=Search"
            . ";Profile=" . $LayoutObject->LinkEncode($Profile)
            . ";SortBy=" . $LayoutObject->LinkEncode($SortBy)
            . ";OrderBy=" . $LayoutObject->LinkEncode($OrderBy)
            . ";TakeLastSearch=1"
            . ";StartHit=" . $LayoutObject->LinkEncode($StartHit)
            . ";Nav=$Nav";

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

        # save search profile (under last-search or real profile name)
        $SaveProfile = 1;

        # remember last search values
        if ( $SaveProfile && $Profile ) {

            # remove old profile stuff
            $SearchProfileObject->SearchProfileDelete(
                Base      => 'FAQSearch',
                Name      => $Profile,
                UserLogin => $Self->{UserLogin},
            );

            # insert new profile params
            for my $Key ( sort keys %GetParam ) {
                if ( $GetParam{$Key} ) {
                    $SearchProfileObject->SearchProfileAdd(
                        Base      => 'FAQSearch',
                        Name      => $Profile,
                        Key       => $Key,
                        Value     => $GetParam{$Key},
                        UserLogin => $Self->{UserLogin},
                    );
                }
            }
        }

        # prepare votes search
        if ( IsNumber( $GetParam{VoteSearch} ) && $GetParam{VoteSearchOption} ) {
            $GetParam{Votes} = {
                $GetParam{VoteSearchType} => $GetParam{VoteSearch}
            };
        }

        # prepare rate search
        if ( IsNumber( $GetParam{RateSearch} ) && $GetParam{RateSearchOption} ) {
            $GetParam{Rate} = {
                $GetParam{RateSearchType} => $GetParam{RateSearch}
            };
        }

        my %TimeMap = (
            ItemCreate => 'Time',
            ItemChange => 'ChangeTime',
        );

        for my $TimeType ( sort keys %TimeMap ) {

            # get create time settings
            if ( !$GetParam{ $TimeMap{$TimeType} . 'SearchType' } ) {

                # do nothing with time stuff
            }
            elsif ( $GetParam{ $TimeMap{$TimeType} . 'SearchType' } eq 'TimeSlot' ) {
                for my $Key (qw(Month Day)) {
                    $GetParam{ $TimeType . 'TimeStart' . $Key }
                        = sprintf( "%02d", $GetParam{ $TimeType . 'TimeStart' . $Key } );
                    $GetParam{ $TimeType . 'TimeStop' . $Key }
                        = sprintf( "%02d", $GetParam{ $TimeType . 'TimeStop' . $Key } );
                }
                if (
                    $GetParam{ $TimeType . 'TimeStartDay' }
                    && $GetParam{ $TimeType . 'TimeStartMonth' }
                    && $GetParam{ $TimeType . 'TimeStartYear' }
                    )
                {
                    $GetParam{ $TimeType . 'TimeNewerDate' } = $GetParam{ $TimeType . 'TimeStartYear' } . '-'
                        . $GetParam{ $TimeType . 'TimeStartMonth' } . '-'
                        . $GetParam{ $TimeType . 'TimeStartDay' }
                        . ' 00:00:00';
                }
                if (
                    $GetParam{ $TimeType . 'TimeStopDay' }
                    && $GetParam{ $TimeType . 'TimeStopMonth' }
                    && $GetParam{ $TimeType . 'TimeStopYear' }
                    )
                {
                    $GetParam{ $TimeType . 'TimeOlderDate' } = $GetParam{ $TimeType . 'TimeStopYear' } . '-'
                        . $GetParam{ $TimeType . 'TimeStopMonth' } . '-'
                        . $GetParam{ $TimeType . 'TimeStopDay' }
                        . ' 23:59:59';
                }
            }
            elsif ( $GetParam{ $TimeMap{$TimeType} . 'SearchType' } eq 'TimePoint' ) {
                if (
                    $GetParam{ $TimeType . 'TimePoint' }
                    && $GetParam{ $TimeType . 'TimePointStart' }
                    && $GetParam{ $TimeType . 'TimePointFormat' }
                    )
                {
                    my $Time = 0;
                    if ( $GetParam{ $TimeType . 'TimePointFormat' } eq 'minute' ) {
                        $Time = $GetParam{ $TimeType . 'TimePoint' };
                    }
                    elsif ( $GetParam{ $TimeType . 'TimePointFormat' } eq 'hour' ) {
                        $Time = $GetParam{ $TimeType . 'TimePoint' } * 60;
                    }
                    elsif ( $GetParam{ $TimeType . 'TimePointFormat' } eq 'day' ) {
                        $Time = $GetParam{ $TimeType . 'TimePoint' } * 60 * 24;
                    }
                    elsif ( $GetParam{ $TimeType . 'TimePointFormat' } eq 'week' ) {
                        $Time = $GetParam{ $TimeType . 'TimePoint' } * 60 * 24 * 7;
                    }
                    elsif ( $GetParam{ $TimeType . 'TimePointFormat' } eq 'month' ) {
                        $Time = $GetParam{ $TimeType . 'TimePoint' } * 60 * 24 * 30;
                    }
                    elsif ( $GetParam{ $TimeType . 'TimePointFormat' } eq 'year' ) {
                        $Time = $GetParam{ $TimeType . 'TimePoint' } * 60 * 24 * 365;
                    }
                    if ( $GetParam{ $TimeType . 'TimePointStart' } eq 'Before' ) {

                        # more than ... ago
                        $GetParam{ $TimeType . 'TimeOlderMinutes' } = $Time;
                    }
                    elsif ( $GetParam{ $TimeType . 'TimePointStart' } eq 'Next' ) {

                        # within next
                        $GetParam{ $TimeType . 'TimeNewerMinutes' } = 0;
                        $GetParam{ $TimeType . 'TimeOlderMinutes' } = -$Time;
                    }
                    else {
                        # within last ...
                        $GetParam{ $TimeType . 'TimeOlderMinutes' } = 0;
                        $GetParam{ $TimeType . 'TimeNewerMinutes' } = $Time;
                    }
                }
            }
        }

        # prepare full-text search
        if ( $GetParam{Fulltext} ) {
            $GetParam{ContentSearch} = 'OR';
            $GetParam{What}          = $GetParam{Fulltext};
        }

        # get valid list
        my %ValidList   = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();
        my @AllValidIDs = keys %ValidList;

        # get FAQ object
        my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

        # set default interface settings
        my $Interface = $FAQObject->StateTypeGet(
            Name   => 'internal',
            UserID => $Self->{UserID},
        );
        my $InterfaceStates = $FAQObject->StateTypeList(
            Types  => $ConfigObject->Get('FAQ::Agent::StateTypes'),
            UserID => $Self->{UserID},
        );

        # prepare search states
        my $SearchStates;
        if ( !IsArrayRefWithData( $GetParam{StateIDs} ) ) {
            $SearchStates = $InterfaceStates;
        }
        else {
            STATETYPEID:
            for my $StateTypeID ( @{ $GetParam{StateIDs} } ) {
                next STATETYPEID if !$StateTypeID;
                next STATETYPEID if !$InterfaceStates->{$StateTypeID};
                $SearchStates->{$StateTypeID} = $InterfaceStates->{$StateTypeID};
            }
        }

        # prepare votes search
        if ( IsNumber( $GetParam{VoteSearch} ) && $GetParam{VoteSearchOption} ) {
            $GetParam{Votes} = {
                $GetParam{VoteSearchType} => $GetParam{VoteSearch}
            };
        }

        # prepare rate search
        if ( IsNumber( $GetParam{RateSearch} ) && $GetParam{RateSearchOption} ) {
            $GetParam{Rate} = {
                $GetParam{RateSearchType} => $GetParam{RateSearch}
            };
        }

        # dynamic fields search parameters for FAQ search
        my %DynamicFieldSearchParameters;

        # cycle trough the activated Dynamic Fields for this screen
        DYNAMICFIELD:
        for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
            next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

            # get search field preferences
            my $SearchFieldPreferences = $DynamicFieldBackendObject->SearchFieldPreferences(
                DynamicFieldConfig => $DynamicFieldConfig,
            );

            next DYNAMICFIELD if !IsArrayRefWithData($SearchFieldPreferences);

            PREFERENCE:
            for my $Preference ( @{$SearchFieldPreferences} ) {

                # extract the dynamic field value from the profile
                my $SearchParameter = $DynamicFieldBackendObject->SearchFieldParameterBuild(
                    DynamicFieldConfig => $DynamicFieldConfig,
                    Profile            => \%GetParam,
                    LayoutObject       => $LayoutObject,
                    Type               => $Preference->{Type},
                );

                # set search parameter
                if ( defined $SearchParameter ) {
                    $DynamicFieldSearchParameters{ 'DynamicField_' . $DynamicFieldConfig->{Name} }
                        = $SearchParameter->{Parameter};
                }
            }
        }

        # Get UserCategoryGroup Hash
        # This returns a Hash of the following sample data structure:
        #
        # $UserCatGroup = {
        #   '1' => {
        #          '3' => 'MiscSub'
        #        },
        #   '3' => {},
        #   '0' => {
        #            '1' => 'Misc',
        #            '2' => 'secret'
        #          },
        #   '2' => {}
        # };
        #
        # Keys of the outer hash inform about subcategories
        # 0 Shows top level CategoryIDs.
        # 1 Shows the SubcategoryIDs of Category 1.
        # 2 and 3 are empty hashes because these categories don't have subcategories.
        #
        # Keys of the inner hashes are CategoryIDs a user is allowed to have rw access to.
        # Values are the Category names.

        my $UserCatGroup = $FAQObject->GetUserCategories(
            Type   => 'ro',
            UserID => $Self->{UserID},
        );

        # Find CategoryIDs the current User is allowed to view
        my %AllowedCategoryIDs = ();

        if ( $UserCatGroup && ref $UserCatGroup eq 'HASH' ) {

            # So now we have to extract all Category ID's of the "inner hashes".
            # -> Loop through the outer category ID's
            for my $Level ( sort keys %{$UserCatGroup} ) {

                # Check if the Value of the current hash key is a hash ref
                if ( $UserCatGroup->{$Level} && ref $UserCatGroup->{$Level} eq 'HASH' ) {

                    # Map the keys of the inner hash to a TempIDs hash
                    # Original Datastructure:
                    # {
                    #  '1' => 'Misc',
                    #  '2' => 'secret'
                    # }
                    #
                    # after mapping:
                    #
                    # {
                    #  '1' => 1,
                    #  '2' => 1'
                    # }

                    my %TempIDs = map { $_ => 1 } keys %{ $UserCatGroup->{$Level} };

                    # Put the TempIDs over the formally found AllowedCategorys
                    # to produce a hash that holds all CategoryID as keys
                    # and the number 1 as values.
                    %AllowedCategoryIDs = (
                        %AllowedCategoryIDs,
                        %TempIDs
                    );
                }
            }
        }

        # For the database query it's necessary to have an array
        # of CategoryIDs
        my @CategoryIDs = ();

        if (%AllowedCategoryIDs) {
            @CategoryIDs = sort keys %AllowedCategoryIDs;
        }

        # Categories got from the web request could include a not allowed category if the user
        #    temper with the categories drop-box, a check is needed.
        #
        # "Map" copy from one array to another, while "grep" will only let pass the categories
        #    that are defined in the %AllowedCategoryIDs hash
        if ( IsArrayRefWithData( $GetParam{CategoryIDs} ) ) {
            @{ $GetParam{CategoryIDs} } = map {$_} grep { $AllowedCategoryIDs{$_} } @{ $GetParam{CategoryIDs} };
        }

        # Just search if we do have categories, we have access to.
        # If we don't have access to any category, a search with no CategoryIDs
        # would result in finding all categories.
        #
        # It is not possible to create FAQ's without categories
        # so at least one category has to be present

        my @ViewableFAQIDs = ();

        if (@CategoryIDs) {

            # perform FAQ search
            # default search on all valid ids, this can be overwritten by %GetParam
            @ViewableFAQIDs = $FAQObject->FAQSearch(
                OrderBy             => [$SortBy],
                OrderByDirection    => [$OrderBy],
                Limit               => $SearchLimit,
                UserID              => $Self->{UserID},
                States              => $SearchStates,
                Interface           => $Interface,
                ContentSearchPrefix => '*',
                ContentSearchSuffix => '*',
                ValidIDs            => \@AllValidIDs,
                CategoryIDs         => \@CategoryIDs,
                %GetParam,
                %DynamicFieldSearchParameters,
            );
        }

        # start HTML page
        my $Output = $LayoutObject->Header(
            Type => 'Small',
        );
        $LayoutObject->Print(
            Output => \$Output,
        );
        $Output = '';

        my $Filter = $ParamObject->GetParam( Param => 'Filter' ) || '';
        my $View   = $ParamObject->GetParam( Param => 'View' )   || '';

        # show FAQ's
        my $LinkPage = 'Filter='
            . $LayoutObject->LinkEncode($Filter)
            . ';View=' . $LayoutObject->LinkEncode($View)
            . ';SortBy=' . $LayoutObject->LinkEncode($SortBy)
            . ';OrderBy=' . $LayoutObject->LinkEncode($OrderBy)
            . ';Profile=' . $LayoutObject->LinkEncode($Profile) . ';TakeLastSearch=1;Subaction=Search'
            . ';Nav=' . $Nav
            . ';';
        my $LinkSort = 'Filter='
            . $LayoutObject->LinkEncode($Filter)
            . ';View=' . $LayoutObject->LinkEncode($View)
            . ';Profile=' . $LayoutObject->LinkEncode($Profile) . ';TakeLastSearch=1;Subaction=Search'
            . ';Nav=' . $Nav

            . ';';
        my $LinkFilter = 'TakeLastSearch=1;Subaction=Search;Profile='
            . $LayoutObject->LinkEncode($Profile)
            . ';Nav=' . $Nav
            . ';';
        my $LinkBack = 'Subaction=LoadProfile;Profile='
            . $LayoutObject->LinkEncode($Profile)
            . ';Nav=' . $Nav
            . ';TakeLastSearch=1;';

        my $FilterLink = 'SortBy=' . $LayoutObject->LinkEncode($SortBy)
            . ';OrderBy=' . $LayoutObject->LinkEncode($OrderBy)
            . ';View=' . $LayoutObject->LinkEncode($View)
            . ';Profile=' . $Profile . ';TakeLastSearch=1;Subaction=Search'
            . ';Nav=' . $Nav
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

        $Output .= $LayoutObject->FAQListShow(
            FAQIDs => \@ViewableFAQIDs,
            Total  => scalar @ViewableFAQIDs,

            View => $View,

            Env        => $Self,
            LinkPage   => $LinkPage,
            LinkSort   => $LinkSort,
            LinkFilter => $LinkFilter,
            LinkBack   => $LinkBack,
            Profile    => $Profile,

            TitleName => Translatable('Search Result'),
            Limit     => $SearchLimit,

            Filter     => $Filter,
            FilterLink => $FilterLink,

            OrderBy => $OrderBy,
            SortBy  => $SortBy,

            ShowColumns => \@ShowColumns,
            Nav         => $Nav,
        );

        # build footer
        $Output .= $LayoutObject->Footer(
            Type => 'Small',
        );
        return $Output;
    }

    else {
        $Output = $LayoutObject->Header(
            Type => 'Small',
        );

        # create output
        $Output .= $Self->_MaskForm(
            Nav => $Nav,
            %GetParam,
        );
        $Output .= $LayoutObject->Footer(
            Type => 'Small',
        );

        return $Output;
    }
}

sub _MaskForm {
    my ( $Self, %Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get list type
    my $TreeView = 0;
    if ( $ConfigObject->Get('Ticket::Frontend::ListType') eq 'tree' ) {
        $TreeView = 1;
    }

    # get profiles list
    my %Profiles = $Kernel::OM->Get('Kernel::System::SearchProfile')->SearchProfileList(
        Base      => 'FAQSearch',
        UserLogin => $Self->{UserLogin},
    );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # build profiles output list
    $Param{ProfilesStrg} = $LayoutObject->BuildSelection(
        Data         => {%Profiles},
        PossibleNone => 1,
        Name         => 'Profile',
        SelectedID   => $Param{Profile},
        Class        => 'Modernize',
    );

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # get languages list
    my %Languages = $FAQObject->LanguageList(
        UserID => $Self->{UserID},
    );

    # drop-down menu for 'languages'
    $Param{LanguagesSelectionStrg} = $LayoutObject->BuildSelection(
        Data       => \%Languages,
        Name       => 'LanguageIDs',
        Size       => 5,
        Multiple   => 1,
        SelectedID => $Param{LanguageIDs} || [],
        Class      => 'Modernize',
    );

    # get categories (with category long names) where user has rights
    my $UserCategoriesLongNames = $FAQObject->GetUserCategoriesLongNames(
        Type   => 'ro',
        UserID => $Self->{UserID},
    );

    # build the category selection
    $Param{CategoriesSelectionStrg} = $LayoutObject->BuildSelection(
        Data        => $UserCategoriesLongNames,
        Name        => 'CategoryIDs',
        Size        => 5,
        SelectedID  => $Param{CategoryIDs} || [],
        Translation => 0,
        Multiple    => 1,
        TreeView    => $TreeView,
        Class       => 'Modernize',
    );

    # get valid list
    my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();

    # build the valid selection
    $Param{ValidSelectionStrg} = $LayoutObject->BuildSelection(
        Data        => \%ValidList,
        Name        => 'ValidIDs',
        Size        => 5,
        SelectedID  => $Param{ValidIDs} || [],
        Translation => 0,
        Multiple    => 1,
        Class       => 'Modernize',
    );

    # create a mix of state and state types hash in order to have the state type IDs with state
    # names
    my %StateList = $FAQObject->StateList(
        UserID => $Self->{UserID},
    );

    my %States;
    for my $StateID ( sort keys %StateList ) {
        my %StateData = $FAQObject->StateGet(
            StateID => $StateID,
            UserID  => $Self->{UserID},
        );
        $States{ $StateData{TypeID} } = $StateData{Name}
    }

    $Param{StateSelectionStrg} = $LayoutObject->BuildSelection(
        Data        => \%States,
        Name        => 'StateIDs',
        Size        => 3,
        SelectedID  => $Param{StateIDs} || [],
        Translation => 1,
        Multiple    => 1,
        Class       => 'Modernize',
    );

    my %VotingOperators = (
        Equals            => Translatable('Equals'),
        GreaterThan       => Translatable('Greater than'),
        GreaterThanEquals => Translatable('Greater than equals'),
        SmallerThan       => Translatable('Smaller than'),
        SmallerThanEquals => Translatable('Smaller than equals'),
    );

    $Param{VoteSearchTypeSelectionStrg} = $LayoutObject->BuildSelection(
        Data        => \%VotingOperators,
        Name        => 'VoteSearchType',
        Size        => 1,
        SelectedID  => $Param{VoteSearchType} || '',
        Translation => 1,
        Multiple    => 0,
        Class       => 'Modernize',
    );

    $Param{RateSearchTypeSelectionStrg} = $LayoutObject->BuildSelection(
        Data        => \%VotingOperators,
        Name        => 'RateSearchType',
        Size        => 1,
        SelectedID  => $Param{RateSearchType} || '',
        Translation => 1,
        Multiple    => 0,
        Class       => 'Modernize',
    );
    $Param{RateSearchSelectionStrg} = $LayoutObject->BuildSelection(
        Data => {
            0   => '0%',
            25  => '25%',
            50  => '50%',
            75  => '75%',
            100 => '100%',
        },
        Sort        => 'NumericKey',
        Name        => 'RateSearch',
        Size        => 1,
        SelectedID  => $Param{RateSearch} || '',
        Translation => 0,
        Multiple    => 0,
        Class       => 'Modernize',
    );

    $Param{ApprovedStrg} = $LayoutObject->BuildSelection(
        Data => {
            No  => Translatable('No'),
            Yes => Translatable('Yes'),
        },
        Name         => 'ApprovedSearch',
        SelectedID   => $Param{ApprovedSearch} || '',
        Multiple     => 0,
        Translation  => 1,
        PossibleNone => 1,
        Class        => 'Modernize',
    );

    # get a list of all users to display
    my %ShownUsers = $Kernel::OM->Get('Kernel::System::User')->UserList(
        Type  => 'Long',
        Valid => 1,
    );

    # get the UserIDs from FAQ and faq_admin members
    my %GroupUsers;
    for my $Group (qw(faq faq_admin)) {

        # get group object
        my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

        my $GroupID = $GroupObject->GroupLookup( Group => $Group );
        my %Users = $GroupObject->GroupMemberList(
            GroupID => $GroupID,
            Type    => 'rw',
            Result  => 'HASH',
        );
        %GroupUsers = ( %GroupUsers, %Users );
    }

    # remove all users that are not in the FAQ or faq_admin groups
    for my $UserID ( sort keys %ShownUsers ) {
        if ( !$GroupUsers{$UserID} ) {
            delete $ShownUsers{$UserID};
        }
    }
    $Param{CreatedUserStrg} = $LayoutObject->BuildSelection(
        Data       => \%ShownUsers,
        Name       => 'CreatedUserIDs',
        Size       => 5,
        Multiple   => 1,
        SelectedID => $Param{CreatedUserIDs},
        Class      => 'Modernize',
    );
    $Param{LastChangedUserStrg} = $LayoutObject->BuildSelection(
        Data       => \%ShownUsers,
        Name       => 'LastChangedUserIDs',
        Size       => 5,
        Multiple   => 1,
        SelectedID => $Param{LastChangedUserIDs},
        Class      => 'Modernize',
    );

    $Param{ItemCreateTimePointStrg} = $LayoutObject->BuildSelection(
        Data       => [ 1 .. 59 ],
        Name       => 'ItemCreateTimePoint',
        SelectedID => $Param{ItemCreateTimePoint},
    );
    $Param{ItemCreateTimePointStartStrg} = $LayoutObject->BuildSelection(
        Data => {
            'Last'   => Translatable('within the last ...'),
            'Before' => Translatable('more than ... ago'),
        },
        Name       => 'ItemCreateTimePointStart',
        SelectedID => $Param{ItemCreateTimePointStart} || 'Last',
    );
    $Param{ItemCreateTimePointFormatStrg} = $LayoutObject->BuildSelection(
        Data => {
            minute => Translatable('minute(s)'),
            hour   => Translatable('hour(s)'),
            day    => Translatable('day(s)'),
            week   => Translatable('week(s)'),
            month  => Translatable('month(s)'),
            year   => Translatable('year(s)'),
        },
        Name       => 'ItemCreateTimePointFormat',
        SelectedID => $Param{ItemCreateTimePointFormat},
    );
    $Param{ItemCreateTimeStartStrg} = $LayoutObject->BuildDateSelection(
        %Param,
        Prefix   => 'ItemCreateTimeStart',
        Format   => 'DateInputFormat',
        DiffTime => -( ( 60 * 60 * 24 ) * 30 ),
    );
    $Param{ItemCreateTimeStopStrg} = $LayoutObject->BuildDateSelection(
        %Param,
        Prefix => 'ItemCreateTimeStop',
        Format => 'DateInputFormat',
    );

    $Param{ItemChangeTimePointStrg} = $LayoutObject->BuildSelection(
        Data       => [ 1 .. 59 ],
        Name       => 'ItemChangeTimePoint',
        SelectedID => $Param{ItemChangeTimePoint},
    );
    $Param{ItemChangeTimePointStartStrg} = $LayoutObject->BuildSelection(
        Data => {
            'Last'   => Translatable('within the last ...'),
            'Before' => Translatable('more than ... ago'),
        },
        Name       => 'ItemChangeTimePointStart',
        SelectedID => $Param{ItemChangeTimePointStart} || 'Last',
    );
    $Param{ItemChangeTimePointFormatStrg} = $LayoutObject->BuildSelection(
        Data => {
            minute => Translatable('minute(s)'),
            hour   => Translatable('hour(s)'),
            day    => Translatable('day(s)'),
            week   => Translatable('week(s)'),
            month  => Translatable('month(s)'),
            year   => Translatable('year(s)'),
        },
        Name       => 'ItemChangeTimePointFormat',
        SelectedID => $Param{ItemChangeTimePointFormat},
    );
    $Param{ItemChangeTimeStartStrg} = $LayoutObject->BuildDateSelection(
        %Param,
        Prefix   => 'ItemChangeTimeStart',
        Format   => 'DateInputFormat',
        DiffTime => -( ( 60 * 60 * 24 ) * 30 ),
    );
    $Param{ItemChangeTimeStopStrg} = $LayoutObject->BuildDateSelection(
        %Param,
        Prefix => 'ItemChangeTimeStop',
        Format => 'DateInputFormat',
    );

    # create HTML strings for all dynamic fields
    my %DynamicFieldHTML;

    # get dynamic field backend object
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # get search field preferences
        my $SearchFieldPreferences = $DynamicFieldBackendObject->SearchFieldPreferences(
            DynamicFieldConfig => $DynamicFieldConfig,
        );

        next DYNAMICFIELD if !IsArrayRefWithData($SearchFieldPreferences);

        PREFERENCE:
        for my $Preference ( @{$SearchFieldPreferences} ) {

            # get field HTML
            $DynamicFieldHTML{ $DynamicFieldConfig->{Name} . $Preference->{Type} }
                = $DynamicFieldBackendObject->SearchFieldRender(
                DynamicFieldConfig => $DynamicFieldConfig,
                Profile            => \%Param,
                DefaultValue =>
                    $Self->{Config}->{Defaults}->{DynamicField}->{ $DynamicFieldConfig->{Name} },
                LayoutObject => $LayoutObject,
                Type         => $Preference->{Type},
                );
        }
    }

    # HTML search mask output
    $LayoutObject->Block(
        Name => 'Search',
        Data => {%Param},
    );

    # show languages select
    my $MultiLanguage = $ConfigObject->Get('FAQ::MultiLanguage');
    if ($MultiLanguage) {
        $LayoutObject->Block(
            Name => 'Language',
            Data => {%Param},
        );
    }

    # output Dynamic fields blocks
    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # get search field preferences
        my $SearchFieldPreferences = $DynamicFieldBackendObject->SearchFieldPreferences(
            DynamicFieldConfig => $DynamicFieldConfig,
        );

        next DYNAMICFIELD if !IsArrayRefWithData($SearchFieldPreferences);

        PREFERENCE:
        for my $Preference ( @{$SearchFieldPreferences} ) {

            # skip fields that HTML could not be retrieved
            next PREFERENCE if !IsHashRefWithData(
                $DynamicFieldHTML{ $DynamicFieldConfig->{Name} . $Preference->{Type} }
            );

            $LayoutObject->Block(
                Name => 'DynamicField',
                Data => {
                    Label =>
                        $DynamicFieldHTML{ $DynamicFieldConfig->{Name} . $Preference->{Type} }
                        ->{Label},
                    Field =>
                        $DynamicFieldHTML{ $DynamicFieldConfig->{Name} . $Preference->{Type} }
                        ->{Field},
                },
            );
        }
    }

    # HTML search mask output
    return $LayoutObject->Output(
        TemplateFile => 'AgentFAQSearchSmall',
        Data         => {%Param},
    );
}

1;
