# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::packagesetup::ITSMChangeManagement;    ## no critic

use strict;
use warnings;

use Kernel::Output::Template::Provider;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DB',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicFieldValue',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::Group',
    'Kernel::System::ITSMChange',
    'Kernel::System::ITSMChange::History',
    'Kernel::System::ITSMChange::ITSMChangeCIPAllocate',
    'Kernel::System::ITSMChange::ITSMCondition',
    'Kernel::System::ITSMChange::ITSMStateMachine',
    'Kernel::System::ITSMChange::ITSMWorkOrder',
    'Kernel::System::ITSMChange::Notification',
    'Kernel::System::ITSMChange::Template',
    'Kernel::System::LinkObject',
    'Kernel::System::Log',
    'Kernel::System::Stats',
    'Kernel::System::SysConfig',
    'Kernel::System::Valid',
    'Kernel::System::XML',
);

=head1 NAME

ITSMChangeManagement.pm - code to excecute during package installation

=head1 SYNOPSIS

Functions for installing the ITSMChangeManagement package.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CodeObject = $Kernel::OM->Get('var::packagesetup::ITSMChangeManagement');

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

    # define file prefix for stats
    $Self->{FilePrefix} = 'ITSMStats';

    return $Self;
}

=item CodeInstall()

run the code install part

    my $Result = $CodeObject->CodeInstall();

=cut

sub CodeInstall {
    my ( $Self, %Param ) = @_;

    # add the group itsm-change
    $Self->_GroupAdd(
        Name        => 'itsm-change',
        Description => 'Group for ITSM Change mask access in the agent interface.',
    );

    # add the group itsm-change-builder
    $Self->_GroupAdd(
        Name        => 'itsm-change-builder',
        Description => 'Group for ITSM Change Builders.',
    );

    # add the group itsm-change-manager
    $Self->_GroupAdd(
        Name        => 'itsm-change-manager',
        Description => 'Group for ITSM Change Managers.',
    );

    # install stats
    $Kernel::OM->Get('Kernel::System::Stats')->StatsInstall(
        FilePrefix => $Self->{FilePrefix},
        UserID     => 1,
    );

    # set default CIP matrix
    $Self->_CIPDefaultMatrixSet();

    # set default StateMachine settings
    $Self->_StateMachineDefaultSet();

    # add notifications
    $Self->_AddNotifications();

    return 1;
}

=item CodeReinstall()

run the code reinstall part

    my $Result = $CodeObject->CodeReinstall();

=cut

sub CodeReinstall {
    my ( $Self, %Param ) = @_;

    # add the group itsm-change
    $Self->_GroupAdd(
        Name        => 'itsm-change',
        Description => 'Group for ITSM Change mask access in the agent interface.',
    );

    # add the group itsm-change-builder
    $Self->_GroupAdd(
        Name        => 'itsm-change-builder',
        Description => 'Group for ITSM Change Builders.',
    );

    # add the group itsm-change-manager
    $Self->_GroupAdd(
        Name        => 'itsm-change-manager',
        Description => 'Group for ITSM Change Managers.',
    );

    # install stats
    $Kernel::OM->Get('Kernel::System::Stats')->StatsInstall(
        FilePrefix => $Self->{FilePrefix},
        UserID     => 1,
    );

    # set default CIP matrix
    $Self->_CIPDefaultMatrixSet();

    # set default StateMachine settings
    $Self->_StateMachineDefaultSet();

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

    # set default CIP matrix (this is only done if no matrix exists)
    $Self->_CIPDefaultMatrixSet();

    return 1;
}

=item CodeUpgradeFromLowerThan_3_3_91()

This function is only executed if the installed module version is smaller than 3.3.91 (4.0.0 Beta 1).

my $Result = $CodeObject->CodeUpgradeFromLowerThan_3_3_91();

=cut

sub CodeUpgradeFromLowerThan_3_3_91 {    ## no critic
    my ( $Self, %Param ) = @_;

    # Migrate change and workorder freetext fields to dynamic fields.
    $Self->_MigrateFreeTextToDynamicFields();

    return 1;
}

=item CodeUpgradeFromLowerThan_4_0_2()

This function is only executed if the installed module version is smaller than 4.0.2.

my $Result = $CodeObject->CodeUpgradeFromLowerThan_4_0_2();

=cut

sub CodeUpgradeFromLowerThan_4_0_2 {    ## no critic
    my ( $Self, %Param ) = @_;

    # migrate the DTL Content in the SysConfig
    $Self->_MigrateDTLInSysConfig();

    return 1;
}

=item CodeUpgradeFromLowerThan_4_0_91()

This function is only executed if the installed module version is smaller than 4.0.91 (5.0.0 Beta 1).

my $Result = $CodeObject->CodeUpgradeFromLowerThan_4_0_91();

=cut

sub CodeUpgradeFromLowerThan_4_0_91 {    ## no critic
    my ( $Self, %Param ) = @_;

    # migrate notifications
    $Self->_MigrateNotifications();

    # change configurations to match the new module location.
    $Self->_MigrateConfigs();

    return 1;
}

=item CodeUpgradeFromLowerThan_5_0_12()

This function is only executed if the installed module version is smaller than 5.0.12.

my $Result = $CodeObject->CodeUpgradeFromLowerThan_5_0_12();

=cut

sub CodeUpgradeFromLowerThan_5_0_12 {    ## no critic
    my ( $Self, %Param ) = @_;

    # change configurations to match a new JavaScript file location
    $Self->_MigrateConfigsFromLowerThan_5_0_12();

    return 1;
}

=item CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    # delete all links with change and workorder objects
    $Self->_LinkDelete();

    # delete all existing attachments for changes and workorders
    $Self->_AttachmentDelete();

    # delete all dynamic fields for changes and workorders
    $Self->_DynamicFieldsDelete();

    # deactivate the group itsm-change
    $Self->_GroupDeactivate(
        Name => 'itsm-change',
    );

    # deactivate the group itsm-change-builder
    $Self->_GroupDeactivate(
        Name => 'itsm-change-builder',
    );

    # deactivate the group itsm-change-manager
    $Self->_GroupDeactivate(
        Name => 'itsm-change-manager',
    );

    return 1;
}

=begin Internal:

=item _MigrateFreeTextToDynamicFields()

Migrates the change and workorder freetext fields to dynamic fields.

    my $Success = $PackageSetup->_MigrateFreeTextToDynamicFields();

=cut

