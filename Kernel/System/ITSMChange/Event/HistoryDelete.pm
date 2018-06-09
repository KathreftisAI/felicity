# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::Event::HistoryDelete;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::ITSMChange::History',
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

    # handle deletion of a change
    if ( $Param{Event} eq 'ChangeDeletePost' ) {

        # delete history of change
        my $Success = $Kernel::OM->Get('Kernel::System::ITSMChange::History')->ChangeHistoryDelete(
            ChangeID => $Param{Data}->{ChangeID},
            UserID   => $Param{UserID},
        );

        # handle error
        if ( !$Success ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "ChangeDelete() failed for ChangeID '$Param{Data}->{ChangeID}'!",
            );
            return;
        }

        return 1;
    }

    # error
    else {

        # an unknown event
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "$Param{Event} is an unknown event!",
        );

        return;
    }

    return 1;
}

1;
