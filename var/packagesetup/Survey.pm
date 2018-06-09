# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::packagesetup::Survey;

use strict;
use warnings;

use Kernel::Output::Template::Provider;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DB',
    'Kernel::System::Log',
    'Kernel::System::SysConfig',
);

=head1 NAME

Survey.pm - code to execute during package installation

=head1 SYNOPSIS

All functions

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CodeObject = $Kernel::OM->Get('var::packagesetup::Survey');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # rebuild ZZZ* files
    $Kernel::OM->Get('Kernel::System::SysConfig')->WriteDefault();

    # define the ZZZ files
    my @ZZZFiles = (
        'ZZZAAuto.pm',
        'ZZZAuto.pm',
    );

    # reload the ZZZ files (mod_perl workaround)
    for my $ZZZFile (@ZZZFiles) {

        PREFIX:
        for my $Prefix (@INC) {
            my $File = $Prefix . '/Kernel/Config/Files/' . $ZZZFile;
            next PREFIX if !-f $File;
            do $File;
            last PREFIX;
        }
    }

    # always discard the config object before package code is executed,
    # to make sure that the config object will be created newly, so that it
    # will use the recently written new config from the package
    $Kernel::OM->ObjectsDiscard(
        Objects => ['Kernel::Config'],
    );

    return $Self;
}

=item CodeInstall()

run the code install part

    my $Result = $CodeObject->CodeInstall();

=cut

sub CodeInstall {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item CodeReinstall()

run the code reinstall part

    my $Result = $CodeObject->CodeReinstall();

=cut

sub CodeReinstall {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item CodeUpgrade()

run the code upgrade part

    my $Result = $CodeObject->CodeUpgrade();

=cut

sub CodeUpgrade {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item CodeUpgradeFromLowerThan_2_0_92()

This function is only executed if the installed module version is smaller than 2.0.92.

my $Result = $CodeObject->CodeUpgradeFromLowerThan_2_0_92();

=cut

sub CodeUpgradeFromLowerThan_2_0_92 {    ## no critic
    my ( $Self, %Param ) = @_;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # SELECT all functionality values
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id, send_time
            FROM survey_request',
    );

    my @List;
    ROW:
    while ( my @Row = $DBObject->FetchrowArray() ) {
        next ROW if !$Row[1];

        push @List, \@Row;
    }

    # save entries in new table
    for my $Entry (@List) {
        return if !$DBObject->Do(
            SQL => '
                UPDATE survey_request
                SET create_time = ?
                WHERE  id = ?',
            Bind => [ \$Entry->[1], \$Entry->[0] ],
        );
    }

    return 1;
}

=item CodeUpgradeFromLowerThan_2_1_5()

This function is only executed if the installed module version is smaller than 2.1.5.

my $Result = $CodeObject->CodeUpgradeFromLowerThan_2_1_5();

=cut

sub CodeUpgradeFromLowerThan_2_1_5 {    ## no critic
    my ( $Self, %Param ) = @_;

    # set all survey_question records
    # that don't have answer_required set to something
    # to 0
    $Self->_Prefill_AnswerRequiredFromSurveyQuestion_2_1_5();

    return 1;
}

=item CodeUpgradeFromLowerThan_4_0_1()

This function is only executed if the installed module version is smaller than 4.0.1.

my $Result = $CodeObject->CodeUpgradeFromLowerThan_4_0_1();

=cut

sub CodeUpgradeFromLowerThan_4_0_1 {    ## no critic
    my ( $Self, %Param ) = @_;

    # migrate the DTL Content in the SysConfig
    $Self->_MigrateDTLInSysConfig();

    return 1;
}

=item CodeUpgradeFromLowerThan_4_0_91()

This function is only executed if the installed module version is smaller than 4.0.91.

my $Result = $CodeObject->CodeUpgradeFromLowerThan_4_0_91();

=cut

sub CodeUpgradeFromLowerThan_4_0_91 {    ## no critic
    my ( $Self, %Param ) = @_;

    # change configurations to match the new module location.
    $Self->_MigrateConfigs();

    return 1;
}

=item _Prefill_AnswerRequiredFromSurveyQuestion_2_1_5()

Inserts 0 into all answer_required records of table suvey_question
where there is no entry present.

    my $Success = $PackageSetup->_Prefill_AnswerRequiredFromSurveyQuestion_2_1_5();

=cut

sub _Prefill_AnswerRequiredFromSurveyQuestion_2_1_5 {    ## no critic
    my ($Self) = @_;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    return if !$DBObject->Prepare(
        SQL => '
            SELECT id, answer_required
            FROM survey_question',
    );
    my @IdsToUpdate;
    while ( my @Row = $DBObject->FetchrowArray() ) {

        # if we had an id
        # but no answer_required or answer_required isn't 0 or 1
        # collect the ID in @IdsToUpdate
        if (
            defined $Row[0]
            && length $Row[0]
            && (
                !defined $Row[1]
                || ( $Row[1] ne '0' && $Row[1] ne '1' )
            )
            )
        {
            push @IdsToUpdate, $Row[0];
        }
    }

    for my $QuestionID (@IdsToUpdate) {
        return if !$DBObject->Do(
            SQL => '
                UPDATE survey_question
                SET answer_required = 0
                WHERE id = ?',
            Bind => [
                \$QuestionID,
            ],
        );
    }
    return 1;
}

sub _MigrateDTLInSysConfig {

    # create needed objects
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ProviderObject  = Kernel::Output::Template::Provider->new();

    # get setting's content
    my $Setting = $ConfigObject->Get('Survey::Frontend::MenuModule');
    return if !$Setting;

    MENUMODULE:
    for my $MenuModule ( sort keys %{$Setting} ) {

        my $SettingContent = $Setting->{$MenuModule}->{Link};

        # do nothing no value for migrating
        next MENUMODULE if !$SettingContent;

        my $TTContent;
        eval {
            $TTContent = $ProviderObject->MigrateDTLtoTT( Content => $SettingContent );
        };
        if ($@) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$MenuModule->Link : $@!",
            );
        }
        else {

            next MENUMODULE if $SettingContent eq $TTContent;

            $Setting->{$MenuModule}->{Link} = $TTContent;
        }

        my $Success = $SysConfigObject->ConfigItemUpdate(
            Valid => 1,
            Key   => 'Survey::Frontend::MenuModule',
            Value => $Setting,
        );
    }
    return 1;
}