sub _MigrateFreeTextToDynamicFields {
    my ($Self) = @_;

    # ---------------------------------------------------------------------------------------------
    # Migrate freekey and freetext fields to dynamic fields (just the fields, the data comes later)
    # ---------------------------------------------------------------------------------------------

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get all configured change and workorder freekey and freetext numbers from sysconfig
    my @DynamicFields;
    for my $Type (qw(Change WorkOrder)) {

        FREETEXTNUMBER:
        for my $Number ( 1 .. 500 ) {

            # get freekey and freetext config
            my $FreeKeyConfig  = $ConfigObject->Get( $Type . 'FreeKey' . $Number );
            my $FreeTextConfig = $ConfigObject->Get( $Type . 'FreeText' . $Number );

            # only if a KEY config exists
            next FREETEXTNUMBER if !$FreeKeyConfig;

            # default label, same like the name
            my $Label = $Type . 'FreeText' . $Number;

            # the freekey has more than one entry, then we want to create
            # it as it's own dynamic field
            if ( ref $FreeKeyConfig eq 'HASH' && scalar keys %{$FreeKeyConfig} > 1 ) {

                # find out if possible none must be set or not
                my $PossibleNone = 0;
                if ( $FreeKeyConfig->{''} && $FreeKeyConfig->{''} eq '-' ) {
                    delete $FreeKeyConfig->{''};
                    $PossibleNone = 1;
                }

                push @DynamicFields, {
                    Name       => $Type . 'FreeKey' . $Number,
                    Label      => $Type . 'FreeKey' . $Number,
                    FieldType  => 'Dropdown',
                    ObjectType => 'ITSM' . $Type,
                    Config     => {
                        DefaultValue => $ConfigObject->Get( $Type . 'FreeKey' . $Number . '::DefaultSelection' ) || '',
                        Link         => '',
                        PossibleNone => $PossibleNone,
                        PossibleValues     => $FreeKeyConfig,
                        TranslatableValues => 1,
                    },
                };
            }

            # if the key has only one possible value for this entry we use it as the label
            # and we do NOT create an own FreeKEY field, only the FreeTEXT field!
            elsif ( ref $FreeKeyConfig eq 'HASH' && scalar keys %{$FreeKeyConfig} == 1 ) {

                # but we try to take the only entry of the KEY as label!
                for my $Key ( sort keys %{$FreeKeyConfig} ) {
                    if ( $FreeKeyConfig->{$Key} ) {
                        $Label = $FreeKeyConfig->{$Key};
                    }
                }
            }

            # freetext config is a hash -> we need a dropdown
            if ( $FreeTextConfig && ref $FreeTextConfig eq 'HASH' && %{$FreeTextConfig} ) {

                # find out if possible none must be set or not
                my $PossibleNone = 0;
                if ( $FreeTextConfig->{''} && $FreeTextConfig->{''} eq '-' ) {
                    delete $FreeTextConfig->{''};
                    $PossibleNone = 1;
                }

                push @DynamicFields, {
                    Name       => $Type . 'FreeText' . $Number,
                    Label      => $Label,
                    FieldType  => 'Dropdown',
                    ObjectType => 'ITSM' . $Type,
                    Config     => {
                        DefaultValue => $ConfigObject->Get( $Type . 'FreeText' . $Number . '::DefaultSelection' ) || '',
                        Link =>
                            $ConfigObject->Get( $Type . 'FreeText' . $Number . '::Link' )
                            || '',
                        PossibleNone       => $PossibleNone,
                        PossibleValues     => $FreeTextConfig,
                        TranslatableValues => 1,
                    },
                };
            }

            # no freetext config -> we need a text field
            else {

                push @DynamicFields, {
                    Name       => $Type . 'FreeText' . $Number,
                    Label      => $Label,
                    FieldType  => 'Text',
                    ObjectType => 'ITSM' . $Type,
                    Config     => {
                        DefaultValue => $ConfigObject->Get( $Type . 'FreeText' . $Number . '::DefaultSelection' ) || '',
                        Link =>
                            $ConfigObject->Get( $Type . 'FreeText' . $Number . '::Link' )
                            || '',
                    },
                };
            }
        }
    }

    # get all current dynamic fields
    my $DynamicFieldList = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid => 0,
    );

    # get the list of order numbers (is already sorted).
    my @DynamicfieldOrderList;
    for my $Dynamicfield ( @{$DynamicFieldList} ) {
        push @DynamicfieldOrderList, $Dynamicfield->{FieldOrder};
    }

    # get the last element from the order list and add 1
    my $NextOrderNumber = 1;
    if (@DynamicfieldOrderList) {
        $NextOrderNumber = $DynamicfieldOrderList[-1] + 1;
    }

    # get the valid id for "valid"
    my $ValidID = $Kernel::OM->Get('Kernel::System::Valid')->ValidLookup(
        Valid => 'valid',
    );

    # remember current setting for event module configuratiom
    my $EventModuleConfig = $ConfigObject->{'DynamicField::EventModulePost'}->{'100-UpdateITSMChangeConditions'};

    # temporary delete event module configuration
    delete $ConfigObject->{'DynamicField::EventModulePost'}->{'100-UpdateITSMChangeConditions'};

    DYNAMICFIELD:
    for my $DynamicField (@DynamicFields) {

        # create a new field
        my $FieldID = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldAdd(
            Name       => $DynamicField->{Name},
            Label      => $DynamicField->{Label},
            FieldOrder => $NextOrderNumber,
            FieldType  => $DynamicField->{FieldType},
            ObjectType => $DynamicField->{ObjectType},
            Config     => $DynamicField->{Config},
            ValidID    => $ValidID,
            UserID     => 1,
        );
        next DYNAMICFIELD if !$FieldID;

        # increase the order number
        $NextOrderNumber++;
    }

    # re-activate the config setting again
    $ConfigObject->{'DynamicField::EventModulePost'}->{'100-UpdateITSMChangeConditions'} = $EventModuleConfig;

    # ---------------------------------------------------------------------------------------------
    # Migrate the change and workorder data from freekey and freetext fields to dynamic fields
    # ---------------------------------------------------------------------------------------------

    # get the list of change and workorder dynamic fields
    $DynamicFieldList = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid      => 1,
        ObjectType => [ 'ITSMChange', 'ITSMWorkOrder' ],
    );

    # migrate the freekey and freetext data
    DYNAMICFIELD:
    for my $DynamicField ( @{$DynamicFieldList} ) {

        # get the table prefix and column name based on change or workorder
        my $TablePrefix;
        my $ColumnName;
        if ( $DynamicField->{ObjectType} eq 'ITSMChange' ) {
            $TablePrefix = 'change_free';
            $ColumnName  = 'change_id';
        }
        elsif ( $DynamicField->{ObjectType} eq 'ITSMWorkOrder' ) {
            $TablePrefix = 'change_wo_free';
            $ColumnName  = 'workorder_id';
        }

        # get the type (key or text) and the number from the name
        my $Number;
        my $TableName;
        if ( $DynamicField->{Name} =~ m{ \A (Change|WorkOrder)Free(Key|Text)(\d+) \z }xms ) {
            $TableName = $TablePrefix . lc($2);
            $Number    = $3;
        }
        else {
            next DYNAMICFIELD;
        }

        # get the old data
        next DYNAMICFIELD if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL => "SELECT $ColumnName, field_value
                    FROM $TableName
                    WHERE field_id = ?",
            Bind => [ \$Number ],
        );

        # fetch the result
        my @Data;
        while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
            push @Data, {
                ObjectID => $Row[0],
                Value    => $Row[1],
            };
        }

        # insert data into dynamic_field_value table
        RECORD:
        for my $Record (@Data) {

            next RECORD if !$Kernel::OM->Get('Kernel::System::DB')->Do(
                SQL => 'INSERT INTO dynamic_field_value
                        (field_id, object_id, value_text)
                        VALUES (?, ?, ?)',
                Bind => [
                    \$DynamicField->{ID},
                    \$Record->{ObjectID},
                    \$Record->{Value},
                ],
            );
        }
    }

    # ---------------------------------------------------------------------------------------------
    # Delete obsolete freekey and freetext field attributes from conditions
    # ---------------------------------------------------------------------------------------------

    # build a lookup hash for all new created change and workorder dynamic fields
    my %DynamicFieldName;
    for my $DynamicField (@DynamicFields) {
        $DynamicFieldName{ $DynamicField->{Name} } = 1;
    }

    # get all condition attributes
    my $ConditionAttributes = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->AttributeList(
        UserID => 1,
    );

    # reverse the list to lookup attribute names
    my %Attribute2ID = reverse %{$ConditionAttributes};

    ATTRIBUTE:
    for my $Attribute ( sort keys %Attribute2ID ) {

        # we are only interested in old change and workorder freekey and freetext attributes
        next ATTRIBUTE if $Attribute !~ m{ \A (Change|WorkOrder)Free(Key|Text)(\d+) \z }xms;

        # rename the attribute (add a prefix to the attribute)
        if ( $DynamicFieldName{$Attribute} ) {

            my $Success = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->AttributeUpdate(
                AttributeID => $Attribute2ID{$Attribute},
                Name        => 'DynamicField_' . $Attribute,
                UserID      => 1,
            );
        }

        # this attribute does not exist as dynamic field
        else {

            # delete this attribute from expression table
            next ATTRIBUTE if !$Kernel::OM->Get('Kernel::System::DB')->Do(
                SQL => 'DELETE FROM condition_expression
                        WHERE attribute_id = ?',
                Bind => [
                    \$Attribute2ID{$Attribute},
                ],
            );

            # delete this attribute from action table
            next ATTRIBUTE if !$Kernel::OM->Get('Kernel::System::DB')->Do(
                SQL => 'DELETE FROM condition_action
                        WHERE attribute_id = ?',
                Bind => [
                    \$Attribute2ID{$Attribute},
                ],
            );

            # delete this attribute from attribute table
            next ATTRIBUTE if !$Kernel::OM->Get('Kernel::System::DB')->Do(
                SQL => 'DELETE FROM condition_attribute
                        WHERE id = ?',
                Bind => [
                    \$Attribute2ID{$Attribute},
                ],
            );
        }
    }

    # ---------------------------------------------------------------------------------------------
    # Migrate freetext screen config
    # ---------------------------------------------------------------------------------------------

    # migrate change freetext frontend config
    CONFIGNAME:
    for my $ConfigName (
        qw(
        ITSMChange::Frontend::AgentITSMChangeAdd
        ITSMChange::Frontend::AgentITSMChangeEdit
        ITSMChange::Frontend::AgentITSMChangeSearch
        ITSMChange::Frontend::AgentITSMWorkOrderAdd
        ITSMWorkOrder::Frontend::AgentITSMWorkOrderEdit
        ITSMWorkOrder::Frontend::AgentITSMWorkOrderReport
        )
        )
    {

        my $FieldType;
        my $Config = $ConfigObject->Get($ConfigName);
        if ( $ConfigName =~ m{ AgentITSMWorkOrder }xms ) {
            $FieldType = 'WorkOrderFreeText';
        }
        else {
            $FieldType = 'ChangeFreeText';
        }
        $Config = $Config->{$FieldType};

        my %NewSetting;
        NUMBER:
        for my $Number ( sort keys %{$Config} ) {

            my $Value = $Config->{$Number};

            next NUMBER if !$Value;

            $NewSetting{ $FieldType . $Number } = $Value;
        }

        next CONFIGNAME if !%NewSetting;

        # update the sysconfig
        my $Success = $Kernel::OM->Get('Kernel::System::SysConfig')->ConfigItemUpdate(
            Valid => 1,
            Key   => $ConfigName . '###DynamicField',
            Value => \%NewSetting,
        );
    }

    my %ChangeDynamicFieldConfig;
    my %WorkorderDynamicFieldConfig;

    DYNAMICFIELD:
    for my $DynamicField ( @{$DynamicFieldList} ) {

        if ( $DynamicField->{ObjectType} eq 'ITSMChange' ) {
            $ChangeDynamicFieldConfig{ $DynamicField->{Name} } = 1;
        }
        elsif ( $DynamicField->{ObjectType} eq 'ITSMWorkOrder' ) {
            $WorkorderDynamicFieldConfig{ $DynamicField->{Name} } = 1;
        }
    }

    # show all change dynamic fields in the change zoom
    $Kernel::OM->Get('Kernel::System::SysConfig')->ConfigItemUpdate(
        Valid => 1,
        Key   => 'ITSMChange::Frontend::AgentITSMChangeZoom###DynamicField',
        Value => \%ChangeDynamicFieldConfig,
    );

    # show all workorder dynamic fields in the workorder zoom
    $Kernel::OM->Get('Kernel::System::SysConfig')->ConfigItemUpdate(
        Valid => 1,
        Key   => 'ITSMWorkOrder::Frontend::AgentITSMWorkOrderZoom###DynamicField',
        Value => \%WorkorderDynamicFieldConfig,
    );

    # ---------------------------------------------------------------------------------------------
    # Delete change and workorder freekey and freetext tables
    # ---------------------------------------------------------------------------------------------
    my @Drop = $Kernel::OM->Get('Kernel::System::DB')->SQLProcessor(
        Database => [

            # drop table change_freekey
            {
                Tag     => 'TableDrop',
                Name    => 'change_freekey',
                TagType => 'Start',
            },
            {
                Tag     => 'TableDrop',
                TagType => 'End',
            },

            # drop table change_freetext
            {
                Tag     => 'TableDrop',
                Name    => 'change_freetext',
                TagType => 'Start',
            },
            {
                Tag     => 'TableDrop',
                TagType => 'End',
            },

            # drop table change_wo_freekey
            {
                Tag     => 'TableDrop',
                Name    => 'change_wo_freekey',
                TagType => 'Start',
            },
            {
                Tag     => 'TableDrop',
                TagType => 'End',
            },

            # drop table change_wo_freetext
            {
                Tag     => 'TableDrop',
                Name    => 'change_wo_freetext',
                TagType => 'Start',
            },
            {
                Tag     => 'TableDrop',
                TagType => 'End',
            },
        ],
    );

    for my $SQL (@Drop) {
        $Kernel::OM->Get('Kernel::System::DB')->Do(
            SQL => $SQL,
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

    # get list of all groups
    my %GroupList = $Kernel::OM->Get('Kernel::System::Group')->GroupList();

    # reverse the group list for easier lookup
    my %GroupListReverse = reverse %GroupList;

    # check if group already exists
    my $GroupID = $GroupListReverse{ $Param{Name} };

    # reactivate the group
    if ($GroupID) {

        # get current group data
        my %GroupData = $Kernel::OM->Get('Kernel::System::Group')->GroupGet(
            ID     => $GroupID,
            UserID => 1,
        );

        # reactivate group
        $Kernel::OM->Get('Kernel::System::Group')->GroupUpdate(
            %GroupData,
            ValidID => $ValidListReverse{valid},
            UserID  => 1,
        );

        return 1;
    }

    # add the group
    else {
        return if !$Kernel::OM->Get('Kernel::System::Group')->GroupAdd(
            Name    => $Param{Name},
            Comment => $Param{Description},
            ValidID => $ValidListReverse{valid},
            UserID  => 1,
        );
    }

    # lookup the new group id
    my $NewGroupID = $Kernel::OM->Get('Kernel::System::Group')->GroupLookup(
        Group  => $Param{Name},
        UserID => 1,
    );

    # add user root to the group
    $Kernel::OM->Get('Kernel::System::Group')->GroupMemberAdd(
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

    # lookup group id
    my $GroupID = $Kernel::OM->Get('Kernel::System::Group')->GroupLookup(
        Group => $Param{Name},
    );

    return if !$GroupID;

    # get valid list
    my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList(
        UserID => 1,
    );
    my %ValidListReverse = reverse %ValidList;

    # get current group data
    my %GroupData = $Kernel::OM->Get('Kernel::System::Group')->GroupGet(
        ID     => $GroupID,
        UserID => 1,
    );

    # deactivate group
    $Kernel::OM->Get('Kernel::System::Group')->GroupUpdate(
        %GroupData,
        ValidID => $ValidListReverse{invalid},
        UserID  => 1,
    );

    return 1;
}

=item _CIPDefaultMatrixSet()

set the default CIP matrix

    my $Result = $CodeObject->_CIPDefaultMatrixSet();

=cut

sub _CIPDefaultMatrixSet {
    my ( $Self, %Param ) = @_;

    # get current allocation list
    my $List = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMChangeCIPAllocate')->AllocateList(
        UserID => 1,
    );

    return if !$List;
    return if ref $List ne 'HASH';

    # set no matrix if already defined
    return if %{$List};

    # define the allocations
    # $Allocation{Impact}->{Category} = Priority
    my %Allocation;
    $Allocation{'1 very low'}->{'1 very low'}   = '1 very low';
    $Allocation{'1 very low'}->{'2 low'}        = '1 very low';
    $Allocation{'1 very low'}->{'3 normal'}     = '2 low';
    $Allocation{'1 very low'}->{'4 high'}       = '2 low';
    $Allocation{'1 very low'}->{'5 very high'}  = '3 normal';
    $Allocation{'2 low'}->{'1 very low'}        = '1 very low';
    $Allocation{'2 low'}->{'2 low'}             = '2 low';
    $Allocation{'2 low'}->{'3 normal'}          = '2 low';
    $Allocation{'2 low'}->{'4 high'}            = '3 normal';
    $Allocation{'2 low'}->{'5 very high'}       = '4 high';
    $Allocation{'3 normal'}->{'1 very low'}     = '2 low';
    $Allocation{'3 normal'}->{'2 low'}          = '2 low';
    $Allocation{'3 normal'}->{'3 normal'}       = '3 normal';
    $Allocation{'3 normal'}->{'4 high'}         = '4 high';
    $Allocation{'3 normal'}->{'5 very high'}    = '4 high';
    $Allocation{'4 high'}->{'1 very low'}       = '2 low';
    $Allocation{'4 high'}->{'2 low'}            = '3 normal';
    $Allocation{'4 high'}->{'3 normal'}         = '4 high';
    $Allocation{'4 high'}->{'4 high'}           = '4 high';
    $Allocation{'4 high'}->{'5 very high'}      = '5 very high';
    $Allocation{'5 very high'}->{'1 very low'}  = '3 normal';
    $Allocation{'5 very high'}->{'2 low'}       = '4 high';
    $Allocation{'5 very high'}->{'3 normal'}    = '4 high';
    $Allocation{'5 very high'}->{'4 high'}      = '5 very high';
    $Allocation{'5 very high'}->{'5 very high'} = '5 very high';

    # get impact list
    my $ImpactList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ChangeManagement::Impact',
    );
    my %ImpactListReverse = reverse %{$ImpactList};

    # get category list
    my $CategoryList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ChangeManagement::Category',
    );
    my %CategoryListReverse = reverse %{$CategoryList};

    # get priority list
    my $PriorityList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ChangeManagement::Priority',
    );
    my %PriorityListReverse = reverse %{$PriorityList};

    # create the allocation matrix
    my %AllocationMatrix;
    IMPACT:
    for my $Impact ( sort keys %Allocation ) {

        next IMPACT if !$ImpactListReverse{$Impact};

        # extract impact id
        my $ImpactID = $ImpactListReverse{$Impact};

        CATEGORY:
        for my $Category ( sort keys %{ $Allocation{$Impact} } ) {

            next CATEGORY if !$CategoryListReverse{$Category};

            # extract priority
            my $Priority = $Allocation{$Impact}->{$Category};

            next CATEGORY if !$PriorityListReverse{$Priority};

            # extract criticality id and priority id
            my $CategoryID = $CategoryListReverse{$Category};
            my $PriorityID = $PriorityListReverse{$Priority};

            $AllocationMatrix{$ImpactID}->{$CategoryID} = $PriorityID;
        }
    }

    # save the matrix
    $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMChangeCIPAllocate')->AllocateUpdate(
        AllocateData => \%AllocationMatrix,
        UserID       => 1,
    );

    return 1;
}

