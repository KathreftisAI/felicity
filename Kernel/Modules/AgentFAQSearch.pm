# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentFAQSearch;

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
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("FAQ::Frontend::$Self->{Action}");

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

    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get config from constructor
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

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # build output for open search description by FAQ number
    if ( $Self->{Subaction} eq 'OpenSearchDescriptionFAQNumber' ) {
        my $Output = $LayoutObject->Output(
            TemplateFile => 'AgentFAQSearchOpenSearchDescriptionFAQNumber',
            Data         => \%Param,
        );
        return $LayoutObject->Attachment(
            Filename    => 'OpenSearchDescriptionFAQNumber.xml',
            ContentType => 'application/opensearchdescription+xml',
            Content     => $Output,
            Type        => 'inline',
        );
    }

    # build output for open search description by full-text
    if ( $Self->{Subaction} eq 'OpenSearchDescriptionFulltext' ) {
        my $Output = $LayoutObject->Output(
            TemplateFile => 'AgentFAQSearchOpenSearchDescriptionFulltext',
            Data         => \%Param,
        );
        return $LayoutObject->Attachment(
            Filename    => 'OpenSearchDescriptionFulltext.xml',
            ContentType => 'application/opensearchdescription+xml',
            Content     => $Output,
            Type        => 'inline',
        );
    }

    # search with a saved template
    if ( $ParamObject->GetParam( Param => 'SearchTemplate' ) && $Profile ) {
        return $LayoutObject->Redirect(
            OP =>
                "Action=AgentFAQSearch;Subaction=Search;TakeLastSearch=1;SaveProfile=1;Profile=$Profile",
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
            qw(Number Title Keyword Fulltext ResultForm VoteSearch VoteSearchType RateSearch
            RateSearchType ApprovedSearch
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

    # get create time option
    if ( !$GetParam{TimeSearchType} ) {
        $GetParam{'TimeSearchType::None'} = 1;
    }
    elsif ( $GetParam{TimeSearchType} eq 'TimePoint' ) {
        $GetParam{'TimeSearchType::TimePoint'} = 1;
    }
    elsif ( $GetParam{TimeSearchType} eq 'TimeSlot' ) {
        $GetParam{'TimeSearchType::TimeSlot'} = 1;
    }

    # get change time option
    if ( !$GetParam{ChangeTimeSearchType} ) {
        $GetParam{'ChangeTimeSearchType::None'} = 1;
    }
    elsif ( $GetParam{ChangeTimeSearchType} eq 'TimePoint' ) {
        $GetParam{'ChangeTimeSearchType::TimePoint'} = 1;
    }
    elsif ( $GetParam{ChangeTimeSearchType} eq 'TimeSlot' ) {
        $GetParam{'ChangeTimeSearchType::TimeSlot'} = 1;
    }

    # set result form ENV
    if ( !$GetParam{ResultForm} ) {
        $GetParam{ResultForm} = '';
    }

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # show result site
    if ( $Self->{Subaction} eq 'Search' && !$EraseTemplate ) {

        # fill up profile name (e.g. with last-search)
        if ( !$Profile || !$SaveProfile ) {
            $Profile = 'last-search';
        }

        # get session object
        my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

        # store last overview screen
        my $URL = "Action=AgentFAQSearch;Subaction=Search"
            . ";Profile=" . $LayoutObject->LinkEncode($Profile)
            . ";SortBy=" . $LayoutObject->LinkEncode($SortBy)
            . ";OrderBy=" . $LayoutObject->LinkEncode($OrderBy)
            . ";TakeLastSearch=1"
            . ";StartHit=" . $LayoutObject->LinkEncode($StartHit);

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

                my $DynamicFieldValue = $DynamicFieldBackendObject->SearchFieldValueGet(
                    DynamicFieldConfig     => $DynamicFieldConfig,
                    ParamObject            => $ParamObject,
                    Type                   => $Preference->{Type},
                    ReturnProfileStructure => 1,
                );

                # set the complete value structure in %DynamicFieldValues to discard those where the
                # value will not be possible to get
                next PREFERENCE if !IsHashRefWithData($DynamicFieldValue);

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

        # prepare full-text search
        if ( $GetParam{Fulltext} ) {
            $GetParam{ContentSearch} = 'OR';
            $GetParam{What}          = $GetParam{Fulltext};
        }

        # get valid list
        my %ValidList   = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();
        my @AllValidIDs = keys %ValidList;

        # get config object
        my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

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

        if ( IsNumber( $GetParam{VoteSearch} ) ) {
            $GetParam{Votes} = {
                $GetParam{VoteSearchType} => $GetParam{VoteSearch}
            };
        }

        if ( IsNumber( $GetParam{RateSearch} ) ) {
            $GetParam{Rate} = {
                $GetParam{RateSearchType} => $GetParam{RateSearch}
            };
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
                    # Original Data structure:
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

        # get time object
        my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

        my $MultiLanguage = $ConfigObject->Get('FAQ::MultiLanguage');

        # CSV output
        if ( $GetParam{ResultForm} eq 'CSV' ) {
            my @TmpCSVHead;
            my @CSVHead;
            my @CSVData;

            # get the FAQ dynamic fields for CSV display
            my $CSVDynamicField = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
                Valid       => 1,
                ObjectType  => 'FAQ',
                FieldFilter => $Config->{SearchCSVDynamicField} || {},
            );

            for my $FAQID (@ViewableFAQIDs) {

                # get FAQ data details
                my %FAQData = $FAQObject->FAQGet(
                    ItemID        => $FAQID,
                    ItemFields    => 0,
                    DynamicFields => 1,
                    UserID        => $Self->{UserID},
                );

                # get info for CSV output
                my %CSVInfo = (%FAQData);

                $CSVInfo{Changed} = $LayoutObject->{LanguageObject}->FormatTimeString(
                    $FAQData{Changed},
                    'DateFormat',
                );

                # CSV quote
                if ( !@CSVHead ) {
                    @TmpCSVHead = qw( FAQNumber Title Category);
                    @CSVHead    = qw( FAQNumber Title Category);

                    # insert language header
                    if ($MultiLanguage) {
                        push @TmpCSVHead, 'Language';
                        push @CSVHead,    'Language';
                    }

                    push @TmpCSVHead, qw(State Changed);
                    push @CSVHead,    qw(State Changed);

                    # include the selected dynamic fields on CVS results
                    DYNAMICFIELD:
                    for my $DynamicFieldConfig ( @{$CSVDynamicField} ) {
                        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);
                        next DYNAMICFIELD if !$DynamicFieldConfig->{Name};
                        next DYNAMICFIELD if $DynamicFieldConfig->{Name} eq '';

                        push @TmpCSVHead, 'DynamicField_' . $DynamicFieldConfig->{Name};
                        push @CSVHead,    $DynamicFieldConfig->{Label};
                    }
                }

                # insert data
                my @Data;
                for my $Header (@TmpCSVHead) {

                    # check if header is a dynamic field and get the value from dynamic field
                    # backend
                    if ( $Header =~ m{\A DynamicField_ ( [a-zA-Z\d]+ ) \z}xms ) {

                        # loop over the dynamic fields configured for CSV output
                        DYNAMICFIELD:
                        for my $DynamicFieldConfig ( @{$CSVDynamicField} ) {
                            next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);
                            next DYNAMICFIELD if !$DynamicFieldConfig->{Name};

                            # skip all fields that does not match with current field name ($1)
                            # with out the 'DynamicField_' prefix
                            next DYNAMICFIELD if $DynamicFieldConfig->{Name} ne $1;

                            # get the value as for print (to correctly display)
                            my $ValueStrg = $DynamicFieldBackendObject->DisplayValueRender(
                                DynamicFieldConfig => $DynamicFieldConfig,
                                Value              => $CSVInfo{$Header},
                                HTMLOutput         => 0,
                                LayoutObject       => $LayoutObject,
                            );
                            push @Data, $ValueStrg->{Value};

                            # terminate the DYNAMICFIELD loop
                            last DYNAMICFIELD;
                        }
                    }

                    # otherwise retrieve data from FAQ item
                    else {
                        if ( $Header eq 'FAQNumber' ) {
                            push @Data, $CSVInfo{'Number'};
                        }
                        elsif ( $Header eq 'Category' ) {
                            push @Data, $CSVInfo{'CategoryName'};
                        }
                        else {
                            push @Data, $CSVInfo{$Header};
                        }
                    }
                }
                push @CSVData, \@Data;
            }

            # CSV quote
            # translate non existing header may result in a garbage file
            if ( !@CSVHead ) {
                @TmpCSVHead = qw(FAQNumber Title Category);
                @CSVHead    = qw(FAQNumber Title Category);

                # insert language header
                if ($MultiLanguage) {
                    push @TmpCSVHead, 'Language';
                    push @CSVHead,    'Language';
                }

                push @TmpCSVHead, qw(State Changed);
                push @CSVHead,    qw(State Changed);

                # include the selected dynamic fields on CVS results
                DYNAMICFIELD:
                for my $DynamicFieldConfig ( @{$CSVDynamicField} ) {
                    next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);
                    next DYNAMICFIELD if !$DynamicFieldConfig->{Name};
                    next DYNAMICFIELD if $DynamicFieldConfig->{Name} eq '';

                    push @TmpCSVHead, 'DynamicField_' . $DynamicFieldConfig->{Name};
                    push @CSVHead,    $DynamicFieldConfig->{Label};
                }
            }

            # translate headers
            for my $Header (@CSVHead) {

                # replace FAQNumber header with the current FAQHook from config
                if ( $Header eq 'FAQNumber' ) {
                    $Header = $ConfigObject->Get('FAQ::FAQHook');
                }
                else {
                    $Header = $LayoutObject->{LanguageObject}->Translate($Header);
                }
            }

            # assemble CSV data
            my $CSV = $Kernel::OM->Get('Kernel::System::CSV')->Array2CSV(
                Head      => \@CSVHead,
                Data      => \@CSVData,
                Separator => $Self->{UserCSVSeparator},
            );

            # return CSV to download
            my $CSVFile = 'FAQ_search';
            my ( $s, $m, $h, $D, $M, $Y ) = $TimeObject->SystemTime2Date(
                SystemTime => $TimeObject->SystemTime(),
            );
            $M = sprintf( "%02d", $M );
            $D = sprintf( "%02d", $D );
            $h = sprintf( "%02d", $h );
            $m = sprintf( "%02d", $m );
            return $LayoutObject->Attachment(
                Filename    => $CSVFile . "_" . "$Y-$M-$D" . "_" . "$h-$m.csv",
                ContentType => "text/csv; charset=" . $LayoutObject->{UserCharset},
                Content     => $CSV,
            );
        }
        elsif ( $GetParam{ResultForm} eq 'Print' ) {

            # get PDF object
            my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

            my @PDFData;
            for my $FAQID (@ViewableFAQIDs) {

                # get FAQ data details
                my %FAQData = $FAQObject->FAQGet(
                    ItemID     => $FAQID,
                    ItemFields => 0,
                    UserID     => $Self->{UserID},
                );

                # set change date to long format
                my $Changed = $LayoutObject->{LanguageObject}->FormatTimeString(
                    $FAQData{Changed},
                    'DateFormatLong',
                );

                # create PDF Rows
                my @PDFRow;
                push @PDFRow, $FAQData{Number};
                push @PDFRow, $FAQData{Title};
                push @PDFRow, $FAQData{CategoryName};

                # create language row
                if ($MultiLanguage) {
                    push @PDFRow, $FAQData{Language};
                }

                push @PDFRow,  $FAQData{State};
                push @PDFRow,  $Changed;
                push @PDFData, \@PDFRow;
            }

            # PDF Output
            my $Title = $LayoutObject->{LanguageObject}->Translate('FAQ') . ' '
                . $LayoutObject->{LanguageObject}->Translate('Search');
            my $PrintedBy = $LayoutObject->{LanguageObject}->Translate('printed by');
            my $Page      = $LayoutObject->{LanguageObject}->Translate('Page');
            my $Time      = $LayoutObject->{Time};

            # get maximum number of pages
            my $MaxPages = $ConfigObject->Get('PDF::MaxPages');
            if ( !$MaxPages || $MaxPages < 1 || $MaxPages > 1000 ) {
                $MaxPages = 100;
            }

            # create the header
            my $CellData;

            # output 'No Result', if no content was given
            if (@PDFData) {

                $CellData->[0]->[0]->{Content} = $ConfigObject->Get('FAQ::FAQHook');
                $CellData->[0]->[0]->{Font}    = 'ProportionalBold';
                $CellData->[0]->[1]->{Content} = $LayoutObject->{LanguageObject}->Translate('Title');
                $CellData->[0]->[1]->{Font}    = 'ProportionalBold';
                $CellData->[0]->[2]->{Content} = $LayoutObject->{LanguageObject}->Translate('Category');
                $CellData->[0]->[2]->{Font}    = 'ProportionalBold';

                # store the correct header index
                my $NextHeaderIndex = 3;

                # add language header
                if ($MultiLanguage) {
                    $CellData->[0]->[3]->{Content} = $LayoutObject->{LanguageObject}->Translate('Language');
                    $CellData->[0]->[3]->{Font}    = 'ProportionalBold';
                    $NextHeaderIndex               = 4;
                }

                $CellData->[0]->[$NextHeaderIndex]->{Content} = $LayoutObject->{LanguageObject}->Translate('State');
                $CellData->[0]->[$NextHeaderIndex]->{Font}    = 'ProportionalBold';

                $CellData->[0]->[ $NextHeaderIndex + 1 ]->{Content}
                    = $LayoutObject->{LanguageObject}->Translate('Changed');
                $CellData->[0]->[ $NextHeaderIndex + 1 ]->{Font} = 'ProportionalBold';

                # create the content array
                my $CounterRow = 1;
                for my $Row (@PDFData) {
                    my $CounterColumn = 0;
                    for my $Content ( @{$Row} ) {
                        $CellData->[$CounterRow]->[$CounterColumn]->{Content} = $Content;
                        $CounterColumn++;
                    }
                    $CounterRow++;
                }
            }
            else {
                $CellData->[0]->[0]->{Content} = $LayoutObject->{LanguageObject}->Translate('No Result!');

            }

            # page params
            my %PageParam;
            $PageParam{PageOrientation} = 'landscape';
            $PageParam{MarginTop}       = 30;
            $PageParam{MarginRight}     = 40;
            $PageParam{MarginBottom}    = 40;
            $PageParam{MarginLeft}      = 40;
            $PageParam{HeaderRight}     = $Title;
            $PageParam{HeadlineLeft}    = $Title;

            # table params
            my %TableParam;
            $TableParam{CellData}            = $CellData;
            $TableParam{Type}                = 'Cut';
            $TableParam{FontSize}            = 6;
            $TableParam{Border}              = 0;
            $TableParam{BackgroundColorEven} = '#DDDDDD';
            $TableParam{Padding}             = 1;
            $TableParam{PaddingTop}          = 3;
            $TableParam{PaddingBottom}       = 3;

            # create new PDF document
            $PDFObject->DocumentNew(
                Title  => $ConfigObject->Get('Product') . ': ' . $Title,
                Encode => $LayoutObject->{UserCharset},
            );

            # start table output
            $PDFObject->PageNew(
                %PageParam,
                FooterRight => $Page . ' 1',
            );

            $PDFObject->PositionSet(
                Move => 'relativ',
                Y    => -6,
            );

            # output title
            $PDFObject->Text(
                Text     => $Title,
                FontSize => 13,
            );

            $PDFObject->PositionSet(
                Move => 'relativ',
                Y    => -6,
            );

            # output "printed by"
            $PDFObject->Text(
                Text => $PrintedBy . ' '
                    . $Self->{UserFirstname} . ' '
                    . $Self->{UserLastname} . ' ('
                    . $Self->{UserEmail} . ')'
                    . ', ' . $Time,
                FontSize => 9,
            );

            $PDFObject->PositionSet(
                Move => 'relativ',
                Y    => -14,
            );

            PAGE:
            for ( 2 .. $MaxPages ) {

                # output table (or a fragment of it)
                %TableParam = $PDFObject->Table( %TableParam, );

                # stop output or another page
                if ( $TableParam{State} ) {
                    last PAGE;
                }
                else {
                    $PDFObject->PageNew(
                        %PageParam,
                        FooterRight => $Page . ' ' . $_,
                    );
                }
            }

            # return the PDF document
            my $Filename = 'FAQ_search';
            my ( $s, $m, $h, $D, $M, $Y ) = $TimeObject->SystemTime2Date(
                SystemTime => $TimeObject->SystemTime(),
            );
            $M = sprintf( "%02d", $M );
            $D = sprintf( "%02d", $D );
            $h = sprintf( "%02d", $h );
            $m = sprintf( "%02d", $m );
            my $PDFString = $PDFObject->DocumentOutput();
            return $LayoutObject->Attachment(
                Filename    => $Filename . "_" . "$Y-$M-$D" . "_" . "$h-$m.pdf",
                ContentType => "application/pdf",
                Content     => $PDFString,
                Type        => 'inline',
            );
        }
        else {

            # start HTML page
            my $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();
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
                . ';';
            my $LinkSort = 'Filter='
                . $LayoutObject->LinkEncode($Filter)
                . ';View=' . $LayoutObject->LinkEncode($View)
                . ';Profile=' . $LayoutObject->LinkEncode($Profile) . ';TakeLastSearch=1;Subaction=Search'
                . ';';
            my $LinkFilter = 'TakeLastSearch=1;Subaction=Search;Profile='
                . $LayoutObject->LinkEncode($Profile)
                . ';';
            my $LinkBack = 'Subaction=LoadProfile;Profile='
                . $LayoutObject->LinkEncode($Profile)
                . ';TakeLastSearch=1;';

            my $FilterLink = 'SortBy=' . $LayoutObject->LinkEncode($SortBy)
                . ';OrderBy=' . $LayoutObject->LinkEncode($OrderBy)
                . ';View=' . $LayoutObject->LinkEncode($View)
                . ';Profile=' . $LayoutObject->LinkEncode($Profile) . ';TakeLastSearch=1;Subaction=Search'
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

                ShowColumns  => \@ShowColumns,
                FAQTitleSize => $Config->{TitleSize},
            );

            # build footer
            $Output .= $LayoutObject->Footer();
            return $Output;
        }
    }

    elsif ( $Self->{Subaction} eq 'AJAXProfileDelete' ) {
        my $Profile = $ParamObject->GetParam( Param => 'Profile' );

        # remove old profile stuff
        $SearchProfileObject->SearchProfileDelete(
            Base      => 'FAQSearch',
            Name      => $Profile,
            UserLogin => $Self->{UserLogin},
        );
        my $Output = $LayoutObject->JSONEncode(
            Data => 1,
        );
        return $LayoutObject->Attachment(
            NoCache     => 1,
            ContentType => 'text/html',
            Content     => $Output,
            Type        => 'inline',
        );
    }

    elsif ( $Self->{Subaction} eq 'AJAX' ) {

        # create output
        my $Output = $Self->_MaskForm(
            %GetParam,
        );

        return $LayoutObject->Attachment(
            NoCache     => 1,
            ContentType => 'text/html',
            Charset     => $LayoutObject->{UserCharset},
            Content     => $Output,
            Type        => 'inline',
        );
    }

    # show default search screen
    $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $LayoutObject->Block(
        Name => 'Search',
        Data => \%Param,
    );
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentFAQSearch',
        Data         => \%Param,
    );
    $Output .= $LayoutObject->Footer();
    return $Output;

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

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    my $Profile = $ParamObject->GetParam( Param => 'Profile' ) || '';
    my $EmptySearch = $ParamObject->GetParam( Param => 'EmptySearch' );
    if ( !$Profile ) {
        $EmptySearch = 1;
    }

    # get search profile object
    my $SearchProfileObject = $Kernel::OM->Get('Kernel::System::SearchProfile');

    my %GetParam = $SearchProfileObject->SearchProfileGet(
        Base      => 'FAQSearch',
        Name      => $Profile,
        UserLogin => $Self->{UserLogin},
    );

    # get config from constructor
    my $Config = $Self->{Config};

    # if no profile is used, set default params of default attributes
    if ( !$Profile ) {
        if ( $Config->{Defaults} ) {
            ATTRIBUTE:
            for my $Attribute ( sort keys %{ $Config->{Defaults} } ) {
                next ATTRIBUTE if !$Config->{Defaults}->{$Attribute};
                next ATTRIBUTE if $Attribute eq 'DynamicField';
                $GetParam{$Attribute} = $Config->{Defaults}->{$Attribute};
            }
        }
    }

    # set attributes string
    my @Attributes = (
        {
            Key   => 'Number',
            Value => Translatable('FAQ Number'),
        },
        {
            Key   => 'Fulltext',
            Value => Translatable('Fulltext'),
        },
        {
            Key   => 'Title',
            Value => Translatable('Title'),
        },
        {
            Key   => 'Keyword',
            Value => Translatable('Keyword'),
        },
    );

    # show Languages attribute
    my $MultiLanguage = $ConfigObject->Get('FAQ::MultiLanguage');
    if ($MultiLanguage) {
        push @Attributes, (
            {
                Key   => 'LanguageIDs',
                Value => Translatable('Language'),
            },
        );
    }

    push @Attributes, (
        {
            Key   => 'CategoryIDs',
            Value => Translatable('Category'),
        },
        {
            Key   => 'ValidIDs',
            Value => Translatable('Validity'),
        },
        {
            Key   => 'StateIDs',
            Value => Translatable('State'),
        },
        {
            Key   => 'VoteSearchType',
            Value => Translatable('Votes'),
        },
        {
            Key   => 'RateSearchType',
            Value => Translatable('Rate'),
        },
        {
            Key   => 'ApprovedSearch',
            Value => Translatable('Approved'),
        },
        {
            Key   => 'CreatedUserIDs',
            Value => Translatable('Created by'),
        },
        {
            Key   => 'LastChangedUserIDs',
            Value => Translatable('Last Changed by'),
        },
        {
            Key   => 'ItemCreateTimePoint',
            Value => Translatable('FAQ Item Create Time (before/after)'),
        },
        {
            Key   => 'ItemCreateTimeSlot',
            Value => Translatable('FAQ Item Create Time (between)'),
        },
        {
            Key   => 'ItemChangeTimePoint',
            Value => Translatable('FAQ Item Change Time (before/after)'),
        },
        {
            Key   => 'ItemChangeTimeSlot',
            Value => Translatable('FAQ Item Change Time (between)'),
        },
    );

    my $DynamicFieldSeparator = 1;

    # get needed objects
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # create dynamic fields search options for attribute select
    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);
        next DYNAMICFIELD if !$DynamicFieldConfig->{Name};
        next DYNAMICFIELD if $DynamicFieldConfig->{Name} eq '';

        # create a separator for dynamic fields attributes
        if ($DynamicFieldSeparator) {
            push @Attributes, (
                {
                    Key      => '',
                    Value    => '-',
                    Disabled => 1,
                },
            );

            $DynamicFieldSeparator = 0;
        }

        # get search field preferences
        my $SearchFieldPreferences = $DynamicFieldBackendObject->SearchFieldPreferences(
            DynamicFieldConfig => $DynamicFieldConfig,
        );

        next DYNAMICFIELD if !IsArrayRefWithData($SearchFieldPreferences);

        # translate the dynamic field label
        my $TranslatedDynamicFieldLabel = $LayoutObject->{LanguageObject}->Translate(
            $DynamicFieldConfig->{Label},
        );

        PREFERENCE:
        for my $Preference ( @{$SearchFieldPreferences} ) {

            # translate the suffix
            my $TranslatedSuffix = $LayoutObject->{LanguageObject}->Translate(
                $Preference->{LabelSuffix},
            ) || '';

            if ($TranslatedSuffix) {
                $TranslatedSuffix = ' (' . $TranslatedSuffix . ')';
            }

            push @Attributes, (
                {
                    Key => 'Search_DynamicField_'
                        . $DynamicFieldConfig->{Name}
                        . $Preference->{Type},
                    Value => $TranslatedDynamicFieldLabel . $TranslatedSuffix,
                },
            );
        }
    }

    # create a separator if a dynamic field attribute was pushed
    if ( !$DynamicFieldSeparator ) {
        push @Attributes, (
            {
                Key      => '',
                Value    => '-',
                Disabled => 1,
            },
        );
    }

    # create HTML strings for all dynamic fields
    my %DynamicFieldHTML;

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
                Profile            => \%GetParam,
                DefaultValue =>
                    $Config->{Defaults}->{DynamicField}
                    ->{ $DynamicFieldConfig->{Name} },
                LayoutObject => $LayoutObject,
                Type         => $Preference->{Type},
                );
        }
    }

    # drop-down menu for 'attributes'
    $Param{AttributesStrg} = $LayoutObject->BuildSelection(
        Data     => \@Attributes,
        Name     => 'Attribute',
        Multiple => 0,
        Class    => 'Modernize',
    );
    $Param{AttributesOrigStrg} = $LayoutObject->BuildSelection(
        Data     => \@Attributes,
        Name     => 'AttributeOrig',
        Multiple => 0,
        Class    => 'Modernize',
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
        SelectedID => $GetParam{LanguageIDs} || [],
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
        SelectedID  => $GetParam{CategoryIDs} || [],
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
        SelectedID  => $GetParam{ValidIDs} || [],
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
        SelectedID  => $GetParam{StateIDs} || [],
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
        SelectedID  => $GetParam{VoteSearchType} || '',
        Translation => 1,
        Multiple    => 0,
        Class       => 'Modernize',
    );

    $Param{RateSearchTypeSelectionStrg} = $LayoutObject->BuildSelection(
        Data        => \%VotingOperators,
        Name        => 'RateSearchType',
        Size        => 1,
        SelectedID  => $GetParam{RateSearchType} || '',
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
        SelectedID  => $GetParam{RateSearch} || '',
        Translation => 0,
        Multiple    => 0,
        Class       => 'Modernize',
    );

    $Param{ApprovedStrg} = $LayoutObject->BuildSelection(
        Data => {
            No  => Translatable('No'),
            Yes => Translatable('Yes'),
        },
        Name        => 'ApprovedSearch',
        SelectedID  => $GetParam{ApprovedSearch} || 'Yes',
        Multiple    => 0,
        Translation => 1,
        Class       => 'Modernize',
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
        SelectedID => $GetParam{CreatedUserIDs},
        Class      => 'Modernize',
    );
    $Param{LastChangedUserStrg} = $LayoutObject->BuildSelection(
        Data       => \%ShownUsers,
        Name       => 'LastChangedUserIDs',
        Size       => 5,
        Multiple   => 1,
        SelectedID => $GetParam{LastChangedUserIDs},
        Class      => 'Modernize',
    );

    $Param{ItemCreateTimePointStrg} = $LayoutObject->BuildSelection(
        Data       => [ 1 .. 59 ],
        Name       => 'ItemCreateTimePoint',
        SelectedID => $GetParam{ItemCreateTimePoint},
    );
    $Param{ItemCreateTimePointStartStrg} = $LayoutObject->BuildSelection(
        Data => {
            'Last'   => Translatable('within the last ...'),
            'Before' => Translatable('more than ... ago'),
        },
        Name       => 'ItemCreateTimePointStart',
        SelectedID => $GetParam{ItemCreateTimePointStart} || 'Last',
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
        SelectedID => $GetParam{ItemCreateTimePointFormat},
    );
    $Param{ItemCreateTimeStartStrg} = $LayoutObject->BuildDateSelection(
        %GetParam,
        Prefix   => 'ItemCreateTimeStart',
        Format   => 'DateInputFormat',
        DiffTime => -( ( 60 * 60 * 24 ) * 30 ),
    );
    $Param{ItemCreateTimeStopStrg} = $LayoutObject->BuildDateSelection(
        %GetParam,
        Prefix => 'ItemCreateTimeStop',
        Format => 'DateInputFormat',
    );

    $Param{ItemChangeTimePointStrg} = $LayoutObject->BuildSelection(
        Data       => [ 1 .. 59 ],
        Name       => 'ItemChangeTimePoint',
        SelectedID => $GetParam{ItemChangeTimePoint},
    );
    $Param{ItemChangeTimePointStartStrg} = $LayoutObject->BuildSelection(
        Data => {
            'Last'   => Translatable('within the last ...'),
            'Before' => Translatable('more than ... ago'),
        },
        Name       => 'ItemChangeTimePointStart',
        SelectedID => $GetParam{ItemChangeTimePointStart} || 'Last',
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
        SelectedID => $GetParam{ItemChangeTimePointFormat},
    );
    $Param{ItemChangeTimeStartStrg} = $LayoutObject->BuildDateSelection(
        %GetParam,
        Prefix   => 'ItemChangeTimeStart',
        Format   => 'DateInputFormat',
        DiffTime => -( ( 60 * 60 * 24 ) * 30 ),
    );
    $Param{ItemChangeTimeStopStrg} = $LayoutObject->BuildDateSelection(
        %GetParam,
        Prefix => 'ItemChangeTimeStop',
        Format => 'DateInputFormat',
    );

    my %Profiles = $SearchProfileObject->SearchProfileList(
        Base      => 'FAQSearch',
        UserLogin => $Self->{UserLogin},
    );
    delete $Profiles{''};
    delete $Profiles{'last-search'};
    if ($EmptySearch) {
        $Profiles{''} = '-';
    }
    else {
        $Profiles{'last-search'} = '-';
    }
    $Param{ProfilesStrg} = $LayoutObject->BuildSelection(
        Data       => \%Profiles,
        Name       => 'Profile',
        ID         => 'SearchProfile',
        SelectedID => $Profile,
        Class      => 'Modernize',
    );

    $Param{ResultFormStrg} = $LayoutObject->BuildSelection(
        Data => {
            Normal => Translatable('Normal'),
            Print  => Translatable('Print'),
            CSV    => Translatable('CSV'),
        },
        Name       => 'ResultForm',
        SelectedID => $GetParam{ResultForm} || 'Normal',
        Class      => 'Modernize',
    );

    # HTML search mask output
    $LayoutObject->Block(
        Name => 'SearchAJAX',
        Data => {
            %Param,
            %GetParam,
            EmptySearch => $EmptySearch,
        },
    );

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

    # show attributes
    my %AlreadyShown;
    ITEM:
    for my $Item (@Attributes) {
        my $Key = $Item->{Key};
        next ITEM if !$Key;
        next ITEM if !defined $GetParam{$Key};
        next ITEM if $GetParam{$Key} eq '';

        next ITEM if $AlreadyShown{$Key};
        $AlreadyShown{$Key} = 1;
        $LayoutObject->Block(
            Name => 'SearchAJAXShow',
            Data => {
                Attribute => $Key,
            },
        );
    }

    # if no attribute is shown, show full-text search
    if ( !$Profile ) {

        # Merge regular show/hide settings and the settings for the dynamic fields
        my %Defaults = %{ $Config->{Defaults} || {} };

        delete $Defaults{DynamicField};

        for my $DynamicFieldItem ( sort keys %{ $Config->{DynamicField} || {} } ) {
            if ( $Config->{DynamicField}->{$DynamicFieldItem} == 2 ) {
                $Defaults{"Search_DynamicField_$DynamicFieldItem"} = 1;
            }
        }

        if (%Defaults) {
            DEFAULT:
            for my $Key ( sort keys %Defaults ) {
                next DEFAULT if $Key eq 'DynamicField';    # Ignore entry for DF config
                next DEFAULT if $AlreadyShown{$Key};
                $AlreadyShown{$Key} = 1;

                $LayoutObject->Block(
                    Name => 'SearchAJAXShow',
                    Data => {
                        Attribute => $Key,
                    },
                );
            }
        }
        else {
            $LayoutObject->Block(
                Name => 'SearchAJAXShow',
                Data => {
                    Attribute => 'Fulltext',
                },
            );
        }
    }

    # build output
    my $Output = $LayoutObject->Output(
        TemplateFile => 'AgentFAQSearch',
        Data         => {%Param},
    );

    return $Output;
}

1;
