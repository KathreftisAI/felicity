# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::Template::CAB;

use strict;
use warnings;

## nofilter(TidyAll::Plugin::OTRS::Perl::Dumper)
use Data::Dumper;

our @ObjectDependencies = (
    'Kernel::System::ITSMChange',
    'Kernel::System::Log',
    'Kernel::System::Main',
);

=head1 NAME

Kernel::System::ITSMChange::Template::CAB - all template functions for CAB

=head1 SYNOPSIS

All functions for CAB templates in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template::CAB');

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

Serialize the CAB of a change. This is done with Data::Dumper. It returns
a serialized string of the datastructure. The CAB actions
are "wrapped" within a hashreference...

    my $TemplateString = $TemplateObject->Serialize(
        ChangeID => 1,
        UserID   => 1,
        Return   => 'HASH', # (optional) HASH|STRING default 'STRING'
    );

returns

    '{CABAdd => { CABCustomers => [ 'mm@localhost' ], ... }}'

If parameter C<Return> is set to C<HASH>, the Perl datastructure
is returned

    {
        CABAdd   => { ... },
        Children => [ ... ],
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

    # get CAB of the change
    my $Change = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    return if !$Change;

    # templates have to be an array reference;
    my $OriginalData = {
        CABAdd => {
            CABCustomers => $Change->{CABCustomers},
            CABAgents    => $Change->{CABAgents},
        },
    };

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

Updates the CAB of a change based on the given CAB template. It
returns the change id the cab is for.

    my $ChangeID = $TemplateObject->DeSerialize(
        Data => {
            CABCustomers => [ 'mm@localhost' ],
            CABAgents    => [ 1, 2 ],
        },
        ChangeID => 1,
        UserID   => 1,
    );

=cut

sub DeSerialize {
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

    # get current CAB of change
    my $Change = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    # a CAB add is actually a CAB update on a change
    return if !$Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeCABUpdate(
        ChangeID     => $Param{ChangeID},
        CABCustomers => [ @{ $Param{Data}->{CABCustomers} }, @{ $Change->{CABCustomers} } ],
        CABAgents    => [ @{ $Param{Data}->{CABAgents} }, @{ $Change->{CABAgents} } ],
        UserID       => $Param{UserID},
    );

    my %Info = (
        ID       => $Param{ChangeID},
        ChangeID => $Param{ChangeID},
    );

    return %Info;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
