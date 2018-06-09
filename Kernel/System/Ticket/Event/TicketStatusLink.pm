# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Ticket::Event::TicketStatusLink;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Log',
    'Kernel::System::Ticket',
    'Kernel::System::User',
    'Kernel::System::ITSMConfigItem',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::LinkObject',
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
    for my $Needed (qw(Data Event Config)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # check if functionality is enabled
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    return 1 if !$ConfigObject->Get('ITSMConfigItem::SetIncidentStateOnLink');

    # get ticket id depending on event
    my $TicketID;
    if ( $Param{Event} eq 'LinkAdd' || $Param{Event} eq 'LinkDelete' ) {
        for my $Needed (qw(ConfigItemID Comment)) {
            if ( !$Param{Data}->{$Needed} ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Need $Needed in Data!",
                );
                return;
            }
        }

        # check if link event concerns a ticket
        return 1 if $Param{Data}->{Comment} !~ m{ \A ( \d+ ) %%Ticket \z }xms;
        $TicketID = $1;
    }
    else {
        if ( !$Param{Data}->{TicketID} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need TicketID in Data!",
            );
            return;
        }
        $TicketID = $Param{Data}->{TicketID};
    }

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my %Ticket       = $TicketObject->TicketGet(
        TicketID => $TicketID,
        UserID   => 1,
    );
    return 1 if !%Ticket;

    # check if ticket type is relevant (optional functionality)
    my $OldTicketTypeRelevant;
    my $NewTicketTypeRelevant;
    my $TicketTypes = $ConfigObject->Get('ITSMConfigItem::LinkStatus::TicketTypes');
    if ( $Param{Event} eq 'TicketTypeUpdate' ) {

        # ticket types are not used, changes don't affect CI incident states
        return 1 if !IsArrayRefWithData($TicketTypes);

        # determine type of ticket before last update
        my $OldTicketType;
        my @HistoryLines = $TicketObject->HistoryGet(
            TicketID => $TicketID,
            UserID   => 1,
        );
        LINE:
        for my $Line ( reverse @HistoryLines ) {
            next LINE if $Line->{HistoryType} ne 'TypeUpdate';
            my @CommentParts = split '%%', $Line->{Name};
            $OldTicketType = $CommentParts[3];
            last LINE;
        }
        if ( !$OldTicketType ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Found no previous ticket type for ticket id $TicketID!",
            );
            return;
        }

        # only changes relevant->irrelevant and irrelevant->relevant are of interest
        $OldTicketTypeRelevant = 1 if grep { $_ eq $OldTicketType } @{$TicketTypes};
        $NewTicketTypeRelevant = 1 if grep { $_ eq $Ticket{Type} } @{$TicketTypes};
        return 1 if ( $OldTicketTypeRelevant || '' ) eq ( $NewTicketTypeRelevant || '' );
    }

    # shortcut for other events (check if ticket type is in scope)
    elsif ( IsArrayRefWithData($TicketTypes) ) {
        return 1 if !$Ticket{Type};
        return 1 if !grep { $_ eq $Ticket{Type} } @{$TicketTypes};
    }

    # check if ticket state is relevant
    my $OldTicketStateRelevant;
    my $NewTicketStateRelevant;
    my @OpenStateTypes = ( 'new', 'open', 'pending reminder', 'pending auto' );
    if ( $Param{Event} eq 'TicketStateUpdate' ) {
        if ( !$Param{Data}->{OldTicketData} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need TicketID in OldTicketData!",
            );
            return;
        }

        # only changes open->close and close->open are of interest
        $NewTicketStateRelevant = 1 if grep { $_ eq $Ticket{StateType} } @OpenStateTypes;
        $OldTicketStateRelevant = 1 if grep { $_ eq $Param{Data}->{OldTicketData}->{StateType} } @OpenStateTypes;
        return 1 if ( $NewTicketStateRelevant || '' ) eq ( $OldTicketStateRelevant || '' );
    }

    # shortcut for other events (check if ticket state is in scope)
    else {
        return 1 if !grep { $_ eq $Ticket{StateType} } @OpenStateTypes;
    }

    # shortcut for ticket events (check if ticket has any potentially relevant links)
    if ( $Param{Event} eq 'TicketStateUpdate' || $Param{Event} eq 'TicketTypeUpdate' ) {
        my %LinkKeyList = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkKeyList(
            Object1 => 'Ticket',
            Key1    => $TicketID,
            Object2 => 'ITSMConfigItem',
            State   => 'Valid',
            UserID  => 1,
        );
        return 1 if !IsHashRefWithData( \%LinkKeyList );
    }

    # prepare incident states and relevant link types per incident state
    my $IncidentStates = $ConfigObject->Get('ITSMConfigItem::LinkStatus::IncidentStates');
    my $LinkTypes      = $ConfigObject->Get('ITSMConfigItem::LinkStatus::LinkTypes');
    if ( !IsHashRefWithData($LinkTypes) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need configuration for 'ITSMConfigItem::LinkStatus::LinkTypes'!",
        );
        return;
    }
    my %LinkTypesByIncidentState;
    LINKTYPE:
    for my $LinkType ( sort keys %{$LinkTypes} ) {
        push @{ $LinkTypesByIncidentState{ $LinkTypes->{$LinkType} } }, $LinkType;
    }

    # handle added or removed links
    if ( $Param{Event} eq 'LinkAdd' || $Param{Event} eq 'LinkDelete' ) {
        my $ConfigItemID = $Param{Data}->{ConfigItemID};
        my $Version      = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionGet(
            ConfigItemID => $ConfigItemID,
        );

        # optional: check if CI deployment state is relevant
        my $DeploymentStates = $ConfigObject->Get('ITSMConfigItem::LinkStatus::DeploymentStates');
        if ( IsArrayRefWithData($DeploymentStates) ) {
            return 1 if !grep { $_ eq $Version->{DeplState} } @{$DeploymentStates};
        }

        # raise incident state if necessary
        if ( $Param{Event} eq 'LinkAdd' ) {
            return $Self->_CheckRaiseIncidentState(
                Version                  => $Version,
                IncidentStates           => $IncidentStates,
                LinkTypesByIncidentState => \%LinkTypesByIncidentState,
                TicketID                 => $TicketID,
            );
        }

        # lower incident state if necessary
        return $Self->_CheckLowerIncidentState(
            Version                  => $Version,
            IncidentStates           => $IncidentStates,
            LinkTypesByIncidentState => \%LinkTypesByIncidentState,
            TicketID                 => $TicketID,
        );
    }

    # handle ticket closure/re-open and relevant/irrelevant type change
    elsif ( $Param{Event} eq 'TicketStateUpdate' || $Param{Event} eq 'TicketTypeUpdate' ) {

        # relevant ticket state and type updates are handled the same way
        # both mean a ticket is relevant for CI incident state changes or not
        # ticket re-open or change to relevant type = might have to raise incident state of CIs
        # ticket closure or change to irrelevant type = might have to lower incident state of CIs
        my $RelevantNow;
        if (
            ( $Param{Event} eq 'TicketStateUpdate' && $NewTicketStateRelevant )
            || ( $Param{Event} eq 'TicketTypeUpdate' && $NewTicketTypeRelevant )
            )
        {
            $RelevantNow = 1;
        }

        # loop through all link types and check links to see if there are possibly affected CIs
        my $DeploymentStates = $ConfigObject->Get('ITSMConfigItem::LinkStatus::DeploymentStates');
        INCIDENTSTATE:
        for my $IncidentState ( @{$IncidentStates} ) {
            LINKTYPE:
            for my $LinkType ( @{ $LinkTypesByIncidentState{$IncidentState} } ) {
                my @LinkedCIs = $Self->_CheckTicketLinks(
                    TicketID => $TicketID,
                    Type     => $LinkType,
                );
                next LINKTYPE if !@LinkedCIs;

                CONFIGITEMID:
                for my $ConfigItemID (@LinkedCIs) {
                    my $Version = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionGet(
                        ConfigItemID => $ConfigItemID,
                    );

                    # optional: check if CI deployment state is relevant
                    if ( IsArrayRefWithData($DeploymentStates) ) {
                        next CONFIGITEMID if !grep { $_ eq $Version->{DeplState} } @{$DeploymentStates};
                    }

                    # check current incident state vs state caused by link

                    # current incident state is lower than caused by link -> set
                    if ($RelevantNow) {

                        # shortcut: nothing to do if CI is already in highest incident state
                        next CONFIGITEMID if $Version->{InciState} eq $IncidentStates->[0];

                        # shortcut: nothing to do if CI is already in same incident state
                        next CONFIGITEMID if $Version->{InciState} eq $IncidentState;

                        # check if CI is in higher incident state already
                        TMPINCIDENTSTATE:
                        for my $TmpIncidentState ( @{$IncidentStates} ) {

                            # all further incident states are lower than current one -> set new state
                            last TMPINCIDENTSTATE if $TmpIncidentState eq $IncidentState;

                            next CONFIGITEMID if $Version->{InciState} eq $TmpIncidentState;
                        }

                        # set new incident state
                        $Self->_SetCIStatus(
                            Version       => $Version,
                            IncidentState => $IncidentState,
                            TicketID      => $TicketID,
                        );
                    }

                    # current incident state is same as caused by link -> re-calculate
                    else {

                        # shortcut: nothing to do if CI is already in lowest incident state
                        next CONFIGITEMID if $Version->{InciState} eq $IncidentStates->[-1];

                        # shortcut: nothing to do if CI is not in same incident state
                        next CONFIGITEMID if $Version->{InciState} ne $IncidentState;

                        # recalculate incident state exactly
                        $Self->_CheckLowerIncidentState(
                            Version                  => $Version,
                            IncidentStates           => $IncidentStates,
                            LinkTypesByIncidentState => \%LinkTypesByIncidentState,
                            TicketID                 => $TicketID,
                        );
                    }
                }
            }
        }
    }

    # unknown/irrelevant event
    else {
        return 1;
    }

    return 1;
}

