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

        # get needed objects
        my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
        my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
        my $Helper       = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

        # set download type to inline
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'AttachmentDownloadType',
            Value => 'inline'
        );

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'users' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $ConfigObject->Get('ScriptAlias');

        my @TestAttachments = (
            {
                Name            => 'StdAttachment-Test1.txt',
                ExpectedContent => 'Some German Text with Umlaut: ÄÖÜß',
            },
            {
                Name            => 'file-1.html',
                ExpectedContent => 'This is file-1.html content.',
            }
        );

        for my $TestAttachment (@TestAttachments) {

            # create test ticket
            my $TicketID = $TicketObject->TicketCreate(
                Title        => 'Selenium Ticket',
                Queue        => 'Raw',
                Lock         => 'unlock',
                Priority     => '3 normal',
                State        => 'new',
                CustomerID   => '123465',
                CustomerUser => 'customer@example.com',
                OwnerID      => 1,
                UserID       => 1,
            );
            $Self->True(
                $TicketID,
                "TicketCreate - ID $TicketID",
            );

            # create article for test ticket with attachment
            my $Location = $ConfigObject->Get('Home')
                . "/scripts/test/sample/StdAttachment/$TestAttachment->{Name}";
            my $ContentRef = $Kernel::OM->Get('Kernel::System::Main')->FileRead(
                Location => $Location,
                Mode     => 'binmode',
            );
            my $Content = ${$ContentRef};

            my $ArticleID = $TicketObject->ArticleCreate(
                TicketID       => $TicketID,
                ArticleType    => 'note-internal',
                SenderType     => 'agent',
                Subject        => 'Selenium subject test',
                Body           => 'Selenium body test',
                ContentType    => 'text/plain; charset=ISO-8859-15',
                HistoryType    => 'OwnerUpdate',
                HistoryComment => 'Some free text!',
                UserID         => 1,
                Attachment     => [
                    {
                        Content     => $Content,
                        ContentType => 'text/plain; charset=ISO-8859-15',
                        Filename    => $TestAttachment->{Name},
                    },
                ],
                NoAgentNotify => 1,
            );
            $Self->True(
                $ArticleID,
                "ArticleCreate - ID $ArticleID",
            );

            # navigate to AgentTicketZoom screen of created test ticket
            $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketZoom;TicketID=$TicketID");

            # check if attachment exists
            $Self->True(
                $Selenium->execute_script(
                    "return \$('.ArticleMailHeader a[href*=\"Action=AgentTicketAttachment;ArticleID=$ArticleID\"]:contains($TestAttachment->{Name})').length;"
                ),
                "'$TestAttachment->{Name}' is found on page",
            );

            # check ticket attachment
            $Selenium->get(
                "${ScriptAlias}index.pl?Action=AgentTicketAttachment;ArticleID=$ArticleID;FileID=1",
                {
                    NoVerify => 1,
                }
            );

            # check if attachment is genuine
            $Self->True(
                index( $Selenium->get_page_source(), $TestAttachment->{ExpectedContent} ) > -1,
                "'$TestAttachment->{Name}' opened successfully",
            );

            # delete created test ticket
            my $Success = $TicketObject->TicketDelete(
                TicketID => $TicketID,
                UserID   => 1,
            );
            $Self->True(
                $Success,
                "Ticket with ticket ID $TicketID is deleted"
            );
        }

        # make sure the cache is correct
        for my $Cache (qw( Ticket CustomerUser )) {
            $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => $Cache );
        }

    }
);

1;
