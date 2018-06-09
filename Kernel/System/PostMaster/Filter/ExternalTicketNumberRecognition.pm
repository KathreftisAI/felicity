# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::PostMaster::Filter::ExternalTicketNumberRecognition;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Log',
    'Kernel::System::State',
    'Kernel::System::Ticket',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    $Self->{Debug} = $Param{Debug} || 0;

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # checking mandatory configuration options
    for my $Option (qw(NumberRegExp DynamicFieldName SenderType ArticleType)) {
        if ( !defined $Param{JobConfig}->{$Option} && !$Param{JobConfig}->{$Option} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Missing configuration for $Option for postmaster filter.",
            );
            return 1;
        }
    }

    if ( $Self->{Debug} >= 1 ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'debug',
            Message  => "starting Filter $Param{JobConfig}->{Name}",
        );
    }

    # check if sender is of interest
    return 1 if !$Param{GetParam}->{From};

    if ( defined $Param{JobConfig}->{FromAddressRegExp} && $Param{JobConfig}->{FromAddressRegExp} )
    {

        if ( $Param{GetParam}->{From} !~ /$Param{JobConfig}->{FromAddressRegExp}/i ) {
            return 1;
        }
    }

    # search in the subject
    if ( $Param{JobConfig}->{SearchInSubject} ) {

        # try to get external ticket number from email subject
        my @SubjectLines = split /\n/, $Param{GetParam}->{Subject};
        LINE:
        for my $Line (@SubjectLines) {
            if ( $Line =~ m{ $Param{JobConfig}->{NumberRegExp} }msx ) {
                $Self->{Number} = $1;
                last LINE;
            }
        }

        if ( $Self->{Number} ) {
            if ( $Self->{Debug} >= 1 ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'debug',
                    Message  => "Found number: $Self->{Number} in subject",
                );
            }
        }
        else {
            if ( $Self->{Debug} >= 1 ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'debug',
                    Message  => "No number found in subject: '" . join( '', @SubjectLines ) . "'",
                );
            }
        }
    }

    # search in the body
    if ( $Param{JobConfig}->{SearchInBody} ) {

        # split the body into separate lines
        my @BodyLines = split /\n/, $Param{GetParam}->{Body};

        # traverse lines and return first match
        LINE:
        for my $Line (@BodyLines) {
            if ( $Line =~ m{ $Param{JobConfig}->{NumberRegExp} }msx ) {

                # get the found element value
                $Self->{Number} = $1;
                last LINE;
            }
        }
    }

    # we need to have found an external number to proceed.
    if ( !$Self->{Number} ) {
        if ( $Self->{Debug} >= 1 ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'debug',
                Message  => 'Could not find external ticket number => Ignoring',
            );
        }
        return 1;
    }
    else {
        if ( $Self->{Debug} >= 1 ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'debug',
                Message  => "Found number $Self->{Number}",
            );
        }
    }

    # is there a ticket for this ticket number?
    my %Query = (
        Result => 'ARRAY',
        Limit  => 1,
        UserID => 1,
    );

    # check if we should only find the ticket number in tickets with a given state type
    if ( defined $Param{JobConfig}->{TicketStateTypes} && $Param{JobConfig}->{TicketStateTypes} ) {

        $Query{StateTypeIDs} = [];
        my @StateTypeIDs;

        # if StateTypes contains semicolons, use that for split,
        # otherwise split on spaces (for compat)
        if ( $Param{JobConfig}->{TicketStateTypes} =~ m{;} ) {
            @StateTypeIDs = split ';', $Param{JobConfig}->{TicketStateTypes};
        }
        else {
            @StateTypeIDs = split ' ', $Param{JobConfig}->{TicketStateTypes};
        }

        STATETYPE:
        for my $StateType (@StateTypeIDs) {

            next STATETYPE if !$StateType;

            my $StateTypeID = $Kernel::OM->Get('Kernel::System::State')->StateTypeLookup(
                StateType => $StateType,
            );

            if ($StateTypeID) {
                push @{ $Query{StateTypeIDs} }, $StateTypeID;
            }
        }
    }

    # dynamic field search condition
    $Query{ 'DynamicField_' . $Param{JobConfig}->{'DynamicFieldName'} } = {
        Equals => $Self->{Number},
    };

    # get ticket object
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # search tickets
    my @TicketIDs = $TicketObject->TicketSearch(%Query);

    # get the first and only ticket id
    my $TicketID = shift @TicketIDs;

    # ok, found ticket to deal with
    if ($TicketID) {

        # get ticket number
        my $TicketNumber = $TicketObject->TicketNumberLookup(
            TicketID => $TicketID,
            UserID   => 1,
        );

        if ( $Self->{Debug} >= 1 ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'debug',
                Message =>
                    "Found ticket $TicketNumber open for external number $Self->{Number}. Updating.",
            );
        }

        # get config object
        my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

        # build subject
        my $TicketHook        = $ConfigObject->Get('Ticket::Hook');
        my $TicketHookDivider = $ConfigObject->Get('Ticket::HookDivider');
        $Param{GetParam}->{Subject} .= " [$TicketHook$TicketHookDivider$TicketNumber]";

        # set sender type and article type.
        $Param{GetParam}->{'X-OTRS-FollowUp-SenderType'}  = $Param{JobConfig}->{SenderType};
        $Param{GetParam}->{'X-OTRS-FollowUp-ArticleType'} = $Param{JobConfig}->{ArticleType};

        # also set these parameters. It could be that the follow up is rejected by Reject.pm
        #   (follow-ups not allowed), but the original article will still be attached to the ticket.
        $Param{GetParam}->{'X-OTRS-SenderType'}  = $Param{JobConfig}->{SenderType};
        $Param{GetParam}->{'X-OTRS-ArticleType'} = $Param{JobConfig}->{ArticleType};

    }
    else {
        if ( $Self->{Debug} >= 1 ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'debug',
                Message  => "Creating new ticket for external ticket $Self->{Number}",
            );
        }

        # get the dynamic field name and description from JobConfig, set as headers
        my $TicketDynamicFieldName = $Param{JobConfig}->{'DynamicFieldName'};
        $Param{GetParam}->{ 'X-OTRS-DynamicField-' . $TicketDynamicFieldName } = $Self->{Number};

        # set sender type and article type
        $Param{GetParam}->{'X-OTRS-SenderType'}  = $Param{JobConfig}->{SenderType};
        $Param{GetParam}->{'X-OTRS-ArticleType'} = $Param{JobConfig}->{ArticleType};
    }

    return 1;
}

1;
