# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::packagesetup::FAQ;

use strict;
use warnings;

use Kernel::Output::Template::Provider;
use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Cache',
    'Kernel::System::DB',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicFieldValue',
    'Kernel::System::FAQ',
    'Kernel::System::Group',
    'Kernel::System::LinkObject',
    'Kernel::System::Log',
    'Kernel::System::Stats',
    'Kernel::System::SysConfig',
    'Kernel::System::Valid',
);

=head1 NAME

FAQ.pm - code to execute during package installation

=head1 SYNOPSIS

All functions

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CodeObject = $Kernel::OM->Get('var::packagesetup::FAQ');

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

    # the stats object needs a UserID parameter for the constructor
    # we need to discard any existing stats object before
    $Kernel::OM->ObjectsDiscard(
        Objects => ['Kernel::System::Stats'],
    );

    # define UserID parameter for the constructor of the stats object
    $Kernel::OM->ObjectParamAdd(
        'Kernel::System::Stats' => {
            UserID => 1,
        },
    );

    # define file prefix
    $Self->{FilePrefix} = 'FAQ';

    return $Self;
}

=item CodeInstall()

run the code install part

    my $Result = $CodeObject->CodeInstall();

=cut

sub CodeInstall {
    my ( $Self, %Param ) = @_;

    # insert the FAQ states
    $Self->_InsertFAQStates();

    # add the group FAQ
    $Self->_GroupAdd(
        Name        => 'faq',
        Description => 'faq database users',
    );

    # add the group faq_admin
    $Self->_GroupAdd(
        Name        => 'faq_admin',
        Description => 'faq admin users',
    );

    # add the group faq_approval
    $Self->_GroupAdd(
        Name        => 'faq_approval',
        Description => 'faq approval users',
    );

    # add the FAQ groups to the category 'Misc'
    $Self->_CategoryGroupSet(
        Category => 'Misc',
        Groups   => [ 'faq', 'faq_admin', 'faq_approval' ],
    );

    # create additional FAQ languages
    $Self->_CreateAditionalFAQLanguages();

    # install stats
    $Kernel::OM->Get('Kernel::System::Stats')->StatsInstall(
        FilePrefix => $Self->{FilePrefix},
        UserID     => 1,
    );

    return 1;
}

=item CodeReinstall()

run the code reinstall part

    my $Result = $CodeObject->CodeReinstall();

=cut

sub CodeReinstall {
    my ( $Self, %Param ) = @_;

    # insert the FAQ states
    $Self->_InsertFAQStates();

    # add the group FAQ
    $Self->_GroupAdd(
        Name        => 'faq',
        Description => 'faq database users',
    );

    # add the group faq_admin
    $Self->_GroupAdd(
        Name        => 'faq_admin',
        Description => 'faq admin users',
    );

    # add the group faq_approval
    $Self->_GroupAdd(
        Name        => 'faq_approval',
        Description => 'faq approval users',
    );

    # install stats
    $Kernel::OM->Get('Kernel::System::Stats')->StatsInstall(
        FilePrefix => $Self->{FilePrefix},
        UserID     => 1,
    );

    # create additional FAQ languages
    $Self->_CreateAditionalFAQLanguages();

    return 1;
}

=item CodeUpgrade()

run the code upgrade part

    my $Result = $CodeObject->CodeUpgrade();

=cut

sub CodeUpgrade {
    my ( $Self, %Param ) = @_;

    # install stats
    $Kernel::OM->Get('Kernel::System::Stats')->StatsInstall(
        FilePrefix => $Self->{FilePrefix},
        UserID     => 1,
    );

    # create additional FAQ languages
    $Self->_CreateAditionalFAQLanguages();

    # delete the FAQ cache (to avoid old data from previous FAQ modules)
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => 'FAQ',
    );

    return 1;
}

=item CodeUpgradeSpecial()

run special code upgrade part

    my $Result = $CodeObject->CodeUpgradeSpecial();

=cut

sub CodeUpgradeSpecial {
    my ( $Self, %Param ) = @_;

    # convert \n to <br> for existing articles
    $Self->_ConvertNewlines();

    # start normal code upgrade
    $Self->CodeUpgrade();

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

    # set content type
    $Self->_SetContentType();

    return 1;
}

=item CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    # remove Dynamic Fields and its values
    $Self->_DynamicFieldsDelete();

    # deactivate the group FAQ
    $Self->_GroupDeactivate(
        Name => 'faq',
    );

    # deactivate the group faq_admin
    $Self->_GroupDeactivate(
        Name => 'faq_admin',
    );

    # deactivate the group faq_approval
    $Self->_GroupDeactivate(
        Name => 'faq_approval',
    );

    # uninstall stats
    $Kernel::OM->Get('Kernel::System::Stats')->StatsUninstall(
        FilePrefix => $Self->{FilePrefix},
        UserID     => 1,
    );

    # delete all links with FAQ articles
    $Self->_LinkDelete();

    return 1;
}

