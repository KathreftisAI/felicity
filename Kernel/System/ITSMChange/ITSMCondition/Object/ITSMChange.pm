# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMCondition::Object::ITSMChange;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::ITSMChange',
    'Kernel::System::Log',
    'Kernel::System::User',
);

=head1 NAME

Kernel::System::ITSMChange::ITSMCondition::Object::ITSMChange - condition itsm change object lib

=head1 SYNOPSIS

All ITSMChange object functions for conditions in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $ConditionObjectITSMChange = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition::Object::ITSMChange');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item DataGet()

Returns change data in an array reference.

    my $ChangeDataRef = $ConditionObjectITSMChange->DataGet(
        Selector => 1234,
        UserID   => 2345,
    );

=cut

sub DataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Selector UserID)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # remap params
    my %ChangeGet = (
        ChangeID => $Param{Selector},
        UserID   => $Param{UserID},
    );

    # get change data as anon hash ref
    my $Change = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(%ChangeGet);

    # check for change
    return if !$Change;

    # build array ref
    my $ChangeData = [$Change];

    return $ChangeData;
}

=item CompareValueList()

Returns a list of available CompareValues for the given attribute id of a change object as hash reference.

    my $CompareValueList = $ConditionObjectITSMChange->CompareValueList(
        AttributeName => 'PriorityID',
        UserID        => 1,
    );

Returns a hash reference like this, for the change attribute 'Priority':

    $CompareValueList = {
        23    => '1 very low',
        24    => '2 low',
        25    => '3 normal',
        26    => '4 high',
        27    => '5 very high',
    }

=cut

sub CompareValueList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(AttributeName UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # to store the list
    my $CompareValueList = {};

    # CategoryID, ImpactID, PriorityID
    if ( $Param{AttributeName} =~ m{ \A ( Category | Impact | Priority ) ID \z }xms ) {

        # remove 'ID' at the end of attribute
        my $Type = $1;

        # get the category or impact or priority list
        $CompareValueList = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangePossibleCIPGet(
            Type   => $Type,
            UserID => $Param{UserID},
        );
    }

    # ChangeStateID
    elsif ( $Param{AttributeName} eq 'ChangeStateID' ) {

        # get change state list
        $CompareValueList = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangePossibleStatesGet(
            UserID => $Param{UserID},
        );
    }
    elsif (
        $Param{AttributeName} eq 'ChangeBuilderID'
        || $Param{AttributeName} eq 'ChangeManagerID'
        )
    {

        # get a complete list of users
        my %Users = $Kernel::OM->Get('Kernel::System::User')->UserList(
            Type  => 'Long',
            Valid => 1,
        );

        $CompareValueList = \%Users;
    }

    return $CompareValueList;
}

=item SelectorList()

Returns a list of all selectors available for the given change object id and condition id as hash reference

    my $SelectorList = $ConditionObjectITSMChange->SelectorList(
        ObjectID    => 1234,
        ConditionID => 5,
        UserID      => 1,
    );

Returns a hash reference like this:

    $SelectorList = {
        456 => 'Change# 2010011610000618',
    }

=cut

sub SelectorList {
    my ( $Self, %Param ) = @_;

    # get change data
    my $ChangeData = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    # check error
    return if !$ChangeData;

    # build selector list
    my %SelectorList = (
        $ChangeData->{ChangeID} => $ChangeData->{ChangeNumber},
    );

    return \%SelectorList;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
