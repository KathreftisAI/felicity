# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::SupportDataCollector::Plugin::OTRS::DatabaseRecords;

use strict;
use warnings;

use base qw(Kernel::System::SupportDataCollector::PluginBase);

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DB',
);

sub GetDisplayPath {
    return Translatable('OTRS') . '/' . Translatable('Database Records');
}

sub Run {
    my $Self = shift;

    my @Checks = (
        {
            SQL        => "SELECT count(*) FROM ticket",
            Identifier => 'TicketCount',
            Label      => Translatable("Tickets"),
        },
        {
            SQL        => "SELECT count(*) FROM ticket_history",
            Identifier => 'TicketHistoryCount',
            Label      => Translatable("Ticket History Entries"),
        },
        {
            SQL        => "SELECT count(*) FROM article",
            Identifier => 'ArticleCount',
            Label      => Translatable("Articles"),
        },
        {
            SQL =>
                "SELECT count(*) from article_attachment WHERE content_type NOT LIKE 'text/html%'",
            Identifier => 'AttachmentCountDBNonHTML',
            Label      => Translatable("Attachments (DB, Without HTML)"),
        },
        {
            SQL        => "SELECT count(DISTINCT(customer_user_id)) FROM ticket",
            Identifier => 'DistinctTicketCustomerCount',
            Label      => Translatable("Customers With At Least One Ticket"),
        },
        {
            SQL        => "SELECT count(*) FROM queue",
            Identifier => 'QueueCount',
            Label      => Translatable("Queues"),
        },
        {
            SQL        => "SELECT count(*) FROM users",
            Identifier => 'AgentCount',
            Label      => Translatable("Agents"),
        },
        {
            SQL        => "SELECT count(*) FROM roles",
            Identifier => 'RoleCount',
            Label      => Translatable("Roles"),
        },
        {
            SQL        => "SELECT count(*) FROM groups",
            Identifier => 'GroupCount',
            Label      => Translatable("Groups"),
        },
        {
            SQL        => "SELECT count(*) FROM dynamic_field",
            Identifier => 'DynamicFieldCount',
            Label      => Translatable("Dynamic Fields"),
        },
        {
            SQL        => "SELECT count(*) FROM dynamic_field_value",
            Identifier => 'DynamicFieldValueCount',
            Label      => Translatable("Dynamic Field Values"),
        },
        {
            SQL        => "SELECT count(*) FROM dynamic_field WHERE valid_id > 1",
            Identifier => 'InvalidDynamicFieldCount',
            Label      => Translatable("Invalid Dynamic Fields"),
        },
        {
            SQL => "
                SELECT count(*)
                FROM dynamic_field_value
                    JOIN dynamic_field ON dynamic_field.id = dynamic_field_value.field_id
                WHERE dynamic_field.valid_id > 1",
            Identifier => 'InvalidDynamicFieldValueCount',
            Label      => Translatable("Invalid Dynamic Field Values"),
        },
        {
            SQL        => "SELECT count(*) FROM gi_webservice_config",
            Identifier => 'WebserviceCount',
            Label      => Translatable("GenericInterface Webservices"),
        },
        {
            SQL        => "SELECT count(*) FROM pm_process",
            Identifier => 'ProcessCount',
            Label      => Translatable("Processes"),
        },
        {
            SQL => "
                SELECT count(*)
                FROM dynamic_field df
                    LEFT JOIN dynamic_field_value dfv ON df.id = dfv.field_id
                    RIGHT JOIN ticket t ON t.id = dfv.object_id
                WHERE df.name = '"
                . $Kernel::OM->Get('Kernel::Config')->Get("Process::DynamicFieldProcessManagementProcessID") . "'",
            Identifier => 'ProcessTickets',
            Label      => Translatable("Process Tickets"),
        },
    );

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my %Counts;
    CHECK:
    for my $Check (@Checks) {
        $DBObject->Prepare( SQL => $Check->{SQL} );
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $Counts{ $Check->{Identifier} } = $Row[0];
        }

        if ( defined $Counts{ $Check->{Identifier} } ) {
            $Self->AddResultInformation(
                Identifier => $Check->{Identifier},
                Label      => $Check->{Label},
                Value      => $Counts{ $Check->{Identifier} },
            );
        }
        else {
            $Self->AddResultProblem(
                Identifier => $Check->{Identifier},
                Label      => $Check->{Label},
                Value      => $Counts{ $Check->{Identifier} },
                Message    => Translatable('Could not determine value.'),
            );
        }
    }

    $DBObject->Prepare(
        SQL => "SELECT max(create_time_unix), min(create_time_unix) FROM ticket WHERE id > 1 ",
    );
    my $TicketWindowTime = 1;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        if ( $Row[0] && $Row[1] ) {
            $TicketWindowTime = ( $Row[0] - $Row[1] ) || 1;
        }

    }
    $TicketWindowTime = $TicketWindowTime / ( 60 * 60 * 24 * 30.4 );    # month in seconds
    $TicketWindowTime = 1 if $TicketWindowTime < 1;

    $Self->AddResultInformation(
        Identifier => 'TicketWindowTime',
        Label      => Translatable('Months Between First And Last Ticket'),
        Value      => sprintf( "%.02f", $TicketWindowTime ),
    );
    $Self->AddResultInformation(
        Identifier => 'TicketsPerMonth',
        Label      => Translatable('Tickets Per Month (avg)'),
        Value      => sprintf( "%.02f", $Counts{TicketCount} / $TicketWindowTime ),
    );

    return $Self->GetResults();
}

1;
