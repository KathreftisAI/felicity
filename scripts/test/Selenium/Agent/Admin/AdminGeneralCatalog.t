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

        # create and log in test user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => ['admin'],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AdminGeneralCatalog screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminGeneralCatalog");

        # click "Add Catalog Class"
        $Selenium->find_element("//button[\@value='Add'][\@type='submit']")->VerifiedClick();

        # check for input fields
        for my $ID (
            qw(ClassDsc Name ValidID Comment)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # check client side validation
        $Selenium->find_element( "#Name", 'css' )->clear();
        $Selenium->find_element( "#Name", 'css' )->VerifiedSubmit();
        $Self->Is(
            $Selenium->execute_script(
                "return \$('#Name').hasClass('Error')"
            ),
            '1',
            'Client side validation correctly detected missing input value',
        );

        # create real test catalog class
        my $CatalogClassDsc  = "CatalogClassDsc" . $Helper->GetRandomID();
        my $CatalogClassName = "CatalogClassName" . $Helper->GetRandomID();
        $Selenium->find_element( "#ClassDsc", 'css' )->send_keys($CatalogClassDsc);
        $Selenium->find_element( "#Name",     'css' )->send_keys($CatalogClassName);
        $Selenium->find_element( "#Comment",  'css' )->send_keys("Selenium catalog class");
        $Selenium->execute_script("\$('#ValidID').val('1').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->VerifiedClick();

        # click "Go to overview"
        $Selenium->find_element("//a[contains(\@href, \'Action=AdminGeneralCatalog' )]")->VerifiedClick();

        # check for created test catalog class in AdminGeneralCatalog screen and click on it
        $Self->True(
            index( $Selenium->get_page_source(), $CatalogClassDsc ) > -1,
            "Created test catalog class $CatalogClassDsc - found",
        );
        $Selenium->find_element(
            "//a[contains(\@href, \'Action=AdminGeneralCatalog;Subaction=ItemList;Class=$CatalogClassDsc' )]"
        )->VerifiedClick();

        # click "Add Catalog Item"
        $Selenium->find_element("//button[\@value='Add'][\@type='submit']")->VerifiedClick();

        # check client side validation
        $Selenium->find_element( "#Name", 'css' )->clear();
        $Selenium->find_element( "#Name", 'css' )->VerifiedSubmit();
        $Self->Is(
            $Selenium->execute_script(
                "return \$('#Name').hasClass('Error')"
            ),
            '1',
            'Client side validation correctly detected missing input value',
        );

        # try to create catalog item that already exists
        $Selenium->find_element( "#Name", 'css' )->send_keys($CatalogClassName);
        $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->VerifiedClick();

        # verify error message
        $Self->True(
            index( $Selenium->get_page_source(), 'Need ItemID OR Class and Name!' ) > -1,
            "Error message - displayed",
        );

        # return back to test catalog class screen and click on "Add Catalog Item"
        $Selenium->VerifiedGet(
            "${ScriptAlias}index.pl?Action=AdminGeneralCatalog;Subaction=ItemList;Class=$CatalogClassDsc"
        );
        $Selenium->find_element("//button[\@value='Add'][\@type='submit']")->VerifiedClick();

        # create real test catalog item
        my $CatalogClassItem = "CatalogClassItem" . $Helper->GetRandomID();
        $Selenium->find_element( "#Name",    'css' )->send_keys($CatalogClassItem);
        $Selenium->find_element( "#Comment", 'css' )->send_keys("Selenium catalog item");
        $Selenium->execute_script("\$('#ValidID').val('1').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->VerifiedClick();

        # get test catalog items IDs
        my @CatalogItemIDs;
        for my $CatalogItems ( $CatalogClassName, $CatalogClassItem ) {
            my $CatalogClassItemData = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
                Class => $CatalogClassDsc,
                Name  => $CatalogItems,
            );
            my $CatalogItemID = $CatalogClassItemData->{ItemID};
            push @CatalogItemIDs, $CatalogItemID;
        }

        # check for created test catalog item and click on it
        $Self->True(
            index( $Selenium->get_page_source(), $CatalogClassItem ) > -1,
            "Created test catalog item $CatalogClassItem - found",
        );
        $Selenium->find_element(
            "//a[contains(\@href, \'Action=AdminGeneralCatalog;Subaction=ItemEdit;ItemID=$CatalogItemIDs[1]' )]"
        )->VerifiedClick();

        # check new test catalog item values
        $Self->Is(
            $Selenium->find_element( '#Name', 'css' )->get_value(),
            $CatalogClassItem,
            "#Name stored value",
        );
        $Self->Is(
            $Selenium->find_element( '#Comment', 'css' )->get_value(),
            "Selenium catalog item",
            "#Comment stored value",
        );

        # edit name and comment
        my $EditCatalogClassItem = "Edit" . $CatalogClassItem;
        $Selenium->find_element( "#Name",    'css' )->clear();
        $Selenium->find_element( "#Name",    'css' )->send_keys($EditCatalogClassItem);
        $Selenium->find_element( "#Comment", 'css' )->send_keys(" edit");
        $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->VerifiedClick();

        # check edited test catalog item values
        $Selenium->find_element( $EditCatalogClassItem, 'link_text' )->VerifiedClick();
        $Self->Is(
            $Selenium->find_element( '#Name', 'css' )->get_value(),
            $EditCatalogClassItem,
            "#Name updated value",
        );
        $Self->Is(
            $Selenium->find_element( '#Comment', 'css' )->get_value(),
            "Selenium catalog item edit",
            "#Comment updated value",
        );

        # get DB object
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        # delete created test catalog class
        for my $CatalogItem (@CatalogItemIDs) {

            my $Success = $DBObject->Do(
                SQL => "DELETE FROM general_catalog_preferences WHERE general_catalog_id = $CatalogItem",
            );
            $Self->True(
                $Success,
                "CatalogItemID $CatalogItem preference - deleted",
            );

            $Success = $DBObject->Do(
                SQL => "DELETE FROM general_catalog WHERE id = $CatalogItem",
            );
            $Self->True(
                $Success,
                "CatalogItemID $CatalogItem - deleted",
            );
        }

        # clean up cache
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'GeneralCatalog' );
    }
);

1;