# Rationale:
# Start at highest (worst) incident state and loop down to current incident state,
#   checking for links on all types configured for the corresponding incident state.
# If any link for a higher incident state than the current one is found,
#   set this state and exit.
# Due to top-to-bottom method, no higher incident state can occur later.
sub _CheckRaiseIncidentState {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Version IncidentStates LinkTypesByIncidentState TicketID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # loop through target states and check if it needs to be changed
    INCIDENTSTATE:
    for my $IncidentState ( @{ $Param{IncidentStates} } ) {

        # CI already in target state - nothing to do
        return 1 if $Param{Version}->{InciState} eq $IncidentState;

        # check if we have linked tickets that lead to incident state
        LINKTYPE:
        for my $LinkType ( @{ $Param{LinkTypesByIncidentState}->{$IncidentState} } ) {
            next LINKTYPE if !$Self->_CheckConfigItemLinks(
                ConfigItemID => $Param{Version}->{ConfigItemID},
                Type         => $LinkType,
            );

            # we have at least one linked ticket - set incident state and exit
            return $Self->_SetCIStatus(
                Version       => $Param{Version},
                IncidentState => $IncidentState,
                TicketID      => $Param{TicketID},
            );
        }
    }

    return 1;
}

# Rationale:
# Shortcut if CI is alredy in lowest (best) incident state = can't have changed after link delete.
# Start at highest (worst) incident state and loop down to current incident state,
#   checking for links on all types configured for the corresponding incident states.
# If a link for the current incident state is found, exit immediately (no change).
# Otherwise set incident state for first occurance of a link, then exit.
# If no link is found, set the lowest state.
# Due to top-to-bottom method, first remembered incident state is the highest possible.
sub _CheckLowerIncidentState {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Version IncidentStates LinkTypesByIncidentState TicketID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # shortcut for lowest level
    return 1 if $Param{Version}->{InciState} eq $Param{IncidentStates}->[-1];

    # loop through target states and check if it needs to be changed
    my $LowerIncidentState;
    INCIDENTSTATE:
    for my $IncidentState ( @{ $Param{IncidentStates} } ) {

        # skip level if current CI incident state is not on this or any higher level
        next INCIDENTSTATE if $Param{Version}->{InciState} ne $IncidentState && !$LowerIncidentState;

        # check if we have linked tickets that keep incident state
        LINKTYPE:
        for my $LinkType ( @{ $Param{LinkTypesByIncidentState}->{$IncidentState} } ) {
            next LINKTYPE if !$Self->_CheckConfigItemLinks(
                ConfigItemID => $Param{Version}->{ConfigItemID},
                Type         => $LinkType,
            );

            # we have at least one linked ticket

            # keep incident state
            return 1 if $Param{Version}->{InciState} eq $IncidentState;

            # otherwise set new (lower) incident state and exit
            return $Self->_SetCIStatus(
                Version       => $Param{Version},
                IncidentState => $IncidentState,
                TicketID      => $Param{TicketID},
            );
        }

        # remember that state needs to be changed (= current level isn'T justified by links anymore)
        $LowerIncidentState = 1;
    }

    # no relevant links have been found, but CI wasn't in lowest incident state before - set it now and exit
    return $Self->_SetCIStatus(
        Version       => $Param{Version},
        IncidentState => $Param{IncidentStates}->[-1],
        TicketID      => $Param{TicketID},
    );
}