=item _StateMachineDefaultSet()

set the default state machine

    my $Result = $CodeObject->_StateMachineDefaultSet();

=cut

sub _StateMachineDefaultSet {
    my ( $Self, %Param ) = @_;

    # get the change states from the general catalog
    my %Name2ChangeStateID = reverse %{
        $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
            Class => 'ITSM::ChangeManagement::Change::State',
            )
    };

    # get the workorder states from the general catalog
    my %Name2WorkOrderStateID = reverse %{
        $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
            Class => 'ITSM::ChangeManagement::WorkOrder::State',
            )
    };

    # define ChangeState transitions
    my %ChangeStateTransitions = (
        0           => ['requested'],
        'requested' => [ 'rejected', 'retracted', 'pending approval', 'in progress' ],
        'pending approval' => [ 'rejected',  'retracted', 'approved' ],
        'approved'         => [ 'retracted', 'in progress' ],
        'in progress' => [ 'pending pir', 'retracted', 'failed', 'successful', 'canceled' ],
        'pending pir' => [ 'failed',      'successful' ],
        'rejected'    => [0],
        'retracted'   => [0],
        'failed'      => [0],
        'successful'  => [0],
        'canceled'    => [0],
    );

    # define WorkOrderState transitions
    my %WorkOrderStateTransitions = (
        0             => ['created'],
        'created'     => [ 'accepted', 'canceled' ],
        'accepted'    => [ 'ready', 'canceled' ],
        'ready'       => [ 'in progress', 'canceled' ],
        'in progress' => [ 'closed', 'canceled' ],
        'canceled'    => [0],
        'closed'      => [0],
    );

    # insert ChangeState transitions into database
    for my $State ( sort keys %ChangeStateTransitions ) {

        for my $NextState ( @{ $ChangeStateTransitions{$State} } ) {

            # add state transition
            my $TransitionID = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMStateMachine')->StateTransitionAdd(
                StateID     => $Name2ChangeStateID{$State}     || 0,
                NextStateID => $Name2ChangeStateID{$NextState} || 0,
                Class       => 'ITSM::ChangeManagement::Change::State',
            );
        }
    }

    # insert WorkOrderState transitions into database
    for my $State ( sort keys %WorkOrderStateTransitions ) {

        for my $NextState ( @{ $WorkOrderStateTransitions{$State} } ) {

            # add state transition
            my $TransitionID = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMStateMachine')->StateTransitionAdd(
                StateID     => $Name2WorkOrderStateID{$State}     || 0,
                NextStateID => $Name2WorkOrderStateID{$NextState} || 0,
                Class       => 'ITSM::ChangeManagement::WorkOrder::State',
            );
        }
    }

    return 1;
}

=item _LinkDelete()

delete all existing links with change and workorder objects

    my $Result = $CodeObject->_LinkDelete();

=cut

sub _LinkDelete {
    my ( $Self, %Param ) = @_;

    # get all change object ids
    my $ChangeIDs = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeList(
        UserID => 1,
    );

    # delete all change links
    if ( $ChangeIDs && ref $ChangeIDs eq 'ARRAY' ) {

        CHANGEID:
        for my $ChangeID ( @{$ChangeIDs} ) {

            # delete all links to this change
            $Kernel::OM->Get('Kernel::System::LinkObject')->LinkDeleteAll(
                Object => 'ITSMChange',
                Key    => $ChangeID,
                UserID => 1,
            );

            # get all workorder ids for this change
            my $WorkOrderIDs = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderList(
                ChangeID => $ChangeID,
                UserID   => 1,
            );

            next CHANGEID if !$WorkOrderIDs;
            next CHANGEID if ref $WorkOrderIDs ne 'ARRAY';

            # delete all workorder links
            for my $WorkOrderID ( @{$WorkOrderIDs} ) {
                $Kernel::OM->Get('Kernel::System::LinkObject')->LinkDeleteAll(
                    Object => 'ITSMWorkOrder',
                    Key    => $WorkOrderID,
                    UserID => 1,
                );
            }
        }
    }

    return 1;
}

=item _AttachmentDelete()

delete all existing attachments for changes and workorders

    my $Result = $CodeObject->_AttachmentDelete();

