# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::Event::Notification;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Group',
    'Kernel::System::ITSMChange',
    'Kernel::System::ITSMChange::History',
    'Kernel::System::ITSMChange::ITSMWorkOrder',
    'Kernel::System::ITSMChange::Notification',
    'Kernel::System::LinkObject',
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

    # do not modify the original event, because we need this unmodified in later event modules
    my $Event = $Param{Event};

    # in history event handling we use Event name without the trailing 'Post'
    $Event =~ s{ Post \z }{}xms;

    # distinguish between Change and WorkOrder events, based on naming convention
    my $Type;
    if ( $Event =~ m{ \A (Change|ActionExecute) }xms ) {
        $Type = 'Change';
    }
    elsif ( $Event =~ m{ \A WorkOrder }xms ) {
        $Type = 'WorkOrder';
    }
    else {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Could not determine the object type for the event '$Event'!",
        );
        return;
    }

    # get the event id, for looking up the list of relevant rules
    my $EventID = $Kernel::OM->Get('Kernel::System::ITSMChange::History')->HistoryTypeLookup(
        HistoryType => $Event,
    );
    if ( !$EventID ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Encountered unknown event '$Event'!",
        );
        return;
    }

    my $NotificationRuleIDs = $Kernel::OM->Get('Kernel::System::ITSMChange::Notification')->NotificationRuleSearch(
        EventID => $EventID,
    );
    if ( !$NotificationRuleIDs ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Could not get notification rules for the event '$Event'!",
        );
        return;
    }

    # in case of an update, we have the old data for comparison
    my $OldData = $Param{Data}->{"Old${Type}Data"};

    # The notification rules are based on names, while the ChangeUpdate-Function
    # primarily cares about IDs. So there needs to be a mapping.
    my %Name2ID = (
        ChangeState    => 'ChangeStateID',
        WorkOrderState => 'WorkOrderStateID',
    );

    # loop over the notification rules and check the condition
    RULEID:
    for my $RuleID ( @{$NotificationRuleIDs} ) {
        my $Rule = $Kernel::OM->Get('Kernel::System::ITSMChange::Notification')->NotificationRuleGet(
            ID => $RuleID,
        );

        my $Attribute = $Rule->{Attribute} || '';
        if ( $Name2ID{$Attribute} ) {
            $Attribute = $Name2ID{$Attribute};
        }

        # no notification if the attribute is not relevant
        if ( $Attribute && !exists $Param{Data}->{$Attribute} ) {
            next RULEID;
        }

        # in case of an update, check whether the attribute has changed
        if (
            $Attribute
            && ( $Event eq 'ChangeUpdate' || $Event eq 'WorkOrderUpdate' )
            )
        {
            my $HasChanged = $Self->_HasFieldChanged(
                New => $Param{Data}->{$Attribute},
                Old => $OldData->{$Attribute},
            );

            next RULEID if !$HasChanged;
        }

        # get the string to match against
        # TODO: support other combinations, maybe use GeneralCatalog directly
        my $NewFieldContent = $Attribute ? $Param{Data}->{$Attribute} : '';

        if ( $Attribute eq 'ChangeStateID' ) {
            $NewFieldContent = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeStateLookup(
                ChangeStateID => $NewFieldContent,
            );
        }
        elsif ( $Attribute eq 'WorkOrderStateID' ) {
            $NewFieldContent = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderStateLookup(
                WorkOrderStateID => $NewFieldContent,
            );
        }

        # should the notification be sent ?
        # the x-modifier is harmful here, as $Rule->{Rule} can contain spaces
        if (
            defined $Rule->{Rule}
            && defined $NewFieldContent
            && $NewFieldContent !~ m/^$Rule->{Rule}$/
            )
        {
            next RULEID;
        }

        # determine list of agents and customers
        my $AgentAndCustomerIDs = $Self->_AgentAndCustomerIDsGet(
            Recipients  => $Rule->{Recipients},
            Type        => $Type,
            Event       => $Event,
            ChangeID    => $Param{Data}->{ChangeID},
            WorkOrderID => $Param{Data}->{WorkOrderID},
            OldData     => $OldData,
            UserID      => $Param{UserID},
        );

        next RULEID if !$AgentAndCustomerIDs;

        $Kernel::OM->Get('Kernel::System::ITSMChange::Notification')->NotificationSend(
            %{$AgentAndCustomerIDs},
            Type   => $Type,
            Event  => $Event,
            UserID => $Param{UserID},
            Data   => {
                %{ $Param{Data} },    # do not pass as reference, as it would influence later events!
            },

            Message => $Rule->{Message},
        );
    }

    return 1;
}

