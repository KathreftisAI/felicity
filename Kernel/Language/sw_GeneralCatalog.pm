# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::sw_GeneralCatalog;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Utendaji';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'Usimamizi wa katalogi wa ujumla';
    $Self->{Translation}->{'Add Catalog Item'} = 'Ongeza kipengele ya katalogi';
    $Self->{Translation}->{'Add Catalog Class'} = 'Ongeza tabaka la katalogi';
    $Self->{Translation}->{'Catalog Class'} = 'Tabaka la katalogi';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = '';
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'Tengeneza na simamia Katalogi ya ujumla.';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} =
        'Usajili wa moduli ya mazingira ya mbele kwa usanidi wa katalogi ya ujumla ya msimamizi katika eneo la usimamizi.';
    $Self->{Translation}->{'General Catalog'} = 'Katalogi ya ujumla';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} =
        'Vigezo kwa mfano Maoni 2 ya sifa za katalogi za ujumla.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Vigezo kwa mfano ruhusa za vikundi kwa sifa za katalogi za ujumla.';

}

1;
