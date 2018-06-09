# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# $origin: otrs - 0dfa6e24adb335c39e33bed360506aae86683276 - scripts/test/Selenium/Agent/AgentTicketEmail.t
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

        # disable check email addresses
        $Helper->ConfigSettingChange(
            Key   => 'CheckEmailAddresses',
            Value => 0,
        );

        # do not check RichText
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'Frontend::RichText',
            Value => 0,
        );

        # do not check service and type
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'Ticket::Service',
# ---
# ITSMIncidentProblemManagement
# ---
#            Value => 0,
            Value => 1,
# ---
        );
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'Ticket::Type',
# ---
# ITSMIncidentProblemManagement
# ---
#            Value => 0,
            Value => 1,
# ---
        );

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
# ---
# ITSMIncidentProblemManagement
# ---
#            Groups => [ 'admin', 'users' ],
            Groups => [ 'admin', 'users', 'itsm-service' ],
# ---
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentTicketEmail screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketEmail");

        # check page
        for my $ID (
            qw(Dest ToCustomer CcCustomer BccCustomer CustomerID RichText
            Signature FileUpload NextStateID PriorityID submitRichText)
# ---
# ITSMIncidentProblemManagement
# ---
            , qw(TypeID ServiceID OptionLinkTicket DynamicField_ITSMImpact)
# ---
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # check client side validation
        my $Element = $Selenium->find_element( "#Subject", 'css' );
        $Element->send_keys("");
        $Element->VerifiedSubmit();

        $Self->Is(
            $Selenium->execute_script(
                "return \$('#Subject').hasClass('Error')"
            ),
            '1',
            'Client side validation correctly detected missing input value',
        );

        # navigate to AgentTicketEmail screen again
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketEmail");

        # get test user ID
        my $TestUserID = $Kernel::OM->Get('Kernel::System::User')->UserLookup(
            UserLogin => $TestUserLogin,
        );

        # add test customer for testing
        my $TestCustomer       = 'Customer' . $Helper->GetRandomID();
        my $TestCustomerUserID = $Kernel::OM->Get('Kernel::System::CustomerUser')->CustomerUserAdd(
            Source         => 'CustomerUser',
            UserFirstname  => $TestCustomer,
            UserLastname   => $TestCustomer,
            UserCustomerID => $TestCustomer,
            UserLogin      => $TestCustomer,
            UserEmail      => "$TestCustomer\@localhost.com",
            ValidID        => 1,
            UserID         => $TestUserID,
        );
        $Self->True(
            $TestCustomerUserID,
            "CustomerUserAdd - $TestCustomerUserID"
        );
# ---
# ITSMIncidentProblemManagement
# ---
        # get service object
        my $ServiceObject = $Kernel::OM->Get('Kernel::System::Service');

        # create test service
        my $ServiceName = "Selenium" . $Helper->GetRandomID();
        my $ServiceID   = $ServiceObject->ServiceAdd(
            Name        => $ServiceName,
            ValidID     => 1,
            Comment     => 'Selenium Test Service',
            TypeID      => 2,
            Criticality => '5 very high',
            UserID      => $TestUserID,
        );
        $Self->True(
            $ServiceID,
            "Service is created - ID $ServiceID",
        );

        # link test service with test customer
        $ServiceObject->CustomerUserServiceMemberAdd(
            CustomerUserLogin => $TestCustomer,
            ServiceID         => $ServiceID,
            Active            => 1,
            UserID            => $TestUserID,
        );
# ---

        # create test email ticket
        my $AutoCompleteString = "\"$TestCustomer $TestCustomer\" <$TestCustomer\@localhost.com> ($TestCustomer)";
        my $TicketSubject      = "Selenium Ticket";
        my $TicketBody         = "Selenium body test";
# ---
# ITSMIncidentProblemManagement
# ---
        $Selenium->execute_script(
            "\$('#TypeID').val(\$('#TypeID option').filter(function () { return \$(this).html() == 'Unclassified'; } ).val() ).trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && !$(".AJAXLoader:visible").length' );
# ---
        $Selenium->execute_script(
            "\$('#Dest').val(\$('#Dest option').filter(function () { return \$(this).html() == 'Raw'; } ).val() ).trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && !$(".AJAXLoader:visible").length' );

        $Selenium->find_element( "#ToCustomer", 'css' )->send_keys($TestCustomer);

        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("li.ui-menu-item:visible").length' );

        $Selenium->find_element("//*[text()='$AutoCompleteString']")->VerifiedClick();
# ---
# ITSMIncidentProblemManagement
# ---

        $Selenium->WaitFor( JavaScript => "return \$('#ServiceID option[value=\"$ServiceID\"]').length;" );
        $Selenium->execute_script("\$('#ServiceID').val('$ServiceID').trigger('redraw.InputField').trigger('change');");
        $Selenium->WaitFor( JavaScript => 'return $("#ServiceIncidentState").length' );

        # check for service incident state field
        my $ServiceIncidentStateElement = $Selenium->find_element( "#ServiceIncidentState", 'css' );
        $ServiceIncidentStateElement->is_enabled();
        $ServiceIncidentStateElement->is_displayed();

        $Selenium->WaitFor( JavaScript => "return \$('#DynamicField_ITSMImpact option[value=\"3 normal\"]').length;" );
        $Selenium->WaitFor( JavaScript => "return \$('#PriorityID option[value=\"4\"]').length;" );

        # test priority update based on impact value
        $Self->Is(
            $Selenium->find_element( '#PriorityID', 'css' )->get_value(),
            '4',
            "#PriorityID stored value",
        );

        $Selenium->execute_script(
            "\$('#DynamicField_ITSMImpact').val('1 very low').trigger('redraw.InputField').trigger('change');");

        # wait for ajax loading icon to show up
        $Selenium->WaitFor( JavaScript => "return \$('#AJAXLoaderPriorityID:visible').length;" );

        # wait for ajax loading icon to hide
        $Selenium->WaitFor( JavaScript => "return !\$('#AJAXLoaderPriorityID:visible').length;" );

        $Self->Is(
            $Selenium->find_element( '#PriorityID', 'css' )->get_value(),
            '3',
            "#PriorityID updated value",
        );
# ---
        $Selenium->find_element( "#Subject",  'css' )->send_keys($TicketSubject);
        $Selenium->find_element( "#RichText", 'css' )->send_keys($TicketBody);
        $Selenium->find_element( "#Subject",  'css' )->VerifiedSubmit();

        # get created test ticket data
        my %TicketIDs = $Kernel::OM->Get('Kernel::System::Ticket')->TicketSearch(
            Result         => 'HASH',
            Limit          => 1,
            CustomerUserID => $TestCustomer,
        );
        my $TicketNumber = (%TicketIDs)[1];
        my $TicketID     = (%TicketIDs)[0];

        $Self->True(
            $TicketID,
            "Ticket was created and found - $TicketID",
        ) || die;

        $Self->True(
            $Selenium->find_element("//a[contains(\@href, \'Action=AgentTicketZoom;TicketID=$TicketID' )]"),
            "Ticket with ticket number $TicketNumber is created",
        );

        # go to ticket zoom page of created test ticket
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketZoom;TicketID=$TicketID");

        # check if test ticket values are genuine
        $Self->True(
            index( $Selenium->get_page_source(), $TicketSubject ) > -1,
            "$TicketSubject found on page",
        ) || die "$TicketSubject not found on page";
        $Self->True(
            index( $Selenium->get_page_source(), $TicketBody ) > -1,
            "$TicketBody found on page",
        ) || die "$TicketBody not found on page";
        $Self->True(
            index( $Selenium->get_page_source(), $TestCustomer ) > -1,
            "$TestCustomer found on page",
        ) || die "$TestCustomer not found on page";
# ---
# ITSMIncidentProblemManagement
# ---
        # force sub menus to be visible in order to be able to click one of the links
        $Selenium->execute_script("\$('.Cluster ul ul').addClass('ForceVisible');");

        # click on history and switch window
        $Selenium->find_element("//*[text()='History']")->click();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $(".CancelClosePopup").length' );

        # check for ITSM updated fields
        for my $UpdateText (qw(Impact Criticality)) {
            $Self->True(
                index( $Selenium->get_page_source(), "Updated: FieldName=ITSM$UpdateText" ) > -1,
                "DynamicFieldUpdate $UpdateText - found",
            );
        }
# ---

        # delete created test ticket
        my $Success = $Kernel::OM->Get('Kernel::System::Ticket')->TicketDelete(
            TicketID => $TicketID,
            UserID   => 1,
        );
        $Self->True(
            $Success,
            "Ticket with ticket ID $TicketID is deleted",
        );
# ---
# ITSMIncidentProblemManagement
# ---
        # delete test service - test customer connection
        $Success = $Kernel::OM->Get('Kernel::System::DB')->Do(
            SQL => "DELETE FROM service_customer_user WHERE service_id = $ServiceID",
        );
        $Self->True(
            $Success,
            "Delete service-customer connection",
        );

        # delete test service preferences
        $Success = $Kernel::OM->Get('Kernel::System::DB')->Do(
            SQL => "DELETE FROM service_preferences WHERE service_id = $ServiceID",
        );
        $Self->True(
            $Success,
            "Service preferences is deleted - ID $ServiceID",
        );

        # delete created test service
        $Success = $Kernel::OM->Get('Kernel::System::DB')->Do(
            SQL => "DELETE FROM service WHERE id = $ServiceID",
        );
        $Self->True(
            $Success,
            "Service is deleted - ID $ServiceID",
        );
# ---

        # delete created test customer user
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
        $TestCustomer = $DBObject->Quote($TestCustomer);
        $Success      = $DBObject->Do(
            SQL  => "DELETE FROM customer_user WHERE login = ?",
            Bind => [ \$TestCustomer ],
        );
        $Self->True(
            $Success,
            "Delete customer user - $TestCustomer",
        );

        # make sure the cache is correct
        for my $Cache (
# ---
# ITSMIncidentProblemManagement
# ---
#            qw (Ticket CustomerUser)
            qw (Ticket CustomerUser Service)
# ---
            )
        {
            $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
                Type => $Cache,
            );
        }

    }
);

1;