=cut

sub _AttachmentDelete {
    my ( $Self, %Param ) = @_;

    # get all change object ids
    my $ChangeIDs = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeList(
        UserID => 1,
    );

    for my $ChangeID ( @{$ChangeIDs} ) {

        # get the list of all change attachments
        my @ChangeAttachments = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeAttachmentList(
            ChangeID => $ChangeID,
        );

        # delete all change attachments
        for my $Filename (@ChangeAttachments) {

            $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeAttachmentDelete(
                ChangeID => $ChangeID,
                Filename => $Filename,
                UserID   => 1,
            );
        }

        # get all workorder ids for this change
        my $WorkOrderIDs = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderList(
            ChangeID => $ChangeID,
            UserID   => 1,
        );

        for my $WorkOrderID ( @{$WorkOrderIDs} ) {

            # get the list of all workorder attachments
            my @WorkOrderAttachments
                = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderAttachmentList(
                WorkOrderID => $WorkOrderID,
                );

            # delete all workorder attachments
            for my $Filename (@WorkOrderAttachments) {

                $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderAttachmentDelete(
                    ChangeID       => $ChangeID,
                    WorkOrderID    => $WorkOrderID,
                    Filename       => $Filename,
                    AttachmentType => 'WorkOrder',
                    UserID         => 1,
                );
            }

            # get the list of all workorder report attachments
            my @ReportAttachments
                = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderReportAttachmentList(
                WorkOrderID => $WorkOrderID,
                );

            # delete all workorder report attachments
            for my $Filename (@ReportAttachments) {

                $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderAttachmentDelete(
                    ChangeID       => $ChangeID,
                    WorkOrderID    => $WorkOrderID,
                    Filename       => $Filename,
                    AttachmentType => 'WorkOrderReport',
                    UserID         => 1,
                );
            }
        }
    }

    return 1;
}

=item _DynamicFieldsDelete()

delete all existing dynamic fields for changes and workorders

    my $Result = $CodeObject->_DynamicFieldsDelete();

=cut

sub _DynamicFieldsDelete {
    my ( $Self, %Param ) = @_;

    my $DynamicFieldObject      = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $DynamicFieldValueObject = $Kernel::OM->Get('Kernel::System::DynamicFieldValue');

    # get the list of change and workorder dynamic fields (valid and invalid ones)
    my $DynamicFieldList = $DynamicFieldObject->DynamicFieldListGet(
        Valid      => 0,
        ObjectType => [ 'ITSMChange', 'ITSMWorkOrder' ],
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
                $Self->{LogObject}->Log(
                    Priority => 'error',
                    Message  => "Could not delete dynamic field '$DynamicField->{Name}'!",
                );
            }
        }

        # values could not be deleted
        else {
            $Self->{LogObject}->Log(
                Priority => 'error',
                Message  => "Could not delete values for dynamic field '$DynamicField->{Name}'!",
            );
        }
    }

    return 1;
}

=item _AddNotifications()

Add ChangeManagement specific notifications.

    my $Success = $SetupObject->_AddNotifications;

=cut

