# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Stats::Dynamic::ITSMChangeManagementHistory;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::ITSMChange',
    'Kernel::System::ITSMChange::History',
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

    return 'ITSMChangeManagementHistory';
}

sub GetObjectAttributes {
    my ( $Self, %Param ) = @_;

    # get change state list
    my $ChangeStates = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangePossibleStatesGet(
        UserID => 1,
    );
    my %ChangeStateList = map { $_->{Key} => $_->{Value} } @{$ChangeStates};

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
            Element          => 'NewValues',
            Block            => 'MultiSelectField',
            Values           => \%ChangeStateList,
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
                TimeStart => 'ChangeTimeNewerDate',
                TimeStop  => 'ChangeTimeOlderDate',
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

    # search history
    my $IDs = $Kernel::OM->Get('Kernel::System::ITSMChange::History')->HistorySearch(
        UserID    => 1,
        Type      => 'Change',
        Attribute => 'ChangeStateID',
        Limit     => 100_000_000,
        %Param,
    );

    my @ChangeNumbers;
    if ( $IDs && ref $IDs eq 'ARRAY' ) {

        ID:
        for my $ID ( @{$IDs} ) {
            my $Change = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
                ChangeID => $ID,
                UserID   => 1,
            );

            next ID if !$Change;

            push @ChangeNumbers, $Change->{ChangeNumber};
        }
    }

    return join "\n", @ChangeNumbers;
}

sub ExportWrapper {
    my ( $Self, %Param ) = @_;

    # wrap ids to used spelling
    for my $Use (qw(UseAsValueSeries UseAsRestriction UseAsXvalue)) {
        ELEMENT:
        for my $Element ( @{ $Param{$Use} } ) {
            next ELEMENT if !$Element || !$Element->{SelectedValues};
            my $ElementName = $Element->{Element};
            my $Values      = $Element->{SelectedValues};

            if ( $ElementName eq 'NewValues' ) {
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
            next ELEMENT if !$Element || !$Element->{SelectedValues};
            my $ElementName = $Element->{Element};
            my $Values      = $Element->{SelectedValues};

            if ( $ElementName eq 'NewValues' ) {
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
                            Message  => "Import: Can' find state $ID->{Content}!"
                        );
                        $ID = undef;
                    }
                }
            }
        }
    }
    return \%Param;
}

1;
