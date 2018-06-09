# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::Event::ToolBarMyCABCacheDelete;

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
    my $CacheTypePrefix = 'ITSMChangeManagementToolBarMyCAB';

    # handle update of a CAB
    if ( $Param{Event} eq 'ChangeCABUpdatePost' ) {

        # do nothing if the CABAgents were not updated
        return 1 if !$Param{Data}->{CABAgents};

        # make sure the data is initialized
        $Param{Data}->{CABAgents} ||= [];
        $Param{Data}->{OldChangeCABData}->{CABAgents} ||= [];

        # build lookup hash for CABAgents from "new" and "old" Agents
        my %ChangedCABAgentsLookup;
        for my $CABAgent (
            @{ $Param{Data}->{CABAgents} },
            @{ $Param{Data}->{OldChangeCABData}->{CABAgents} }
            )
        {
            $ChangedCABAgentsLookup{$CABAgent}++;
        }

        # find the CABAgents which have been changed, which are only agents with a count of exactly one
        my @ChangedCABAgents;
        for my $CABAgent ( sort keys %ChangedCABAgentsLookup ) {
            if ( $ChangedCABAgentsLookup{$CABAgent} == 1 ) {
                push @ChangedCABAgents, $CABAgent;
            }
        }

        # delete cache for all changed CABAgents
        for my $CABAgent (@ChangedCABAgents) {

            # set the cache type
            my $CacheType = $CacheTypePrefix . $CABAgent;

            # delete the cache
            $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
                Type => $CacheType,
            );
        }

        return 1;
    }

    # handle deleting a CAB
    elsif ( $Param{Event} eq 'ChangeCABDeletePost' ) {

        # do nothing if there were no CABAgents set
        return 1 if !$Param{Data}->{OldChangeCABData}->{CABAgents};
        return 1 if !@{ $Param{Data}->{OldChangeCABData}->{CABAgents} };

        # delete cache for all CABAgents
        for my $CABAgent ( @{ $Param{Data}->{OldChangeCABData}->{CABAgents} } ) {

            # set the cache type
            my $CacheType = $CacheTypePrefix . $CABAgent;

            # delete the cache
            $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
                Type => $CacheType,
            );
        }

        return 1;
    }

    return 1;
}

1;