sub _AddNotifications {
    my ($Self) = @_;

    # Set up some standard texts for English, German, Hungarian and Dutch, Change and WorkOrder, agent and customer
    # The customer texts provide no link.

    # Change info for agents (en)
    my $ChangeInfoAgentEn = "\n"
        . "\n"
        . "Change title: <OTRS_CHANGE_ChangeTitle>\n"
        . "Change builder: <OTRS_CHANGE_ChangeBuilder>\n"
        . "Change manager: <OTRS_CHANGE_ChangeManager>\n"
        . "Current change state: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMChangeZoom;ChangeID=<OTRS_CHANGE_ChangeID>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Change info for customers (en)
    my $ChangeInfoCustomerEn = "\n"
        . "\n"
        . "Change title: <OTRS_CHANGE_ChangeTitle>\n"
        . "Current change state: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Change info for agents (de)
    my $ChangeInfoAgentDe = "\n"
        . "\n"
        . "Change Titel: <OTRS_CHANGE_ChangeTitle>\n"
        . "Change-Builder: <OTRS_CHANGE_ChangeBuilder>\n"
        . "Change-Manager: <OTRS_CHANGE_ChangeManager>\n"
        . "Aktueller Change Status: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMChangeZoom;ChangeID=<OTRS_CHANGE_ChangeID>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Change info for customers (de)
    my $ChangeInfoCustomerDe = "\n"
        . "\n"
        . "Change Titel: <OTRS_CHANGE_ChangeTitle>\n"
        . "Aktueller Change Status: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Change info for agents (hu)
    my $ChangeInfoAgentHu = "\n"
        . "\n"
        . "Változáscím: <OTRS_CHANGE_ChangeTitle>\n"
        . "Változás-összeállító: <OTRS_CHANGE_ChangeBuilder>\n"
        . "Változásmenedzser: <OTRS_CHANGE_ChangeManager>\n"
        . "Jelenlegi változásállapot: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMChangeZoom;ChangeID=<OTRS_CHANGE_ChangeID>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Change info for customers (hu)
    my $ChangeInfoCustomerHu = "\n"
        . "\n"
        . "Változáscím: <OTRS_CHANGE_ChangeTitle>\n"
        . "Jelenlegi változásállapot: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Change info for agents (nl)
    my $ChangeInfoAgentNl = "\n"
        . "\n"
        . "Change-titel: <OTRS_CHANGE_ChangeTitle>\n"
        . "Change-Builder: <OTRS_CHANGE_ChangeBuilder>\n"
        . "Change-Manager: <OTRS_CHANGE_ChangeManager>\n"
        . "Actuele change-status: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMChangeZoom;ChangeID=<OTRS_CHANGE_ChangeID>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Change info for customers (nl)
    my $ChangeInfoCustomerNl = "\n"
        . "\n"
        . "Change-titel: <OTRS_CHANGE_ChangeTitle>\n"
        . "Actuele change-status: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Workorder info for customers (en)
    my $WorkOrderInfoCustomerEn = "\n"
        . "\n"
        . "Change title: <OTRS_CHANGE_ChangeTitle>\n"
        . "Current change state: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "Workorder title: <OTRS_WORKORDER_WorkOrderTitle>\n"
        . "Workorder type: <OTRS_WORKORDER_WorkOrderType>\n"
        . "Workorder agent: <OTRS_WORKORDER_WorkOrderAgent>\n"
        . "Current workorder state: <OTRS_WORKORDER_WorkOrderState>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Workorder info for agents (en)
    my $WorkOrderInfoAgentEn = "\n"
        . "\n"
        . "Change title: <OTRS_CHANGE_ChangeTitle>\n"
        . "Current change state: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "Workorder title: <OTRS_WORKORDER_WorkOrderTitle>\n"
        . "Workorder type: <OTRS_WORKORDER_WorkOrderType>\n"
        . "Current workorder state: <OTRS_WORKORDER_WorkOrderState>\n"
        . "\n"
        . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMWorkOrderZoom;WorkOrderID=<OTRS_WORKORDER_WorkOrderID>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Workorder info for agents (de)
    my $WorkOrderInfoAgentDe = "\n"
        . "\n"
        . "Change Titel: <OTRS_CHANGE_ChangeTitle>\n"
        . "Aktueller Change Status: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "Workorder Titel: <OTRS_WORKORDER_WorkOrderTitle>\n"
        . "Workorder Typ: <OTRS_WORKORDER_WorkOrderType>\n"
        . "Workorder Agent: <OTRS_WORKORDER_WorkOrderAgent>\n"
        . "Aktueller Workorder Status: <OTRS_WORKORDER_WorkOrderState>\n"
        . "\n"
        . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMWorkOrderZoom;WorkOrderID=<OTRS_WORKORDER_WorkOrderID>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Workorder info for customers (de)
    my $WorkOrderInfoCustomerDe = "\n"
        . "\n"
        . "Change Titel: <OTRS_CHANGE_ChangeTitle>\n"
        . "Aktueller Change Status: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "Workorder Titel: <OTRS_WORKORDER_WorkOrderTitle>\n"
        . "Workorder Typ: <OTRS_WORKORDER_WorkOrderType>\n"
        . "Aktueller Workorder Status: <OTRS_WORKORDER_WorkOrderState>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Workorder info for customers (hu)
    my $WorkOrderInfoCustomerHu = "\n"
        . "\n"
        . "Változáscím: <OTRS_CHANGE_ChangeTitle>\n"
        . "Jelenlegi változásállapot: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "Munkamegrendelés-cím: <OTRS_WORKORDER_WorkOrderTitle>\n"
        . "Munkamegrendelés-típus: <OTRS_WORKORDER_WorkOrderType>\n"
        . "Munkamegrendelés-ügyintéző: <OTRS_WORKORDER_WorkOrderAgent>\n"
        . "Jelenlegi munkamegrendelés-állapot: <OTRS_WORKORDER_WorkOrderState>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Workorder info for agents (hu)
    my $WorkOrderInfoAgentHu = "\n"
        . "\n"
        . "Változáscím: <OTRS_CHANGE_ChangeTitle>\n"
        . "Jelenlegi változásállapot: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "Munkamegrendelés-cím: <OTRS_WORKORDER_WorkOrderTitle>\n"
        . "Munkamegrendelés-típus: <OTRS_WORKORDER_WorkOrderType>\n"
        . "Jelenlegi munkamegrendelés-állapot: <OTRS_WORKORDER_WorkOrderState>\n"
        . "\n"
        . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMWorkOrderZoom;WorkOrderID=<OTRS_WORKORDER_WorkOrderID>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Workorder info for agents (nl)
    my $WorkOrderInfoAgentNl = "\n"
        . "\n"
        . "Change-titel: <OTRS_CHANGE_ChangeTitle>\n"
        . "Actuele change-status: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "Work Order-titel: <OTRS_WORKORDER_WorkOrderTitle>\n"
        . "Work Order-type: <OTRS_WORKORDER_WorkOrderType>\n"
        . "Work Order-agent: <OTRS_WORKORDER_WorkOrderAgent>\n"
        . "Actuele Work Order-status: <OTRS_WORKORDER_WorkOrderState>\n"
        . "\n"
        . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMWorkOrderZoom;WorkOrderID=<OTRS_WORKORDER_WorkOrderID>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # Workorder info for customers (nl)
    my $WorkOrderInfoCustomerNl = "\n"
        . "\n"
        . "Change-titel: <OTRS_CHANGE_ChangeTitle>\n"
        . "Actuele change-status: <OTRS_CHANGE_ChangeState>\n"
        . "\n"
        . "Work Order-titel: <OTRS_WORKORDER_WorkOrderTitle>\n"
        . "Work Order-type: <OTRS_WORKORDER_WorkOrderType>\n"
        . "Actuele Work Order-status: <OTRS_WORKORDER_WorkOrderState>\n"
        . "\n"
        . "-- <OTRS_CONFIG_NotificationSenderName>\n";

    # define notifications and recipients
    my @Notifications = (
        {
            Name      => 'requested changes',
            Attribute => '',
            Event     => 'ChangeAdd',
            ValidID   => 1,
            Comment   => 'inform recipients that a change was requested',
            Rule      => '',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] neu erstellt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde neu erstellt.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] created',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was created.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] létrehozva',
                        Body =>
                            'Létrejött a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aangemaakt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is aangemaakt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] neu erstellt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde neu erstellt.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] created',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was created.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] létrehozva',
                        Body =>
                            'Létrejött a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aangemaakt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is aangemaakt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [ 'ChangeManager', 'ChangeBuilder' ],
        },
        {
            Name      => 'pending approval changes',
            Attribute => 'ChangeState',
            Event     => 'ChangeUpdate',
            ValidID   => 1,
            Comment   => 'inform recipients that a change waits for approval',
            Rule      => 'pending approval',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [ 'ChangeManager', 'CABCustomers', 'CABAgents' ],
        },
        {
            Name      => 'pending PIR changes',
            Attribute => 'ChangeState',
            Event     => 'ChangeUpdate',
            ValidID   => 1,
            Comment   => 'inform recipients that a change waits for PIR',
            Rule      => 'pending pir',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => ['ChangeManager'],
        },
        {
            Name      => 'rejected changes',
            Attribute => 'ChangeState',
            Event     => 'ChangeUpdate',
            ValidID   => 1,
            Comment   => 'inform recipients that a change was rejected',
            Rule      => 'rejected',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'ChangeInitiators', 'CABCustomers', 'CABAgents', 'WorkOrderAgents',
            ],
        },
        {
            Name      => 'approved changes',
            Attribute => 'ChangeState',
            Event     => 'ChangeUpdate',
            ValidID   => 1,
            Comment   => 'inform recipients that a change was approved',
            Rule      => 'approved',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'ChangeInitiators', 'CABCustomers', 'CABAgents',
                'WorkOrderAgents',
            ],
        },
        {
            Name      => 'changes in progress',
            Attribute => 'ChangeState',
            Event     => 'ChangeUpdate',
            ValidID   => 1,
            Comment   => 'inform recipients that a change is in progress',
            Rule      => 'in progress',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [ 'ChangeManager', 'WorkOrderAgents' ],
        },
        {
            Name      => 'successful changes',
            Attribute => 'ChangeState',
            Event     => 'ChangeUpdate',
            ValidID   => 1,
            Comment   => 'inform recipients that a change was successful',
            Rule      => 'successful',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'ChangeInitiators', 'CABCustomers', 'CABAgents', 'WorkOrderAgents',
            ],
        },
        {
            Name      => 'failed changes',
            Attribute => 'ChangeState',
            Event     => 'ChangeUpdate',
            ValidID   => 1,
            Comment   => 'inform recipients that a change failed',
            Rule      => 'failed',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'ChangeInitiators', 'CABCustomers', 'CABAgents', 'WorkOrderAgents',
            ],
        },
        {
            Name      => 'canceled changes',
            Attribute => 'ChangeState',
            Event     => 'ChangeUpdate',
            ValidID   => 1,
            Comment   => 'inform recipients that a change was canceled',
            Rule      => 'canceled',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [ 'ChangeBuilder', 'ChangeManager' ],
        },
        {
            Name      => 'retracted changes',
            Attribute => 'ChangeState',
            Event     => 'ChangeUpdate',
            ValidID   => 1,
            Comment   => 'inform recipients that a change was retracted',
            Rule      => 'retracted',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'ChangeInitiators', 'CABCustomers', 'CABAgents', 'WorkOrderAgents',
            ],
        },
        {
            Name      => 'ChangeManager update',
            Attribute => 'ChangeManagerID',
            Event     => 'ChangeUpdate',
            ValidID   => 1,
            Comment   => 'inform recipients that the changemanager was replaced',
            Rule      => '.*',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeManager', 'OldChangeManager',
            ],
        },
        {
            Name      => 'ChangeBuilder update',
            Attribute => 'ChangeBuilderID',
            Event     => 'ChangeUpdate',
            ValidID   => 1,
            Comment   => 'inform recipients that the changebuilder was replaced',
            Rule      => '.*',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aktualisiert',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde aktualisiert.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] updated',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was updated.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] frissítve',
                        Body =>
                            'Frissült a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] bijgewerkt',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is bijgewerkt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeManager', 'ChangeBuilder', 'OldChangeBuilder',
            ],
        },
        {
            Name      => 'new workorder',
            Attribute => '',
            Event     => 'WorkOrderAdd',
            ValidID   => 1,
            Comment   => 'inform recipients that a workorder was added',
            Rule      => '',
            Message   => {
                Agent => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] neu erstellt',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> wurde neu erstellt.'
                            . $WorkOrderInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] created',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> was created.'
                            . $WorkOrderInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] létrehozva',
                        Body =>
                            'Létrejött a következő munkamegrendelés: <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>.'
                            . $WorkOrderInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] aangemaakt',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> is aangemaakt.'
                            . $WorkOrderInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] neu erstellt',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> wurde neu erstellt.'
                            . $WorkOrderInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] created',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> was created.'
                            . $WorkOrderInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] létrehozva',
                        Body =>
                            'Létrejött a következő munkamegrendelés: <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>.'
                            . $WorkOrderInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] aangemaakt',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> is aangemaakt.'
                            . $WorkOrderInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'WorkOrderAgent',
            ],
        },
        {
            Name      => 'updated state for workorder',
            Attribute => 'WorkOrderState',
            Event     => 'WorkOrderUpdate',
            ValidID   => 1,
            Comment   => 'inform recipients that a the state of a workorder was changed',
            Rule      => '.*',
            Message   => {
                Agent => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] aktualisiert',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> wurde aktualisiert.'
                            . $WorkOrderInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] updated',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> was updated.'
                            . $WorkOrderInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] frissítve',
                        Body =>
                            'Frissült a következő munkamegrendelés: <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>.'
                            . $WorkOrderInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] bijgewerkt',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> is bijgewerkt.'
                            . $WorkOrderInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] aktualisiert',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> wurde aktualisiert.'
                            . $WorkOrderInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] updated',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> was updated.'
                            . $WorkOrderInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] frissítve',
                        Body =>
                            'Frissült a következő munkamegrendelés: <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>.'
                            . $WorkOrderInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] bijgewerkt',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> is bijgewerkt.'
                            . $WorkOrderInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'WorkOrderAgents',
            ],
        },
        {
            Name      => 'updated workorder agent for workorder',
            Attribute => 'WorkOrderAgentID',
            Event     => 'WorkOrderUpdate',
            ValidID   => 1,
            Comment   => 'inform recipients that the workorder agent was replaced',
            Rule      => '.*',
            Message   => {
                Agent => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] aktualisiert',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> wurde aktualisiert.'
                            . $WorkOrderInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] updated',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> was updated.'
                            . $WorkOrderInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] frissítve',
                        Body =>
                            'Frissült a következő munkamegrendelés: <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>.'
                            . $WorkOrderInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] bijgewerkt',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> is bijgewerkt.'
                            . $WorkOrderInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] aktualisiert',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> wurde aktualisiert.'
                            . $WorkOrderInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] updated',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> was updated.'
                            . $WorkOrderInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] frissítve',
                        Body =>
                            'Frissült a következő munkamegrendelés: <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>.'
                            . $WorkOrderInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] bijgewerkt',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> is bijgewerkt.'
                            . $WorkOrderInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'WorkOrderAgent', 'OldWorkOrderAgent',
            ],
        },
        {
            Name      => 'ticket linked to change',
            Attribute => '',
            Event     => 'ChangeLinkAdd',
            ValidID   => 1,
            Comment   => 'inform recipients that a ticket was linked to the change',
            Rule      => '',
            Message   => {
                Agent => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] <OTRS_LINK_Object> verknüpft',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde mit einem <OTRS_LINK_Object> verknüpft.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] <OTRS_LINK_Object> linked',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was linked to a <OTRS_LINK_Object> .'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] <OTRS_LINK_Object> összekapcsolva',
                        Body =>
                            'A(z) <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> változást összekapcsolták egy <OTRS_LINK_Object> objektummal.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] <OTRS_LINK_Object> linked',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is gekoppeld aan een <OTRS_LINK_Object> .'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] <OTRS_LINK_Object> verknüpft',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde mit einem <OTRS_LINK_Object> verknüpft.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] <OTRS_LINK_Object> linked',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was linked to a <OTRS_LINK_Object> .'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] <OTRS_LINK_Object> összekapcsolva',
                        Body =>
                            'A(z) <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> változást összekapcsolták egy <OTRS_LINK_Object> objektummal.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] <OTRS_LINK_Object> gekoppeld',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is gekoppeld aan een <OTRS_LINK_Object> .'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'ChangeInitiators',
            ],
        },
        {
            Name      => 'planned start time of change reached',
            Attribute => '',
            Event     => 'ChangePlannedStartTimeReached',
            ValidID   => 1,
            Comment   => 'inform recipients that a change has reached the planned start time',
            Rule      => '',
            Message   => {
                Agent => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] geplante Startzeit erreicht',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> hat die geplante Startzeit erreicht.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Planned Start Time reached',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> has reached its Planned Start Time.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] tervezett kezdési idő elérve',
                        Body =>
                            'A(z) <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> változás elérte a tervezett kezdési idejét.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] geplande starttijd bereikt',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> heeft de geplande starttijd bereikt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] geplante Startzeit erreicht',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> hat die geplante Startzeit erreicht.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Planned Start Time reached',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> has reached its Planned Start Time.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] tervezett kezdési idő elérve',
                        Body =>
                            'A(z) <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> változás elérte a tervezett kezdési idejét.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] geplande starttijd bereikt',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> heeft de geplande starttijd bereikt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'ChangeManager',
            ],
        },
        {
            Name      => 'planned end time of change reached',
            Attribute => '',
            Event     => 'ChangePlannedEndTimeReached',
            ValidID   => 1,
            Comment   => 'inform recipients that a change has reached the planned end time',
            Rule      => '',
            Message   => {
                Agent => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] geplante Endzeit erreicht',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> hat die geplante Endzeit erreicht.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Planned End Time reached',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> has reached its Planned End Time.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] tervezett befejezési idő elérve',
                        Body =>
                            'A(z) <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> változás elérte a tervezett befejezési idejét.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] geplande eindttijd bereikt',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> heeft de geplande eindtijd bereikt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] geplante Endzeit erreicht',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> hat die geplante Endzeit erreicht.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Planned End Time reached',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> has reached its Planned End Time.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] tervezett befejezési idő elérve',
                        Body =>
                            'A(z) <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> változás elérte a tervezett befejezési idejét.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] geplande eindtijd bereikt',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> heeft de geplande eindtijd bereikt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'ChangeManager',
            ],
        },
        {
            Name      => 'actual start time of change reached',
            Attribute => '',
            Event     => 'ChangeActualStartTimeReached',
            ValidID   => 1,
            Comment   => 'inform recipients that a change has reached the actual start time',
            Rule      => '',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] begonnen',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde begonnen.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] started',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> has started.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] elkezdődött',
                        Body =>
                            'Elkezdődött a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] gestart',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is gestart.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] begonnen',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde begonnen.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] started',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> has started.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] elkezdődött',
                        Body =>
                            'Elkezdődött a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] gestart',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is gestart.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'ChangeManager',
            ],
        },
        {
            Name      => 'actual end time of change reached',
            Attribute => '',
            Event     => 'ChangeActualEndTimeReached',
            ValidID   => 1,
            Comment   => 'inform recipients that a change has reached the actual end time',
            Rule      => '',
            Message   => {
                Agent => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] abgeschlossen',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde abgeschlossen.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] finished',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was finished.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] befejeződött',
                        Body =>
                            'Befejeződött a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] afgerond',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is afgerond.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] abgeschlossen',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> wurde abgeschlossen.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] finished',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> was finished.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] befejeződött',
                        Body =>
                            'Befejeződött a következő változás: <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] afgerond',
                        Body    => '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> is afgerond.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'ChangeManager',
            ],
        },
        {
            Name      => 'requested time of change reached',
            Attribute => '',
            Event     => 'ChangeRequestedTimeReached',
            ValidID   => 1,
            Comment   => 'inform recipients that a change has reached the requested time',
            Rule      => '',
            Message   => {
                Agent => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Gewünschte Fertigstellungszeit erreicht',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> hat die gewünschte Fertigstellungszeit erreicht.'
                            . $ChangeInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] requested time reached',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> has reached its requested time.'
                            . $ChangeInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] kért idő elérve',
                        Body =>
                            'A(z) <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> változás elérte a kért idejét.'
                            . $ChangeInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aangevraagd tijdstip bereikt',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> heeft het aangevraagde tijdstip bereikt.'
                            . $ChangeInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Gewünschte Fertigstellungszeit erreicht',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> hat die gewünschte Fertigstellungszeit erreicht.'
                            . $ChangeInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] requested time reached',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> has reached its requested time.'
                            . $ChangeInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject => '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] kért idő elérve',
                        Body =>
                            'A(z) <OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> változás elérte a kért idejét.'
                            . $ChangeInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] aangevraagd tijdstip bereikt',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> heeft het aangevraagde tijdstip bereikt.'
                            . $ChangeInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder', 'ChangeManager',
            ],
        },
        {
            Name      => 'planned start time of workorder reached',
            Attribute => '',
            Event     => 'WorkOrderPlannedStartTimeReached',
            ValidID   => 1,
            Comment   => 'inform recipients that a workorder has reached the planned start time',
            Rule      => '',
            Message   => {
                Agent => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] geplante Startzeit erreicht',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> hat die geplante Startzeit erreicht.'
                            . $WorkOrderInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] Planned Start Time reached',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> has reached the Planned Start Time.'
                            . $WorkOrderInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] tervezett kezdési idő elérve',
                        Body =>
                            'A(z) <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> munkamegrendelés elérte a tervezett kezdési idejét.'
                            . $WorkOrderInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] geplande starttijd bereikt',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> heeft de geplande starttijd bereikt.'
                            . $WorkOrderInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] geplante Startzeit erreicht',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> hat die geplante Startzeit erreicht.'
                            . $WorkOrderInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] Planned Start Time reached',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> has reached the Planned Start Time.'
                            . $WorkOrderInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] tervezett kezdési idő elérve',
                        Body =>
                            'A(z) <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> munkamegrendelés elérte a tervezett kezdési idejét.'
                            . $WorkOrderInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] geplande starttijd bereikt',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> heeft de geplande starttijd bereikt.'
                            . $WorkOrderInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'WorkOrderAgent',
            ],
        },
        {
            Name      => 'planned end time of workorder reached',
            Attribute => '',
            Event     => 'WorkOrderPlannedEndTimeReached',
            ValidID   => 1,
            Comment   => 'inform recipients that a workorder has reached the planned end time',
            Rule      => '',
            Message   => {
                Agent => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] geplante Endzeit erreicht',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> hat die geplante Endzeit erreicht.'
                            . $WorkOrderInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] Planned End Time reached',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> has reached the Planned End Time.'
                            . $WorkOrderInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] tervezett befejezési idő elérve',
                        Body =>
                            'A(z) <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> munkamegrendelés elérte a tervezett befejezési idejét.'
                            . $WorkOrderInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] geplande eindttijd bereikt',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> heeft de geplande eindtijd bereikt.'
                            . $WorkOrderInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] geplante Endzeit erreicht',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> hat die geplante Endzeit erreicht.'
                            . $WorkOrderInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] Planned End Time reached',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> has reached the Planned End Time.'
                            . $WorkOrderInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] tervezett befejezési idő elérve',
                        Body =>
                            'A(z) <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> munkamegrendelés elérte a tervezett befejezési idejét.'
                            . $WorkOrderInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] geplande eindtijd bereikt',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> heeft de geplande eindtijd bereikt.'
                            . $WorkOrderInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'WorkOrderAgent',
            ],
        },
        {
            Name      => 'actual start time of workorder reached',
            Attribute => '',
            Event     => 'WorkOrderActualStartTimeReached',
            ValidID   => 1,
            Comment   => 'inform recipients that a workorder has reached the actual start time',
            Rule      => '',
            Message   => {
                Agent => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] begonnen',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> wurde begonnen.'
                            . $WorkOrderInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] started',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> has started.'
                            . $WorkOrderInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] elkezdődött',
                        Body =>
                            'Elkezdődött a következő munkamegrendelés: <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>.'
                            . $WorkOrderInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] gestart',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> is gestart.'
                            . $WorkOrderInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] begonnen',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> wurde begonnen.'
                            . $WorkOrderInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] started',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> has started.'
                            . $WorkOrderInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] elkezdődött',
                        Body =>
                            'Elkezdődött a következő munkamegrendelés: <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>.'
                            . $WorkOrderInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] gestart',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> is gestart.'
                            . $WorkOrderInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'WorkOrderAgent',
            ],
        },
        {
            Name      => 'actual end time of workorder reached',
            Attribute => '',
            Event     => 'WorkOrderActualEndTimeReached',
            ValidID   => 1,
            Comment   => 'inform recipients that a workorder has reached the actual end time',
            Rule      => '',
            Message   => {
                Agent => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] abgeschlossen',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> wurde abgeschlossen.'
                            . $WorkOrderInfoAgentDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] finished',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> was finished.'
                            . $WorkOrderInfoAgentEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] befejeződött',
                        Body =>
                            'Befejeződött a következő munkamegrendelés: <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>.'
                            . $WorkOrderInfoAgentHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] afgerond',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> is afgerond.'
                            . $WorkOrderInfoAgentNl,
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] abgeschlossen',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> wurde abgeschlossen.'
                            . $WorkOrderInfoCustomerDe,
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] finished',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> was finished.'
                            . $WorkOrderInfoCustomerEn,
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] befejeződött',
                        Body =>
                            'Befejeződött a következő munkamegrendelés: <OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>.'
                            . $WorkOrderInfoCustomerHu,
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber>] afgerond',
                        Body =>
                            '<OTRS_CONFIG_ITSMWorkOrder::Hook><OTRS_CHANGE_ChangeNumber>-<OTRS_WORKORDER_WorkOrderNumber> is afgerond.'
                            . $WorkOrderInfoCustomerNl,
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'WorkOrderAgent',
            ],
        },
        {
            Name      => 'action execution successfully',
            Attribute => 'ActionResult',
            Event     => 'ActionExecute',
            ValidID   => 1,
            Comment   => 'inform recipients that an action was executed successfully',
            Rule      => 'successfully',
            Message   => {
                Agent => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Aktions-Ausführung <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> Aktions-Ausführung <OTRS_CONDITION_ActionResult>.'
                            . "\n"
                            . "\n"
                            . "Change Titel: <OTRS_CHANGE_ChangeTitle>\n"
                            . "Aktueller Change Status: <OTRS_CHANGE_ChangeState>\n"
                            . "\n"
                            . "Condition ID: <OTRS_CONDITION_ConditionID>\n"
                            . "Condition Name: <OTRS_CONDITION_ConditionName>\n"
                            . "\n"
                            . "Action ID: <OTRS_CONDITION_ActionID>\n"
                            . "Aktions-Ausführung: <OTRS_CONDITION_ActionResult>\n"
                            . "\n"
                            . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMChangeZoom;ChangeID=<OTRS_CHANGE_ChangeID>\n"
                            . "\n"
                            . "-- <OTRS_CONFIG_NotificationSenderName>\n",
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Action execution <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> Action execution <OTRS_CONDITION_ActionResult>.'
                            . "\n"
                            . "\n"
                            . "Change title: <OTRS_CHANGE_ChangeTitle>\n"
                            . "Current change state: <OTRS_CHANGE_ChangeState>\n"
                            . "\n"
                            . "Condition ID: <OTRS_CONDITION_ConditionID>\n"
                            . "Condition name: <OTRS_CONDITION_ConditionName>\n"
                            . "\n"
                            . "Action ID: <OTRS_CONDITION_ActionID>\n"
                            . "Action execution: <OTRS_CONDITION_ActionResult>\n"
                            . "\n"
                            . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMChangeZoom;ChangeID=<OTRS_CHANGE_ChangeID>\n"
                            . "\n"
                            . "-- <OTRS_CONFIG_NotificationSenderName>\n",
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] művelet-végrehajtás: <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> művelet-végrehajtás: <OTRS_CONDITION_ActionResult>.'
                            . "\n"
                            . "\n"
                            . "Változáscím: <OTRS_CHANGE_ChangeTitle>\n"
                            . "Jelenlegi változásállapot: <OTRS_CHANGE_ChangeState>\n"
                            . "\n"
                            . "Feltételazonosító: <OTRS_CONDITION_ConditionID>\n"
                            . "Feltételnév: <OTRS_CONDITION_ConditionName>\n"
                            . "\n"
                            . "Műveletazonosító: <OTRS_CONDITION_ActionID>\n"
                            . "Művelet-végrehajtás: <OTRS_CONDITION_ActionResult>\n"
                            . "\n"
                            . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMChangeZoom;ChangeID=<OTRS_CHANGE_ChangeID>\n"
                            . "\n"
                            . "-- <OTRS_CONFIG_NotificationSenderName>\n",
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Actie uitgevoerd <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> Actie uitgevoerd <OTRS_CONDITION_ActionResult>.'
                            . "\n"
                            . "\n"
                            . "Change-titel: <OTRS_CHANGE_ChangeTitle>\n"
                            . "Actuele change-status: <OTRS_CHANGE_ChangeState>\n"
                            . "\n"
                            . "Conditie-ID: <OTRS_CONDITION_ConditionID>\n"
                            . "Conditie naam: <OTRS_CONDITION_ConditionName>\n"
                            . "\n"
                            . "Actie-ID: <OTRS_CONDITION_ActionID>\n"
                            . "Actie resultaat: <OTRS_CONDITION_ActionResult>\n"
                            . "\n"
                            . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMChangeZoom;ChangeID=<OTRS_CHANGE_ChangeID>\n"
                            . "\n"
                            . "-- <OTRS_CONFIG_NotificationSenderName>\n",
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Aktions-Ausführung <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> Aktions-Ausführung <OTRS_CONDITION_ActionResult>.',
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Action execution <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> Action execution <OTRS_CONDITION_ActionResult>.',
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] művelet-végrehajtás: <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> művelet-végrehajtás: <OTRS_CONDITION_ActionResult>.',
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Actie uitgevoerd <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> Actie uitgevoerd <OTRS_CONDITION_ActionResult>.',
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder',
            ],
        },
        {
            Name      => 'action execution unsuccessfully',
            Attribute => 'ActionResult',
            Event     => 'ActionExecute',
            ValidID   => 1,
            Comment   => 'inform recipients that an action was executed unsuccessfully',
            Rule      => 'unsuccessfully',
            Message   => {
                Agent => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Aktions-Ausführung <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> Aktions-Ausführung <OTRS_CONDITION_ActionResult>.'
                            . "\n"
                            . "\n"
                            . "Change Titel: <OTRS_CHANGE_ChangeTitle>\n"
                            . "Aktueller Change Status: <OTRS_CHANGE_ChangeState>\n"
                            . "\n"
                            . "Condition ID: <OTRS_CONDITION_ConditionID>\n"
                            . "Condition Name: <OTRS_CONDITION_ConditionName>\n"
                            . "\n"
                            . "Action ID: <OTRS_CONDITION_ActionID>\n"
                            . "Aktions-Ausführung: <OTRS_CONDITION_ActionResult>\n"
                            . "\n"
                            . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMChangeZoom;ChangeID=<OTRS_CHANGE_ChangeID>\n"
                            . "\n"
                            . "-- <OTRS_CONFIG_NotificationSenderName>\n",
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Action execution <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> Action execution <OTRS_CONDITION_ActionResult>.'
                            . "\n"
                            . "\n"
                            . "Change title: <OTRS_CHANGE_ChangeTitle>\n"
                            . "Current change state: <OTRS_CHANGE_ChangeState>\n"
                            . "\n"
                            . "Condition ID: <OTRS_CONDITION_ConditionID>\n"
                            . "Condition name: <OTRS_CONDITION_ConditionName>\n"
                            . "\n"
                            . "Action ID: <OTRS_CONDITION_ActionID>\n"
                            . "Action execution: <OTRS_CONDITION_ActionResult>\n"
                            . "\n"
                            . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMChangeZoom;ChangeID=<OTRS_CHANGE_ChangeID>\n"
                            . "\n"
                            . "-- <OTRS_CONFIG_NotificationSenderName>\n",
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] művelet-végrehajtás: <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> művelet-végrehajtás: <OTRS_CONDITION_ActionResult>.'
                            . "\n"
                            . "\n"
                            . "Változáscím: <OTRS_CHANGE_ChangeTitle>\n"
                            . "Jelenlegi változásállapot: <OTRS_CHANGE_ChangeState>\n"
                            . "\n"
                            . "Feltételazonosító: <OTRS_CONDITION_ConditionID>\n"
                            . "Feltételnév: <OTRS_CONDITION_ConditionName>\n"
                            . "\n"
                            . "Műveletazonosító: <OTRS_CONDITION_ActionID>\n"
                            . "Művelet-végrehajtás: <OTRS_CONDITION_ActionResult>\n"
                            . "\n"
                            . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMChangeZoom;ChangeID=<OTRS_CHANGE_ChangeID>\n"
                            . "\n"
                            . "-- <OTRS_CONFIG_NotificationSenderName>\n",
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Actie uitgevoerd <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> Actie uitgevoerd <OTRS_CONDITION_ActionResult>.'
                            . "\n"
                            . "\n"
                            . "Change-titel: <OTRS_CHANGE_ChangeTitle>\n"
                            . "Actuele change-status: <OTRS_CHANGE_ChangeState>\n"
                            . "\n"
                            . "Conditie-ID: <OTRS_CONDITION_ConditionID>\n"
                            . "Conditie naam: <OTRS_CONDITION_ConditionName>\n"
                            . "\n"
                            . "Actie-ID: <OTRS_CONDITION_ActionID>\n"
                            . "Actie resultaat: <OTRS_CONDITION_ActionResult>\n"
                            . "\n"
                            . "<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentITSMChangeZoom;ChangeID=<OTRS_CHANGE_ChangeID>\n"
                            . "\n"
                            . "-- <OTRS_CONFIG_NotificationSenderName>\n",
                        ContentType => 'text/plain',
                    },
                },
                Customer => {
                    de => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Aktions-Ausführung <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> Aktions-Ausführung <OTRS_CONDITION_ActionResult>.',
                        ContentType => 'text/plain',
                    },
                    en => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Action execution <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> Action execution <OTRS_CONDITION_ActionResult>.',
                        ContentType => 'text/plain',
                    },
                    hu => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] művelet-végrehajtás: <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> művelet-végrehajtás: <OTRS_CONDITION_ActionResult>.',
                        ContentType => 'text/plain',
                    },
                    nl => {
                        Subject =>
                            '[<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber>] Actie uitgevoerd <OTRS_CONDITION_ActionResult>',
                        Body =>
                            '<OTRS_CONFIG_ITSMChange::Hook><OTRS_CHANGE_ChangeNumber> Actie uitgevoerd <OTRS_CONDITION_ActionResult>.',
                        ContentType => 'text/plain',
                    },
                },
            },
            Recipients => [
                'ChangeBuilder',
            ],
        },
    );

    # add notifications
    for my $Notification (@Notifications) {

        # find recipients
        my @RecipientIDs;
        for my $Recipient ( @{ $Notification->{Recipients} } ) {
            my $RecipientID = $Kernel::OM->Get('Kernel::System::ITSMChange::Notification')->RecipientLookup(
                Name => $Recipient,
            );

            if ($RecipientID) {
                push @RecipientIDs, $RecipientID;
            }
        }

        # get event id
        my $EventID = $Kernel::OM->Get('Kernel::System::ITSMChange::History')->HistoryTypeLookup(
            HistoryType => $Notification->{Event},
        );

        # insert notification
        my $RuleID = $Kernel::OM->Get('Kernel::System::ITSMChange::Notification')->NotificationRuleAdd(
            %{$Notification},
            EventID      => $EventID,
            RecipientIDs => \@RecipientIDs,
        );
    }

    return 1;
}

