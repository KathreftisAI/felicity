# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::LinkObject::ITSMWorkOrder;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::ITSMChange',
    'Kernel::System::ITSMChange::ITSMWorkOrder',
    'Kernel::System::Log',
);

=head1 NAME

Kernel/System/LinkObject/ITSMWorkOrder.pm - LinkObject ITSMWorkOrder module

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $LinkObjectITSMWorkOrderObject = $Kernel::OM->Get('Kernel::System::LinkObject::ITSMWorkOrder');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item LinkListWithData()

fill up the link list with data

    $Success = $LinkObjectBackend->LinkListWithData(
        LinkList => $HashRef,
        UserID   => 1,
    );

=cut

sub LinkListWithData {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(LinkList UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check link list
    if ( ref $Param{LinkList} ne 'HASH' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'LinkList must be a hash reference!',
        );
        return;
    }

    for my $LinkType ( sort keys %{ $Param{LinkList} } ) {

        for my $Direction ( sort keys %{ $Param{LinkList}->{$LinkType} } ) {

            WORKORDERID:
            for my $WorkOrderID ( sort keys %{ $Param{LinkList}->{$LinkType}->{$Direction} } ) {

                # get workorder data
                my $WorkOrderData = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
                    WorkOrderID => $WorkOrderID,
                    UserID      => $Param{UserID},
                );

                # remove id from hash if WorkOrderGet() returns no results
                if ( !$WorkOrderData ) {
                    delete $Param{LinkList}->{$LinkType}->{$Direction}->{$WorkOrderID};
                    next WORKORDERID;
                }

                # get change data for this workorder
                my $ChangeData = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
                    ChangeID => $WorkOrderData->{ChangeID},
                    UserID   => $Param{UserID},
                );

                # remove workorder id from hash if change for this workorder returns no results
                if ( !$ChangeData ) {
                    delete $Param{LinkList}->{$LinkType}->{$Direction}->{$WorkOrderID};
                    next WORKORDERID;
                }

                # add the change data to workorder data
                my %Data = (
                    %{$WorkOrderData},
                    ChangeData => $ChangeData,
                );

                # add workorder data
                $Param{LinkList}->{$LinkType}->{$Direction}->{$WorkOrderID} = \%Data;
            }
        }
    }

    return 1;
}

=item ObjectPermission()

checks read permission for a given object and UserID.

    $Permission = $LinkObject->ObjectPermission(
        Object  => 'ITSMWorkOrder',
        Key     => 123,
        UserID  => 1,
    );

=cut

sub ObjectPermission {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Object Key UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get config of workorder zoom frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get('ITSMWorkOrder::Frontend::AgentITSMWorkOrderZoom');

    # check permissions
    my $Access = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->Permission(
        Type        => $Self->{Config}->{Permission},
        WorkOrderID => $Param{Key},
        UserID      => $Param{UserID},
    );

    return $Access;
}

=item ObjectDescriptionGet()

return a hash of object descriptions

Return
    %Description = (
        Normal => "Workorder# 2009102110001674-1",
        Long   => "Workorder# 2009102110001674-1: The Workorder Title",
    );

    %Description = $LinkObject->ObjectDescriptionGet(
        Key     => 123,
        UserID  => 1,
    );

=cut

sub ObjectDescriptionGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Object Key UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # create description
    my %Description = (
        Normal => 'Workorder',
        Long   => 'Workorder',
    );

    return %Description if $Param{Mode} && $Param{Mode} eq 'Temporary';

    # get workorder data
    my $WorkOrderData = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
        WorkOrderID => $Param{Key},
        UserID      => $Param{UserID},
    );

    return if !$WorkOrderData;
    return if !%{$WorkOrderData};

    # get change data for this workorder
    my $ChangeData = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
        ChangeID => $WorkOrderData->{ChangeID},
        UserID   => $Param{UserID},
    );

    return if !$ChangeData;
    return if !%{$ChangeData};

    # define description text
    my $WorkOrderHook   = $Kernel::OM->Get('Kernel::Config')->Get('ITSMWorkOrder::Hook');
    my $DescriptionText = "$WorkOrderHook $ChangeData->{ChangeNumber}-$WorkOrderData->{WorkOrderNumber}";

    # create description
    %Description = (
        Normal => $DescriptionText,
        Long   => "$DescriptionText: $WorkOrderData->{WorkOrderTitle}",
    );

    return %Description;
}

=item ObjectSearch()

return a hash list of the search results