=begin Internal:

=item _HasFieldChanged()

This method checks whether a field was changed or not. It returns 1 when field
was changed, 0 otherwise

    my $FieldHasChanged = $NotificationEventObject->_HasFieldChanged(
        Old => 'old value', # can be array reference or hash reference as well
        New => 'new value', # can be array reference or hash reference as well
    );

=cut

sub _HasFieldChanged {
    my ( $Self, %Param ) = @_;

    # field has changed when either 'new' or 'old is not set
    return 1 if !( $Param{New} && $Param{Old} ) && ( $Param{New} || $Param{Old} );

    # field has not changed when both values are empty
    return if !$Param{New} && !$Param{Old};

    # return result of 'eq' when both params are scalars
    return $Param{New} ne $Param{Old} if !ref( $Param{New} ) && !ref( $Param{Old} );

    # a field has changed when 'ref' is different
    return 1 if ref( $Param{New} ) ne ref( $Param{Old} );

    # check hashes
    if ( ref $Param{New} eq 'HASH' ) {

        # field has changed when number of keys are different
        return 1 if scalar keys %{ $Param{New} } != scalar keys %{ $Param{Old} };

        # check the values for each key
        for my $Key ( sort keys %{ $Param{New} } ) {
            return 1 if $Param{New}->{$Key} ne $Param{Old}->{$Key};
        }
    }

    # check arrays
    if ( ref $Param{New} eq 'ARRAY' ) {

        # changed when number of elements differ
        return 1 if scalar @{ $Param{New} } != scalar @{ $Param{Old} };

        # check each element
        for my $Index ( 0 .. $#{ $Param{New} } ) {
            return 1 if $Param{New}->[$Index] ne $Param{Old}->[$Index];
        }
    }

    # field has not been changed
    return 0;
}

=item _AgentAndCustomerIDsGet()

Get the agent and customer IDs from the recipient list.

    my $AgentAndCustomerIDs = $HistoryObject->_AgentAndCustomerIDsGet(
        Recipients => ['ChangeBuilder', 'ChangeManager'],
    );

returns

    $AgentAndCustomerIDs = {
        AgentIDs    => [ 2, 4 ],
        CustomerIDs => [],
    };

=cut

