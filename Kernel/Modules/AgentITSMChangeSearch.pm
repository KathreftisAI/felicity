# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeSearch;

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

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get config for frontend
    $Self->{Config} = $ConfigObject->Get("ITSMChange::Frontend::$Self->{Action}");

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get confid data
    $Self->{StartHit} = int( $ParamObject->GetParam( Param => 'StartHit' ) || 1 );
    $Self->{SearchLimit} = $Self->{Config}->{SearchLimit} || 500;
    $Self->{SortBy} = $ParamObject->GetParam( Param => 'SortBy' )
        || $Self->{Config}->{'SortBy::Default'}
        || 'ChangeID';
    $Self->{OrderBy} = $ParamObject->GetParam( Param => 'OrderBy' )
        || $Self->{Config}->{'Order::Default'}
        || 'Down';
    $Self->{Profile}        = $ParamObject->GetParam( Param => 'Profile' )        || '';
    $Self->{SaveProfile}    = $ParamObject->GetParam( Param => 'SaveProfile' )    || '';
    $Self->{TakeLastSearch} = $ParamObject->GetParam( Param => 'TakeLastSearch' ) || '';
    $Self->{SelectTemplate} = $ParamObject->GetParam( Param => 'SelectTemplate' ) || '';
    $Self->{EraseTemplate}  = $ParamObject->GetParam( Param => 'EraseTemplate' )  || '';

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check request
    if ( $ParamObject->GetParam( Param => 'SearchTemplate' ) && $Self->{Profile} ) {

        return $LayoutObject->Redirect(
            OP =>
                "Action=AgentITSMChangeSearch;Subaction=Search;TakeLastSearch=1;SaveProfile=1;Profile=$Self->{Profile}"
        );
    }

    # get dynamic field object
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    # get the dynamic fields for this screen (change dynamic fields)
    $Self->{DynamicFieldChange} = $DynamicFieldObject->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => 'ITSMChange',
        FieldFilter => $Self->{Config}->{DynamicField} || {},
    );

    # get the dynamic fields for this screen (workorder dynamic fields)
    $Self->{DynamicFieldWorkOrder} = $DynamicFieldObject->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => 'ITSMWorkOrder',
        FieldFilter => $Self->{Config}->{DynamicField} || {},
    );

    # get needed objects
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
    my $SearchProfileObject       = $Kernel::OM->Get('Kernel::System::SearchProfile');

    # get single params
    my %GetParam;

    # load parameters from search profile,
    # this happens when the next result page should be shown, or when the results are reordered
    if ( ( $Self->{Subaction} eq 'LoadProfile' && $Self->{Profile} ) || $Self->{TakeLastSearch} ) {
        %GetParam = $SearchProfileObject->SearchProfileGet(
            Base      => 'ITSMChangeSearch',
            Name      => $Self->{Profile},
            UserLogin => $Self->{UserLogin},
        );
    }
    else {

        # get scalar search params
        for my $ParamName (
            qw(
            ChangeNumber ChangeTitle Description Justification
            CABCustomer
            CABAgent
            WorkOrderTitle WorkOrderInstruction WorkOrderReport ResultForm
            RequestedTimeSearchType PlannedStartTimeSearchType PlannedEndTimeSearchType
            ActualStartTimeSearchType ActualEndTimeSearchType CreateTimeSearchType
            ChangeTimeSearchType
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
            qw( ChangeStateIDs
            ChangeManagerIDs ChangeBuilderIDs
            PriorityIDs CategoryIDs ImpactIDs
            CreateBy
            WorkOrderStateIDs WorkOrderTypeIDs WorkOrderAgentIDs
            )
            )
        {
            my @Array = $ParamObject->GetArray( Param => $SearchParam );
            if (@Array) {
                $GetParam{$SearchParam} = \@Array;
            }
        }

        # get time related params
        for my $TimeType (
            qw( Requested PlannedStart PlannedEnd ActualStart ActualEnd Create Change )
            )
        {

            # get time params fields
            my @Array = $ParamObject->GetArray( Param => $TimeType . 'TimeSearchType' );
            if (@Array) {
                for my $Item (@Array) {
                    $GetParam{ $TimeType . $Item . 'Field' } = 1;
                }
            }

            # get time params details
            for my $Part (
                qw(
                PointFormat Point PointStart
                Start StartDay StartMonth StartYear
                Stop  StopDay  StopMonth  StopYear
                )
                )
            {
                my $ParamKey = "${TimeType}Time${Part}";
                my $ParamVal = $ParamObject->GetParam( Param => $ParamKey );

                # remove white space on the start and end
                if ($ParamVal) {
                    $ParamVal =~ s{ \A \s+ }{}xms;
                    $ParamVal =~ s{ \s+ \z }{}xms;
                }

                # store in %GetParam
                $GetParam{$ParamKey} = $ParamVal;
            }
        }

        # get Dynamic fields from param object
        # cycle trough the activated Dynamic Fields for this screen
        DYNAMICFIELD:
        for my $DynamicFieldConfig (
            @{ $Self->{DynamicFieldChange} },
            @{ $Self->{DynamicFieldWorkOrder} }
            )
        {
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

    # set result form env
    if ( !$GetParam{ResultForm} ) {
        $GetParam{ResultForm} = '';
    }

    # show result site or perform other actions
    if ( $Self->{Subaction} eq 'Search' && !$Self->{EraseTemplate} ) {

        # fill up profile name (e.g. with last-search)
        if ( !$Self->{Profile} || !$Self->{SaveProfile} ) {
            $Self->{Profile} = 'last-search';
        }

        # save search profile (under last-search or real profile name)
        $Self->{SaveProfile} = 1;

        # remember last search values
        if ( $Self->{SaveProfile} && $Self->{Profile} ) {

            # remove old profile stuff
            $SearchProfileObject->SearchProfileDelete(
                Base      => 'ITSMChangeSearch',
                Name      => $Self->{Profile},
                UserLogin => $Self->{UserLogin},
            );

            # insert new profile params
            for my $Key ( sort keys %GetParam ) {
                if ( $GetParam{$Key} ) {
                    $SearchProfileObject->SearchProfileAdd(
                        Base      => 'ITSMChangeSearch',
                        Name      => $Self->{Profile},
                        Key       => $Key,
                        Value     => $GetParam{$Key},
                        UserLogin => $Self->{UserLogin},
                    );
                }
            }
        }

        # prepare CABAgents and CABCustomers
        if ( $GetParam{CABAgent} ) {
            $GetParam{CABAgents} = [ $GetParam{CABAgent} ];
        }
        if ( $GetParam{CABCustomer} ) {
            $GetParam{CABCustomers} = [ $GetParam{CABCustomer} ];
        }

        # get session object
        my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

        # store last queue screen
        my $URL = "Action=AgentITSMChangeSearch;Subaction=Search;Profile=$Self->{Profile};SortBy=$Self->{SortBy}"
            . ";OrderBy=$Self->{OrderBy};TakeLastSearch=1;StartHit=$Self->{StartHit}";
        $SessionObject->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => 'LastScreenChanges',
            Value     => $URL,
        );
        $SessionObject->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => 'LastChangeView',
            Value     => $URL,
        );

        # get time object
        my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

        # get and check the time search parameters
        TIMETYPE:
        for my $TimeType (
            qw( Requested PlannedStart PlannedEnd ActualStart ActualEnd Create Change )
            )
        {

            # extract the time search parameters for $TimeType into %TimeSelectionParam
            my %TimeSelectionParam;
            for my $Part (
                qw(
                SearchType
                PointFormat Point PointStart
                Start StartDay StartMonth StartYear
                Stop  StopDay  StopMonth  StopYear
                )
                )
            {
                $TimeSelectionParam{$Part} = $GetParam{ $TimeType . 'Time' . $Part };
            }

            # nothing to do, when no time search type has been selected
            next TIMETYPE if !$TimeSelectionParam{SearchType};

            if ( $TimeSelectionParam{SearchType} eq 'TimeSlot' ) {

                my %SystemTime;    # used for checking the ordering of the two times

                # the earlier limit
                if (
                    $TimeSelectionParam{StartDay}
                    && $TimeSelectionParam{StartMonth}
                    && $TimeSelectionParam{StartYear}
                    )
                {

                    # format as timestamp
                    $GetParam{ $TimeType . 'TimeNewerDate' } = sprintf
                        '%04d-%02d-%02d 00:00:00',
                        $TimeSelectionParam{StartYear},
                        $TimeSelectionParam{StartMonth},
                        $TimeSelectionParam{StartDay};
                }

                # the later limit
                if (
                    $TimeSelectionParam{StopDay}
                    && $TimeSelectionParam{StopMonth}
                    && $TimeSelectionParam{StopYear}
                    )
                {

                    # format as timestamp
                    $GetParam{ $TimeType . 'TimeOlderDate' } = sprintf
                        '%04d-%02d-%02d 23:59:59',
                        $TimeSelectionParam{StopYear},
                        $TimeSelectionParam{StopMonth},
                        $TimeSelectionParam{StopDay};
                }
            }
            elsif ( $TimeSelectionParam{SearchType} eq 'TimePoint' ) {

                # queries relative to now
                if (
                    $TimeSelectionParam{Point}
                    && $TimeSelectionParam{PointStart}
                    && $TimeSelectionParam{PointFormat}
                    )
                {
                    my $DiffSeconds = 0;
                    if ( $TimeSelectionParam{PointFormat} eq 'minute' ) {
                        $DiffSeconds = $TimeSelectionParam{Point} * 60;
                    }
                    elsif ( $TimeSelectionParam{PointFormat} eq 'hour' ) {
                        $DiffSeconds = $TimeSelectionParam{Point} * 60 * 60;
                    }
                    elsif ( $TimeSelectionParam{PointFormat} eq 'day' ) {
                        $DiffSeconds = $TimeSelectionParam{Point} * 60 * 60 * 24;
                    }
                    elsif ( $TimeSelectionParam{PointFormat} eq 'week' ) {
                        $DiffSeconds = $TimeSelectionParam{Point} * 60 * 60 * 24 * 7;
                    }
                    elsif ( $TimeSelectionParam{PointFormat} eq 'month' ) {
                        $DiffSeconds = $TimeSelectionParam{Point} * 60 * 60 * 24 * 30;
                    }
                    elsif ( $TimeSelectionParam{PointFormat} eq 'year' ) {
                        $DiffSeconds = $TimeSelectionParam{Point} * 60 * 60 * 24 * 365;
                    }

                    my $CurrentSystemTime = $TimeObject->SystemTime();
                    my $CurrentTimeStamp  = $TimeObject->SystemTime2TimeStamp(
                        SystemTime => $CurrentSystemTime
                    );
                    if ( $TimeSelectionParam{PointStart} eq 'Before' ) {

                        # search in the future
                        my $SearchTimeStamp = $TimeObject->SystemTime2TimeStamp(
                            SystemTime => $CurrentSystemTime + $DiffSeconds,
                        );
                        $GetParam{ $TimeType . 'TimeNewerDate' } = $CurrentTimeStamp;
                        $GetParam{ $TimeType . 'TimeOlderDate' } = $SearchTimeStamp;
                    }
                    else {
                        my $SearchTimeStamp = $TimeObject->SystemTime2TimeStamp(
                            SystemTime => $CurrentSystemTime - $DiffSeconds,
                        );
                        $GetParam{ $TimeType . 'TimeNewerDate' } = $SearchTimeStamp;
                        $GetParam{ $TimeType . 'TimeOlderDate' } = $CurrentTimeStamp;
                    }
                }
            }
            else {

                # unknown search types are simply ignored
            }
        }

        # search for substrings by default
        for my $Field (
            qw(ChangeTitle WorkOrderTitle Description Justification
            WorkOrderInstruction WorkOrderReport
            )
            )
        {
            if ( defined( $GetParam{$Field} ) && $GetParam{$Field} ne '' ) {
                $GetParam{$Field} = "*$GetParam{$Field}*";
            }
        }

        # dynamic fields search parameters for ticket search
        my %DynamicFieldSearchParameters;

        # cycle trough the activated Dynamic Fields for this screen
        DYNAMICFIELD:
        for my $DynamicFieldConfig (
            @{ $Self->{DynamicFieldChange} },
            @{ $Self->{DynamicFieldWorkOrder} }
            )
        {
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

        # get change object
        my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

        # perform change search
        my $ViewableChangeIDs = $ChangeObject->ChangeSearch(
            Result           => 'ARRAY',
            OrderBy          => [ $Self->{SortBy} ],
            OrderByDirection => [ $Self->{OrderBy} ],
            Limit            => $Self->{SearchLimit},
            MirrorDB         => 1,
            UserID           => $Self->{UserID},
            %GetParam,
            %DynamicFieldSearchParameters,
        );

        # get user object
        my $UserObject = $Kernel::OM->Get('Kernel::System::User');

        # CSV output
        if ( $GetParam{ResultForm} eq 'CSV' ) {
            my @CSVHead;
            my @CSVData;

            # get all change dynamic fields that are configured for the search csv output
            my %FieldFilter;
            FIELD:
            for my $Field ( @{ $Self->{Config}->{SearchCSVData} } ) {
                if ( $Field =~ m{ \A DynamicField_ ( [a-zA-Z\d]+ ) \z }xms ) {
                    $FieldFilter{$1} = 1;
                }
            }

            # get all dynamic fields for ITSMChange with the selected field filter
            my $DynamicFieldsITSMChange = $DynamicFieldObject->DynamicFieldListGet(
                Valid       => 1,
                ObjectType  => 'ITSMChange',
                FieldFilter => \%FieldFilter,
            );

            ID:
            for my $ChangeID ( @{$ViewableChangeIDs} ) {

                # to store data of sub-elements
                my %SubElementData;

                # get change data
                my $Change = $ChangeObject->ChangeGet(
                    UserID   => $Self->{UserID},
                    ChangeID => $ChangeID,
                );

                next ID if !$Change;

                # to store all data
                my %Info = %{$Change};

                # get user data for needed user types
                USERTYPE:
                for my $UserType (qw(ChangeBuilder ChangeManager WorkOrderAgent)) {

                    # check if UserType attribute exists either in change or workorder
                    if ( !$Change->{ $UserType . 'ID' } && !$Info{ $UserType . 'ID' } ) {
                        next USERTYPE;
                    }

                    # get user data
                    my %User = $UserObject->GetUserData(
                        UserID => $Change->{ $UserType . 'ID' } || $Info{ $UserType . 'ID' },
                        Cached => 1,
                    );

                    # set user data
                    $Info{ $UserType . 'UserLogin' }        = $User{UserLogin};
                    $Info{ $UserType . 'UserFirstname' }    = $User{UserFirstname};
                    $Info{ $UserType . 'UserLastname' }     = $User{UserLastname};
                    $Info{ $UserType . 'LeftParenthesis' }  = '(';
                    $Info{ $UserType . 'RightParenthesis' } = ')';

                    # set user full name
                    $Info{$UserType} = $User{UserLogin} . ' (' . $User{UserFirstname}
                        . $User{UserLastname} . ')';
                }

                # to store the linked service data
                my $LinkListWithData = {};

                my @WorkOrderIDs;

                # store the combined linked services data from all workorders of this change
                @WorkOrderIDs = @{ $Change->{WorkOrderIDs} };

                # store the combined linked services data
                for my $WorkOrderID (@WorkOrderIDs) {

                    # get linked objects of this workorder
                    my $LinkListWithDataWorkOrder = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkListWithData(
                        Object => 'ITSMWorkOrder',
                        Key    => $WorkOrderID,
                        State  => 'Valid',
                        UserID => $Self->{UserID},
                    );

                    OBJECT:
                    for my $Object ( sort keys %{$LinkListWithDataWorkOrder} ) {

                        # only show linked services of workorder
                        next OBJECT if $Object ne 'Service';

                        LINKTYPE:
                        for my $LinkType ( sort keys %{ $LinkListWithDataWorkOrder->{$Object} } ) {

                            DIRECTION:
                            for my $Direction (
                                sort keys %{ $LinkListWithDataWorkOrder->{$Object}->{$LinkType} }
                                )
                            {

                                ID:
                                for my $ID (
                                    sort keys %{
                                        $LinkListWithDataWorkOrder->{$Object}->{$LinkType}
                                            ->{$Direction}
                                    }
                                    )
                                {

                                    # combine the linked object data from all workorders
                                    $LinkListWithData->{$Object}->{$LinkType}->{$Direction}->{$ID}
                                        = $LinkListWithDataWorkOrder->{$Object}->{$LinkType}
                                        ->{$Direction}->{$ID};
                                }
                            }
                        }
                    }
                }

                # get unique service ids
                my %UniqueServiceIDs;
                my $ServicesRef = $LinkListWithData->{Service} || {};
                for my $LinkType ( sort keys %{$ServicesRef} ) {

                    # extract link type List
                    my $LinkTypeList = $ServicesRef->{$LinkType};

                    for my $Direction ( sort keys %{$LinkTypeList} ) {

                        # extract direction list
                        my $DirectionList = $ServicesRef->{$LinkType}->{$Direction};

                        # collect unique service ids
                        for my $ServiceID ( sort keys %{$DirectionList} ) {
                            $UniqueServiceIDs{$ServiceID}++;
                        }
                    }
                }

                # get the data for each service
                my @ServicesData;
                SERVICEID:
                for my $ServiceID ( sort keys %UniqueServiceIDs ) {

                    # get service data
                    my %ServiceData = $Kernel::OM->Get('Kernel::System::Service')->ServiceGet(
                        ServiceID => $ServiceID,
                        UserID    => $Self->{UserID},
                    );

                    # store service data
                    push @ServicesData, \%ServiceData;
                }

                # sort services data by service name
                @ServicesData = sort { $a->{Name} cmp $b->{Name} } @ServicesData;

                # store services data
                if ( scalar @ServicesData ) {
                    SERVICE:
                    for my $Service (@ServicesData) {
                        my $ServiceName = $Service->{NameShort};
                        if ( $Info{Services} ) {
                            $Info{Services} .= ' ' . $ServiceName;
                            next SERVICE;
                        }
                        $Info{Services} = $ServiceName;
                    }
                }

                # csv quote
                if ( !@CSVHead ) {
                    @CSVHead = @{ $Self->{Config}->{SearchCSVData} };
                }

                my @Data;
                for my $Header (@CSVHead) {

                    # if the column is a dynamic field
                    if ( $Header =~ m{ \A DynamicField_ ( [a-zA-Z\d]+ ) \z }xms ) {

                        my $DynamicFieldName = $1;

                        DYNAMICFIELD:
                        for my $DynamicFieldConfig ( @{$DynamicFieldsITSMChange} ) {

                            next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);
                            next DYNAMICFIELD if $DynamicFieldConfig->{Name} ne $DynamicFieldName;

                            # get print string for this dynamic field
                            my $Value = $DynamicFieldBackendObject->DisplayValueRender(
                                DynamicFieldConfig => $DynamicFieldConfig,
                                Value              => $Info{$Header},
                                ValueMaxChars      => 100,
                                LayoutObject       => $LayoutObject,
                            );

                            $Info{$Header} = $Value->{Value};

                            last DYNAMICFIELD;
                        }
                    }

                    push @Data, $Info{$Header};
                }

                push @CSVData, \@Data;
            }

            # csv quote
            # translate non existing header may result in a garbage file
            if ( !@CSVHead ) {
                @CSVHead = @{ $Self->{Config}->{SearchCSVData} };
            }

            # translate headers
            for my $Header (@CSVHead) {

                # replace ChangeNumber header with the current ChangeHook from config
                if ( $Header eq 'ChangeNumber' ) {
                    $Header = $ConfigObject->Get('ITSMChange::Hook');
                }
                else {
                    $Header = $LayoutObject->{LanguageObject}->Translate($Header);
                }
            }

            # assable CSV data
            my $CSV = $Kernel::OM->Get('Kernel::System::CSV')->Array2CSV(
                Head      => \@CSVHead,
                Data      => \@CSVData,
                Separator => $Self->{UserCSVSeparator},
            );

            # return csv to download
            my $CSVFile = 'change_search';
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

            # to store all data
            my %Info;

            # get pdf object
            my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

            # to send data to the PDF output
            my @PDFData;
            ID:
            for my $ChangeID ( @{$ViewableChangeIDs} ) {

                # get change data
                my $Change = $ChangeObject->ChangeGet(
                    UserID   => $Self->{UserID},
                    ChangeID => $ChangeID,
                );

                next ID if !$Change;

                # add change data,
                %Info = %{$Change};

                # get user data for needed user types
                USERTYPE:
                for my $UserType (qw(ChangeBuilder ChangeManager WorkOrderAgent)) {

                    # check if UserType attribute exists either in change or workorder
                    if ( !$Change->{ $UserType . 'ID' } && !$Info{ $UserType . 'ID' } ) {
                        next USERTYPE;
                    }

                    # get user data
                    my %User = $UserObject->GetUserData(
                        UserID =>
                            $Change->{ $UserType . 'ID' } || $Info{ $UserType . 'ID' },
                        Cached => 1,
                    );

                    # set user full name
                    $Info{$UserType} = $User{UserLogin} . ' (' . $User{UserFirstname}
                        . $User{UserLastname} . ')';
                }

                my $ChangeTitle = $LayoutObject->Output(
                    Template => '[% Data.ChangeTitle | truncate(30) | html %]',
                    Data     => \%Info,
                );

                my $PlannedStart = $LayoutObject->Output(
                    Template => '[% Data.PlannedStartTime | Localize("TimeLong") %]',
                    Data     => \%Info,
                );

                my $PlannedEnd = $LayoutObject->Output(
                    Template => '[% Data.PlannedEndTime | Localize("TimeLong") %]',
                    Data     => \%Info,
                );

                my @PDFRow;
                push @PDFRow,  $Info{ChangeNumber};
                push @PDFRow,  $ChangeTitle;
                push @PDFRow,  $Info{ChangeBuilder};
                push @PDFRow,  $Info{WorkOrderCount};
                push @PDFRow,  $Info{ChangeState};
                push @PDFRow,  $Info{Priority};
                push @PDFRow,  $PlannedStart;
                push @PDFRow,  $PlannedEnd;
                push @PDFData, \@PDFRow;
            }

            # PDF Output
            my $Title     = $LayoutObject->{LanguageObject}->Translate('Change Search');
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

            # output 'No ticket data found', if no content was given
            if (@PDFData) {
                $CellData->[0]->[0]->{Content} = $ConfigObject->Get('ITSMChange::Hook');
                $CellData->[0]->[0]->{Font}    = 'ProportionalBold';
                $CellData->[0]->[1]->{Content} = $LayoutObject->{LanguageObject}->Translate('ChangeTitle');
                $CellData->[0]->[1]->{Font}    = 'ProportionalBold';
                $CellData->[0]->[2]->{Content} = $LayoutObject->{LanguageObject}->Translate('ChangeBuilder');
                $CellData->[0]->[2]->{Font}    = 'ProportionalBold';
                $CellData->[0]->[3]->{Content} = $LayoutObject->{LanguageObject}->Translate('WorkOrders');
                $CellData->[0]->[3]->{Font}    = 'ProportionalBold';
                $CellData->[0]->[4]->{Content} = $LayoutObject->{LanguageObject}->Translate('ChangeState');
                $CellData->[0]->[4]->{Font}    = 'ProportionalBold';
                $CellData->[0]->[5]->{Content} = $LayoutObject->{LanguageObject}->Translate('Priority');
                $CellData->[0]->[5]->{Font}    = 'ProportionalBold';
                $CellData->[0]->[6]->{Content} = $LayoutObject->{LanguageObject}->Translate('PlannedStartTime');
                $CellData->[0]->[6]->{Font}    = 'ProportionalBold';
                $CellData->[0]->[7]->{Content} = $LayoutObject->{LanguageObject}->Translate('PlannedEndTime');
                $CellData->[0]->[7]->{Font}    = 'ProportionalBold';

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
                $CellData->[0]->[0]->{Content} = $LayoutObject->{LanguageObject}->Translate('No ticket data found.');
            }

            # page params
            my %PageParam;
            $PageParam{PageOrientation} = 'landscape';
            $PageParam{MarginTop}       = 30;
            $PageParam{MarginRight}     = 40;
            $PageParam{MarginBottom}    = 40;
            $PageParam{MarginLeft}      = 40;
            $PageParam{HeaderRight}     = $Title;

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

            # create new pdf document
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
                    . $Self->{UserEmail} . ') '
                    . $Time,
                FontSize => 9,
            );

            $PDFObject->PositionSet(
                Move => 'relativ',
                Y    => -14,
            );

            PAGE:
            for my $Count ( 2 .. $MaxPages ) {

                # output table (or a fragment of it)
                %TableParam = $PDFObject->Table( %TableParam, );

                # stop output or another page
                if ( $TableParam{State} ) {
                    last PAGE;
                }
                else {
                    $PDFObject->PageNew(
                        %PageParam, FooterRight => $Page
                            . ' '
                            . $Count,
                    );
                }
            }

            # return the pdf document
            my $Filename = 'change_search';
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

            # start html page
            my $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();
            $LayoutObject->Print( Output => \$Output );
            $Output = '';

            $Self->{Filter} = $ParamObject->GetParam( Param => 'Filter' ) || '';
            $Self->{View}   = $ParamObject->GetParam( Param => 'View' )   || '';

            # show changes
            my $LinkPage = 'Filter='
                . $LayoutObject->Ascii2Html( Text => $Self->{Filter} )
                . ';View=' . $LayoutObject->Ascii2Html( Text => $Self->{View} )
                . ';SortBy=' . $LayoutObject->Ascii2Html( Text => $Self->{SortBy} )
                . ';OrderBy='
                . $LayoutObject->Ascii2Html( Text => $Self->{OrderBy} )
                . ';Profile=' . $Self->{Profile} . ';TakeLastSearch=1;Subaction=Search'
                . ';';
            my $LinkSort = 'Filter='
                . $LayoutObject->Ascii2Html( Text => $Self->{Filter} )
                . ';View=' . $LayoutObject->Ascii2Html( Text => $Self->{View} )
                . ';Profile=' . $Self->{Profile} . ';TakeLastSearch=1;Subaction=Search'
                . ';';
            my $LinkFilter = 'TakeLastSearch=1;Subaction=Search;Profile='
                . $LayoutObject->Ascii2Html( Text => $Self->{Profile} )
                . ';';
            my $LinkBack = 'Subaction=LoadProfile;Profile='
                . $LayoutObject->Ascii2Html( Text => $Self->{Profile} )
                . ';TakeLastSearch=1;';

            # find out which columns should be shown
            my @ShowColumns;
            if ( $Self->{Config}->{ShowColumns} ) {

                # get all possible columns from config
                my %PossibleColumn = %{ $Self->{Config}->{ShowColumns} };

                # get the column names that should be shown
                COLUMNNAME:
                for my $Name ( sort keys %PossibleColumn ) {
                    next COLUMNNAME if !$PossibleColumn{$Name};
                    push @ShowColumns, $Name;
                }
            }

            $Output .= $LayoutObject->ITSMChangeListShow(
                ChangeIDs    => $ViewableChangeIDs,
                Total        => scalar @{$ViewableChangeIDs},
                View         => $Self->{View},
                Env          => $Self,
                LinkPage     => $LinkPage,
                LinkSort     => $LinkSort,
                LinkFilter   => $LinkFilter,
                LinkBack     => $LinkBack,
                Profile      => $Self->{Profile},
                TitleName    => $LayoutObject->{LanguageObject}->Translate('Change Search Result'),
                ShowColumns  => \@ShowColumns,
                SortBy       => $LayoutObject->Ascii2Html( Text => $Self->{SortBy} ),
                OrderBy      => $LayoutObject->Ascii2Html( Text => $Self->{OrderBy} ),
                RequestedURL => 'Action=' . $Self->{Action} . ';' . $LinkPage,
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
            Base      => 'ITSMChangeSearch',
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
            Type        => 'inline'
        );
    }
    elsif ( $Self->{Subaction} eq 'AJAX' ) {

        my $Output .= $Self->_MaskForm(
            %GetParam,
        );

        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentITSMChangeSearch',
            Data         => \%Param,
        );
        return $LayoutObject->Attachment(
            NoCache     => 1,
            ContentType => 'text/html',
            Content     => $Output,
            Type        => 'inline'
        );

    }

    # There was no 'SubAction', or there were validation errors, or an user or customer was searched
    # generate search mask
    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();

    $LayoutObject->Block(
        Name => 'Search',
        Data => \%Param,
    );
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMChangeSearch',
        Data         => \%Param,
    );
    $Output .= $LayoutObject->Footer();

    return $Output;
}