Return
    $SearchList = {
        NOTLINKED => {
            Source => {
                12  => $DataOfItem12,
                212 => $DataOfItem212,
                332 => $DataOfItem332,
            },
        },
    };

    $SearchList = $LinkObjectBackend->ObjectSearch(
        SearchParams => $HashRef,    # (optional)
        UserID       => 1,
    );

=cut

sub ObjectSearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );
        return;
    }

    # set default params
    $Param{SearchParams} ||= {};

    # add wildcards
    my %Search;
    for my $Element (qw(ChangeNumber ChangeTitle WorkOrderTitle)) {
        if ( $Param{SearchParams}->{$Element} ) {
            $Search{$Element} = '*' . $Param{SearchParams}->{$Element} . '*';
        }
    }

    # search the workorders
    # no need to use OrderBy here, because it is sorted in TableCreateComplex and TableCreatSimple
    my $WorkOrderIDsRef = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderSearch(
        %{ $Param{SearchParams} },
        %Search,
        UsingWildcards => 1,
        MirrorDB       => 1,

        # TODO:
        # use sysconfig option for 'limit' instead, decide wheater this option would be only
        # valid for linking workorders, or just use a global setting for all linking stuff
        Limit => 200,

        UserID => $Param{UserID},
    );

    my %SearchList;
    WORKORDERID:
    for my $WorkOrderID ( @{$WorkOrderIDsRef} ) {

        # get workorder data
        my $WorkOrderData = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
            WorkOrderID => $WorkOrderID,
            UserID      => $Param{UserID},
        );

        next WORKORDERID if !$WorkOrderData;

        # get change data for this workorder
        my $ChangeData = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
            ChangeID => $WorkOrderData->{ChangeID},
            UserID   => $Param{UserID},
        );

        next WORKORDERID if !$ChangeData;

        # add the change data to workorder data
        my %Data = (
            %{$WorkOrderData},
            ChangeData => $ChangeData,
        );

        # add workorder data
        $SearchList{NOTLINKED}->{Source}->{$WorkOrderID} = \%Data;
    }

    return \%SearchList;
}

=item LinkAddPre()

link add pre event module

    $True = $LinkObject->LinkAddPre(
        Key          => 123,
        SourceObject => 'ITSMWorkOrder',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkAddPre(
        Key          => 123,
        TargetObject => 'ITSMWorkOrder',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkAddPre {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # do not trigger event for temporary links
    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

=item LinkAddPost()

link add pre event module

    $True = $LinkObject->LinkAddPost(
        Key          => 123,
        SourceObject => 'ITSMWorkOrder',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkAddPost(
        Key          => 123,
        TargetObject => 'ITSMWorkOrder',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkAddPost {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # do not trigger event for temporary links
    return 1 if $Param{State} eq 'Temporary';

    # get information about linked object
    my $ID     = $Param{TargetKey}    || $Param{SourceKey};
    my $Object = $Param{TargetObject} || $Param{SourceObject};

    # trigger WorkOrderLinkAddPost-Event
    $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->EventHandler(
        Event => 'WorkOrderLinkAddPost',
        Data  => {
            WorkOrderID => $Param{Key},
            Object      => $Object,         # the other object of the link
            ID          => $ID,             # id of the other object
            Type        => $Param{Type},    # the link type
            %Param,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item LinkDeletePre()

link delete pre event module

    $True = $LinkObject->LinkDeletePre(
        Key          => 123,
        SourceObject => 'ITSMWorkOrder',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkDeletePre(
        Key          => 123,
        TargetObject => 'ITSMWorkOrder',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkDeletePre {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # do not trigger event for temporary links
    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

=item LinkDeletePost()

link delete post event module

    $True = $LinkObject->LinkDeletePost(
        Key          => 123,
        SourceObject => 'ITSMWorkOrder',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkDeletePost(
        Key          => 123,
        TargetObject => 'ITSMWorkOrder',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkDeletePost {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # do not trigger event for temporary links
    return 1 if $Param{State} eq 'Temporary';

    # get information about linked object
    my $ID     = $Param{TargetKey}    || $Param{SourceKey};
    my $Object = $Param{TargetObject} || $Param{SourceObject};

    # trigger WorkOrderLinkDeletePost-Event
    $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->EventHandler(
        Event => 'WorkOrderLinkDeletePost',
        Data  => {
            WorkOrderID => $Param{Key},
            Object      => $Object,         # the other object of the link
            ID          => $ID,             # id of the other object
            Type        => $Param{Type},    # the link type
            %Param,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
