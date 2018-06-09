# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ToolBar::MyCAB;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Cache',
    'Kernel::System::Group',
    'Kernel::System::ITSMChange',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get UserID param
    $Self->{UserID} = $Param{UserID} || die "Got no UserID!";

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # define action, group, label, image and prio
    my $Action = 'AgentITSMChangeMyCAB';
    my $Group  = 'itsm-change';
    my $Icon   = $Param{Config}->{Icon};

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # do not show icon if frontend module is not registered
    return if !$ConfigObject->Get('Frontend::Module')->{$Action};

    # get config of frontend module
    my $Config = $ConfigObject->Get("ITSMChange::Frontend::$Action");

    # get group object
    my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

    # get the group id
    my $GroupID = $GroupObject->GroupLookup( Group => $Group );

    # deny access, when the group is not found
    return if !$GroupID;

    # get user groups, where the user has the appropriate privilege
    my %Groups = $GroupObject->GroupMemberList(
        UserID => $Self->{UserID},
        Type   => $Config->{Permission},
        Result => 'HASH',
    );

    # deny access if the agent doesn't have the appropriate type in the appropriate group
    return if !$Groups{$GroupID};

    # get the number of viewable changes
    my $Count = 0;
    if ( $Config->{'Filter::ChangeStates'} && @{ $Config->{'Filter::ChangeStates'} } ) {

        # remove empty change states
        my @ChangeStates;
        CHANGESTATE:
        for my $ChangeState ( @{ $Config->{'Filter::ChangeStates'} } ) {
            next CHANGESTATE if !$ChangeState;
            push @ChangeStates, $ChangeState;
        }

        # get the cache type and TTL (in seconds)
        $Self->{CacheType} = 'ITSMChangeManagementToolBarMyCAB' . $Self->{UserID};
        $Self->{CacheTTL}  = $ConfigObject->Get('ITSMChange::ToolBar::CacheTTL') * 60;

        # get cache object
        my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

        # check cache
        my $CacheKey = join ',', sort @ChangeStates;
        my $Cache = $CacheObject->Get(
            Type => $Self->{CacheType},
            Key  => $CacheKey,
        );

        if ( defined $Cache ) {
            $Count = $Cache;
        }
        else {

            # count the number of viewable changes
            $Count = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeSearch(
                CABAgents    => [ $Self->{UserID} ],
                ChangeStates => \@ChangeStates,
                Limit        => 1000,
                Result       => 'COUNT',
                MirrorDB     => 1,
                UserID       => $Self->{UserID},
            );

            # set cache
            $CacheObject->Set(
                Type  => $Self->{CacheType},
                Key   => $CacheKey,
                Value => $Count || 0,
                TTL   => $Self->{CacheTTL},
            );
        }
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get ToolBar object parameters
    my $Class = $Param{Config}->{CssClass};
    my $Text  = $LayoutObject->{LanguageObject}->Translate('My CABs');

    # set ToolBar object
    my $URL      = $LayoutObject->{Baselink};
    my $Priority = $Param{Config}->{Priority};
    my %Return;
    if ($Count) {
        $Return{$Priority} = {
            Block       => 'ToolBarItem',
            Description => $Text,
            Count       => $Count,
            Class       => $Class,
            Icon        => $Icon,
            Link        => $URL . 'Action=' . $Action,
            AccessKey   => '',
        };
    }

    return %Return;
}

1;