sub _MaskForm {
    my ( $Self, %Param ) = @_;

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $Profile = $ParamObject->GetParam( Param => 'Profile' ) || '';
    my $EmptySearch = $ParamObject->GetParam( Param => 'EmptySearch' );
    if ( !$Profile ) {
        $EmptySearch = 1;
    }

    # get search profile object
    my $SearchProfileObject = $Kernel::OM->Get('Kernel::System::SearchProfile');

    my %GetParam = $SearchProfileObject->SearchProfileGet(
        Base      => 'ITSMChangeSearch',
        Name      => $Profile,
        UserLogin => $Self->{UserLogin},
    );

    # allow profile overwrite the contents of %Param
    %Param = (
        %Param,
        %GetParam,
    );

    # get user object
    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # set user friendly CABAgent field
    if ( $Param{CABAgent} && $Param{CABAgent} ne '' ) {

        # get user data
        my %UserData = $UserObject->GetUserData(
            UserID => $Param{CABAgent},
        );

        # set user frenly CABAgent string
        my $UserValue = sprintf '"%s %s" <%s>',
            $UserData{UserFirstname},
            $UserData{UserLastname},
            $UserData{UserEmail};

        $Param{CABAgentSearch} = $UserValue;
    }

    # set user frendly CABCustomer field
    if ( $Param{CABCustomer} && $Param{CABCustomer} ne '' ) {

        # get customer data
        my %CustomerSearchList = $Kernel::OM->Get('Kernel::System::CustomerUser')->CustomerSearch(
            Search => $Param{CABCustomer},
        );
        $Param{CABCustomerSearch} = $CustomerSearchList{ $Param{CABCustomer} };
    }

    # set attributes string
    my @Attributes = (
        {
            Key   => 'ChangeNumber',
            Value => Translatable('Change Number'),
        },
        {
            Key   => 'ChangeTitle',
            Value => Translatable('Change Title'),
        },
        {
            Key   => 'WorkOrderTitle',
            Value => Translatable('Work Order Title'),
        },
        {
            Key   => 'CABAgent',
            Value => Translatable('CAB Agent'),
        },
        {
            Key   => 'CABCustomer',
            Value => Translatable('CAB Customer'),
        },
        {
            Key      => '',
            Value    => '-',
            Disabled => 1,
        },
        {
            Key   => 'Description',
            Value => Translatable('Change Description'),
        },
        {
            Key   => 'Justification',
            Value => Translatable('Change Justification'),
        },
        {
            Key   => 'WorkOrderInstruction',
            Value => Translatable('WorkOrder Instruction'),
        },
        {
            Key   => 'WorkOrderReport',
            Value => Translatable('WorkOrder Report'),
        },
    );

    # get dynamic field backend object
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    my $DynamicFieldSeparator = 1;
    my $LastObjectType        = '';

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # create dynamic fields search options for attribute select
    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig (
        @{ $Self->{DynamicFieldChange} },
        @{ $Self->{DynamicFieldWorkOrder} }
        )
    {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);
        next DYNAMICFIELD if !$DynamicFieldConfig->{Name};
        next DYNAMICFIELD if $DynamicFieldConfig->{Name} eq '';

        if (
            $LastObjectType eq 'ITSMChange'
            && $DynamicFieldConfig->{ObjectType} eq 'ITSMWorkOrder'
            )
        {
            $DynamicFieldSeparator = 1;
        }

        # save the last object type (needed for separator between change and workorder fields)
        $LastObjectType = $DynamicFieldConfig->{ObjectType};

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
    for my $DynamicFieldConfig (
        @{ $Self->{DynamicFieldChange} },
        @{ $Self->{DynamicFieldWorkOrder} }
        )
    {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # get search field preferences
        my $SearchFieldPreferences = $DynamicFieldBackendObject->SearchFieldPreferences(
            DynamicFieldConfig => $DynamicFieldConfig,
        );

        next DYNAMICFIELD if !IsArrayRefWithData($SearchFieldPreferences);

        # get PossibleValues
        my $PossibleValues = $DynamicFieldBackendObject->PossibleValuesGet(
            DynamicFieldConfig   => $DynamicFieldConfig,
            OverridePossibleNone => 0,
        );

        PREFERENCE:
        for my $Preference ( @{$SearchFieldPreferences} ) {

            # get field html
            $DynamicFieldHTML{ $DynamicFieldConfig->{Name} . $Preference->{Type} }
                = $DynamicFieldBackendObject->SearchFieldRender(
                DynamicFieldConfig   => $DynamicFieldConfig,
                Profile              => \%GetParam,
                PossibleValuesFilter => $PossibleValues,
                DefaultValue =>
                    $Self->{Config}->{Defaults}->{DynamicField}
                    ->{ $DynamicFieldConfig->{Name} },
                LayoutObject => $LayoutObject,
                Type         => $Preference->{Type},
                );
        }
    }

    push @Attributes, (
        {
            Key   => 'PriorityIDs',
            Value => Translatable('Change Priority'),
        },
        {
            Key   => 'ImpactIDs',
            Value => Translatable('Change Impact'),
        },
        {
            Key   => 'CategoryIDs',
            Value => Translatable('Change Category'),
        },
        {
            Key   => 'ChangeStateIDs',
            Value => Translatable('Change State'),
        },
        {
            Key   => 'ChangeManagerIDs',
            Value => Translatable('Change Manager'),
        },
        {
            Key   => 'ChangeBuilderIDs',
            Value => Translatable('Change Builder'),
        },
        {
            Key   => 'CreateBy',
            Value => Translatable('Created By'),
        },
        {
            Key   => 'WorkOrderStateIDs',
            Value => Translatable('WorkOrder State'),
        },
        {
            Key   => 'WorkOrderTypeIDs',
            Value => Translatable('WorkOrder Type'),
        },
        {
            Key   => 'WorkOrderAgentIDs',
            Value => Translatable('WorkOrder Agent'),
        },
        {
            Key      => '',
            Value    => '-',
            Disabled => 1,
        },
    );

    # set time attributes
    my @TimeTypes = (
        {
            Prefix => 'Requested',
            Title  => Translatable('Requested Date'),
        },
        {
            Prefix => 'PlannedStart',
            Title  => Translatable('Planned Start Time'),
        },
        {
            Prefix => 'PlannedEnd',
            Title  => Translatable('Planned End Time'),
        },
        {
            Prefix => 'ActualStart',
            Title  => Translatable('Actual Start Time'),
        },
        {
            Prefix => 'ActualEnd',
            Title  => Translatable('Actual End Time'),
        },
        {
            Prefix => 'Create',
            Title  => Translatable('Create Time'),
        },
        {
            Prefix => 'Change',
            Title  => Translatable('Change Time'),
        },
    );

    TIMETYPE:
    for my $TimeType (@TimeTypes) {
        my $Prefix = $TimeType->{Prefix};

        # show RequestedTime only when enabled in SysConfig
        if ( $Prefix eq 'Requested' && !$Self->{Config}->{RequestedTime} ) {
            next TIMETYPE;
        }

        my $Title                   = $LayoutObject->{LanguageObject}->Translate( $TimeType->{Title} );
        my $BeforeAfterTranslatable = $LayoutObject->{LanguageObject}->Translate('(before/after)');
        my $BetweenTranslatable     = $LayoutObject->{LanguageObject}->Translate('(between)');
        push @Attributes, (
            {
                Key   => $Prefix . 'TimePointField',
                Value => $Title . " $BeforeAfterTranslatable",
            },
            {
                Key   => $Prefix . 'TimeSlotField',
                Value => $Title . " $BetweenTranslatable",
            },

        );
    }

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

    # Get a complete list of users
    # for the selection 'ChangeBuilder', 'ChangeManager' and 'created by user'.
    # It is important to also search for invalid agents, as we want to find
    # these changes too.
    # Out of office nice might be appended to the values.
    my %Users = $UserObject->UserList(
        Type  => 'Long',
        Valid => 0,
    );

    # dropdown menu for 'created by users'
    $Param{'CreateBySelectionString'} = $LayoutObject->BuildSelection(
        Data       => \%Users,
        Name       => 'CreateBy',
        Multiple   => 1,
        Size       => 5,
        SelectedID => $Param{CreateBy},
        Class      => 'Modernize',
    );

    # build change manager dropdown
    $Param{'ChangeManagerSelectionString'} = $LayoutObject->BuildSelection(
        Data       => \%Users,
        Name       => 'ChangeManagerIDs',
        Multiple   => 1,
        Size       => 5,
        SelectedID => $Param{ChangeManagerIDs},
        Class      => 'Modernize',
    );

    # build change builder dropdown
    $Param{'ChangeBuilderSelectionString'} = $LayoutObject->BuildSelection(
        Data       => \%Users,
        Name       => 'ChangeBuilderIDs',
        Multiple   => 1,
        Size       => 5,
        SelectedID => $Param{ChangeBuilderIDs},
        Class      => 'Modernize',
    );

    # get change object
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

    # get possible Change Categories
    my $Categories = $ChangeObject->ChangePossibleCIPGet(
        Type   => 'Category',
        UserID => $Self->{UserID},
    );
    $Param{'ChangeCategorySelectionString'} = $LayoutObject->BuildSelection(
        Data       => $Categories,
        Name       => 'CategoryIDs',
        Multiple   => 1,
        Size       => 5,
        SelectedID => $Param{CategoryIDs},
        Class      => 'Modernize',
    );

    # get possible Change Impacts
    my $Impacts = $ChangeObject->ChangePossibleCIPGet(
        Type   => 'Impact',
        UserID => $Self->{UserID},
    );
    $Param{'ChangeImpactSelectionString'} = $LayoutObject->BuildSelection(
        Data       => $Impacts,
        Name       => 'ImpactIDs',
        Multiple   => 1,
        Size       => 5,
        SelectedID => $Param{ImpactIDs},
        Class      => 'Modernize',
    );

    # get possible Change Priorities
    my $Priorities = $ChangeObject->ChangePossibleCIPGet(
        Type   => 'Priority',
        UserID => $Self->{UserID},
    );
    $Param{'ChangePrioritySelectionString'} = $LayoutObject->BuildSelection(
        Data       => $Priorities,
        Name       => 'PriorityIDs',
        Multiple   => 1,
        Size       => 5,
        SelectedID => $Param{PriorityIDs},
        Class      => 'Modernize',
    );

    # get change states
    my $ChangeStates = $ChangeObject->ChangePossibleStatesGet(
        UserID => $Self->{UserID},
    );
    $Param{'ChangeStateSelectionString'} = $LayoutObject->BuildSelection(
        Data       => $ChangeStates,
        Name       => 'ChangeStateIDs',
        Multiple   => 1,
        Size       => 5,
        SelectedID => $Param{ChangeStateIDs},
        Class      => 'Modernize',
    );

    # get workorder agents
    $Param{'WorkOrderAgentIDSelectionString'} = $LayoutObject->BuildSelection(
        Data       => \%Users,
        Name       => 'WorkOrderAgentIDs',
        Multiple   => 1,
        Size       => 5,
        SelectedID => $Param{WorkOrderAgentIDs},
        Class      => 'Modernize',
    );

    # get work order object
    my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');

    # get workorder states
    my $WorkOrderStates = $WorkOrderObject->WorkOrderPossibleStatesGet(
        UserID => 1,
    );
    $Param{'WorkOrderStateSelectionString'} = $LayoutObject->BuildSelection(
        Data       => $WorkOrderStates,
        Name       => 'WorkOrderStateIDs',
        Multiple   => 1,
        Size       => 5,
        SelectedID => $Param{WorkOrderStateIDs},
        Class      => 'Modernize',
    );

    # get workorder types
    my $WorkOrderTypes = $WorkOrderObject->WorkOrderTypeList(
        UserID => 1,
    );
    $Param{'WorkOrderTypeSelectionString'} = $LayoutObject->BuildSelection(
        Data       => $WorkOrderTypes,
        Name       => 'WorkOrderTypeIDs',
        Multiple   => 1,
        Size       => 5,
        SelectedID => $Param{WorkOrderTypeIDs},
        Class      => 'Modernize',
    );

    # set result output formats
    $Param{ResultFormStrg} = $LayoutObject->BuildSelection(
        Data => {
            Normal => Translatable('Normal'),
            Print  => Translatable('Print'),
            CSV    => Translatable('CSV'),
        },
        Name       => 'ResultForm',
        SelectedID => $Param{ResultForm} || 'Normal',
        Class      => 'Modernize',
    );

    my %Profiles = $SearchProfileObject->SearchProfileList(
        Base      => 'ITSMChangeSearch',
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

        # Do not modernize this field as this causes problems with the automatic focussing of the first element.
    );

    # html search mask output
    $LayoutObject->Block(
        Name => 'SearchAJAX',
        Data => { %Param, },    #%GetParam },
    );

    # number of minutes, days, weeks, months and years
    my %OneToFiftyNine = map { $_ => sprintf '%2s', $_ } ( 1 .. 59 );

    # time period that can be selected from the GUI
    my %TimePeriod = %{ $ConfigObject->Get('ITSMWorkOrder::TimePeriod') };

    TIMETYPE:
    for my $TimeType (@TimeTypes) {
        my $Prefix = $TimeType->{Prefix};

        # show RequestedTime only when enabled in SysConfig
        if ( $Prefix eq 'Requested' && !$Self->{Config}->{RequestedTime} ) {
            next TIMETYPE;
        }

        my $Title             = $LayoutObject->{LanguageObject}->Translate( $TimeType->{Title} );
        my %TimeSelectionData = (
            Prefix => $Prefix,
            Title  => $Title,
        );

        $TimeSelectionData{TimePoint} = $LayoutObject->BuildSelection(
            Data       => \%OneToFiftyNine,
            Name       => $Prefix . 'TimePoint',
            SelectedID => $Param{ $Prefix . 'TimePoint' },
        );

        $TimeSelectionData{TimePointStart} = $LayoutObject->BuildSelection(
            Data => {
                'Last'   => Translatable('last'),
                'Before' => Translatable('before'),
            },
            Name       => $Prefix . 'TimePointStart',
            SelectedID => $Param{ $Prefix . 'TimePointStart' } || 'Last',
        );

        $TimeSelectionData{TimePointFormat} = $LayoutObject->BuildSelection(
            Data => {
                minute => Translatable('minute(s)'),
                hour   => Translatable('hour(s)'),
                day    => Translatable('day(s)'),
                week   => Translatable('week(s)'),
                month  => Translatable('month(s)'),
                year   => Translatable('year(s)'),
            },
            Name       => $Prefix . 'TimePointFormat',
            SelectedID => $Param{ $Prefix . 'TimePointFormat' },
        );

        $TimeSelectionData{TimeStart} = $LayoutObject->BuildDateSelection(
            %Param,
            %TimePeriod,
            Prefix   => $Prefix . 'TimeStart',
            Format   => 'DateInputFormat',
            Validate => 1,
            DiffTime => -( ( 60 * 60 * 24 ) * 30 ),
        );

        $TimeSelectionData{TimeStop} = $LayoutObject->BuildDateSelection(
            %Param,
            %TimePeriod,
            Prefix => $Prefix . 'TimeStop',
            Format => 'DateInputFormat',
        );

        # show time field
        $LayoutObject->Block(
            Name => 'TimeSelection',
            Data => \%TimeSelectionData,
        );
    }

    # output Dynamic fields blocks
    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig (
        @{ $Self->{DynamicFieldChange} },
        @{ $Self->{DynamicFieldWorkOrder} }
        )
    {
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
        next ITEM if !defined $Param{$Key};
        next ITEM if $Param{$Key} eq '';
        next ITEM if $AlreadyShown{$Key};
        if ( ref $Param{$Key} eq 'ARRAY' && !@{ $Param{$Key} } ) {
            next ITEM;
        }
        $AlreadyShown{$Key} = 1;

        $LayoutObject->Block(
            Name => 'SearchAJAXShow',
            Data => {
                Attribute => $Key,
            },
        );
    }

    # if no attribute is shown, show change number
    if ( !$Profile ) {

        $LayoutObject->Block(
            Name => 'SearchAJAXShow',
            Data => {
                Attribute => 'ChangeNumber',
            },
        );
    }

    # build output
    my $Output = $LayoutObject->Output(
        TemplateFile => 'AgentITSMChangeSearch',
        Data         => \%Param,
    );

    return $Output;
}

1;
