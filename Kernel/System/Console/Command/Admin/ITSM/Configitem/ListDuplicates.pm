# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Admin::ITSM::Configitem::ListDuplicates;

use strict;
use warnings;
use Kernel::System::VariableCheck qw(IsArrayRefWithData);

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::ITSMConfigItem',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('List ConfigItems which have a non-unique name.');
    $Self->AddOption(
        Name        => 'class',
        Description => "Check only config items of this class.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'scope',
        Description => "Define the scope for the uniqueness check (global|class)",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/(global|class)/smx,
    );
    $Self->AddOption(
        Name        => 'all-states',
        Description => "Also check config items in non-productive states.",
        Required    => 0,
        HasValue    => 0,
    );

    return;
}

sub PreRun {
    my ( $Self, %Param ) = @_;

    # get class argument
    my $Class = $Self->GetOption('class') // '';

    if ($Class) {

        # get class list
        my $ClassList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
            Class => 'ITSM::ConfigItem::Class',
        );

        # invert the hash to have the classes' names as keys
        my %ClassName2ID = reverse %{$ClassList};

        # check, whether this class exists
        if ( $ClassName2ID{$Class} ) {
            my $ID = $ClassName2ID{$Class};

            # get ids of this class' config items
            $Self->{SearchCriteria}->{ClassIDs} = [$ID];
        }
        else {
            die "Class $Class does not exist...\n";
        }
    }

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Listing duplicates of config items...</yellow>\n\n");

    if ( !$Self->GetOption('all-states') ) {

        my $StateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
            Class       => 'ITSM::ConfigItem::DeploymentState',
            Preferences => {
                Functionality => [ 'preproductive', 'productive' ],
            },
        );

        my $DeploymentStateIDs = [ keys %{$StateList} ];

        $Self->{SearchCriteria}->{DeplStateIDs} = [ keys %{$StateList} ];

    }

    # get ITSMConfigitem object
    my $ITSMConfigitemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

    # get all config items ids
    my @ConfigItemIDs = @{ $ITSMConfigitemObject->ConfigItemSearch( %{ $Self->{SearchCriteria} } ) };

    # get number of config items
    my $CICount = scalar @ConfigItemIDs;

    # get class argument
    my $Class = $Self->GetOption('class') // '';

    # if there are any CI to check
    if ($CICount) {

        # if the scope was explicitely defined, set it, otherwise this script will fall back to the
        # value set in SysConfig
        my $Scope = $Self->GetOption('scope');
        if ($Scope) {
            $Kernel::OM->Get('Kernel::Config')->Set(
                Key   => 'UniqueCIName::UniquenessCheckScope',
                Value => $Scope,
            );
        }

        if ($Class) {
            $Self->Print("<yellow>Checking config items of class $Class...</yellow>\n");
        }
        else {
            $Self->Print("<yellow>Checking all config items...\n</yellow>\n");
        }

        $Self->Print( "<green>" . ( '=' x 69 ) . "</green>\n" );

        my $DuplicatesFound = 0;

        # check config items
        CONFIGITEMID:
        for my $ConfigItemID (@ConfigItemIDs) {

            # get the attributes of this config item
            my $ConfigItem = $ITSMConfigitemObject->ConfigItemGet(
                ConfigItemID => $ConfigItemID,
            );

            next CONFIGITEMID if !$ConfigItem->{LastVersionID};

            # get the latest version of this config item
            my $Version = $ITSMConfigitemObject->VersionGet(
                VersionID  => $ConfigItem->{LastVersionID},
                XMLDataGet => 1,
            );

            next CONFIGITEMID if !$Version;

            if ( !$Version->{Name} ) {
                $Self->Print("<red>Skipping ConfigItem $ConfigItemID as it doesn't have a name.\n</red>\n");
                next CONFIGITEMID;
            }

            my $Duplicates = $ITSMConfigitemObject->UniqueNameCheck(
                ConfigItemID => $ConfigItemID,
                ClassID      => $ConfigItem->{ClassID},
                Name         => $Version->{Name}
            );

            if ( IsArrayRefWithData($Duplicates) ) {

                $DuplicatesFound = 1;

                my @DuplicateData;

                for my $DuplicateID ( @{$Duplicates} ) {

                    # get the # of the duplicate
                    my $DuplicateConfigItem = $ITSMConfigitemObject->ConfigItemGet(
                        ConfigItemID => $DuplicateID,
                    );

                    my $DuplicateVersion = $ITSMConfigitemObject->VersionGet(
                        VersionID => $DuplicateConfigItem->{LastVersionID},
                    );

                    push @DuplicateData, $DuplicateVersion;
                }

                $Self->Print(
                    "<yellow>ConfigItem $Version->{Number} (Name: $Version->{Name}, ConfigItemID: "
                        . "$Version->{ConfigItemID}) has the following duplicates:</yellow>\n"
                );

                # list all the details of the duplicates
                for my $DuplicateVersion (@DuplicateData) {
                    print "\n";
                    $Self->Print(
                        "<green>\t * $DuplicateVersion->{Number} (ConfigItemID: "
                            . "$DuplicateVersion->{ConfigItemID})</green>\n"
                    );
                }

                $Self->Print( "<green>" . ( '-' x 69 ) . "</green>\n" );
            }
        }

        if ($DuplicatesFound) {
            $Self->Print("<green>Finished checking for duplicate names.\n</green>\n");
        }
        else {
            $Self->Print("<yellow>No duplicate names found.\n</yellow>\n");
        }
    }
    else {
        $Self->Print("<yellow>There are NO config items to check.\n</yellow>\n");
    }

    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();

}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
