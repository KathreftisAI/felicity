# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::SupportDataCollector::Plugin::OTRS::DefaultSOAPUser;

use strict;
use warnings;

use base qw(Kernel::System::SupportDataCollector::PluginBase);

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::Config',
);

sub GetDisplayPath {
    return Translatable('OTRS');
}

sub Run {
    my $Self = shift;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $SOAPUser     = $ConfigObject->Get('SOAP::User')     || '';
    my $SOAPPassword = $ConfigObject->Get('SOAP::Password') || '';

    if ( $SOAPUser eq 'some_user' && ( $SOAPPassword eq 'some_pass' || $SOAPPassword eq '' ) ) {
        $Self->AddResultProblem(
            Label => Translatable('Default SOAP Username And Password'),
            Value => '',
            Message =>
                Translatable(
                'Security risk: you use the default setting for SOAP::User and SOAP::Password. Please change it.'
                ),
        );
    }
    else {
        $Self->AddResultOk(
            Label => Translatable('Default SOAP Username And Password'),
            Value => '',
        );
    }

    return $Self->GetResults();
}

1;
