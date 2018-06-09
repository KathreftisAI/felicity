# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminITSMCIPAllocate;

use strict;
use warnings;

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

    # get the priority list
    my %PriorityList = $Kernel::OM->Get('Kernel::System::Priority')->PriorityList(
        UserID => 1,
    );

    # get the dynamic fields for ITSMCriticality and ITSMImpact
    my $DynamicFieldConfigArrayRef = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => ['Ticket'],
        FieldFilter => {
            ITSMCriticality => 1,
            ITSMImpact      => 1,
        },
    );

    # get the dynamic field value for ITSMCriticality and ITSMImpact
    my %PossibleValues;
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicFieldConfigArrayRef} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # get PossibleValues
        $PossibleValues{ $DynamicFieldConfig->{Name} } = $DynamicFieldConfig->{Config}->{PossibleValues} || {};
    }

    # set the criticality list
    $Self->{CriticalityList} = $PossibleValues{ITSMCriticality};

    # set the impact list
    $Self->{ImpactList} = $PossibleValues{ITSMImpact};

    # get needed object
    my $CIPAllocateObject = $Kernel::OM->Get('Kernel::System::ITSMCIPAllocate');
    my $LayoutObject      = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # ------------------------------------------------------------ #
    # criticality, impact and priority allocation
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'CIPAllocate' ) {

        # get all PriorityIDs of the matrix
        my $AllocateData;
        for my $Impact ( sort keys %{ $Self->{ImpactList} } ) {

            CRITICALITY:
            for my $Criticality ( sort keys %{ $Self->{CriticalityList} } ) {

                # build field name for priority id
                my $FieldName = "PriorityID" . $Impact . '-' . $Criticality;

                # clean up all whitespaces because they are not allowed in HTML ID-Attributes
                $FieldName =~ s{ \s+ }{}gxms;

                # get form param for priority id
                my $PriorityID = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam(
                    Param => $FieldName,
                ) || '';

                next CRITICALITY if !$PriorityID;

                $AllocateData->{$Impact}->{$Criticality} = $PriorityID;
            }
        }

        # update allocations
        $CIPAllocateObject->AllocateUpdate(
            AllocateData => $AllocateData,
            UserID       => 1,
        );

        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
    }

    # ------------------------------------------------------------ #
    # overview
    # ------------------------------------------------------------ #
    else {

        # get allocation data
        my $AllocateData = $CIPAllocateObject->AllocateList(
            UserID => 1,
        );

        my $AllocateMatrix;
        $AllocateMatrix->[0]->[0]->{ObjectType} =
            $LayoutObject->{LanguageObject}->Translate('Impact') . ' / '
            . $LayoutObject->{LanguageObject}->Translate('Criticality');
        $AllocateMatrix->[0]->[0]->{Class} = 'HeaderColumnDescription';

        # generate table description (Impact)
        my $Counter1 = 1;
        for my $Impact (
            sort { $Self->{ImpactList}->{$a} cmp $Self->{ImpactList}->{$b} }
            keys %{ $Self->{ImpactList} }
            )
        {
            $AllocateMatrix->[$Counter1]->[0]->{ObjectType}   = 'Impact';
            $AllocateMatrix->[$Counter1]->[0]->{ImpactKey}    = $Impact;
            $AllocateMatrix->[$Counter1]->[0]->{ObjectOption} = $Self->{ImpactList}->{$Impact};
            $Counter1++;
        }

        # generate table description (Criticality)
        my $Counter2 = 1;
        for my $Criticality (
            sort { $Self->{CriticalityList}->{$a} cmp $Self->{CriticalityList}->{$b} }
            keys %{ $Self->{CriticalityList} }
            )
        {
            $AllocateMatrix->[0]->[$Counter2]->{ObjectType}     = 'Criticality';
            $AllocateMatrix->[0]->[$Counter2]->{CriticalityKey} = $Criticality;
            $AllocateMatrix->[0]->[$Counter2]->{ObjectOption}   = $Self->{CriticalityList}->{$Criticality};
            $Counter2++;
        }

        # generate content
        for my $Row ( 1 .. ( $Counter1 - 1 ) ) {
            for my $Column ( 1 .. ( $Counter2 - 1 ) ) {

                # extract keys
                my $ImpactKey      = $AllocateMatrix->[$Row]->[0]->{ImpactKey};
                my $CriticalityKey = $AllocateMatrix->[0]->[$Column]->{CriticalityKey};

                # build field name for priority id
                my $FieldName = "PriorityID" . $ImpactKey . '-' . $CriticalityKey;

                # clean up all whitespaces because they are not allowed in HTML ID-Attributes
                $FieldName =~ s{ \s+ }{}gxms;

                # create option string
                my $OptionStrg = $LayoutObject->BuildSelection(
                    Name       => $FieldName,
                    Data       => \%PriorityList,
                    SelectedID => $AllocateData->{$ImpactKey}->{$CriticalityKey} || '',
                    Title      => 'Priority',
                );

                $AllocateMatrix->[$Row]->[$Column]->{OptionStrg} = $OptionStrg;
                $AllocateMatrix->[$Row]->[$Column]->{Class}      = 'Content';
            }
        }

        for my $Row ( 0 .. $#{$AllocateMatrix} ) {

            if ( $Row != 0 ) {
                $LayoutObject->Block( Name => 'Row' )
            }

            for my $Column ( 0 .. $#{ $AllocateMatrix->[$Row] } ) {

                # check if the row is header
                if ( $Row == 0 ) {

                    if ( $Column == 0 ) {
                        $LayoutObject->Block(
                            Name => 'HeaderColumnDescription',
                            Data => $AllocateMatrix->[$Row]->[$Column],
                        );
                    }
                    else {
                        $LayoutObject->Block(
                            Name => 'HeaderCell',
                            Data => $AllocateMatrix->[$Row]->[$Column],
                        );
                    }
                }

                # check if the column is description
                elsif ( $Column == 0 ) {
                    $LayoutObject->Block(
                        Name => 'DescriptionCell',
                        Data => $AllocateMatrix->[$Row]->[$Column],
                    );
                }
                else {
                    $LayoutObject->Block(
                        Name => 'ContentCell',
                        Data => $AllocateMatrix->[$Row]->[$Column],
                    );
                }
            }
        }

        # output header and navbar
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # generate output
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminITSMCIPAllocate',
            Data         => \%Param,
        );
        $Output .= $LayoutObject->Footer();

        return $Output;
    }
}

1;
