# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::Template::ITSMCondition;

use strict;
use warnings;

## nofilter(TidyAll::Plugin::OTRS::Perl::Dumper)
use Data::Dumper;

our @ObjectDependencies = (
    'Kernel::System::ITSMChange::ITSMCondition',
    'Kernel::System::Log',
    'Kernel::System::Main',
);

=head1 NAME

Kernel::System::ITSMChange::Template::ITSMCondition - all template functions for conditions

=head1 SYNOPSIS

All functions for condition templates in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template::ITSMCondition');

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

Serialize a condition. This is done with Data::Dumper. It returns
a serialized string of the datastructure. The condition actions
are "wrapped" within a hashreference...

    my $TemplateString = $TemplateObject->Serialize(
        ConditionID => 1,
        UserID      => 1,
        Return      => 'HASH', # (optional) HASH|STRING default 'STRING'
    );

returns

    '{ConditionAdd => { ... }}'

If parameter C<Return> is set to C<HASH>, the Perl datastructure
is returned

    {
        ConditionAdd => { ... },
        Children     => [ ... ],
    }

=cut

sub Serialize {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID ConditionID)) {
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

    # get condition
    my $Condition = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ConditionGet(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    return if !$Condition;

    # templates have to be an array reference;
    my $OriginalData = { ConditionAdd => $Condition };

    # get expressions
    my $Expressions = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ExpressionList(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    ) || [];

    # add each expression to condition data
    for my $ExpressionID ( @{$Expressions} ) {
        my $Expression = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ExpressionGet(
            ExpressionID => $ExpressionID,
            UserID       => $Param{UserID},
        );

        push @{ $OriginalData->{Children} }, { ExpressionAdd => $Expression };
    }

    # get actions
    my $Actions = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ActionList(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    ) || [];

    # add each action to condition data
    for my $ActionID ( @{$Actions} ) {
        my $Action = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ActionGet(
            ActionID => $ActionID,
            UserID   => $Param{UserID},
        );

        push @{ $OriginalData->{Children} }, { ActionAdd => $Action };
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
            # ... Params for ConditionAdd
        },
        ChangeID => 1,
        UserID   => 1,
        Method   => 'ConditionAdd',
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
        ConditionAdd  => '_ConditionAdd',
        ExpressionAdd => '_ExpressionAdd',
        ActionAdd     => '_ActionAdd',
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

=item _ConditionAdd()

Creates new conditions for a change based on the given template. It
returns a hash of information (change id it was created for, id is
the condition id)

    my %Info = $TemplateObject->_ConditionAdd(
        Data => {
            # ... Params for ConditionAdd
        },
        ChangeID => 1,
        UserID   => 1,
    );

=cut

sub _ConditionAdd {
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

    my %Data = %{ $Param{Data} };

    # delete attributes
    delete $Data{ConditionID};

    # add condition
    my $ConditionID = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ConditionAdd(
        %Data,
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    my %Info = (
        ID          => $ConditionID,
        ChangeID    => $Param{ChangeID},
        ConditionID => $ConditionID,
    );

    return %Info;
}

=item _ExpressionAdd()

Creates new expressions for a condition based on the given template. It
returns a hash of information (change id it was created for, id is
the expression id)

    my %Info = $TemplateObject->_ExpressionAdd(
        Data => {
            # ... Params for ExpressionAdd
        },
        ChangeID => 1,
        UserID   => 1,
    );

=cut

sub _ExpressionAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID ChangeID Data ConditionID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my %Data = %{ $Param{Data} };

    # delete attributes that are not needed
    delete $Data{ExpressionID};

    # replace old ids with new ids
    $Data{ConditionID} = $Param{ConditionID};

    # replace old id only if it is an ID
    if ( $Data{Selector} =~ m{ \A \d+ \z }xms ) {
        my $Object = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ObjectGet(
            ObjectID => $Data{ObjectID},
            UserID   => $Param{UserID},
        );

        if ( $Object->{Name} eq 'ITSMChange' ) {
            $Data{Selector} = $Param{ChangeID};
        }
        elsif ( $Object->{Name} eq 'ITSMWorkOrder' ) {
            $Data{Selector} = $Param{OldWorkOrderIDs}->{ $Data{Selector} };
        }
    }

    # add expression
    my $ExpressionID = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ExpressionAdd(
        %Data,
        UserID => $Param{UserID},
    );

    my %Info = (
        ID           => $ExpressionID,
        ChangeID     => $Param{ChangeID},
        ExpressionID => $ExpressionID,
    );

    return %Info;
}

=item _ActionAdd()

Creates new actions for a condition based on the given template. It
returns a hash of information (change id it was created for, id is
the action id)

    my %Info = $TemplateObject->_ActionAdd(
        Data => {
            # ... Params for ActionAdd
        },
        ChangeID => 1,
        UserID   => 1,
    );

=cut

sub _ActionAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID ChangeID Data ConditionID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    my %Data = %{ $Param{Data} };

    # delete attributes that are not needed
    delete $Data{ActionID};

    # replace old ids with new ids
    $Data{ConditionID} = $Param{ConditionID};

    # replace old id only if it is an ID
    if ( $Data{Selector} =~ m{ \A \d+ \z }xms ) {
        my $Object = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ObjectGet(
            ObjectID => $Data{ObjectID},
            UserID   => $Param{UserID},
        );

        if ( $Object->{Name} eq 'ITSMChange' ) {
            $Data{Selector} = $Param{ChangeID};
        }
        elsif ( $Object->{Name} eq 'ITSMWorkOrder' ) {
            $Data{Selector} = $Param{OldWorkOrderIDs}->{ $Data{Selector} };
        }
    }

    # add action
    my $ActionID = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ActionAdd(
        %Data,
        UserID => $Param{UserID},
    );

    my %Info = (
        ID       => $ActionID,
        ChangeID => $Param{ChangeID},
        ActionID => $ActionID,
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