sub _AgentAndCustomerIDsGet {
    my ( $Self, %Param ) = @_;

    my $WorkOrderAgentID;
    if ( $Param{Type} eq 'WorkOrder' ) {

        # check WorkOrderID
        if ( !$Param{WorkOrderID} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "The param 'WorkOrderID' is required for WorkOrder events!",
            );
        }
        elsif ( $Param{Event} eq 'WorkOrderDelete' ) {

            # the workorder is already deleted, so we look at the OldData
            $Param{ChangeID} = $Param{OldData}->{ChangeID};
            $WorkOrderAgentID = $Param{OldData}->{WorkOrderAgentID};
        }
        else {

            # get ChangeID and WorkOrderAgentID from the WorkOrder,
            # the WorkOrderAgent might have been recently updated
            my $WorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
                WorkOrderID => $Param{WorkOrderID},
                UserID      => $Param{UserID},

            );
            $Param{ChangeID} = $WorkOrder->{ChangeID};
            $WorkOrderAgentID = $WorkOrder->{WorkOrderAgentID};
        }
    }

    # these arrays will be returned
    my ( @AgentIDs, @CustomerIDs );

    # needed for determining the actual recipients
    my $Change = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    return if !$Change;
    return if ref $Change ne 'HASH';
    return if !%{$Change};

    for my $Recipient ( @{ $Param{Recipients} } ) {

        if ( $Recipient eq 'ChangeBuilder' || $Recipient eq 'ChangeManager' ) {

            # take the builder or manager from the current change data
            push @AgentIDs, $Change->{ $Recipient . 'ID' };
        }
        elsif ( $Recipient eq 'OldChangeBuilder' || $Recipient eq 'OldChangeManager' ) {
            if ( $Param{Event} ne 'ChangeUpdate' ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Recipient $Recipient is only valid for ChangeUpdate events, "
                        . "but the event was a '$Param{Event}' event!",
                );
            }
            else {

                # take the builder or manager from the original change data
                $Recipient =~ s{ \A Old }{}xms;
                push @AgentIDs, $Param{OldData}->{ $Recipient . 'ID' };
            }
        }
        elsif ( $Recipient eq 'CABCustomers' ) {
            push @CustomerIDs, @{ $Change->{CABCustomers} };
        }
        elsif ( $Recipient eq 'CABAgents' ) {
            push @AgentIDs, @{ $Change->{CABAgents} };
        }
        elsif ( $Recipient eq 'WorkOrderAgent' ) {
            if ( $Param{Type} ne 'WorkOrder' ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Recipient $Recipient is only valid for workorder events "
                        . "but the event was a '$Param{Event}' event!",
                );
            }
            else {
                push @AgentIDs, $WorkOrderAgentID;
            }
        }
        elsif ( $Recipient eq 'OldWorkOrderAgent' ) {
            if ( $Param{Event} ne 'WorkOrderUpdate' ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Recipient $Recipient is only valid for WorkOrderUpdate events "
                        . "but the event was a '$Param{Event}' event!",
                );
            }
            else {

                # take the workorder agent from the original workorder data
                $Recipient =~ s{ \A Old }{}xms;
                push @AgentIDs, $Param{OldData}->{ $Recipient . 'ID' };
            }
        }
        elsif ( $Recipient eq 'WorkOrderAgents' ) {

            # loop over the workorders of a change and get their workorder agents
            for my $WorkOrderID ( @{ $Change->{WorkOrderIDs} } ) {
                my $WorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
                    WorkOrderID => $WorkOrderID,
                    UserID      => $Param{UserID},
                );

                push @AgentIDs, $WorkOrder->{WorkOrderAgentID};
            }
        }
        elsif ( $Recipient eq 'ChangeInitiators' ) {

            # get linked objects which are directly linked with this change object
            my $LinkListWithData = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkListWithData(
                Object => 'ITSMChange',
                Key    => $Param{ChangeID},
                State  => 'Valid',
                UserID => $Param{UserID},
            );

            # get change initiators (customer users of linked tickets)
            # This should be the same list a displayed in ChangeZoom.
            my $LinkList = $LinkListWithData->{Ticket} || {};
            for my $LinkType ( sort keys %{$LinkList} ) {

                # the linked tickets are always the 'Source'.
                for my $TicketData ( values %{ $LinkList->{$LinkType}->{Source} } ) {

                    # The data for the linked ticket can have a customer id.
                    # If it doesn't, fall back to the owner.
                    if ( $TicketData->{CustomerUserID} ) {
                        push @CustomerIDs, $TicketData->{CustomerUserID};
                    }
                    else {
                        push @AgentIDs, $TicketData->{OwnerID};
                    }
                }
            }
        }
        elsif ( $Recipient =~ m{ \A GroupITSMChange(|Builder|Manager) \z }xms ) {

            my %Recipient2Group = (
                GroupITSMChange        => 'itsm-change',
                GroupITSMChangeBuilder => 'itsm-change-builder',
                GroupITSMChangeManager => 'itsm-change-manager',
            );

            # get group id
            my $GroupID = $Kernel::OM->Get('Kernel::System::Group')->GroupLookup(
                Group => $Recipient2Group{$Recipient}
            );

            # get members of group
            my %Users = $Kernel::OM->Get('Kernel::System::Group')->GroupMemberList(
                GroupID => $GroupID,
                Type    => 'ro',
                Result  => 'HASH',
                Cached  => 1,
            );

            push @AgentIDs, keys %Users;
        }
        else {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Unknown recipient '$Recipient'!",
            );
            return;
        }
    }

    # no need to eliminate duplicates, NotificationSend() takes care of that
    # remove empty IDs
    @AgentIDs    = grep {$_} @AgentIDs;
    @CustomerIDs = grep {$_} @CustomerIDs;

    my %AgentAndCustomerIDs = (
        AgentIDs    => \@AgentIDs,
        CustomerIDs => \@CustomerIDs,
    );

    return \%AgentAndCustomerIDs;
}

1;

=end Internal:
