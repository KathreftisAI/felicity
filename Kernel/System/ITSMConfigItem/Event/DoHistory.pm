# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem::Event::DoHistory;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::ITSMConfigItem',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::ITSMConfigItem::Event::DoHistory - Event handler that does the history

=head1 SYNOPSIS

All event handler functions for history.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $DoHistoryObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem::Event::DoHistory');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item Run()

This method handles the event.

    $DoHistoryObject->Run(
        Event => 'ConfigItemCreate',
        Data  => {
            Comment      => 'new value: 1',
            ConfigItemID => 123,
        },
        UserID => 1,
    );

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    # as DefinitionCreate does not belong to an item, we don't create
    # a history entry
    if ( $Param{Event} && $Param{Event} eq 'DefinitionCreate' ) {
        return;
    }

    # check needed stuff
    for my $Needed (qw(Data Event UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # due to consistency with ticket history, we need HistoryType
    $Param{HistoryType} = $Param{Event};

    # dispatch table for all events
    my %Dispatcher = (
        ConfigItemCreate      => \&_HistoryAdd,
        ConfigItemDelete      => \&_ConfigItemDelete,
        LinkAdd               => \&_HistoryAdd,
        LinkDelete            => \&_HistoryAdd,
        NameUpdate            => \&_HistoryAdd,
        IncidentStateUpdate   => \&_HistoryAdd,
        DeploymentStateUpdate => \&_HistoryAdd,
        DefinitionUpdate      => \&_HistoryAdd,
        VersionCreate         => \&_HistoryAdd,
        ValueUpdate           => \&_HistoryAdd,
        DefinitionCreate      => \&_HistoryAdd,
        VersionDelete         => \&_HistoryAdd,
        AttachmentAddPost     => \&_HistoryAdd,
        AttachmentDeletePost  => \&_HistoryAdd,
    );

    # error handling
    if ( !exists $Dispatcher{ $Param{Event} } ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'non existant history type: ' . $Param{Event},
        );

        return;
    }

    # call callback
    my $Sub = $Dispatcher{ $Param{Event} };
    $Self->$Sub(
        %Param,
        %{ $Param{Data} },
    );

    return 1;
}

=item _ConfigItemDelete()

history's event handler for ConfigItemDelete

=cut

sub _ConfigItemDelete {
    my ( $Self, %Param ) = @_;

    # delete history
    $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->HistoryDelete(
        ConfigItemID => $Param{ConfigItemID},
    );

    return 1;
}

=item _HistoryAdd()

history's default event handler.

=cut

sub _HistoryAdd {
    my ( $Self, %Param ) = @_;

    # add history entry
    $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->HistoryAdd(
        %Param,
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
