# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::PublicFAQRSS;

use strict;
use warnings;

use XML::RSS::SimpleGen qw();
use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # set UserID to root because in public interface there is no user
    $Self->{UserID} = 1;

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get RSS type
    my $Type = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'Type' );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    if ( !$Type ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No Type is given!'),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # check type
    if ( $Type !~ m{ Created | Changed | Top10 }xms ) {
        return $LayoutObject->FatalError(
            Message => Translatable('Type must be either LastCreate or LastChange or Top10!'),
        );
    }

    my @ItemIDs;
    my $Title;

    # get needed objects
    my $FAQObject    = $Kernel::OM->Get('Kernel::System::FAQ');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # set default interface settings
    my $Interface = $FAQObject->StateTypeGet(
        Name   => 'public',
        UserID => $Self->{UserID},
    );

    # get the Top-10 FAQ articles
    if ( $Type eq 'Top10' ) {

        # interface needs to be the interface name
        my $Top10ItemIDsRef = $FAQObject->FAQTop10Get(
            Interface => $Interface->{Name},
            Limit     => $ConfigObject->Get('FAQ::Explorer::Top10::Limit') || 10,
            UserID    => $Self->{UserID},
        ) || [];

        @ItemIDs = map { $_->{ItemID} } @{$Top10ItemIDsRef};

        # build the title
        $Title = $LayoutObject->{LanguageObject}->Translate('FAQ Articles (Top 10)');
    }

    # search the FAQ articles
    else {

        # get interface state list
        my $InterfaceStates = $FAQObject->StateTypeList(
            Types  => $ConfigObject->Get('FAQ::Public::StateTypes'),
            UserID => $Self->{UserID},
        );

        # interface needs to be complete interface hash
        @ItemIDs = $FAQObject->FAQSearch(
            States           => $InterfaceStates,
            OrderBy          => [$Type],
            OrderByDirection => ['Down'],
            Interface        => $Interface,
            Limit            => 20,
            UserID           => $Self->{UserID},
        );

        # build the title
        if ( $Type eq 'Created' ) {
            $Title = $LayoutObject->{LanguageObject}->Translate('FAQ Articles (new created)');
        }
        elsif ( $Type eq 'Changed' ) {
            $Title = $LayoutObject->{LanguageObject}->Translate(
                'FAQ Articles (recently changed)'
            );
        }
    }

    # create RSS object object
    my $RSSObject = XML::RSS::SimpleGen->new(
        $ConfigObject->Get("HttpType")
            . '://'
            . $ConfigObject->Get("FQDN")
    );

    # generate the RSS title
    $Title = $ConfigObject->Get('ProductName') . ' ' . $Title;

    $RSSObject->title($Title);

    # get the FAQ data
    for my $ItemID (@ItemIDs) {

        my %ItemData = $FAQObject->FAQGet(
            ItemID     => $ItemID,
            ItemFields => 1,
            UserID     => $Self->{UserID},
        );

        # build a preview of the first two fields
        my $Preview = '';
        for my $Count ( 1 .. 2 ) {
            if ( $ItemData{"Field$Count"} ) {
                $Preview .= $ItemData{"Field$Count"};
            }
        }

        # convert preview to ASCII
        $Preview = $Kernel::OM->Get('Kernel::System::HTMLUtils')->ToAscii( String => $Preview );

        # reduce size of preview
        $Preview =~ s{ \A ( .{80} ) .* \z }{$1\[\.\.\]}gxms;

        # build the RSS item
        $RSSObject->item(
            $ConfigObject->Get('HttpType')
                . "://"
                . $ConfigObject->Get("FQDN")
                . $LayoutObject->{Baselink}
                . "Action=PublicFAQZoom;ItemID=$ItemID",
            $ItemData{Title},
            $Preview,
        );
    }

    # convert to string
    my $Output = $RSSObject->as_string();

    # check error
    if ( !$Output ) {
        return $LayoutObject->FatalError(
            Message => Translatable('Can\'t create RSS file!'),
        );
    }

    # return the RSS feed
    return $LayoutObject->Attachment(
        Content     => $Output,
        ContentType => 'text/xml',
        Type        => 'inline',
    );
}

1;
