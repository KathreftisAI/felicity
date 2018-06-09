# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Stats::Dynamic::ITSMChangeManagementChangesPerCIClasses;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::DB',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::ITSMChange',
    'Kernel::System::LinkObject',
    'Kernel::System::Log',
    'Kernel::System::Time',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub GetObjectName {
    my ( $Self, %Param ) = @_;

    return 'ITSMChangeManagementChangesPerCIClasses';
}

sub GetObjectAttributes {
    my ( $Self, %Param ) = @_;

    # get cip lists
    my $Categories = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangePossibleCIPGet(
        Type   => 'Category',
        UserID => 1,
    );
    my %CategoryList = map { $_->{Key} => $_->{Value} } @{$Categories};

    # get class list
    my $ClassList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # get deployment state list
    my $DeplStateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    # get incident state list
    my $InciStateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::Core::IncidentState',
    );

    # get current time to fix bug#4870
    my $TimeStamp = $Kernel::OM->Get('Kernel::System::Time')->CurrentTimestamp();
    my ($Date) = split /\s+/, $TimeStamp;
    my $Today = sprintf "%s 23:59:59", $Date;

    my @ObjectAttributes = (
        {
            Name             => 'ConfigItem Classes',
            UseAsXvalue      => 0,
            UseAsValueSeries => 1,
            UseAsRestriction => 0,
            Element          => 'CIClassIDs',
            Block            => 'MultiSelectField',
            Translation      => 0,
            Values           => $ClassList,
        },
        {
            Name             => 'Category',
            UseAsXvalue      => 1,
            UseAsValueSeries => 0,
            UseAsRestriction => 0,
            Element          => 'CategoryIDs',
            Block            => 'MultiSelectField',
            Values           => \%CategoryList,
        },
        {
            Name             => 'ConfigItem Status',
            UseAsXvalue      => 0,
            UseAsValueSeries => 0,
            UseAsRestriction => 1,
            Element          => 'CIStateIDs',
            Block            => 'MultiSelectField',
            Translation      => 0,
            Values           => $InciStateList,
        },
        {
            Name             => 'Timeperiod',
            UseAsXvalue      => 0,
            UseAsValueSeries => 0,
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

    return @ObjectAttributes;
}

sub GetStatElementPreview {
    my ( $Self, %Param ) = @_;

    return int rand 50;
}

sub GetStatElement {
    my ( $Self, %Param ) = @_;

    # get object ids for change and config item
    my $ConfigItemObjectID = $Kernel::OM->Get('Kernel::System::LinkObject')->ObjectLookup(
        Name   => 'ITSMConfigItem',
        UserID => 1,
    );

    return if !$ConfigItemObjectID;

    my $ChangeObjectID = $Kernel::OM->Get('Kernel::System::LinkObject')->ObjectLookup(
        Name   => 'ITSMWorkOrder',
        UserID => 1,
    );

    return if !$ChangeObjectID;

    # get change id and config item id
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT chi.id AS change_id, ci.id AS ci_id '
            . 'FROM change_item chi, change_workorder chw, link_relation lr, configitem ci '
            . 'WHERE chi.id = chw.change_id '
            . 'AND chi.category_id = ? '
            . 'AND ( '
            . '( '
            . 'chw.id = lr.target_key '
            . 'AND lr.target_object_id = ? '
            . 'AND lr.source_object_id = ? '
            . 'AND lr.source_key = ci.id '
            . 'AND ci.class_id = ? '
            . ') '
            . 'OR '
            . '( '
            . 'chw.id = lr.source_key '
            . 'AND lr.source_object_id = ? '
            . 'AND lr.target_object_id = ? '
            . 'AND lr.target_key = ci.id '
            . 'AND ci.class_id = ? '
            . ') '
            . ')',
        Bind => [
            \( $Param{CategoryIDs}->[0] ),
            \$ChangeObjectID,
            \$ConfigItemObjectID,
            \( $Param{CIClassIDs}->[0] ),
            \$ChangeObjectID,
            \$ConfigItemObjectID,
            \( $Param{CIClassIDs}->[0] ),
        ],
    );

    # fetch change and config item ids
    my @Matches;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        push @Matches, \@Row;
    }

    # check for each change if the config item is in appropriate status
    # if so, count the change
    my %ChangesAlreadyCounted;
    MATCH:
    for my $Match (@Matches) {
        next MATCH if $ChangesAlreadyCounted{ $Match->[0] };

        # get current state of the config item
        next MATCH if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL => 'SELECT inci_state_id FROM configitem_version '
                . 'WHERE configitem_id = ? '
                . 'AND create_time >= ? AND create_time <= ?',
            Bind => [
                \( $Match->[1] ),
                \( $Param{CreateTimeNewerDate} ),
                \( $Param{CreateTimeOlderDate} ),
            ],
            Limit => 1,
        );

        # fetch current incident state
        my $IncidentStateID;
        while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
            $IncidentStateID = $Row[0];
        }

        next MATCH if !$IncidentStateID;

        # check if user has selected this state
        my ($Found) = grep { $_ == $IncidentStateID } @{ $Param{CIStateIDs} };

        next MATCH if !$Found;

        $ChangesAlreadyCounted{ $Match->[0] }++;
    }

    # return the number of changes
    my $Count = keys %ChangesAlreadyCounted;
    return $Count;
}

