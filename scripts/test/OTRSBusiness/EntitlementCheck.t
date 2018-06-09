# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $Helper                     = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $AgentNotificationObject    = $Kernel::OM->Get('Kernel::Output::HTML::Notification::AgentOTRSBusiness');
my $CustomerNotificationObject = $Kernel::OM->Get('Kernel::Output::HTML::Notification::CustomerOTRSBusiness');
my $SystemDataObject           = $Kernel::OM->Get('Kernel::System::SystemData');

my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

my @Tests = (
    {
        Name                         => 'OB not installed',
        CurrentTime                  => '2016-09-30 12:00:00',
        OTRSBusinessIsInstalled      => 0,
        SystemData                   => {},
        AgentNotificationResultAgent => '',
        AgentNotificationResultAdmin => '<!-- start Notify -->
<div class="MessageBox Info">
    <p>
            <a href="No-$ENV{"SCRIPT_NAME"}?Action=AdminOTRSBusiness" class="Button"><i class="fa fa-angle-double-up"></i> Upgrade to <b>OTRS Business Solution</b>™ now! </a>
    </p>
</div>
<!-- end Notify -->
',
        CustomerNotificationResult => '',
    },
    {
        Name                    => 'OB installed, everything ok',
        CurrentTime             => '2016-09-30 12:00:00',
        OTRSBusinessIsInstalled => 1,
        SystemData              => {
            'OTRSBusiness::ExpiryDate'                       => '2016-10-30 12:00:00',
            'OTRSBusiness::LastUpdateTime'                   => '2016-09-30 12:00:00',
            'OTRSBusiness::BusinessPermission'               => '1',
            'OTRSBusiness::FrameworkUpdateAvailable'         => '0',
            'OTRSBusiness::LatestVersionForCurrentFramework' => '0.0.0',
            'Registration::State'                            => 'registered',
        },
        AgentNotificationResultAgent => '',
        AgentNotificationResultAdmin => '',
        CustomerNotificationResult   => '',
    },
    {
        Name                    => 'OB installed, expiry warning',
        CurrentTime             => '2016-09-30 12:00:00',
        OTRSBusinessIsInstalled => 1,
        SystemData              => {
            'OTRSBusiness::ExpiryDate'                       => '2016-10-10 12:00:00',
            'OTRSBusiness::LastUpdateTime'                   => '2016-09-30 12:00:00',
            'OTRSBusiness::BusinessPermission'               => '1',
            'OTRSBusiness::FrameworkUpdateAvailable'         => '0',
            'OTRSBusiness::LatestVersionForCurrentFramework' => '0.0.0',
            'Registration::State'                            => 'registered',
        },
        AgentNotificationResultAgent => '',
        AgentNotificationResultAdmin => '<!-- start Notify -->
<div class="MessageBox Notice">
    <p>
            The license for your <b>OTRS Business Solution</b>™ is about to expire. Please make contact with sales@otrs.com to renew your contract!
    </p>
</div>
<!-- end Notify -->
',
        CustomerNotificationResult => '',
    },
    {
        Name                    => 'OB installed, LastUpdateTime outdated, show warning',
        CurrentTime             => '2016-09-30 12:00:00',
        OTRSBusinessIsInstalled => 1,
        SystemData              => {
            'OTRSBusiness::ExpiryDate'                       => '2016-10-30 12:00:00',
            'OTRSBusiness::LastUpdateTime'                   => '2016-09-20 12:00:00',
            'OTRSBusiness::BusinessPermission'               => '1',
            'OTRSBusiness::FrameworkUpdateAvailable'         => '0',
            'OTRSBusiness::LatestVersionForCurrentFramework' => '0.0.0',
            'Registration::State'                            => 'registered',
        },
        AgentNotificationResultAgent => '',
        AgentNotificationResultAdmin => '<!-- start Notify -->
<div class="MessageBox Error">
    <p>
            Connection to cloud.otrs.com via HTTPS couldn\'t be established. Please make sure that your OTRS can connect to cloud.otrs.com via port 443.
    </p>
</div>
<!-- end Notify -->
',
        CustomerNotificationResult => '',
    },
    {
        Name                    => 'OB installed, LastUpdateTime outdated, show error',
        CurrentTime             => '2016-09-30 12:00:00',
        OTRSBusinessIsInstalled => 1,
        SystemData              => {
            'OTRSBusiness::ExpiryDate'                       => '2016-10-30 12:00:00',
            'OTRSBusiness::LastUpdateTime'                   => '2016-09-10 12:00:00',
            'OTRSBusiness::BusinessPermission'               => '1',
            'OTRSBusiness::FrameworkUpdateAvailable'         => '0',
            'OTRSBusiness::LatestVersionForCurrentFramework' => '0.0.0',
            'Registration::State'                            => 'registered',
        },
        AgentNotificationResultAgent => '<!-- start Notify -->
<div class="MessageBox Error">
    <p>
            This system uses the <b>OTRS Business Solution</b>™ without a proper license! Please make contact with sales@otrs.com to renew or activate your contract!
    </p>
</div>
<!-- end Notify -->
',
        AgentNotificationResultAdmin => '<!-- start Notify -->
<div class="MessageBox Error">
    <p>
            This system uses the <b>OTRS Business Solution</b>™ without a proper license! Please make contact with sales@otrs.com to renew or activate your contract!
    </p>
</div>
<!-- end Notify -->
',
        CustomerNotificationResult => '<!-- start Notify -->
<div class="MessageBox Error">
    <p>
            This system uses the <b>OTRS Business Solution</b>™ without a proper license! Please make contact with sales@otrs.com to renew or activate your contract!
    </p>
</div>
<!-- end Notify -->
',
    },
    {
        Name                    => 'OB installed, LastUpdateTime outdated, block system',
        CurrentTime             => '2016-09-30 12:00:00',
        OTRSBusinessIsInstalled => 1,
        SystemData              => {
            'OTRSBusiness::ExpiryDate'                       => '2016-10-30 12:00:00',
            'OTRSBusiness::LastUpdateTime'                   => '2016-09-01 12:00:00',
            'OTRSBusiness::BusinessPermission'               => '1',
            'OTRSBusiness::FrameworkUpdateAvailable'         => '0',
            'OTRSBusiness::LatestVersionForCurrentFramework' => '0.0.0',
            'Registration::State'                            => 'registered',
        },
        AgentNotificationResultAgent => '<!-- start Notify -->
<div class="MessageBox Error">
    <p>
            This system uses the <b>OTRS Business Solution</b>™ without a proper license! Please make contact with sales@otrs.com to renew or activate your contract!
<script>
if (!window.location.search.match(/^[?]Action=(AgentOTRSBusiness|Admin.*)/)) {
    window.location.search = "Action=AgentOTRSBusiness;Subaction=BlockScreen";
}
</script>
    </p>
</div>
<!-- end Notify -->
',
        AgentNotificationResultAdmin => '<!-- start Notify -->
<div class="MessageBox Error">
    <p>
            This system uses the <b>OTRS Business Solution</b>™ without a proper license! Please make contact with sales@otrs.com to renew or activate your contract!
<script>
if (!window.location.search.match(/^[?]Action=(AgentOTRSBusiness|Admin.*)/)) {
    window.location.search = "Action=AgentOTRSBusiness;Subaction=BlockScreen";
}
</script>
    </p>
</div>
<!-- end Notify -->
',
        CustomerNotificationResult => '<!-- start Notify -->
<div class="MessageBox Error">
    <p>
            This system uses the <b>OTRS Business Solution</b>™ without a proper license! Please make contact with sales@otrs.com to renew or activate your contract!
    </p>
</div>
<!-- end Notify -->
',
    },
);