# set CI to a specified incident state and log change in corresponding ticket
sub _SetCIStatus {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Version IncidentState TicketID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );

            return;
        }
    }

    # get incident state list
    my $IncidentStateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::Core::IncidentState',
    );
    return if !IsHashRefWithData($IncidentStateList);

    # check if incident state is valid
    my %ReverseIncidentStateList = reverse %{$IncidentStateList};
    if ( !$ReverseIncidentStateList{ $Param{IncidentState} } ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Have invalid incident state '$Param{IncidentState}'!",
        );
        return;
    }

    # add a new version with the new incident state
    my $VersionID = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionAdd(
        %{ $Param{Version} },
        InciStateID => $ReverseIncidentStateList{ $Param{IncidentState} },
        UserID      => 1,
    );
    return if !$VersionID;

    # log change in ticket
    $Kernel::OM->Get('Kernel::System::Ticket')->HistoryAdd(
        TicketID     => $Param{TicketID},
        HistoryType  => 'Misc',
        Name         => "Updated incident state of config item '$Param{Version}->{Number}' to '$Param{IncidentState}'.",
        CreateUserID => 1,
    );

    return 1;
}

# check if relevant CIs are linked to a ticket
sub _CheckTicketLinks {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(TicketID Type)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # get link type lookup
    my $LinkTypeLookup = $Self->_LinkTypeLookupGet();

    my %LinkKeyList = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkKeyList(
        Object1   => 'Ticket',
        Key1      => $Param{TicketID},
        Object2   => 'ITSMConfigItem',
        State     => 'Valid',
        Type      => $LinkTypeLookup->{ $Param{Type} }->{Name},
        Direction => $LinkTypeLookup->{ $Param{Type} }->{Direction}->{Ticket},
        UserID    => 1,
    );
    return if !IsHashRefWithData( \%LinkKeyList );
    return ( sort keys %LinkKeyList );
}

