# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::Event::HistoryAdd;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::ITSMChange::History',
    'Kernel::System::ITSMChange::ITSMWorkOrder',
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
    for my $Needed (qw(Data Event Config UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # do not modify the original event, because we need this unmodified in later event modules
    my $Event = $Param{Event};

    # in history event handling we use Event name without the trailing 'Post'
    $Event =~ s{ Post \z }{}xms;

    # distinguish between Change and WorkOrder events, based on naming convention
    my ($Type) = $Event =~ m{ \A ( Change | WorkOrder | Condition | Expression | Action ) }xms;
    if ( !$Type ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Could not determine the object type for the event '$Event'!"
        );
        return;
    }

    # store all history add data
    my @HistoryAddData;

    # do history stuff
    if ( $Event eq 'ChangeAdd' || $Event eq 'WorkOrderAdd' ) {

        # tell history that a change was added
        push @HistoryAddData, {
            ChangeID    => $Param{Data}->{ChangeID},
            WorkOrderID => $Param{Data}->{WorkOrderID},
            HistoryType => $Event,
            ContentNew  => $Param{Data}->{ $Type . 'ID' },
            UserID      => $Param{UserID},
        };
    }

    elsif ( $Event eq 'ChangeUpdate' || $Event eq 'WorkOrderUpdate' ) {

        # get old data, either from change or workorder
        my $OldData  = $Param{Data}->{"Old${Type}Data"};
        my $ChangeID = $OldData->{ChangeID};               # works for change and workorder events

        FIELD:
        for my $Field ( sort keys %{ $Param{Data} } ) {

            # do not track special fields 'OldChangeData' or 'OldWorkOrderData'
            next FIELD if $Field eq "Old${Type}Data";

            # we do not track the user id
            next FIELD if $Field eq 'UserID';

            # we do not track the "plain" columns, only the non-plain columns
            next FIELD if $Field eq 'JustificationPlain';    # change
            next FIELD if $Field eq 'DescriptionPlain';      # change
            next FIELD if $Field eq 'ReportPlain';           # workorder
            next FIELD if $Field eq 'InstructionPlain';      # workorder

            # we do no want to track the internal field "NoNumberCalc"
            next FIELD if $Field eq 'NoNumberCalc';          # workorder

            # The history of CAB updates is not tracked here,
            # but in the handler for ChangeCABUpdate.
            next FIELD if $Field eq 'CABAgents';       # change
            next FIELD if $Field eq 'CABCustomers';    # change

            # special handling for accounted time
            if ( $Type eq 'WorkOrder' && $Field eq 'AccountedTime' ) {

                # we do not track if accounted time was empty
                next FIELD if !$Param{Data}->{$Field};

                # if accounted time is not empty, we always track the history

                # get workorder data
                my $WorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
                    WorkOrderID => $Param{Data}->{WorkOrderID},
                    UserID      => $Param{UserID},
                );

                # save history if accounted time has changed
                push @HistoryAddData, {
                    ChangeID    => $ChangeID,
                    WorkOrderID => $Param{Data}->{WorkOrderID},
                    HistoryType => $Event,
                    Fieldname   => $Field,
                    ContentNew  => $WorkOrder->{$Field},
                    ContentOld  => $OldData->{$Field},
                    UserID      => $Param{UserID},
                };

                next FIELD;
            }

            # check if field has changed
            my $FieldHasChanged = $Self->_HasFieldChanged(
                New => $Param{Data}->{$Field},
                Old => $OldData->{$Field},
            );

            # save history if field has changed
            if ($FieldHasChanged) {

                push @HistoryAddData, {
                    ChangeID    => $ChangeID,
                    WorkOrderID => $Param{Data}->{WorkOrderID},
                    HistoryType => $Event,
                    Fieldname   => $Field,
                    ContentNew  => $Param{Data}->{$Field},
                    ContentOld  => $OldData->{$Field},
                    UserID      => $Param{UserID},
                };
            }
        }
    }

    elsif ( $Event eq 'WorkOrderDelete' ) {

        # get old data
        my $OldData = $Param{Data}->{OldWorkOrderData};

        # get existing history entries for this workorder
        my $HistoryEntries = $Kernel::OM->Get('Kernel::System::ITSMChange::History')->WorkOrderHistoryGet(
            WorkOrderID => $OldData->{WorkOrderID},
            UserID      => $Param{UserID},
        );

        # update history entries: delete workorder id
        HISTORYENTRY:
        for my $HistoryEntry ( @{$HistoryEntries} ) {
            $Kernel::OM->Get('Kernel::System::ITSMChange::History')->HistoryUpdate(
                HistoryEntryID => $HistoryEntry->{HistoryEntryID},
                WorkOrderID    => undef,
                UserID         => $Param{UserID},
            );
        }

        # add history entry for WorkOrder deletion
        # call HistoryAdd directly from here instead of using the @HistoryAddData
        # as we want this to appear next to the line in history that HistoryUpdate
        # just added in the code block before
        return if !$Kernel::OM->Get('Kernel::System::ITSMChange::History')->HistoryAdd(
            ChangeID    => $OldData->{ChangeID},
            HistoryType => $Event,
            ContentNew  => $OldData->{WorkOrderID},
            UserID      => $Param{UserID},
        );
    }

    # handle ChangeCAB events
    elsif ( $Event eq 'ChangeCABUpdate' || $Event eq 'ChangeCABDelete' ) {

        # get old data
        my $OldData = $Param{Data}->{OldChangeCABData};

        FIELD:
        for my $Field (qw(CABAgents CABCustomers)) {

            # we do not track when the param has not been passed
            next FIELD if !$Param{Data}->{$Field};

            # check if field has changed
            my $FieldHasChanged = $Self->_HasFieldChanged(
                New => $Param{Data}->{$Field},
                Old => $OldData->{$Field},
            );

            # save history if field has changed
            if ($FieldHasChanged) {

                push @HistoryAddData, {
                    ChangeID    => $Param{Data}->{ChangeID},
                    HistoryType => $Event,
                    Fieldname   => $Field,
                    ContentNew  => join( '%%', @{ $Param{Data}->{$Field} } ),
                    ContentOld  => join( '%%', @{ $OldData->{$Field} } ),
                    UserID      => $Param{UserID},
                };
            }
        }
    }

    # handle link events
    elsif (
        $Event eq 'ChangeLinkAdd'
        || $Event eq 'ChangeLinkDelete'
        || $Event eq 'WorkOrderLinkAdd'
        || $Event eq 'WorkOrderLinkDelete'
        )
    {

        # for  workorder links get the change id
        if ( $Param{Data}->{WorkOrderID} ) {
            my $WorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
                WorkOrderID => $Param{Data}->{WorkOrderID},
                UserID      => $Param{UserID},
            );

            $Param{Data}->{ChangeID} = $WorkOrder->{ChangeID};
        }

        my $ContentNew = join '%%',
            $Param{Data}->{SourceObject} || $Param{Data}->{TargetObject},
            $Param{Data}->{SourceKey} || $Param{Data}->{TargetKey};

        # tell history that a link was added
        push @HistoryAddData, {
            ChangeID    => $Param{Data}->{ChangeID},
            WorkOrderID => $Param{Data}->{WorkOrderID},
            HistoryType => $Event,
            ContentNew  => $ContentNew,
            UserID      => $Param{UserID},
        };
    }

    # handle attachment events
    elsif (
        $Event eq 'ChangeAttachmentAdd'
        || $Event eq 'ChangeAttachmentDelete'
        || $Event eq 'WorkOrderAttachmentAdd'
        || $Event eq 'WorkOrderAttachmentDelete'
        || $Event eq 'WorkOrderReportAttachmentAdd'
        || $Event eq 'WorkOrderReportAttachmentDelete'
        )
    {

        # tell history that an attachment event was triggered
        push @HistoryAddData, {
            ChangeID    => $Param{Data}->{ChangeID},
            WorkOrderID => $Param{Data}->{WorkOrderID},
            HistoryType => $Event,
            ContentNew  => $Param{Data}->{Filename},
            UserID      => $Param{UserID},
        };
    }

    # handle xxxTimeReached events
    elsif ( $Event =~ m{ TimeReached \z }xms ) {

        # get either WorkOrderID or ChangeID
        my $ID = $Param{Data}->{WorkOrderID} || $Param{Data}->{ChangeID};

        push @HistoryAddData, {
            ChangeID    => $Param{Data}->{ChangeID},
            WorkOrderID => $Param{Data}->{WorkOrderID},
            HistoryType => $Event,
            ContentNew  => $ID . '%%Notification Sent',
            UserID      => $Param{UserID},
        };
    }

    # add history entry when notification was sent
    elsif ( $Event =~ m{ NotificationSent \z }xms ) {

        # get either WorkOrderID or ChangeID
        my $ID = $Param{Data}->{WorkOrderID} || $Param{Data}->{ChangeID};

        push @HistoryAddData, {
            ChangeID    => $Param{Data}->{ChangeID},
            WorkOrderID => $Param{Data}->{WorkOrderID},
            HistoryType => $Event,
            ContentNew  => $Param{Data}->{To} . '%%' . $Param{Data}->{EventType},
            UserID      => $Param{UserID},
        };
    }

    # handle condition events
    elsif ( $Event eq 'ConditionAdd' ) {

        # create history for condition
        push @HistoryAddData, {
            ChangeID    => $Param{Data}->{ChangeID},
            HistoryType => $Event,
            ContentNew  => $Param{Data}->{ConditionID},
            UserID      => $Param{UserID},
        };

        # create history for all condition fields
        my @ConditionStatic = qw(ConditionID UserID ChangeID);
        CONDITIONFIELD:
        for my $ConditionField ( sort keys %{ $Param{Data} } ) {

            # check for static fields
            next CONDITIONFIELD if grep { $_ eq $ConditionField } @ConditionStatic;

            # do not add empty fields to history
            next CONDITIONFIELD if !$Param{Data}->{$ConditionField};

            push @HistoryAddData, {
                ChangeID    => $Param{Data}->{ChangeID},
                HistoryType => $Event,
                Fieldname   => $ConditionField,
                ContentNew  => $Param{Data}->{$ConditionField},
                UserID      => $Param{UserID},
            };
        }
    }

    # handle condition update events
    elsif ( $Event eq 'ConditionUpdate' ) {

        # get old data
        my $OldData = $Param{Data}->{OldConditionData};

        # create history for all condition fields
        my @ConditionStatic = qw(ConditionID UserID ChangeID OldConditionData);
        CONDITIONFIELD:
        for my $ConditionField ( sort keys %{ $Param{Data} } ) {

            # check for static fields
            next CONDITIONFIELD if grep { $_ eq $ConditionField } @ConditionStatic;

            # do not add empty fields to history
            next CONDITIONFIELD if !$Param{Data}->{$ConditionField};

            # check if field has changed
            my $FieldHasChanged = $Self->_HasFieldChanged(
                New => $Param{Data}->{$ConditionField},
                Old => $OldData->{$ConditionField},
            );

            # create history only for changed fields
            next CONDITIONFIELD if !$FieldHasChanged;

            push @HistoryAddData, {
                ChangeID    => $OldData->{ChangeID},
                HistoryType => $Event,
                Fieldname   => $ConditionField,
                ContentNew  => $Param{Data}->{ConditionID} . '%%' . $Param{Data}->{$ConditionField},
                ContentOld  => $Param{Data}->{ConditionID} . '%%' . $OldData->{$ConditionField},
                UserID      => $Param{UserID},
            };
        }
    }

    # handle condition delete events
    elsif ( $Event eq 'ConditionDelete' ) {

        # get old data
        my $OldData = $Param{Data}->{OldConditionData};

        push @HistoryAddData, {
            ChangeID    => $OldData->{ChangeID},
            HistoryType => $Event,
            ContentNew  => $OldData->{ConditionID},
            UserID      => $Param{UserID},
        };
    }

    # handle condition delete events
    elsif ( $Event eq 'ConditionDeleteAll' ) {

        return if !$Kernel::OM->Get('Kernel::System::ITSMChange::History')->HistoryAdd(
            ChangeID    => $Param{Data}->{ChangeID},
            HistoryType => $Event,
            ContentNew  => $Param{Data}->{ChangeID},
            UserID      => $Param{UserID},
        );
    }

    # handle expression events
    elsif ( $Event eq 'ExpressionAdd' ) {

        # create history for expression
        push @HistoryAddData, {
            ChangeID    => $Param{Data}->{ChangeID},
            HistoryType => $Event,
            ContentNew  => $Param{Data}->{ExpressionID},
            UserID      => $Param{UserID},
        };

        # create history for all expression fields
        my @ExpressionStatic = qw( ExpressionID UserID ChangeID);
        EXPRESSIONFIELD:
        for my $ExpressionField ( sort keys %{ $Param{Data} } ) {

            # check for static fields
            next EXPRESSIONFIELD if grep { $_ eq $ExpressionField } @ExpressionStatic;

            # do not add empty fields to history
            next EXPRESSIONFIELD if !$Param{Data}->{$ExpressionField};

            push @HistoryAddData, {
                ChangeID    => $Param{Data}->{ChangeID},
                HistoryType => $Event,
                Fieldname   => $ExpressionField,
                ContentNew  => $Param{Data}->{$ExpressionField},
                UserID      => $Param{UserID},
            };
        }
    }

    # handle expression update events
    elsif ( $Event eq 'ExpressionUpdate' ) {

        # get old data
        my $OldData = $Param{Data}->{OldExpressionData};

        # create history for all expression fields
        my @ExpressionStatic = qw( ExpressionID UserID ChangeID OldExpressionData );
        EXPRESSIONFIELD:
        for my $ExpressionField ( sort keys %{ $Param{Data} } ) {

            # check for static fields
            next EXPRESSIONFIELD if grep { $_ eq $ExpressionField } @ExpressionStatic;

            # do not add empty fields to history
            next EXPRESSIONFIELD if !$Param{Data}->{$ExpressionField};

            # check if field has changed
            my $FieldHasChanged = $Self->_HasFieldChanged(
                New => $Param{Data}->{$ExpressionField},
                Old => $OldData->{$ExpressionField},
            );

            # create history only for changed fields
            next EXPRESSIONFIELD if !$FieldHasChanged;

            push @HistoryAddData, {
                ChangeID    => $Param{Data}->{ChangeID},
                HistoryType => $Event,
                Fieldname   => $ExpressionField,
                ContentNew  => $Param{Data}->{ExpressionID} . '%%'
                    . $Param{Data}->{$ExpressionField},
                ContentOld => $Param{Data}->{ExpressionID} . '%%' . $OldData->{$ExpressionField},
                UserID     => $Param{UserID},
            };
        }
    }

    # handle expression delete events
    elsif ( $Event eq 'ExpressionDelete' ) {

        push @HistoryAddData, {
            ChangeID    => $Param{Data}->{ChangeID},
            HistoryType => $Event,
            ContentNew  => $Param{Data}->{ExpressionID},
            UserID      => $Param{UserID},
        };
    }

    # handle delete all expressions events
    elsif ( $Event eq 'ExpressionDeleteAll' ) {

        push @HistoryAddData, {
            ChangeID    => $Param{Data}->{ChangeID},
            HistoryType => $Event,
            ContentNew  => $Param{Data}->{ConditionID},
            UserID      => $Param{UserID},
        };
    }

    # handle action events
    elsif ( $Event eq 'ActionAdd' ) {

        # create history for action
        push @HistoryAddData, {
            ChangeID    => $Param{Data}->{ChangeID},
            HistoryType => $Event,
            ContentNew  => $Param{Data}->{ActionID},
            UserID      => $Param{UserID},
        };

        # create history for all action fields
        my @ActionStatic = qw( ActionID UserID ChangeID);
        ACTIONFIELD:
        for my $ActionField ( sort keys %{ $Param{Data} } ) {

            # check for static fields
            next ACTIONFIELD if grep { $_ eq $ActionField } @ActionStatic;

            # do not add empty fields to history
            next ACTIONFIELD if !$Param{Data}->{$ActionField};

            push @HistoryAddData, {
                ChangeID    => $Param{Data}->{ChangeID},
                HistoryType => $Event,
                Fieldname   => $ActionField,
                ContentNew  => $Param{Data}->{$ActionField},
                UserID      => $Param{UserID},
            };
        }
    }

    # handle action update events
    elsif ( $Event eq 'ActionUpdate' ) {

        # get old data
        my $OldData = $Param{Data}->{OldActionData};

        # create history for all expression fields
        my @ActionStatic = qw( ActionID UserID ChangeID OldActionData );
        ACTIONFIELD:
        for my $ActionField ( sort keys %{ $Param{Data} } ) {

            # check for static fields
            next ACTIONFIELD if grep { $_ eq $ActionField } @ActionStatic;

            # do not add empty fields to history
            next ACTIONFIELD if !$Param{Data}->{$ActionField};

            # check if field has changed
            my $FieldHasChanged = $Self->_HasFieldChanged(
                New => $Param{Data}->{$ActionField},
                Old => $OldData->{$ActionField},
            );

            # create history only for changed fields
            next ACTIONFIELD if !$FieldHasChanged;

            push @HistoryAddData, {
                ChangeID    => $Param{Data}->{ChangeID},
                HistoryType => $Event,
                Fieldname   => $ActionField,
                ContentNew  => $Param{Data}->{ActionID} . '%%' . $Param{Data}->{$ActionField},
                ContentOld  => $Param{Data}->{ActionID} . '%%' . $OldData->{$ActionField},
                UserID      => $Param{UserID},
            };
        }
    }

    # handle action delete events
    elsif ( $Event eq 'ActionDelete' ) {

        push @HistoryAddData, {
            ChangeID    => $Param{Data}->{ChangeID},
            HistoryType => $Event,
            ContentNew  => $Param{Data}->{ActionID},
            UserID      => $Param{UserID},
        };
    }

    # handle delete all actions events
    elsif ( $Event eq 'ActionDeleteAll' ) {

        push @HistoryAddData, {
            ChangeID    => $Param{Data}->{ChangeID},
            HistoryType => $Event,
            ContentNew  => $Param{Data}->{ConditionID},
            UserID      => $Param{UserID},
        };
    }

    # handle action execute events
    elsif ( $Event eq 'ActionExecute' ) {

        push @HistoryAddData, {
            ChangeID    => $Param{Data}->{ChangeID},
            HistoryType => $Event,
            ContentNew  => $Param{Data}->{ActionID} . '%%' . $Param{Data}->{ActionResult},
            UserID      => $Param{UserID},
        };
    }

    # error
    else {

        # an unknown event
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "$Event is an unknown event!",
        );

        return;
    }

    # if there is nothing to write to the history
    return 1 if !@HistoryAddData;

    # if there is just one history entry to write
    if ( scalar @HistoryAddData == 1 ) {

        # write the first and only entry of the array to the history
        $Kernel::OM->Get('Kernel::System::ITSMChange::History')->HistoryAdd(
            %{ $HistoryAddData[0] },
        );
    }

    # there is more than one entry to write
    # let the HistoryAddMultiple function handle that
    else {
        $Kernel::OM->Get('Kernel::System::ITSMChange::History')->HistoryAddMultiple(
            Data => \@HistoryAddData,
        );
    }

    return 1;
}

=begin Internal:

=item _HasFieldChanged()

This method checks whether a field was changed or not. It returns 1 when field
was changed, 0 otherwise

    my $FieldHasChanged = $HistoryObject->_HasFieldChanged(
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

1;

=end Internal:
