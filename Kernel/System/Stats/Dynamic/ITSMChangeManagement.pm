# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Stats::Dynamic::ITSMChangeManagement;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::ITSMChange',
    'Kernel::System::Log',
    'Kernel::System::Time',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get the dynamic fields for change object
    $Self->{DynamicField} = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid      => 1,
        ObjectType => ['ITSMCHange'],
    );

    return $Self;
}

sub GetObjectName {
    my ( $Self, %Param ) = @_;

    return 'ITSMChangeManagement';
}

sub GetObjectAttributes {
    my ( $Self, %Param ) = @_;

    # get change state list
    my $ChangeStates = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangePossibleStatesGet(
        UserID => 1,
    );
    my %ChangeStateList = map { $_->{Key} => $_->{Value} } @{$ChangeStates};

    # get cip lists
    my $Categories = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangePossibleCIPGet(
        Type   => 'Category',
        UserID => 1,
    );
    my %CategoryList = map { $_->{Key} => $_->{Value} } @{$Categories};

    my $Impacts = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangePossibleCIPGet(
        Type   => 'Impact',
        UserID => 1,
    );
    my %ImpactList = map { $_->{Key} => $_->{Value} } @{$Impacts};

    my $Priorities = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangePossibleCIPGet(
        Type   => 'Priority',
        UserID => 1,
    );
    my %PriorityList = map { $_->{Key} => $_->{Value} } @{$Priorities};

    # get current time to fix bug#4870
    my $TimeStamp = $Kernel::OM->Get('Kernel::System::Time')->CurrentTimestamp();
    my ($Date) = split /\s+/, $TimeStamp;
    my $Today = sprintf "%s 23:59:59", $Date;

    my @ObjectAttributes = (
        {
            Name             => 'Change State',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'ChangeStateIDs',
            Block            => 'MultiSelectField',
            Values           => \%ChangeStateList,
        },
        {
            Name             => 'Category',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'CategoryIDs',
            Block            => 'MultiSelectField',
            Values           => \%CategoryList,
        },
        {
            Name             => 'Priority',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'PriorityIDs',
            Block            => 'MultiSelectField',
            Values           => \%PriorityList,
        },
        {
            Name             => 'Impact',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'ImpactIDs',
            Block            => 'MultiSelectField',
            Translation      => 0,
            Values           => \%ImpactList,
        },
        {
            Name             => 'Timeperiod',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'TimePeriod',
            TimePeriodFormat => 'DateInputFormat',    # 'DateInputFormatLong',
            Block            => 'Time',
            TimeStop         => $Today,
            Values           => {
                TimeStart => 'CreateTimeNewerDate',
                TimeStop  => 'CreateTimeOlderDate',
            },
        },
    );

    # get dynamic field backend object
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # skip all fields not designed to be supported by statistics
        my $IsStatsCondition = $DynamicFieldBackendObject->HasBehavior(
            DynamicFieldConfig => $DynamicFieldConfig,
            Behavior           => 'IsStatsCondition',
        );

        next DYNAMICFIELD if !$IsStatsCondition;

        my $PossibleValuesFilter;

        # get field html
        my $DynamicFieldStatsParameter = $DynamicFieldBackendObject->StatsFieldParameterBuild(
            DynamicFieldConfig   => $DynamicFieldConfig,
            PossibleValuesFilter => $PossibleValuesFilter,
        );

        if ( IsHashRefWithData($DynamicFieldStatsParameter) ) {

            # backward compatibility
            if ( !$DynamicFieldStatsParameter->{Block} ) {
                $DynamicFieldStatsParameter->{Block} = 'InputField';
                if ( IsHashRefWithData( $DynamicFieldStatsParameter->{Values} ) ) {
                    $DynamicFieldStatsParameter->{Block} = 'MultiSelectField';
                }
            }

            if ( $DynamicFieldStatsParameter->{Block} eq 'Time' ) {

                # create object attributes (date/time fields)
                my $TimePeriodFormat = $DynamicFieldStatsParameter->{TimePeriodFormat} || 'DateInputFormatLong';

                my %ObjectAttribute = (
                    Name             => $DynamicFieldStatsParameter->{Name},
                    UseAsXvalue      => 1,
                    UseAsValueSeries => 1,
                    UseAsRestriction => 1,
                    Element          => $DynamicFieldStatsParameter->{Element},
                    TimePeriodFormat => $TimePeriodFormat,
                    Block            => $DynamicFieldStatsParameter->{Block},
                    TimePeriodFormat => $TimePeriodFormat,
                    Values           => {
                        TimeStart =>
                            $DynamicFieldStatsParameter->{Element}
                            . '_GreaterThanEquals',
                        TimeStop =>
                            $DynamicFieldStatsParameter->{Element}
                            . '_SmallerThanEquals',
                    },
                );
                push @ObjectAttributes, \%ObjectAttribute;
            }
            elsif ( $DynamicFieldStatsParameter->{Block} eq 'MultiSelectField' ) {

                # create object attributes (multiple values)
                my %ObjectAttribute = (
                    Name             => $DynamicFieldStatsParameter->{Name},
                    UseAsXvalue      => 1,
                    UseAsValueSeries => 1,
                    UseAsRestriction => 1,
                    Element          => $DynamicFieldStatsParameter->{Element},
                    Block            => $DynamicFieldStatsParameter->{Block},
                    Values           => $DynamicFieldStatsParameter->{Values},
                    Translation      => 0,
                    IsDynamicField   => 1,
                    ShowAsTree       => $DynamicFieldConfig->{Config}->{TreeView} || 0,
                );
                push @ObjectAttributes, \%ObjectAttribute;
            }
            else {

                # create object attributes (text fields)
                my %ObjectAttribute = (
                    Name             => $DynamicFieldStatsParameter->{Name},
                    UseAsXvalue      => 0,
                    UseAsValueSeries => 0,
                    UseAsRestriction => 1,
                    Element          => $DynamicFieldStatsParameter->{Element},
                    Block            => $DynamicFieldStatsParameter->{Block},
                );
                push @ObjectAttributes, \%ObjectAttribute;
            }
        }
    }

    return @ObjectAttributes;
}

