# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::CustomerDesk;

use strict;
use warnings;
use LWP::Simple;
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
    my $Output;
    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $LayoutObject  = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    # get config of frontend module
    $Output = $LayoutObject->CustomerHeader();
    $Output .= $LayoutObject->CustomerNavigationBar();
    $Output.= $LayoutObject->Output(
        TemplateFile => 'CustomerDesk',
        Data         => \%Param
        );
    $Output .= $LayoutObject->CustomerFooter();
    return $Output;
}

1;