for my $Test (@Tests) {

    my $SystemTime = $Kernel::OM->Get('Kernel::System::Time')->TimeStamp2SystemTime(
        String => $Test->{CurrentTime},
    );
    $Helper->FixedTimeSet($SystemTime);

    no warnings 'redefine';

    *Kernel::System::OTRSBusiness::OTRSBusinessIsInstalled = sub {
        return $Test->{OTRSBusinessIsInstalled};
    };

    for my $Key ( sort keys %{ $Test->{SystemData} } ) {
        $SystemDataObject->SystemDataDelete(
            Key    => $Key,
            UserID => 1,
        );
        $SystemDataObject->SystemDataAdd(
            Key    => $Key,
            Value  => $Test->{SystemData}->{$Key},
            UserID => 1,
        );
    }

    delete $LayoutObject->{"UserIsGroup[admin]"};

    $Self->Is(
        scalar $AgentNotificationObject->Run(
            Type => 'Agent',
        ),
        $Test->{AgentNotificationResultAgent},
        "$Test->{Name} - agent notification result",
    );

    $LayoutObject->{"UserIsGroup[admin]"} = 'Yes';

    $Self->Is(
        scalar $AgentNotificationObject->Run(
            Type => 'Admin',
        ),
        $Test->{AgentNotificationResultAdmin},
        "$Test->{Name} - admin notification result",
    );

    $Self->Is(
        scalar $CustomerNotificationObject->Run(),
        $Test->{CustomerNotificationResult},
        "$Test->{Name} - customer notification result",
    );
}

# Cleanup is done by RestoreDatabase.

1;