=item _InsertFAQStates()

inserts needed FAQ states into table

    my $Result = $CodeObject->_InsertFAQStates();

=cut

sub _InsertFAQStates {
    my ( $Self, %Param ) = @_;

    # define faq_state_types => faq_states
    my %State = (
        'internal' => 'internal (agent)',
        'external' => 'external (customer)',
        'public'   => 'public (all)',
    );

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    for my $Type ( sort keys %State ) {

        # get the state type
        my $StateTypeRef = $FAQObject->StateTypeGet(
            Name   => $Type,
            UserID => 1,
        );

        # add the state
        $FAQObject->StateAdd(
            Name   => $State{$Type},
            TypeID => $StateTypeRef->{StateID},
            UserID => 1,
        );
    }

    return 1;
}

=item _ConvertNewlines()

coverts all \n into <br> for Fields 1-6 in all existing FAQ articles

    my $Result = $CodeObject->_ConvertNewlines();

=cut

sub _ConvertNewlines {
    my ( $Self, %Param ) = @_;

    # only convert \n to <br> if HTML view is enabled
    return if !$Kernel::OM->Get('Kernel::Config')->Get('FAQ::Item::HTML');

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get all FAQ IDs
    my @FAQIDs;
    $DBObject->Prepare(
        SQL => "SELECT id FROM faq_item",
    );
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push( @FAQIDs, $Row[0] );
    }

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    ID:
    for my $ItemID (@FAQIDs) {

        # get FAQ data
        my %FAQ = $FAQObject->FAQGet(
            ItemID     => $ItemID,
            ItemFields => 1,
            UserID     => 1,
        );

        # get FAQ article fields 1-6
        my $FoundNewline;
        KEY:
        for my $Key (qw (Field1 Field2 Field3 Field4 Field5 Field6)) {
            next KEY if !$FAQ{$Key};

            # replace \n with <br>
            $FAQ{$Key} =~ s/\n/<br\/>\n/g;

            $FoundNewline = 1;
        }
        next ID if !$FoundNewline;

        # update FAQ data
        $FAQObject->FAQUpdate(
            %FAQ,
            UserID => 1,
        );
    }

    return 1;
}

=item _GroupAdd()

add a group

    my $Result = $CodeObject->_GroupAdd(
        Name        => 'the-group-name',
        Description => 'The group description.',
    );

=cut

sub _GroupAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Name Description)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # get valid list
    my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList(
        UserID => 1,
    );
    my %ValidListReverse = reverse %ValidList;

    # get group object
    my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

    # get list of all groups
    my %GroupList = $GroupObject->GroupList();

    # reverse the group list for easier lookup
    my %GroupListReverse = reverse %GroupList;

    # check if group already exists
    my $GroupID = $GroupListReverse{ $Param{Name} };

    # reactivate the group
    if ($GroupID) {

        # get current group data
        my %GroupData = $GroupObject->GroupGet(
            ID     => $GroupID,
            UserID => 1,
        );

        # reactivate group
        $GroupObject->GroupUpdate(
            %GroupData,
            ValidID => $ValidListReverse{valid},
            UserID  => 1,
        );

        return 1;
    }

    # add the group
    else {
        return if !$GroupObject->GroupAdd(
            Name    => $Param{Name},
            Comment => $Param{Description},
            ValidID => $ValidListReverse{valid},
            UserID  => 1,
        );
    }

    # lookup the new group id
    my $NewGroupID = $GroupObject->GroupLookup(
        Group  => $Param{Name},
        UserID => 1,
    );

    # add user root to the group
    $GroupObject->GroupMemberAdd(
        GID        => $NewGroupID,
        UID        => 1,
        Permission => {
            ro        => 1,
            move_into => 1,
            create    => 1,
            owner     => 1,
            priority  => 1,
            rw        => 1,
        },
        UserID => 1,
    );

    return 1;
}

=item _GroupDeactivate()

deactivate a group

    my $Result = $CodeObject->_GroupDeactivate(
        Name => 'the-group-name',
    );

=cut

sub _GroupDeactivate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Name!',
        );

        return;
    }

    # get group object
    my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

    # lookup group id
    my $GroupID = $GroupObject->GroupLookup(
        Group => $Param{Name},
    );

    return if !$GroupID;

    # get valid list
    my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList(
        UserID => 1,
    );
    my %ValidListReverse = reverse %ValidList;

    # get current group data
    my %GroupData = $GroupObject->GroupGet(
        ID     => $GroupID,
        UserID => 1,
    );

    # deactivate group
    $GroupObject->GroupUpdate(
        %GroupData,
        ValidID => $ValidListReverse{invalid},
        UserID  => 1,
    );

    return 1;
}