sub ExportWrapper {
    my ( $Self, %Param ) = @_;

    # get class list
    my $ClassList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # get incident state list
    my $InciStateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::Core::IncidentState',
    );

    # wrap ids to used spelling
    for my $Use (qw(UseAsValueSeries UseAsRestriction UseAsXvalue)) {
        ELEMENT:
        for my $Element ( @{ $Param{$Use} } ) {
            next ELEMENT if !$Element || !$Element->{SelectedValues};
            my $ElementName = $Element->{Element};
            my $Values      = $Element->{SelectedValues};

            if ( $ElementName eq 'CIStateIDs' ) {
                ID:
                for my $ID ( @{$Values} ) {
                    next ID if !$ID;

                    $ID->{Content} = $InciStateList->{ $ID->{Content} };
                }
            }
            elsif ( $ElementName eq 'CIClassIDs' ) {
                ID:
                for my $ID ( @{$Values} ) {
                    next ID if !$ID;

                    $ID->{Content} = $ClassList->{ $ID->{Content} };
                }
            }
            elsif ( $ElementName eq 'CategoryIDs' ) {

                my $CIPList = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangePossibleCIPGet(
                    Type   => 'Category',
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

    # get class list
    my $ClassList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # get incident state list
    my $InciStateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::Core::IncidentState',
    );

    # wrap used spelling to ids
    for my $Use (qw(UseAsValueSeries UseAsRestriction UseAsXvalue)) {
        ELEMENT:
        for my $Element ( @{ $Param{$Use} } ) {
            next ELEMENT if !$Element || !$Element->{SelectedValues};
            my $ElementName = $Element->{Element};
            my $Values      = $Element->{SelectedValues};

            if ( $ElementName eq 'CIStateIDs' ) {
                ID:
                for my $ID ( @{$Values} ) {
                    next ID if !$ID;

                    KEY:
                    for my $Key ( sort keys %{$InciStateList} ) {
                        if ( $ID->{Content} eq $InciStateList->{$Key} ) {
                            $ID->{Content} = $Key;
                            last KEY;
                        }
                    }
                }
            }
            elsif ( $ElementName eq 'CIClassIDs' ) {
                ID:
                for my $ID ( @{$Values} ) {
                    next ID if !$ID;

                    for my $Key ( sort keys %{$ClassList} ) {
                        if ( $ID->{Content} eq $ClassList->{$Key} ) {
                            $ID->{Content} = $Key;
                        }
                    }
                }
            }

            # import wrapper for CIP
            for my $Type (qw(Category)) {
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
                                Message  => "Import: Can' find $Type $ID->{Content}!"
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
