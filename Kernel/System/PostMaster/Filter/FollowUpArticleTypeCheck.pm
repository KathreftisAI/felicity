# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::PostMaster::Filter::FollowUpArticleTypeCheck;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::CustomerUser',
    'Kernel::System::Log',
    'Kernel::System::Ticket',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get parser object
    $Self->{ParserObject} = $Param{ParserObject} || die "Got no ParserObject!";

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # FollowUpArticleTypeCheck is not needed if there is no TicketID.
    return 1 if !$Param{TicketID};

    # check needed stuff
    for (qw(JobConfig GetParam)) {
        if ( !$Param{$_} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $_!"
            );
            return;
        }
    }

    # Only run if we have a follow-up article with SenderType 'customer'.
    #   It could be that follow-ups have a different SenderType like 'system' for
    #   automatic notifications. In these cases there is no need to hide them.
    #   See also bug#10182 for details.
    if (
        !$Param{GetParam}->{'X-OTRS-FollowUp-SenderType'}
        || $Param{GetParam}->{'X-OTRS-FollowUp-SenderType'} ne 'customer'
        )
    {
        return 1;
    }

    # get ticket object
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # Get all articles.
    my @ArticleIndex = $TicketObject->ArticleGet(
        TicketID      => $Param{TicketID},
        DynamicFields => 0,
    );
    return if !@ArticleIndex;

    # Check if it is a known customer, otherwise use email address from CustomerUserID field of the ticket.
    my %CustomerData = $Kernel::OM->Get('Kernel::System::CustomerUser')->CustomerUserDataGet(
        User => $ArticleIndex[0]->{CustomerUserID},
    );
    my $CustomerEmailAddress = $CustomerData{UserEmail} || $ArticleIndex[0]->{CustomerUserID};

    # Email sender address
    my $SenderAddress = $Param{GetParam}->{'X-Sender'};

    # Email Reply-To address for forwarded emails
    my $ReplyToAddress;
    if ( $Param{GetParam}->{ReplyTo} ) {
        $ReplyToAddress = $Self->{ParserObject}->GetEmailAddress(
            Email => $Param{GetParam}->{ReplyTo},
        );
    }

    # check if current sender is customer (do nothing)
    if ( $CustomerEmailAddress && $SenderAddress ) {
        return 1 if lc $CustomerEmailAddress eq lc $SenderAddress;
    }

    my @References = $Self->{ParserObject}->GetReferences();

    # check if current sender got an internal forward
    my $InternalForward;
    ARTICLE:
    for my $Article ( reverse @ArticleIndex ) {

        # just check agent sent article
        next ARTICLE if $Article->{SenderType} ne 'agent';

        # just check email-internal
        next ARTICLE if $Article->{ArticleType} ne 'email-internal';

        # check recipients
        next ARTICLE if !$Article->{To};

        # check based on recipient addresses of the article
        my @ToEmailAddresses = $Self->{ParserObject}->SplitAddressLine(
            Line => $Article->{To},
        );
        my @CcEmailAddresses = $Self->{ParserObject}->SplitAddressLine(
            Line => $Article->{Cc},
        );
        my @EmailAdresses = ( @ToEmailAddresses, @CcEmailAddresses );

        EMAIL:
        for my $Email (@EmailAdresses) {
            my $Recipient = $Self->{ParserObject}->GetEmailAddress(
                Email => $Email,
            );
            if ( lc $Recipient eq lc $SenderAddress ) {
                $InternalForward = 1;
                last ARTICLE;
            }
            if ( $ReplyToAddress && lc $Recipient eq lc $ReplyToAddress ) {
                $InternalForward = 1;
                last ARTICLE;
            }
        }

        # check based on Message-ID of the article
        for my $Reference (@References) {
            if ( $Article->{MessageID} && $Article->{MessageID} eq $Reference ) {
                $InternalForward = 1;
                last ARTICLE;
            }
        }
    }

    return 1 if !$InternalForward;

    # set 'X-OTRS-FollowUp-ArticleType to 'email-internal'
    $Param{GetParam}->{'X-OTRS-FollowUp-ArticleType'} = $Param{JobConfig}->{ArticleType} || 'email-internal';

    # set 'X-OTRS-FollowUp-SenderType to 'customer'
    $Param{GetParam}->{'X-OTRS-FollowUp-SenderType'} = $Param{JobConfig}->{SenderType} || 'customer';

    return 1;
}

1;