=item _LinkDelete()

delete all existing links to FAQ articles

    my $Result = $CodeObject->_LinkDelete();

=cut

sub _LinkDelete {
    my ( $Self, %Param ) = @_;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get all FAQ article ids
    my @FAQIDs = ();
    $DBObject->Prepare(
        SQL => 'SELECT id FROM faq_item'
    );
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @FAQIDs, $Row[0];
    }
    return if !@FAQIDs;

    # delete the FAQ article links
    for my $FAQID (@FAQIDs) {
        $Kernel::OM->Get('Kernel::System::LinkObject')->LinkDeleteAll(
            Object => 'FAQ',
            Key    => $FAQID,
            UserID => 1,
        );
    }

    return 1;
}

=item _CreateAditionalFAQLanguages()

creates additional FAQ languages for system default language and user language

    my $Result = $CodeObject->_CreateAditionalFAQLanguages();

=cut

sub _CreateAditionalFAQLanguages {
    my ( $Self, %Param ) = @_;

    # get system default language
    my $Language = $Kernel::OM->Get('Kernel::Config')->Get('DefaultLanguage');
    if ($Language) {

        # get FAQ object
        my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

        # get current FAQ languages
        my %CurrentLanguages = $FAQObject->LanguageList(
            UserID => 1,
        );

        # use reverse hash for easy lookup
        my %ReverseLanguages = reverse %CurrentLanguages;

        # check if language is already defined
        if ( !$ReverseLanguages{$Language} ) {

            # add language
            my $Success = $FAQObject->LanguageAdd(
                Name   => $Language,
                UserID => 1,
            );
        }
    }
    return 1;
}

=item _CategoryGroupSet()

Adds the given group permissions to the given category.

    my $Result = $CodeObject->_CategoryGroupSet(
        Category => 'Misc',
        Groups   => [ 'faq', 'faq-admin', 'faq_approval' ],
    );

=cut

sub _CategoryGroupSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Category Groups)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # check needed stuff
    if ( ref $Param{Groups} ne 'ARRAY' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Groups must be an array reference!",
        );

        return;
    }

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # get all categories and their ids
    my $CategoryTree = $FAQObject->CategoryTreeList(
        Valid  => 1,
        UserID => 1,
    );

    # create lookup hash for the category id
    my %FAQ2ID = reverse %{$CategoryTree};

    # lookup the category id
    my $CategoryID = $FAQ2ID{ $Param{Category} };

    # lookup the group ids
    my @GroupIDs;
    for my $Group ( @{ $Param{Groups} } ) {
        my $GroupID = $Kernel::OM->Get('Kernel::System::Group')->GroupLookup(
            Group => $Group,
        );
        push @GroupIDs, $GroupID;
    }

    # set category group
    $FAQObject->SetCategoryGroup(
        CategoryID => $CategoryID,
        GroupIDs   => \@GroupIDs,
        UserID     => 1,
    );

    return 1;
}

=item _DynamicFieldsDelete()

delete all existing dynamic fields for FAQ

    my $Result = $CodeObject->_DynamicFieldsDelete();

=cut

sub _DynamicFieldsDelete {
    my ( $Self, %Param ) = @_;

    my $DynamicFieldObject      = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $DynamicFieldValueObject = $Kernel::OM->Get('Kernel::System::DynamicFieldValue');

    # get the list of FAQ dynamic fields (valid and invalid ones)
    my $DynamicFieldList = $DynamicFieldObject->DynamicFieldListGet(
        Valid      => 0,
        ObjectType => ['FAQ'],
    );

    # delete the dynamic fields
    DYNAMICFIELD:
    for my $DynamicField ( @{$DynamicFieldList} ) {

        # delete all field values
        my $ValuesDeleteSuccess = $DynamicFieldValueObject->AllValuesDelete(
            FieldID => $DynamicField->{ID},
            UserID  => 1,
        );

        # values could be deleted
        if ($ValuesDeleteSuccess) {

            # delete field
            my $Success = $DynamicFieldObject->DynamicFieldDelete(
                ID     => $DynamicField->{ID},
                UserID => 1,
            );

            # check error
            if ( !$Success ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Could not delete dynamic field '$DynamicField->{Name}'!",
                );
            }
        }

        # values could not be deleted
        else {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Could not delete values for dynamic field '$DynamicField->{Name}'!",
            );
        }
    }

    return 1;
}