# check if relevant open tickets are linked to a CI
sub _CheckConfigItemLinks {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(ConfigItemID Type)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # get link type lookup
    my $LinkTypeLookup = $Self->_LinkTypeLookupGet();

    my %LinkKeyList = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkKeyList(
        Object1   => 'ITSMConfigItem',
        Key1      => $Param{ConfigItemID},
        Object2   => 'Ticket',
        State     => 'Valid',
        Type      => $LinkTypeLookup->{ $Param{Type} }->{Name},
        Direction => $LinkTypeLookup->{ $Param{Type} }->{Direction}->{ITSMConfigItem},
        UserID    => 1,
    );
    return if !IsHashRefWithData( \%LinkKeyList );

    # list of relevant state types
    my @OpenStateTypes = ( 'new', 'open', 'pending reminder', 'pending auto' );

    # use ticket type check?
    my $TicketTypes = $Kernel::OM->Get('Kernel::Config')->Get('ITSMConfigItem::LinkStatus::TicketTypes');
    my $CheckTicketTypes;
    $CheckTicketTypes = 1 if IsArrayRefWithData($TicketTypes);

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    TICKETID:
    for my $TicketID ( sort keys %LinkKeyList ) {
        my %Ticket = $TicketObject->TicketGet(
            TicketID => $TicketID,
            UserID   => 1,
        );
        next TICKETID if !grep { $_ eq $Ticket{StateType} } @OpenStateTypes;
        if ($CheckTicketTypes) {
            next TICKETID if !$Ticket{Type};
            next TICKETID if !grep { $_ eq $Ticket{Type} } @{$TicketTypes};
        }
        return 1;
    }

    return;
}

# compile list of internal link type names and directions to use for LinkKeyList
sub _LinkTypeLookupGet {
    my ( $Self, %Param ) = @_;

    # if we have generated lookup before
    return $Self->{LinkTypeLookup} if $Self->{LinkTypeLookup};

    my %LinkTypeLookup;
    my %TypeList = $Kernel::OM->Get('Kernel::System::LinkObject')->TypeList();
    for my $TypeNameInternal ( sort keys %TypeList ) {
        my $SourceName = $TypeList{$TypeNameInternal}->{SourceName};
        my $TargetName = $TypeList{$TypeNameInternal}->{TargetName};
        $LinkTypeLookup{$SourceName} = {
            Name      => $TypeNameInternal,
            Direction => {
                ITSMConfigItem => $SourceName eq $TargetName ? 'Both' : 'Target',
                Ticket         => $SourceName eq $TargetName ? 'Both' : 'Source',
            },
        };
        $LinkTypeLookup{$TargetName} = {
            Name      => $TypeNameInternal,
            Direction => {
                ITSMConfigItem => $SourceName eq $TargetName ? 'Both' : 'Source',
                Ticket         => $SourceName eq $TargetName ? 'Both' : 'Target',
            },
        };
    }

    # remember result
    $Self->{LinkTypeLookup} = \%LinkTypeLookup;

    return \%LinkTypeLookup;
}

1;
