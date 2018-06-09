# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

# get selenium object
my $Selenium = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

$Selenium->RunTest(
    sub {

        # get helper object
        my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-configitem' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # create test param
        my @Test = (
            {
                ConfigItemClass => 'Computer',
                CheckEditFields => [
                    'Name', 'DeplStateID', 'InciStateID', 'Vendor', 'Model', 'Description', 'Type', 'Owner',
                    'SerialNumber',
                    'OperatingSystem', 'CPU', 'Ram', 'HardDisk', 'Capacity', 'FQDN', 'NIC', 'PoverDHCP',
                    'GraphicAdapter',
                    'OtherEquipment', 'WarrantyExpirationDate', 'InstallDate', 'Note', 'FileUpload', 'SubmitSave'
                ],
            },
            {
                ConfigItemClass => 'Hardware',
                CheckEditFields => [
                    'Name', 'DeplStateID', 'InciStateID', 'Vendor', 'Model', 'Description', 'Type', 'Owner',
                    'SerialNumber',
                    'WarrantyExpirationDate', 'InstallDate', 'Note', 'FileUpload', 'SubmitSave'
                ],
            },
            {
                ConfigItemClass => 'Location',
                CheckEditFields => [
                    'Name', 'DeplStateID', 'InciStateID', 'Type', 'Phone1', 'Phone2', 'Fax', 'E-Mail', 'Address',
                    'Note', 'FileUpload', 'SubmitSave'
                ],
            },
            {
                ConfigItemClass => 'Network',
                CheckEditFields => [
                    'Name', 'DeplStateID', 'InciStateID', 'Description', 'Type', 'NetworkAddress', 'SubnetMask',
                    'Gateway',
                    'Note', 'FileUpload', 'SubmitSave'
                ],
            },
            {
                ConfigItemClass => 'Software',
                CheckEditFields => [
                    'Name', 'DeplStateID', 'InciStateID', 'Vendor', 'Version', 'Description', 'Type', 'Owner',
                    'SerialNumber',
                    'LicenceType', 'LicenceKey', 'Media', 'Note', 'SubmitSave'
                ],
            },
        );

        # get general catalog object
        my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

        # get 'Production' deployment state ID
        my $DeplStateDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::DeploymentState',
            Name  => 'Production',
        );
        my $DeplStateID = $DeplStateDataRef->{ItemID};

        # test AgentITSMConfigItemEdit
        for my $ConfigItemEdit (@Test) {

            # navigate to AgentITSMConfigItemAdd screen
            $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMConfigItemAdd");

            # get ConfigItem class ID
            my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ConfigItem::Class',
                Name  => $ConfigItemEdit->{ConfigItemClass},
            );
            my $ConfigItemClassID = $ConfigItemDataRef->{ItemID};

            # click on ConfigItem class
            $Selenium->find_element(
                "//a[contains(\@href, \'Action=AgentITSMConfigItemEdit;ClassID=$ConfigItemClassID\' )]"
            )->VerifiedClick();

            # check for ConfigItemEdit fields
            for my $CheckConfigItemField ( @{ $ConfigItemEdit->{CheckEditFields} } ) {

                my $Element = $Selenium->find_element("//*[contains(\@name, \'$CheckConfigItemField\' )]");
                $Element->is_enabled();
                $Element->is_displayed();
            }

            # create test ConfigItem
            my $RandomLabel    = $Helper->GetRandomID();
            my $ConfigItemName = $ConfigItemEdit->{ConfigItemClass} . $Helper->GetRandomID();
            $Selenium->find_element( "#Name", 'css' )->send_keys($ConfigItemName);

            $Selenium->execute_script(
                "\$('#DeplStateID').val('$DeplStateID').trigger('redraw.InputField').trigger('change');"
            );
            $Selenium->execute_script("\$('#InciStateID').val('1').trigger('redraw.InputField').trigger('change');");

            if ( $ConfigItemEdit->{ConfigItemClass} eq 'Computer' ) {

                # get General Catalog ID for 'Yes'
                my $YesDataRef = $GeneralCatalogObject->ItemGet(
                    Class => 'ITSM::ConfigItem::YesNo',
                    Name  => 'Yes',
                );
                my $YesID = $YesDataRef->{ItemID};

                # enter NIC name
                $Selenium->find_element("//*[contains(\@name, \'NIC::1\' )]")->send_keys('SeleniumNetwork');

                # select Yes for DHCPOverIP
                $Selenium->execute_script(
                    "\$('#' + Core.App.EscapeSelector('Item1NIC::11')).val('$YesID').trigger('redraw.InputField').trigger('change');"
                );
            }
            if ( $ConfigItemEdit->{ConfigItemClass} eq 'Network' ) {
                $Selenium->find_element("//*[contains(\@name, \'NetworkAddress\' )]")->send_keys('SeleniumNetwork');
            }

            $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->VerifiedClick();

            # get ConfigItem value
            my @ConfigItemValues = (
                {
                    Value => $ConfigItemEdit->{ConfigItemClass},
                    Check => "p.Value:contains($ConfigItemEdit->{ConfigItemClass})",
                },
                {
                    Value => $ConfigItemName,
                    Check => "h1:contains($ConfigItemName)",
                },
            );

            # check submitted values in AgentITSMConfigItemZoom screen
            for my $CheckConfigItemValue (@ConfigItemValues) {
                $Self->True(
                    $Selenium->execute_script(
                        "return \$('$CheckConfigItemValue->{Check}').length"
                    ),
                    "Test ConfigItem value $CheckConfigItemValue->{Value} - found",
                );
            }

            # get ConfigItem object
            my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

            # get ConfigItemID
            my $ConfigItemID = $ConfigItemObject->VersionSearch(
                Name => $ConfigItemName
            );

            # delete created test ConfigItem
            my $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemID->[0],
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "ConfigItem is deleted - ID $ConfigItemID->[0]",
            );
        }
    }
);

1;
