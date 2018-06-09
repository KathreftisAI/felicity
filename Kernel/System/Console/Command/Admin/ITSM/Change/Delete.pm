# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Admin::ITSM::Change::Delete;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::ITSMChange',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Delete changes  (all or by number).');
    $Self->AddOption(
        Name        => 'all',
        Description => "Delete all changes.",
        Required    => 0,
        HasValue    => 0,
    );
    $Self->AddArgument(
        Name        => 'accept',
        Description => "Accept delete all or cancel.",
        Required    => 0,
        ValueRegex  => qr/(y|n)/smx,
    );
    $Self->AddOption(
        Name        => 'change-number',
        Description => "Delete listed changes.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/\d+/smx,
        Multiple    => 1,
    );

    return;
}

sub PreRun {
    my ( $Self, %Param ) = @_;

    my @ChangeNumbers = @{ $Self->GetOption('change-number') // [] };

    if ( !$Self->GetOption('all') && !@ChangeNumbers ) {
        die "Please provide option --all or --change-number. For more details use --help\n";
    }

    return;

}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Deleting changes...</yellow>\n");

    $Self->Print( "<green>" . ( '=' x 69 ) . "</green>\n" );

    # get change object
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

    # get change numbers
    my @ChangeNumbers = @{ $Self->GetOption('change-number') // [] };

    # delete all changes
    if ( $Self->GetOption('all') ) {

        # get all change ids
        my @ChangesIDs = @{ $ChangeObject->ChangeList( UserID => 1 ) };

        # get number of changes
        my $ChangeCount = scalar @ChangesIDs;

        # if there are any changes to delete
        if ($ChangeCount) {

            $Self->Print("<yellow>Are you sure that you want to delete ALL $ChangeCount changes?</yellow>\n");
            $Self->Print("<yellow>This is irrevocable. [y/n] </yellow>\n");
            my $Confirmation = $Self->GetArgument('accept');
            chomp( $Confirmation = lc <STDIN> ) if !defined $Confirmation;

            # if the user confirms the deletion
            if ( $Confirmation eq 'y' ) {

                # delete changes
                $Self->Print("<yellow>Deleting all changes...</yellow>\n");
                $Self->DeleteChanges( ChangesIDs => \@ChangesIDs );
            }
            else {
                $Self->Print("<yellow>Command delete was canceled!</yellow>\n");
                return $Self->ExitCodeOk();
            }
        }
        else {
            $Self->Print("<yellow>There are NO changes to delete.</yellow>\n");
        }
    }

    # delete listed changes
    elsif (@ChangeNumbers) {

        my @ChangesIDs;

        for my $ChangeNumber (@ChangeNumbers) {

            # checks the validity of the change id
            my $ID = $ChangeObject->ChangeLookup(
                ChangeNumber => $ChangeNumber,
            );

            if ($ID) {
                push @ChangesIDs, $ID;
            }
            else {
                $Self->PrintError("Unable to find change $ChangeNumber.");
            }
        }

        # delete changes (if any valid number was given)
        if (@ChangesIDs) {
            $Self->Print("<yellow>Deleting specified changes...</yellow>\n");
            $Self->DeleteChanges( ChangesIDs => \@ChangesIDs );
        }
    }
    else {
        $Self->PrintError("No change for delete.");
    }

    $Self->Print( "<green>" . ( '=' x 69 ) . "</green>\n" );
    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

sub DeleteChanges {

    my ( $Self, %Param ) = @_;

    my $DeletedChanges = 0;

    # delete specified changes
    for my $ChangeID ( @{ $Param{ChangesIDs} } ) {
        my $True = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeDelete(
            ChangeID => $ChangeID,
            UserID   => 1,
        );
        if ( !$True ) {
            $Self->PrintError("Unable to delete change with id $ChangeID\n");
        }
        else {
            $DeletedChanges++;
        }
    }

    $Self->Print("<green>Deleted $DeletedChanges change(s).</green>\n\n");

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