sub GetStatElementPreview {
    my ( $Self, %Param ) = @_;

    return int rand 50;
}

sub GetStatElement {
    my ( $Self, %Param ) = @_;

    # get dynamic field backend object
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    for my $ParameterName ( sort keys %Param ) {
        if (
            $ParameterName =~ m{ \A DynamicField_ ( [a-zA-Z\d]+ ) (?: _ ( [a-zA-Z\d]+ ) )? \z }xms
            )
        {
            my $FieldName = $1;
            my $Operator  = $2;

            # loop over the dynamic fields configured
            DYNAMICFIELD:
            for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
                next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);
                next DYNAMICFIELD if !$DynamicFieldConfig->{Name};

                # skip all fields that do not match with current field name
                # without the 'DynamicField_' prefix
                next DYNAMICFIELD if $DynamicFieldConfig->{Name} ne $FieldName;

                # skip all fields not designed to be supported by statistics
                my $IsStatsCondition = $DynamicFieldBackendObject->HasBehavior(
                    DynamicFieldConfig => $DynamicFieldConfig,
                    Behavior           => 'IsStatsCondition',
                );

                next DYNAMICFIELD if !$IsStatsCondition;

                # get new search parameter
                my $DynamicFieldStatsSearchParameter = $DynamicFieldBackendObject->StatsSearchFieldParameterBuild(
                    DynamicFieldConfig => $DynamicFieldConfig,
                    Value              => $Param{$ParameterName},
                    Operator           => $Operator,
                );

                # add new search parameter
                if ( !IsHashRefWithData( $Param{"DynamicField_$FieldName"} ) ) {
                    $Param{"DynamicField_$FieldName"} =
                        $DynamicFieldStatsSearchParameter;
                }

                # extend search parameter
                elsif ( IsHashRefWithData($DynamicFieldStatsSearchParameter) ) {
                    $Param{"DynamicField_$FieldName"} = {
                        %{ $Param{"DynamicField_$FieldName"} },
                        %{$DynamicFieldStatsSearchParameter},
                    };
                }
            }
        }
    }

    # search changes
    my $Count = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeSearch(
        UserID     => 1,
        Result     => 'COUNT',
        Permission => 'ro',
        Limit      => 100_000_000,
        %Param,
    );

    return $Count;
}