sub _MigrateDTLInSysConfig {

    # create needed objects
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ProviderObject  = Kernel::Output::Template::Provider->new();

    # get setting's content
    my $Setting = $ConfigObject->Get('FAQ::Frontend::MenuModule');
    return if !$Setting;

    MENUMODULE:
    for my $MenuModule ( sort keys %{$Setting} ) {

        SETTINGITEM:
        for my $SettingItem ( sort keys %{ $Setting->{$MenuModule} } ) {

            my $SettingContent = $Setting->{$MenuModule}->{$SettingItem};

            # do nothing no value for migrating
            next SETTINGITEM if !$SettingContent;

            my $TTContent;
            eval {
                $TTContent = $ProviderObject->MigrateDTLtoTT( Content => $SettingContent );
            };
            if ($@) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "$MenuModule->$SettingItem : $@!",
                );
            }
            else {
                $Setting->{$MenuModule}->{$SettingItem} = $TTContent;
            }
        }
        my $Success = $SysConfigObject->ConfigItemUpdate(
            Valid => 1,
            Key   => 'FAQ::Frontend::MenuModule',
            Value => $Setting,
        );
    }
    return 1;
}

sub _MigrateConfigs {

    # create needed objects
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    # migrate FAQ menu modules
    # get setting content for FAQ menu modules
    my $Setting = $ConfigObject->Get('FAQ::Frontend::MenuModule');

    MENUMODULE:
    for my $MenuModule ( sort keys %{$Setting} ) {

        # update module location
        my $Module = $Setting->{$MenuModule}->{'Module'};
        if ( $Module !~ m{Kernel::Output::HTML::FAQMenu(\w+)} ) {
            next MENUMODULE;
        }

        $Setting->{$MenuModule}->{Module} = "Kernel::Output::HTML::FAQMenu::Generic";

        # set new setting,
        my $Success = $SysConfigObject->ConfigItemUpdate(
            Valid => 1,
            Key   => 'FAQ::Frontend::MenuModule###' . $MenuModule,
            Value => $Setting->{$MenuModule},
        );
    }

    # migrate FAQ config items
    my @Configs = (
        {
            Name       => 'Frontend::HeaderMetaModule',
            ConfigItem => '3-FAQSearch',
            Module     => 'Kernel::Output::HTML::HeaderMeta::AgentFAQSearch',
        },
        {
            Name       => 'CustomerFrontend::HeaderMetaModule',
            ConfigItem => '3-FAQSearch',
            Module     => 'Kernel::Output::HTML::HeaderMeta::CustomerFAQSearch',
        },
        {
            Name       => 'PublicFrontend::HeaderMetaModule',
            ConfigItem => '3-FAQSearch',
            Module     => 'Kernel::Output::HTML::HeaderMeta::PublicFAQSearch',
        },
        {
            Name       => 'Frontend::Output::FilterElementPost',
            ConfigItem => 'FAQ',
            Module     => 'Kernel::Output::HTML::FilterElementPost::FAQ',
        },
        {
            Name       => 'FAQ::Frontend::Overview',
            ConfigItem => 'Small',
            Module     => 'Kernel::Output::HTML::FAQOverview::Small',
        },
        {
            Name       => 'FAQ::Frontend::JournalOverview',
            ConfigItem => 'Small',
            Module     => 'Kernel::Output::HTML::FAQJournalOverview::Small',
        },
        {
            Name       => 'PreferencesGroups',
            ConfigItem => 'FAQOverviewSmallPageShown',
            Module     => 'Kernel::Output::HTML::Preferences::Generic',
        },
        {
            Name       => 'PreferencesGroups',
            ConfigItem => 'FAQJournalOverviewSmallPageShown',
            Module     => 'Kernel::Output::HTML::Preferences::Generic',
        },
        {
            Name       => 'DashboardBackend',
            ConfigItem => '0398-FAQ-LastChange',
            Module     => 'Kernel::Output::HTML::Dashboard::FAQ',
        },
        {
            Name       => 'DashboardBackend',
            ConfigItem => '0399-FAQ-LastCreate',
            Module     => 'Kernel::Output::HTML::Dashboard::FAQ',
        },
        {
            Name       => 'Frontend::ToolBarModule',
            ConfigItem => '90-FAQ::AgentFAQAdd',
            Module     => 'Kernel::Output::HTML::ToolBar::Link',
        },
    );

    CONFIGITEM:
    for my $Config (@Configs) {

        # get setting content for header meta FAQ search
        my $Setting = $ConfigObject->Get( $Config->{Name} );
        next CONFIGITEM if !$Setting;

        my $ConfigItem = $Config->{ConfigItem};
        next CONFIGITEM if !$Setting->{$ConfigItem}->{'Module'};

        # set module
        $Setting->{$ConfigItem}->{'Module'} = $Config->{Module};

        # set new setting,
        my $Success = $SysConfigObject->ConfigItemUpdate(
            Valid => 1,
            Key   => $Config->{Name} . '###' . $ConfigItem,
            Value => $Setting->{$ConfigItem},
        );

    }

    return 1;
}

sub _SetContentType {

    return $Kernel::OM->Get('Kernel::System::FAQ')->FAQContentTypeSet();
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
