# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentFAQHistory;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # permission check
    if ( !$Self->{AccessRo} ) {
        return $LayoutObject->NoPermission(
            Message    => Translatable('You need ro permission!'),
            WithHeader => 'yes',
        );
    }

    # get params
    my %GetParam;

    # get needed Item id
    $GetParam{ItemID} = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'ItemID' );

    # check needed stuff
    if ( !$GetParam{ItemID} ) {

        # error page
        return $LayoutObject->ErrorScreen(
            Message => Translatable('Can\'t show history, as no ItemID is given!'),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # get FAQ item data
    my %FAQData = $FAQObject->FAQGet(
        ItemID     => $GetParam{ItemID},
        ItemFields => 0,
        UserID     => $Self->{UserID},
    );
    if ( !%FAQData ) {
        return $LayoutObject->ErrorScreen();
    }

    # check user permission
    my $Permission = $FAQObject->CheckCategoryUserPermission(
        UserID     => $Self->{UserID},
        CategoryID => $FAQData{CategoryID},
    );

    # show error message
    if ( !$Permission ) {
        return $LayoutObject->NoPermission(
            Message    => Translatable('You have no permission for this category!'),
            WithHeader => 'yes',
        );
    }

    # get FAQ article history
    my $History = $FAQObject->FAQHistoryGet(
        ItemID => $FAQData{ItemID},
        UserID => $Self->{UserID},
    );

    for my $HistoryEntry ( @{$History} ) {

        # replace ID to full user name on CreatedBy key
        my %User = $Kernel::OM->Get('Kernel::System::User')->GetUserData(
            UserID => $HistoryEntry->{CreatedBy},
            Cached => 1,
        );
        $HistoryEntry->{CreatedBy} = "$User{UserLogin} ($User{UserFirstname} $User{UserLastname})";

        # call Row block
        $LayoutObject->Block(
            Name => 'Row',
            Data => {
                %{$HistoryEntry},
            },
        );
    }

    # output header
    my $Output = $LayoutObject->Header(
        Type  => 'Small',
        Title => Translatable('FAQ History'),
    );

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentFAQHistory',
        Data         => {
            %GetParam,
            %FAQData,
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer(
        Type => 'Small',
    );

    return $Output;
}

1;