sub ExportWrapper {
    my ( $Self, %Param ) = @_;

    # wrap ids to used spelling
    for my $Use (qw(UseAsValueSeries UseAsRestriction UseAsXvalue)) {
        ELEMENT:
        for my $Element ( @{ $Param{$Use} } ) {

            next ELEMENT if !$Element;
            next ELEMENT if !$Element->{SelectedValues};

            my $ElementName = $Element->{Element};
            my $Values      = $Element->{SelectedValues};

            if ( $ElementName eq 'ChangeStateIDs' ) {
                my $StateList = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangePossibleStatesGet( UserID => 1 );
                ID:
                for my $ID ( @{$Values} ) {
                    next ID if !$ID;

                    STATE:
                    for my $State ( @{$StateList} ) {
                        next STATE if $ID->{Content} ne $State->{Key};
                        $ID->{Content} = $State->{Value};
                    }
                }
            }

            elsif (
                $ElementName eq 'CategoryIDs' || $ElementName eq 'ImpactIDs'
                || $ElementName eq 'PriorityIDs'
                )
            {
                my ($Type) = $ElementName =~ m{ \A (.*?) IDs \z }xms;

                my $CIPList = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangePossibleCIPGet(
                    Type   => $Type,
                    UserID => 1,
                );

                ID:
                for my $ID ( @{$Values} ) {
                    next ID if !$ID;

                    ELEMENT:
                    for my $Element ( @{$CIPList} ) {
                        next ELEMENT if $ID->{Content} ne $Element->{Key};
                        $ID->{Content} = $Element->{Value};
                    }
                }
            }
        }
    }
    return \%Param;
}

sub ImportWrapper {
    my ( $Self, %Param ) = @_;

    # wrap used spelling to ids
    for my $Use (qw(UseAsValueSeries UseAsRestriction UseAsXvalue)) {
        ELEMENT:
        for my $Element ( @{ $Param{$Use} } ) {

            next ELEMENT if !$Element;
            next ELEMENT if !$Element->{SelectedValues};

            my $ElementName = $Element->{Element};
            my $Values      = $Element->{SelectedValues};

            if ( $ElementName eq 'ChangeStateIDs' ) {
                ID:
                for my $ID ( @{$Values} ) {
                    next ID if !$ID;

                    my $ChangeStateID = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeStateLookup(
                        ChangeState => $ID->{Content},
                        Cache       => 1,
                    );
                    if ($ChangeStateID) {
                        $ID->{Content} = $ChangeStateID;
                    }
                    else {
                        $Kernel::OM->Get('Kernel::System::Log')->Log(
                            Priority => 'error',
                            Message  => "Import: Can't find state $ID->{Content}!"
                        );
                        $ID = undef;
                    }
                }
            }

            # import wrapper for CIP
            for my $Type (qw(Category Impact Priority)) {
                if ( $ElementName eq $Type . 'IDs' ) {
                    ID:
                    for my $ID ( @{$Values} ) {
                        next ID if !$ID;

                        my $CIPID = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeCIPLookup(
                            CIP  => $ID->{Content},
                            Type => $Type,
                        );
                        if ($CIPID) {
                            $ID->{Content} = $CIPID;
                        }
                        else {
                            $Kernel::OM->Get('Kernel::System::Log')->Log(
                                Priority => 'error',
                                Message  => "Import: Can't find $Type $ID->{Content}!"
                            );
                            $ID = undef;
                        }
                    }
                }
            }
        }
    }
    return \%Param;
}

1;