=item _MigrateConfigs()

change configurations to match the new module location.

    my $Result = $CodeObject->_MigrateConfigs();

=cut

sub _MigrateConfigs {

    # create needed objects
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    # migrate survey menu module sysconfig
    # get setting content for survey sysconfig
    my $Setting = $ConfigObject->Get('Survey::Frontend::MenuModule');

    CONFIGITEM:
    for my $MenuModule ( sort keys %{$Setting} ) {

        # update module location
        my $Module = $Setting->{$MenuModule}->{'Module'};
        next CONFIGITEM if !$Module;

        if ( $Module !~ m{Kernel::Output::HTML::SurveyMenu(\w+)} ) {
            next CONFIGITEM;
        }

        $Setting->{$MenuModule}->{Module} = "Kernel::Output::HTML::SurveyMenu::$1";

        # set new setting
        my $Success = $SysConfigObject->ConfigItemUpdate(
            Valid => 1,
            Key   => 'Survey::Frontend::MenuModule###' . $MenuModule,
            Value => $Setting->{$MenuModule},
        );
    }

    # migrate survey overview small SysConfig
    # get setting content for survey SysConfig
    $Setting = $ConfigObject->Get('Survey::Frontend::Overview');

    if ( $Setting->{'Small'}->{Module} ) {

        # update module location
        $Setting->{'Small'}->{Module} = "Kernel::Output::HTML::SurveyOverview::Small";

        # set new setting
        my $Success = $SysConfigObject->ConfigItemUpdate(
            Valid => 1,
            Key   => 'Survey::Frontend::Overview###Small',
            Value => $Setting->{'Small'},
        );
    }

    # migrate survey preference SysConfig
    # get setting content for survey SysConfig
    $Setting = $ConfigObject->Get('PreferencesGroups');

    if ( $Setting->{'SurveyOverviewSmallPageShown'}->{Module} ) {

        # update module location
        $Setting->{'SurveyOverviewSmallPageShown'}->{Module} = "Kernel::Output::HTML::Preferences::Generic";

        # set new setting
        my $Success = $SysConfigObject->ConfigItemUpdate(
            Valid => 1,
            Key   => 'PreferencesGroups###SurveyOverviewSmallPageShown',
            Value => $Setting->{'SurveyOverviewSmallPageShown'},
        );
    }

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
