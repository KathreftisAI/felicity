# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMWorkOrder::Permission::CABCheck;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::ITSMChange',
    'Kernel::System::ITSMChange::ITSMWorkOrder',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::ITSMChange::ITSMWorkOrder::Permission::CABCheck - CAB based permission check

=head1 SYNOPSIS

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CheckObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder::Permission::CABCheck');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item Run()

This method does the check. Access is allowed when type is 'ro' and the agent is a member
of the CAB of the change of the workorder.

    my $HasAccess = $CheckObject->Run(
        UserID      => 123,
        Type        => 'rw',     # 'ro' or 'rw'
        WorkOrderID => 4444,
    );

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID Type WorkOrderID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # only 'ro' access might be granted by this module
    return if $Param{Type} ne 'ro';

    # there already is a workorder
    my $WorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
        UserID      => $Param{UserID},
        WorkOrderID => $Param{WorkOrderID},
    );

    # deny access, when no workorder was found
    return if !$WorkOrder || !%{$WorkOrder} || !$WorkOrder->{ChangeID};

    # get the CAB of the change
    my $CAB = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeCABGet(
        UserID   => $Param{UserID},
        ChangeID => $WorkOrder->{ChangeID},
    );

    # look for a CAB member with the relevant UserID
    my ($FoundCABMember) = grep { $_ == $Param{UserID} } @{ $CAB->{CABAgents} };

    # allow access the the agent is a CAB member
    return 1 if $FoundCABMember;

    # deny access otherwise
    return;
}

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut

1;
