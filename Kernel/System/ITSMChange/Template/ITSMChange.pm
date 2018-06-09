# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::Template::ITSMChange;

use strict;
use warnings;

## nofilter(TidyAll::Plugin::OTRS::Perl::Dumper)
use Data::Dumper;

our @ObjectDependencies = (
    'Kernel::System::ITSMChange',
    'Kernel::System::ITSMChange::ITSMCondition',
    'Kernel::System::ITSMChange::ITSMStateMachine',
    'Kernel::System::ITSMChange::Template::ITSMCondition',
    'Kernel::System::ITSMChange::Template::ITSMWorkOrder',
    'Kernel::System::LinkObject',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::Time',
);

=head1 NAME

Kernel::System::ITSMChange::Template::ITSMChange - all template functions for changes

=head1 SYNOPSIS

All functions for change templates in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template::ITSMChange');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # set the debug flag
    $Self->{Debug} = $Param{Debug} || 0;

    return $Self;
}

=item Serialize()

Serialize a change. This is done with Data::Dumper. It returns
a serialized string of the datastructure. The change actions
are "wrapped" within an arrayreference...

    my $TemplateString = $TemplateObject->Serialize(
        ChangeID   => 1,
        StateReset => 1, # (optional) reset to default state
        UserID     => 1,
        Return     => 'HASH', # (optional) HASH|STRING default 'STRING'
    );

returns

    '{ChangeAdd => {Title => 'title', ...}}, {WorkOrderAdd => { ChangeID => 123, ... }}'

If parameter C<Return> is set to C<HASH>, the Perl datastructure
is returned

    {
        ChangeAdd => { ... },
        Children  => [
            {
                WorkOrderAdd => { ... },
                Children     => [ ... ],
            },
            {
                WorkOrderAdd => { ... },
                Children     => [ ... ],
            },
        ],
    }

=cut