=item _MigrateNotifications()

Migrate old system notifications into ChangeManagement event based notifications.

    my $Success = $SetupObject->_MigrateNotifications;

=cut

sub _MigrateNotifications {
    my ($Self) = @_;

    # get all change notification rules
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT cn.id, cn.name, item_attribute, cht.name
            FROM change_notification cn, change_history_type cht
            WHERE event_id = cht.id',
    );

    # fetch notification rules
    my @NotificationRules;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {

        push @NotificationRules, {
            ID        => $Row[0],
            Name      => $Row[1],
            Attribute => $Row[2] // '',
            Event     => $Row[3],
        };
    }

    for my $NotificationRule (@NotificationRules) {

        # read notifications for this notification type
        return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL => "SELECT notification_type, notification_language, subject, text, content_type
                FROM notifications
                WHERE notification_type = 'Agent::Change::$NotificationRule->{Event}'
                OR notification_type    = 'Agent::WorkOrder::$NotificationRule->{Event}'
                OR notification_type    = 'Customer::Change::$NotificationRule->{Event}'
                OR notification_type    = 'Customer::WorkOrder::$NotificationRule->{Event}'",
        );

        my @Messages;
        while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {

            # extract the information if the notification is for agents or customers
            $Row[0] =~ s{ \A ( Agent | Customer ) :: .+ }{$1}xms;

            # get message attributes
            push @Messages, {
                NotificationType => $Row[0],
                Language         => $Row[1],
                Subject          => $Row[2],
                Body             => $Row[3],
                ContentType      => $Row[4],
            };
        }

        for my $Message (@Messages) {

            return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
                SQL => 'INSERT INTO change_notification_message
                    (notification_id, subject, text, content_type, language, notification_type)
                    VALUES (?, ?, ?, ?, ?, ?)',
                Bind => [
                    \$NotificationRule->{ID},
                    \$Message->{Subject},
                    \$Message->{Body},
                    \$Message->{ContentType},
                    \$Message->{Language},
                    \$Message->{NotificationType},
                ],
            );
        }
    }

    # delete all old notifications for the change management
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'DELETE FROM notifications
            WHERE notification_type LIKE "Agent::Change::%"
            OR notification_type LIKE "Agent::WorkOrder::%"
            OR notification_type LIKE "Customer::Change::%"
            OR notification_type LIKE "Customer::WorkOrder::%"',
    );

    # get number of remaining entries
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT COUNT(id) FROM notifications',
    );

    my $Count;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $Count = $Row[0];
    }

    # delete table but only if table is empty
    # if there are some entries left, these must be deleted by other modules
    # so we give them a chance to be migrated from these modules
    if ( !$Count ) {

        # drop table 'notifications'
        my $XMLString = '<?xml version="1.0" encoding="utf-8" ?>
            <database Name="otrs">
                <TableDrop Name="notifications"/>
            </database>';

        my @SQL;
        my @SQLPost;

        my $XMLObject = $Kernel::OM->Get('Kernel::System::XML');

        # create database specific SQL and PostSQL commands
        my @XMLARRAY = $XMLObject->XMLParse( String => $XMLString );

        # create database specific SQL
        push @SQL, $Kernel::OM->Get('Kernel::System::DB')->SQLProcessor(
            Database => \@XMLARRAY,
        );

        # create database specific PostSQL
        push @SQLPost, $Kernel::OM->Get('Kernel::System::DB')->SQLProcessorPost();

        # execute SQL
        for my $SQL ( @SQL, @SQLPost ) {
            my $Success = $Kernel::OM->Get('Kernel::System::DB')->Do( SQL => $SQL );
            if ( !$Success ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Error during execution of '$SQL'!",
                );
                return;
            }
        }
    }

    return 1;
}

