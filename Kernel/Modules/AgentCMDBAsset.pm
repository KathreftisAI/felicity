# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentCMDBAsset;

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
    my $UserID_value = $Self->{UserID};
    my $SessionID_value = $Self->{SessionID};
    my $LayoutObject  = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    # get config of frontend module
    my $TemplateFileName = 'AgentCMDBAsset';
    my %Data = ('UserID',$UserID_value,'SessionID',$SessionID_value);
    $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
        $Output
            .= $LayoutObject->Output(
            TemplateFile => $TemplateFileName,
            Data         => \%Data
            );
        $Output .= $LayoutObject->Footer();
        return $Output;
}

1;
