# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem::Permission;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::System::ITSMConfigItem::Permission - module for ITSMConfigItem.pm with Permission functions

=head1 SYNOPSIS

All Permission functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item Permission()

returns whether the user has permissions or not

    my $Access = $ConfigItemObject->Permission(
        Type     => 'ro',
        Scope    => 'Class', # Class || Item
        ClassID  => 123,     # if Scope is 'Class'
        ItemID   => 123,     # if Scope is 'Item'
        UserID   => 123,
    );

or without logging, for example for to check if a link/action should be shown

    my $Access = $ConfigItemObject->Permission(
        Type     => 'ro',
        Scope    => 'Class', # Class || Item
        ClassID  => 123,     # if Scope is 'Class'
        ItemID   => 123,     # if Scope is 'Item'
        LogNo    => 1,
        UserID   => 123,
    );

=cut

sub Permission {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Type Scope UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # check for existence of ItemID or ClassID dependent
    # on the Scope
    if (
        ( $Param{Scope} eq 'Class' && !$Param{ClassID} )
        || ( $Param{Scope} eq 'Item' && !$Param{ItemID} )
        )
    {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need ClassID if Scope is 'Class' or ItemID if Scope is 'Item'!",
        );
        return;
    }

    # run all ITSMConfigItem Permission modules
    if (
        ref $Kernel::OM->Get('Kernel::Config')->Get( 'ITSMConfigItem::Permission::' . $Param{Scope} ) eq 'HASH'
        )
    {
        my %Modules = %{
            $Kernel::OM->Get('Kernel::Config')->Get( 'ITSMConfigItem::Permission::' . $Param{Scope} )
        };
        MODULE:
        for my $Module ( sort keys %Modules ) {

            # load module
            next MODULE
                if !$Kernel::OM->Get('Kernel::System::Main')->Require( $Modules{$Module}->{Module} );

            # create object
            my $ModuleObject = $Modules{$Module}->{Module}->new();

            # execute Run()
            my $AccessOk = $ModuleObject->Run(%Param);

            # check granted option (should I say ok)
            if ( $AccessOk && $Modules{$Module}->{Granted} ) {

                # access ok
                return 1;
            }

            # return because access is false but it's required
            if ( !$AccessOk && $Modules{$Module}->{Required} ) {
                if ( !$Param{LogNo} ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'notice',
                        Message  => "Permission denied because module "
                            . "($Modules{$Module}->{Module}) is required "
                            . "(UserID: $Param{UserID} '$Param{Type}' "
                            . "on $Param{Scope}: " . $Param{ $Param{Scope} . 'ID' } . ")!",
                    );
                }

                # access not ok
                return;
            }
        }
    }

    # don't grant access
    if ( !$Param{LogNo} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'notice',
            Message  => "Permission denied (UserID: $Param{UserID} '$Param{Type}' "
                . "on $Param{Scope}: " . $Param{ $Param{Scope} . 'ID' } . ")!",
        );
    }

    return;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