sub Serialize {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID ChangeID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # set default value for 'Return'
    $Param{Return} ||= 'STRING';

    # get change
    my $Change = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    return if !$Change;

    # keep only wanted attributes
    my $CleanChange;
    for my $Attribute (
        qw(
        ChangeID ChangeNumber ChangeStateID ChangeTitle Description
        Justification ChangeManagerID ChangeBuilderID
        CategoryID ImpactID PriorityID CABAgents CABCustomers RequestedTime
        CreateTime CreateBy ChangeTime ChangeBy PlannedStartTime PlannedEndTime)
        )
    {
        $CleanChange->{$Attribute} = $Change->{$Attribute};
    }

    # reset change state to default if requested
    if ( $Param{StateReset} ) {

        # get initial change state id
        my $NextStateIDs = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMStateMachine')->StateTransitionGet(
            StateID => 0,
            Class   => 'ITSM::ChangeManagement::Change::State',
        );

        $CleanChange->{ChangeStateID} = $NextStateIDs->[0];
    }

    # add change dynamic fields to list of wanted attributes
    ATTRIBUTE:
    for my $Attribute ( sort keys %{$Change} ) {

        # find the change dynamic field attributes
        if ( $Attribute =~ m{ \A DynamicField_.* \z }xms ) {

            $CleanChange->{$Attribute} = $Change->{$Attribute};
        }
    }

    my $OriginalData = { ChangeAdd => $CleanChange };

    # get attachments
    my @ChangeAttachments = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeAttachmentList(
        ChangeID => $Change->{ChangeID},
    );
    for my $Filename (@ChangeAttachments) {

        # save attachments to this template
        push @{ $OriginalData->{Children} }, { AttachmentAdd => { Filename => $Filename } };
    }

    # get workorders
    WORKORDERID:
    for my $WorkOrderID ( @{ $Change->{WorkOrderIDs} } ) {
        my $WorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::Template::ITSMWorkOrder')->Serialize(
            WorkOrderID => $WorkOrderID,
            StateReset  => $Param{StateReset} || 0,
            UserID      => $Param{UserID},
            Return      => 'HASH',
        );

        next WORKORDERID if !$WorkOrder;

        push @{ $OriginalData->{Children} }, $WorkOrder;
    }

    # get condition list for the change
    my $ConditionList = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ConditionList(
        ChangeID => $Param{ChangeID},
        Valid    => 0,
        UserID   => $Param{UserID},
    ) || [];

    # get each condition
    CONDITIONID:
    for my $ConditionID ( @{$ConditionList} ) {
        my $Condition = $Kernel::OM->Get('Kernel::System::ITSMChange::Template::ITSMCondition')->Serialize(
            ConditionID => $ConditionID,
            UserID      => $Param{UserID},
            Return      => 'HASH',
        );

        next CONDITIONID if !$Condition;

        push @{ $OriginalData->{Children} }, $Condition;
    }

    # get links to other object
    my $LinkListWithData = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkListWithData(
        Object => 'ITSMChange',
        Key    => $Change->{ChangeID},
        State  => 'Valid',
        UserID => $Param{UserID},
    );

    for my $TargetObject ( sort keys %{$LinkListWithData} ) {
        for my $Type ( sort keys %{ $LinkListWithData->{$TargetObject} } ) {
            for my $Key ( sort keys %{ $LinkListWithData->{$TargetObject}->{$Type} } ) {
                for my $TargetID (
                    sort keys %{ $LinkListWithData->{$TargetObject}->{$Type}->{$Key} }
                    )
                {
                    my $LinkInfo = {
                        SourceObject => 'ITSMChange',
                        SourceKey    => $Change->{ChangeID},
                        TargetObject => $TargetObject,
                        TargetKey    => $TargetID,
                        Type         => $Type,
                        State        => 'Valid',
                        UserID       => $Param{UserID},
                    };
                    push @{ $OriginalData->{Children} }, { LinkAdd => $LinkInfo };
                }
            }
        }
    }

    if ( $Param{Return} eq 'HASH' ) {
        return $OriginalData;
    }

    # no indentation (saves space)
    local $Data::Dumper::Indent = 0;

    # do not use cross-referencing
    local $Data::Dumper::Deepcopy = 1;

    # serialize the data (do not use $VAR1, but $TemplateData for Dumper output)
    my $SerializedData = $Kernel::OM->Get('Kernel::System::Main')->Dump( $OriginalData, 'binary' );

    return $SerializedData;
}

=item DeSerialize()

DeSerialize() is a wrapper for all the _XXXAdd methods.

    my %Info = $TemplateObject->DeSerialize(
        Data => {
            # ... Params for ChangeAdd
        },
        ChangeID => 1,
        UserID   => 1,
        Method   => 'ChangeAdd',
    );

=cut

sub DeSerialize {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID Method Data)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # dispatch table
    my %Method2Sub = (
        ChangeAdd     => '_ChangeAdd',
        AttachmentAdd => '_AttachmentAdd',
        LinkAdd       => '_LinkAdd',
    );

    my $Sub = $Method2Sub{ $Param{Method} };

    if ( !$Sub ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Invalid Methodname!',
        );
        return;
    }

    return $Self->$Sub(%Param);
}

=begin Internal:

=item _ChangeAdd()

Creates a new change based on a template. It returns a hash with additional
info like ChangeID.

    my %Return = $TemplateObject->_ChangeAdd(
        Data => {
            ChangeTitle => 'test',
        },
        # other change attributes
        ChangeID => 0,
        UserID   => 1,
    );

=cut

