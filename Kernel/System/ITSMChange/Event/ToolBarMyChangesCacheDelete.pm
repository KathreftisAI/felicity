# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::Event::ToolBarMyChangesCacheDelete;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Cache',
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

    # set the cache type prefix
    my $CacheTypePrefix = 'ITSMChangeManagementToolBarMyChanges';

    # handle adding of a change
    if ( $Param{Event} eq 'ChangeAddPost' ) {

        # do nothing if the ChangeBuilderID was not set
        return 1 if !$Param{Data}->{ChangeBuilderID};

        # set the cache type
        my $CacheType = $CacheTypePrefix . $Param{Data}->{ChangeBuilderID};

        # delete the cache
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
            Type => $CacheType,
        );

        return 1;
    }

    # handle update of a change
    elsif ( $Param{Event} eq 'ChangeUpdatePost' ) {

        # make sure the data is initialized
        $Param{Data}->{ChangeBuilderID} ||= '';
        $Param{Data}->{OldChangeData}->{ChangeBuilderID} ||= '';

        # do nothing if the ChangeBuilderID did not change
        return 1
            if $Param{Data}->{ChangeBuilderID} eq $Param{Data}->{OldChangeData}->{ChangeBuilderID};

        # set the cache type postfix
        my @CacheTypePostfixes = (
            $Param{Data}->{ChangeBuilderID},
            $Param{Data}->{OldChangeData}->{ChangeBuilderID},
        );

        # delete the cache for the old and the current change builder
        CACHETYPEPOSTFIX:
        for my $CacheTypePostfix (@CacheTypePostfixes) {

            # do nothing if the ChangeBuilderID was not set
            next CACHETYPEPOSTFIX if !$CacheTypePostfix;

            # set the cache type
            my $CacheType = $CacheTypePrefix . $CacheTypePostfix;

            # delete the cache
            $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
                Type => $CacheType,
            );
        }

        return 1;
    }

    # handle deleting a change
    elsif ( $Param{Event} eq 'ChangeDeletePost' ) {

        # do nothing if the ChangeBuilderID was not set
        return 1 if !$Param{Data}->{OldChangeData}->{ChangeBuilderID};

        # set the cache type
        my $CacheType = $CacheTypePrefix . $Param{Data}->{OldChangeData}->{ChangeBuilderID};

        # delete the cache
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
            Type => $CacheType,
        );

        return 1;
    }

    return 1;
}

1;
