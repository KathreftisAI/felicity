# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::DynamicField::Event::UpdateITSMChangeConditions;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::System::Cache',
    'Kernel::System::DB',
    'Kernel::System::ITSMChange::ITSMCondition',
    'Kernel::System::Log',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Data Event Config UserID)) {
        if ( !$Param{$Argument} ) {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # only for dynamic fields of the type ITSMChange or ITSMWorkOrder
    return if !$Param{Data}->{NewData};
    return if !$Param{Data}->{NewData}->{ObjectType};
    if (
        $Param{Data}->{NewData}->{ObjectType} ne 'ITSMChange'
        && $Param{Data}->{NewData}->{ObjectType} ne 'ITSMWorkOrder'
        )
    {
        return;
    }

    # dynamic field has been added
    if ( $Param{Event} eq 'DynamicFieldAdd' ) {

        # add new attribute to condition attribute table
        my $Success = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->AttributeAdd(
            Name   => 'DynamicField_' . $Param{Data}->{NewData}->{Name},
            UserID => $Param{UserID},
        );

        # check error
        if ( !$Success ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Could not add attribute '$Param{Data}->{NewData}->{Name}' to condition attribute table!",
            );
        }
    }

    # dynamic field has been updated
    elsif ( $Param{Event} eq 'DynamicFieldUpdate' ) {

        # lookup the ID of the old attribute
        my $AttributeID = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->AttributeLookup(
            Name => 'DynamicField_' . $Param{Data}->{OldData}->{Name},
        );

        # update the attribute name
        my $Success = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->AttributeUpdate(
            AttributeID => $AttributeID,
            Name        => 'DynamicField_' . $Param{Data}->{NewData}->{Name},
            UserID      => 1,
        );

        # check error
        if ( !$Success ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Could not update attribute name from '$Param{Data}->{OldData}->{Name}' to '$Param{Data}->{NewData}->{Name}'!",
            );
        }
    }

    # dynamic field has been deleted
    elsif ( $Param{Event} eq 'DynamicFieldDelete' ) {

        # get all condition attributes
        my $ConditionAttributes = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->AttributeList(
            UserID => 1,
        );

        # reverse the list to lookup attribute names
        my %Attribute2ID = reverse %{$ConditionAttributes};

        # lookup attribute id
        my $AttributeID = $Attribute2ID{ 'DynamicField_' . $Param{Data}->{NewData}->{Name} } || '';

        # do nothing if no attribute with this name exsists
        return if !$AttributeID;

        # delete this attribute from expression table
        $Kernel::OM->Get('Kernel::System::DB')->Do(
            SQL => 'DELETE FROM condition_expression
                    WHERE attribute_id = ?',
            Bind => [
                \$AttributeID,
            ],
        );

        # delete this attribute from action table
        $Kernel::OM->Get('Kernel::System::DB')->Do(
            SQL => 'DELETE FROM condition_action
                    WHERE attribute_id = ?',
            Bind => [
                \$AttributeID,
            ],
        );

        # delete this attribute from attribute table
        $Kernel::OM->Get('Kernel::System::DB')->Do(
            SQL => 'DELETE FROM condition_attribute
                    WHERE id = ?',
            Bind => [
                \$AttributeID,
            ],
        );

        # delete cache
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
            Type => 'ITSMChangeManagement',
        );
    }

    return 1;
}

1;
