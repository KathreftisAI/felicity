# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Admin::ITSM::Configitem::Delete;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::GeneralCatalog',
    'Kernel::System::ITSMConfigItem',
    'Kernel::System::Time',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Delete config items (all, by class (and deployment state) or by number).');
    $Self->AddOption(
        Name        => 'all',
        Description => "Delete all config items",
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
        Name        => 'class',
        Description => "Delete all config items of this class.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'deployment-state',
        Description => "Delete all config items with this deployment state (ONLY TOGETHER with the --class parameter)",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'configitem-number',
        Description => "Delete listed config items",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/\d+/smx,
        Multiple    => 1,
    );
    $Self->AddOption(
        Name        => 'all-old-versions',
        Description => "Delete all config item versions except the newest version",
        Required    => 0,
        HasValue    => 0,
    );
    $Self->AddOption(
        Name        => 'all-but-keep-last-versions',
        Description => "Delete all config item versions but keep the last XX versions",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/\d+/smx,
    );
    $Self->AddOption(
        Name        => 'all-older-than-days-versions',
        Description => "Delete all config item versions older than XX days",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/\d+/smx,
    );

    return;
}

sub PreRun {
    my ( $Self, %Param ) = @_;

    my $All               = $Self->GetOption('all');
    my $Class             = $Self->GetOption('class') // '';
    my @ConfigItemNumbers = @{ $Self->GetOption('configitem-number') // [] };
    my $DeploymentState   = $Self->GetOption('deployment-state') // '';
    my $AllOldVersions    = $Self->GetOption('all-old-versions') // '';
    my $AllButKeepLast    = $Self->GetOption('all-but-keep-last-versions') // '';
    my $AllOlderThanDays  = $Self->GetOption('all-older-than-days-versions') // '';

    if (
        !$All
        && !$Class
        && !@ConfigItemNumbers
        && !$DeploymentState
        && !$AllOldVersions
        && !$AllButKeepLast
        && !$AllOlderThanDays
        )
    {
        die
            "Please provide option --all, --class, --configitem-number, --all-old-versions, --all-but-keep-last-versions or --all-older-than-days-versions."
            . " For more details use --help\n";
    }

    if ( $DeploymentState && !$Class ) {
        die
            "Deleting all config items with this deployment state is posible ONLY TOGETHER with the --class parameter. \nFor more details use --help\n";
    }

    return;

}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Deleting config items...</yellow>\n\n");

    my $All               = $Self->GetOption('all');
    my $Class             = $Self->GetOption('class') // '';
    my @ConfigItemNumbers = @{ $Self->GetOption('configitem-number') // [] };
    my $DeploymentState   = $Self->GetOption('deployment-state') // '';
    my $AllOldVersions    = $Self->GetOption('all-old-versions') // '';
    my $AllButKeepLast    = $Self->GetOption('all-but-keep-last-versions') // '';
    my $AllOlderThanDays  = $Self->GetOption('all-older-than-days-versions') // '';

    # delete all config items
    if ($All) {

        # get all config items ids
        my @ConfigItemIDs = @{ $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->ConfigItemSearch() };

        # get number of config items
        my $CICount = scalar @ConfigItemIDs;

        # if there are any CI to delete
        if ($CICount) {

            $Self->Print("<yellow>Are you sure that you want to delete ALL $CICount config items?</yellow>\n");
            $Self->Print("<yellow>This is irrevocable. [y/n] </yellow>\n");
            my $Confirmation = $Self->GetArgument('accept');
            chomp( $Confirmation = lc <STDIN> ) if !defined $Confirmation;

            # if the user confirms the deletion
            if ( $Confirmation eq 'y' ) {

                # delete config items
                $Self->Print("<green>Deleting all config items...</green>\n");
                $Self->DeleteConfigItems( ConfigItemIDs => \@ConfigItemIDs );
            }
            else {
                $Self->Print("<yellow>Command delete was canceled</yellow>\n");
                return $Self->ExitCodeOk();
            }
        }
        else {
            $Self->Print("<yellow>There are NO config items to delete.</yellow>\n");
        }
    }

    # delete listed config items
    elsif ( IsArrayRefWithData( \@ConfigItemNumbers ) ) {

        my @ConfigItemIDs;

        for my $ConfigItemNumber (@ConfigItemNumbers) {

            # checks the validity of the config item id
            my $ID = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->ConfigItemLookup(
                ConfigItemNumber => $ConfigItemNumber,
            );

            if ($ID) {
                push @ConfigItemIDs, $ID;
            }
            else {
                $Self->Print("<yellow>Unable to find config item $ConfigItemNumber.</yellow>\n");
            }
        }

        # delete config items (if any valid number was given)
        if (@ConfigItemIDs) {
            $Self->Print("<yellow>Deleting specified config items...</yellow>\n");
            $Self->DeleteConfigItems( ConfigItemIDs => \@ConfigItemIDs );
        }
    }

    # delete config items that belong to the class
    elsif ($Class) {

        my @ConfigItemIDs;

        # get class list
        my $ClassList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
            Class => 'ITSM::ConfigItem::Class',
            Valid => 0,
        );

        # invert the hash to have the classes names as keys
        my %ClassName2ID = reverse %{$ClassList};

        if ( $ClassName2ID{$Class} ) {
            my $ID = $ClassName2ID{$Class};

            # define the search param for the class search
            my %SearchParam = (
                ClassIDs => [$ID],
            );

            # also a deployment state is given
            if ($DeploymentState) {

                # get deployment state list
                my $DeploymentStateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
                    Class => 'ITSM::ConfigItem::DeploymentState',
                );

                # invert the hash to have the deployment state names as keys
                my %DeploymentState2ID = reverse %{$DeploymentStateList};

                # if the deployment state is valid
                if ( $DeploymentState2ID{$DeploymentState} ) {

                    # get the deployment state id
                    my $ID = $DeploymentState2ID{$DeploymentState};

                    # add search parameter
                    $SearchParam{DeplStateIDs} = [$ID];
                }
                else {
                    $Self->PrintError("Unable to find deployment state $DeploymentState.");
                    return $Self->ExitCodeError();
                }
            }

            # get ids of this class (and maybe deployment state) config items
            @ConfigItemIDs = @{
                $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->ConfigItemSearch(%SearchParam)
            };
        }
        else {
            $Self->PrintError("Unable to find class name $Class.");
            return $Self->ExitCodeError();
        }

        # delete config items (if any valid number was given)
        if (@ConfigItemIDs) {
            $Self->Print("<yellow>Deleting config items that belong to the class $Class...</yellow>\n");
            $Self->DeleteConfigItems( ConfigItemIDs => \@ConfigItemIDs );
        }
        else {
            $Self->Print("<yellow>There are no config items that belong to the class $Class...</yellow>\n");
        }
    }

    # delete versions older than xx days from all config items
    elsif ($AllOlderThanDays) {

        my $SystemTime = $Kernel::OM->Get('Kernel::System::Time')->SystemTime();
        my $OlderDate = $SystemTime - ( 60 * 60 * 24 * $AllOlderThanDays );
        $OlderDate = $Kernel::OM->Get('Kernel::System::Time')->SystemTime2TimeStamp(
            SystemTime => $OlderDate,
        );

        my $VersionsOlderDate = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionListAll(
            OlderDate => $OlderDate,
        );

        # We need to get all versions to make sure that at least one version remains
        # -> if one version of a configitem is younger than the amount of days,
        #    we can delete all Versions received by the "OlderDate" query
        # -> if no version is younger than the amount of days
        #    we have to keep one version of the "OlderDate" query result
        my $VersionsAll = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionListAll();

        my @VersionsToDelete;

        CONFIGITEMID:
        for my $ConfigItemID ( sort keys %{$VersionsOlderDate} ) {

            # number of found older versions of this CI
            my $NumberOfOlderVersions = scalar keys %{ $VersionsOlderDate->{$ConfigItemID} };

            # number of all versions of this CI
            my $NumberOfAllVersions = scalar keys %{ $VersionsAll->{$ConfigItemID} };

            # next if there are no older versions
            next CONFIGITEMID if !$NumberOfOlderVersions;

            # next if there is only one or zero of all versions
            next CONFIGITEMID if $NumberOfAllVersions <= 1;

            # if the amount of Versions we have to delete
            # is exactly the same as the amount of AllVersions
            # we have to keep the last one
            # in order to keep the system working
            #
            # -> so let's start counting at "1" instead of "0"
            # in order to stop deleting before we reach the newest version
            my $Count = 0;
            if ( $NumberOfOlderVersions == $NumberOfAllVersions ) {
                $Count = 1;
            }

            # make sure that the versions are numerically sorted
            for my $Version ( sort { $a <=> $b } keys %{ $VersionsOlderDate->{$ConfigItemID} } ) {

                if ( $Count < $NumberOfOlderVersions ) {
                    push @VersionsToDelete, $Version;
                }
                $Count++;
            }
        }

        $Self->DeleteConfigItemVersions(
            VersionIDs => \@VersionsToDelete,
            UserID     => 1,
        );
    }

    # delete all config item versions except the newest version
    elsif ($AllOldVersions) {

        my $VersionsAll = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionListAll();

        my @VersionsToDelete;
        if ( IsHashRefWithData($VersionsAll) ) {

            CONFIGITEMID:
            for my $ConfigItemID ( sort keys %{$VersionsAll} ) {

                next CONFIGITEMID if !IsHashRefWithData( $VersionsAll->{$ConfigItemID} );

                # make sure that the versions are numerically sorted
                my @ReducedVersions = sort { $a <=> $b } keys %{ $VersionsAll->{$ConfigItemID} };

                # remove the last (newest) version
                pop @ReducedVersions;

                push @VersionsToDelete, @ReducedVersions;
            }
        }

        $Self->DeleteConfigItemVersions(
            VersionIDs => \@VersionsToDelete,
            UserID     => 1,
        );
    }

    # delete all config item versions but keep the last XX versions
    elsif ($AllButKeepLast) {

        my $VersionsAll = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionListAll();

        my @VersionsToDelete;

        if ( IsHashRefWithData($VersionsAll) ) {

            CONFIGITEMID:
            for my $ConfigItemID ( sort keys %{$VersionsAll} ) {

                next CONFIGITEMID if !IsHashRefWithData( $VersionsAll->{$ConfigItemID} );

                # make sure that the versions are numerically reverse sorted
                my @ReducedVersions = reverse sort { $a <=> $b } keys %{ $VersionsAll->{$ConfigItemID} };

                my $Count = 0;
                @ReducedVersions = grep { $Count++; $Count > $AllButKeepLast } @ReducedVersions;
                push @VersionsToDelete, @ReducedVersions;
            }
        }

        $Self->DeleteConfigItemVersions(
            VersionIDs => \@VersionsToDelete,
            UserID     => 1,
        );
    }
    else {
        $Self->PrintError("No config item for delete.");
    }

    # show successfull output
    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

sub DeleteConfigItems {

    my ( $Self, %Param ) = @_;

    my $DeletedCI;
    my @ConfigItemNumbers = @{ $Self->GetOption('configitem-number') // [] };

    # delete specified config items
    for my $ConfigItemID ( @{ $Param{ConfigItemIDs} } ) {
        my $True = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->ConfigItemDelete(
            ConfigItemID => $ConfigItemID,
            UserID       => 1,
        );
        if ( !$True ) {
            $Self->PrintError("Unable to delete config item with id $ConfigItemID.");
        }
        else {
            $DeletedCI++;
        }
    }

    $Self->Print("<green>Deleted $DeletedCI config item(s).</green>\n\n");

    return 1;
}

sub DeleteConfigItemVersions {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !IsArrayRefWithData( $Param{VersionIDs} );

    $Self->Print("<green>Deleting config item versions.</green>\n\n");

    $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionDelete(
        VersionIDs => $Param{VersionIDs},
        UserID     => 1,
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
