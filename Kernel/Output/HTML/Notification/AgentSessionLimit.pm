# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::Notification::AgentSessionLimit;

use strict;
use warnings;
use utf8;

our @ObjectDependencies = (
    'Kernel::Output::HTML::Layout',
    'Kernel::System::AuthSession',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # Check if the agent session limit for the prior warning is reached
    #   and save the message for the translation and the output.
    my $AgentSessionLimitPriorWarningMessage
        = $Kernel::OM->Get('Kernel::System::AuthSession')->CheckAgentSessionLimitPriorWarning();

    return '' if !$AgentSessionLimitPriorWarningMessage;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $Output = $LayoutObject->Notify(
        Data     => $LayoutObject->{LanguageObject}->Translate($AgentSessionLimitPriorWarningMessage),
        Priority => 'Warning',
    );

    return $Output;
}

1;