sub _ChangeAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID Data)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # make a local copy
    my %Data = %{ $Param{Data} };

    # we need the old change id for expressions
    my $OldChangeID = $Data{ChangeID};

    # these attributes are generated automatically, so don't pass them to ChangeAdd()
    delete @Data{qw(ChangeID ChangeNumber CreateTime CreateBy ChangeTime ChangeBy)};
    delete @Data{qw(DescriptionPlain JustificationPlain)};

    # if user set a new time, calculate difference
    my $Difference;
    if ( $Param{NewTimeInEpoche} ) {
        my $OldTime = $Data{ $Param{MoveTimeType} };

        if ($OldTime) {
            $Difference = $Self->_GetTimeDifference(
                CurrentTime     => $OldTime,
                NewTimeInEpoche => $Param{NewTimeInEpoche},
            );
        }
    }

    # PlannedXXXTime was saved just for "move time" purposes
    delete $Data{PlannedEndTime};
    delete $Data{PlannedStartTime};

    # RequestedTime should not be set
    delete $Data{RequestedTime};

    # delete all parameters whose values are 'undef'
    # _CheckChangeParams throws an error otherwise
    for my $Parameter ( sort keys %Data ) {
        delete $Data{$Parameter} if !defined $Data{$Parameter};
    }

    # replace the ChangeBuilderID from the saved template with the current user id
    $Data{ChangeBuilderID} = $Param{UserID};

    # add the change
    my $ChangeID = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeAdd(
        %Data,
        UserID => $Param{UserID},
    );

    # error handling
    if ( !$ChangeID ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Could not create change!",
        );
        return;
    }

    my %Info = (
        ID             => $ChangeID,
        ChangeID       => $ChangeID,
        TimeDifference => $Difference,
        OldChangeID    => $OldChangeID,
    );

    return %Info;
}

=item _GetTimeDifference()

If a new planned start/end time was given, the difference is needed
to move all time values

    my $DiffInSeconds = $TemplateObject->_GetTimeDifference(
        CurrentTime     => '2010-01-12 00:00:00',
        NewTimeInEpoche => 1234567890,
    );

=cut

sub _GetTimeDifference {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(CurrentTime NewTimeInEpoche)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get current time as timestamp
    my $CurrentSystemTime = $Kernel::OM->Get('Kernel::System::Time')->TimeStamp2SystemTime(
        String => $Param{CurrentTime},
    );

    my $DiffSeconds = $Param{NewTimeInEpoche} - $CurrentSystemTime;

    return $DiffSeconds;
}

=item _AttachmentAdd()

Creates new attachments for a change or a workorder based on the given template.
It returns a hash of information (with just one key - "Success")

    my %Info = $TemplateObject->_AttachmentAdd(
        Data => {
            # ... Params for AttachmentAdd
        },
        ChangeID => 1,
        UserID   => 1,
    );

=cut

sub _AttachmentAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID ChangeID Data)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my $Attachment = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeAttachmentGet(
        ChangeID => $Param{OldChangeID},
        Filename => $Param{Data}->{Filename},
    );

    my $Success = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeAttachmentAdd(
        %{$Attachment},
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    my %Info = (
        Success => $Success,
    );

    return %Info;
}

=item _LinkAdd()

Creates new links for a change or a workorder based on the given template. It
returns a hash of information (with just one key - "Success")

    my %Info = $TemplateObject->_LinkAdd(
        Data => {
            # ... Params for LinkAdd
        },
        ChangeID    => 1,
        WorkOrderID => 123, # optional
        UserID      => 1,
    );

=cut

sub _LinkAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID Data)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my $SourceKey;

    if ( $Param{Data}->{SourceObject} eq 'ITSMChange' ) {
        $SourceKey = $Param{ChangeID};
    }
    elsif ( $Param{Data}->{SourceObject} eq 'ITSMWorkOrder' ) {
        $SourceKey = $Param{WorkOrderID};
    }

    if ( !$SourceKey ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need WorkOrderID or ChangeID!',
        );
        return;
    }

    my $Success = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkAdd(
        %{ $Param{Data} },
        SourceKey => $SourceKey,
        UserID    => $Param{UserID},
    );

    my %Info = (
        Success => $Success,
    );

    return %Info;
}

1;

=end Internal:

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