=item _DeleteTemplates()

deletes all templates

    my $Result = $CodeObject->_DeleteTemplates();

=cut

sub _DeleteTemplates {
    my ( $Self, %Param ) = @_;

    # get all templates, also invalid ones
    my $Templates = $Kernel::OM->Get('Kernel::System::ITSMChange::Template')->TemplateList(
        Valid  => 0,
        UserID => 1,
    );

    # delete all templates
    for my $TemplateID ( sort keys %{$Templates} ) {

        my $Success = $Kernel::OM->Get('Kernel::System::ITSMChange::Template')->TemplateDelete(
            TemplateID => $TemplateID,
            UserID     => 1,
        );

    }

    return 1;
}

=item _MigrateDTLInSysConfig()

Converts DTL settings in sysconfig to TT.

    my $Result = $CodeObject->_MigrateDTLInSysConfig();

=cut

sub _MigrateDTLInSysConfig {

    # create needed objects
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ProviderObject  = Kernel::Output::Template::Provider->new();

    # handle hash settings
    NAME:
    for my $Name (
        qw(
        Ticket::Frontend::MenuModule
        ITSMChange::Frontend::MenuModule
        ITSMWorkOrder::Frontend::MenuModule
        )
        )
    {

        # get setting's content
        my $Setting = $ConfigObject->Get($Name);
        next NAME if !$Setting;

        MENUMODULE:
        for my $MenuModule ( sort keys %{$Setting} ) {

            # setting is a hash
            SETTINGITEM:
            for my $SettingItem ( sort keys %{ $Setting->{$MenuModule} } ) {

                my $SettingContent = $Setting->{$MenuModule}->{$SettingItem};

                # do nothing if there is no value for migrating
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

            # update the config item
            my $Success = $SysConfigObject->ConfigItemUpdate(
                Valid => 1,
                Key   => $Name,
                Value => $Setting,
            );
        }
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

    # migrate NavBar menu modules
    # get setting content for NavBar menu modules
    my $Setting = $ConfigObject->Get('Frontend::Module');

    NAVBARMODULE:
    for my $ModuleAdmin ( sort keys %{$Setting} ) {

        # update module location
        my $Module = $Setting->{$ModuleAdmin}->{NavBarModule}->{'Module'} // '';

        if ( $Module !~ m{Kernel::Output::HTML::NavBar(\w+)} ) {
            next NAVBARMODULE;
        }
        $Setting->{$ModuleAdmin}->{NavBarModule}->{'Module'} = "Kernel::Output::HTML::NavBar::ModuleAdmin";

        # set new setting,
        my $Success = $SysConfigObject->ConfigItemUpdate(
            Valid => 1,
            Key   => 'Frontend::Module###' . $ModuleAdmin,
            Value => $Setting->{$ModuleAdmin},
        );
    }

    # migrate ITSM menu modules
    # get setting content for ITSM menu modules
    for my $Type (qw(ITSMChange ITSMWorkOrder)) {

        $Setting = $ConfigObject->Get( $Type . '::Frontend::MenuModule' );

        MENUMODULE:
        for my $MenuModule ( sort keys %{$Setting} ) {

            # update module location
            my $Module = $Setting->{$MenuModule}->{'Module'};

            if ( $Module !~ m{Kernel::Output::HTML::$Type(\w+)} ) {
                next MENUMODULE;
            }

            my $NewMenu = $Type . "::$1";
            $Module =~ s{Kernel::Output::HTML::$Type(\w+)}{Kernel::Output::HTML::$NewMenu}xmsg;

            $Setting->{$MenuModule}->{'Module'} = $Module;

            # set new setting,
            my $Success = $SysConfigObject->ConfigItemUpdate(
                Valid => 1,
                Key   => $Type . '::Frontend::MenuModule' . '###' . $MenuModule,
                Value => $Setting->{$MenuModule},
            );
        }
    }

    # migrate ITSM preferences
    # get setting content for preferences
    $Setting = $ConfigObject->Get('PreferencesGroups');

    PREFERENCEMODULE:
    for my $PreferenceModule ( sort keys %{$Setting} ) {

        # update module location
        my $Module = $Setting->{$PreferenceModule}->{'Module'};
        if ( $Module !~ m{Kernel::Output::HTML::Preferences(\w+)} ) {
            next PREFERENCEMODULE;
        }

        $Module =~ s{Kernel::Output::HTML::Preferences(\w+)}{Kernel::Output::HTML::Preferences::$1}xmsg;
        $Setting->{$PreferenceModule}->{'Module'} = $Module;

        # set new setting,
        my $Success = $SysConfigObject->ConfigItemUpdate(
            Valid => 1,
            Key   => 'PreferencesGroups###' . $PreferenceModule,
            Value => $Setting->{$PreferenceModule},
        );
    }

    return 1;
}

=item _MigrateConfigsFromLowerThan_5_0_12()

change configurations to match the new file location.

    my $Result = $CodeObject->_MigrateConfigsFromLowerThan_5_0_12();

=cut

sub _MigrateConfigsFromLowerThan_5_0_12 {    ## no critic

    # create needed objects
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    # get setting content for all frontend modules
    my $FrontendConfig = $ConfigObject->Get('Frontend::Module');

    FRONTENDMODULE:
    for my $Module ( sort keys %{$FrontendConfig} ) {

        next FRONTENDMODULE if !$FrontendConfig->{$Module}->{Loader};
        next FRONTENDMODULE if !$FrontendConfig->{$Module}->{Loader}->{JavaScript};
        next FRONTENDMODULE if !@{ $FrontendConfig->{$Module}->{Loader}->{JavaScript} };

        # check if setting contains the file ITSM.Agent.ConfirmationDialog.js
        next FRONTENDMODULE
            if !grep { $_ eq 'ITSM.Agent.ConfirmationDialog.js' }
            @{ $FrontendConfig->{$Module}->{Loader}->{JavaScript} };

        # build new settings with renamed Javascript file
        my @NewJavascriptLoaderSettings;
        for my $LoaderSetting ( @{ $FrontendConfig->{$Module}->{Loader}->{JavaScript} } ) {
            if ( $LoaderSetting eq 'ITSM.Agent.ConfirmationDialog.js' ) {

                # change the setting (rename the file)
                push @NewJavascriptLoaderSettings, 'ITSM.Agent.ConfirmDialog.js';
            }
            else {
                # use the original setting
                push @NewJavascriptLoaderSettings, $LoaderSetting;
            }
        }

        # change the JS loader settings
        $FrontendConfig->{$Module}->{Loader}->{JavaScript} = \@NewJavascriptLoaderSettings;

        # set new setting
        my $Success = $SysConfigObject->ConfigItemUpdate(
            Valid => 1,
            Key   => 'Frontend::Module###' . $Module,
            Value => $FrontendConfig->{$Module},
        );
    }

    # migrate ITSM menu modules
    # get setting content for ITSM menu modules
    for my $Type (qw(ITSMChange ITSMWorkOrder)) {

        # get menu module setting
        my $Setting = $ConfigObject->Get( $Type . '::Frontend::MenuModule' );

        MENUMODULE:
        for my $MenuModule ( sort keys %{$Setting} ) {

            # get target setting
            my $Target = $Setting->{$MenuModule}->{'Target'};

            # check for the old name
            next MENUMODULE if $Target ne 'ConfirmationDialog';

            # update to new name
            $Setting->{$MenuModule}->{'Target'} = 'ConfirmDialog';

            # set new setting
            my $Success = $SysConfigObject->ConfigItemUpdate(
                Valid => 1,
                Key   => $Type . '::Frontend::MenuModule' . '###' . $MenuModule,
                Value => $Setting->{$MenuModule},
            );
        }
    }

    return 1;
}

1;

=end Internal:

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
