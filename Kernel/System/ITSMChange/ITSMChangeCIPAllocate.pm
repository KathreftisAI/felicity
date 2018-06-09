# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMChangeCIPAllocate;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::DB',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::ITSMChange::ITSMChangeCIPAllocate - category, impact and priority allocation lib

=head1 SYNOPSIS

All category, impact and priority allocation functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CIPAllocateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMChangeCIPAllocate');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item AllocateList()

return a 2d hash reference of allocations

    my $ListRef = $CIPAllocateObject->AllocateList(
        UserID => 1,
    );

C<$ListRef> is something like

    $ListRet = {
        '6' => {
            '4' => 2,
            '1' => 1,
            '3' => 2,
        },
        '8' => {
            '4' => 4,
            '1' => 2,
            '3' => 3,
        },
    };

meaning that the CriticalityID '6' and the IncidentID '4' suggest the PriorityID '2'.

=cut

sub AllocateList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );
        return;
    }

    # ask database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT category_id, impact_id, priority_id FROM change_cip_allocate',
    );

    # result list
    my %AllocateData;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $AllocateData{ $Row[1] }{ $Row[0] } = $Row[2];
    }

    return \%AllocateData;
}

=item AllocateUpdate()

update the allocation of category, impact and priority

    my $True = $CIPAllocateObject->AllocateUpdate(
        AllocateData => $DataRef,  # 2D hash reference
        UserID       => 1,
    );

=cut

sub AllocateUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(AllocateData UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check if allocate data is a hash reference
    if ( ref $Param{AllocateData} ne 'HASH' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'AllocateData must be a 2D hash reference!',
        );
        return;
    }

    # check if allocate data is a 2D hash reference
    IMPACTID:
    for my $ImpactID ( sort keys %{ $Param{AllocateData} } ) {

        next IMPACTID if ref $Param{AllocateData}->{$ImpactID} eq 'HASH';

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'AllocateData must be a 2D hash reference!',
        );
        return;
    }

    # delete old allocations
    return
        if !$Kernel::OM->Get('Kernel::System::DB')->Do( SQL => 'DELETE FROM change_cip_allocate' );

    # insert new allocations
    for my $ImpactID ( sort keys %{ $Param{AllocateData} } ) {

        for my $CategoryID ( sort keys %{ $Param{AllocateData}->{$ImpactID} } ) {

            # extract priority
            my $PriorityID = $Param{AllocateData}->{$ImpactID}->{$CategoryID};

            # insert new allocation
            return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
                SQL => 'INSERT INTO change_cip_allocate '
                    . '(category_id, impact_id, priority_id, '
                    . 'create_time, create_by, change_time, change_by) VALUES '
                    . '(?, ?, ?, current_timestamp, ?, current_timestamp, ?)',
                Bind => [
                    \$CategoryID, \$ImpactID, \$PriorityID,
                    \$Param{UserID}, \$Param{UserID},
                ],
            );
        }
    }

    return 1;
}

=item PriorityAllocationGet()

return the priority id for given category and impact

    my $PriorityID = $CIPAllocateObject->PriorityAllocationGet(
        CategoryID => 321,
        ImpactID   => 123,
    );

=cut

sub PriorityAllocationGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(CategoryID ImpactID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get priority id from db
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT priority_id FROM change_cip_allocate '
            . 'WHERE category_id = ? AND impact_id = ?',
        Bind  => [ \$Param{CategoryID}, \$Param{ImpactID} ],
        Limit => 1,
    );

    # fetch result
    my $PriorityID;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $PriorityID = $Row[0];
    }

    return $PriorityID;
}

1;

=back

=head1 TERMS AND CONDITIONS

This Software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
