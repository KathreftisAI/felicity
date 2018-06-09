# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ImportExport::ObjectBackend::ITSMConfigItem;

use strict;
use warnings;

use List::Util qw(min);
use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::ITSMConfigItem',
    'Kernel::System::ImportExport',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::ImportExport::ObjectBackend::ITSMConfigItem - import/export backend for ITSMConfigItem

=head1 SYNOPSIS

All functions to import and export ITSM config items.

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $BackendObject = $Kernel::OM->Get('Kernel::System::ImportExport::ObjectBackend::ITSMConfigItem');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item ObjectAttributesGet()

get the object attributes of an object as a ref to an array of hash references

    my $Attributes = $ObjectBackend->ObjectAttributesGet(
        UserID => 1,
    );

=cut

sub ObjectAttributesGet {
    my ( $Self, %Param ) = @_;

    # check needed object
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );
        return;
    }

    # get class list
    my $ClassList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    ) || {};

    my $Attributes = [
        {
            Key   => 'ClassID',
            Name  => 'Class',
            Input => {
                Type         => 'Selection',
                Data         => $ClassList,
                Required     => 1,
                Translation  => 0,
                PossibleNone => 1,
            },
        },
        {
            Key   => 'CountMax',
            Name  => 'Maximum number of one element',
            Input => {
                Type         => 'Text',
                ValueDefault => '10',
                Required     => 1,
                Regex        => qr{ \A \d+ \z }xms,
                Translation  => 0,
                Size         => 5,
                MaxLength    => 5,
                DataType     => 'IntegerBiggerThanZero',
            },
        },
        {
            Key   => 'EmptyFieldsLeaveTheOldValues',
            Name  => 'Empty fields indicate that the current values are kept',
            Input => {
                Type => 'Checkbox',
            },
        },
    ];

    return $Attributes;
}

=item MappingObjectAttributesGet()

get the mapping attributes of an object as array/hash reference

    my $Attributes = $ObjectBackend->MappingObjectAttributesGet(
        TemplateID => 123,
        UserID     => 1,
    );

=cut

sub MappingObjectAttributesGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TemplateID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get object data
    my $ObjectData = $Kernel::OM->Get('Kernel::System::ImportExport')->ObjectDataGet(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    return [] if !$ObjectData;
    return [] if ref $ObjectData ne 'HASH';
    return [] if !$ObjectData->{ClassID};

    # get definition
    my $XMLDefinition = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->DefinitionGet(
        ClassID => $ObjectData->{ClassID},
    );

    return [] if !$XMLDefinition;
    return [] if ref $XMLDefinition ne 'HASH';
    return [] if !$XMLDefinition->{DefinitionRef};
    return [] if ref $XMLDefinition->{DefinitionRef} ne 'ARRAY';

    my $ElementList = [
        {
            Key   => 'Number',
            Value => 'Number',
        },
        {
            Key   => 'Name',
            Value => 'Name',
        },
        {
            Key   => 'DeplState',
            Value => 'Deployment State',
        },
        {
            Key   => 'InciState',
            Value => 'Incident State',
        },
    ];

    # add xml elements
    $Self->_MappingObjectAttributesGet(
        XMLDefinition => $XMLDefinition->{DefinitionRef},
        ElementList   => $ElementList,
        CountMaxLimit => $ObjectData->{CountMax} || 10,
    );

    my $Attributes = [
        {
            Key   => 'Key',
            Name  => 'Key',
            Input => {
                Type         => 'Selection',
                Data         => $ElementList,
                Required     => 1,
                Translation  => 0,
                PossibleNone => 1,
            },
        },
        {
            Key   => 'Identifier',
            Name  => 'Identifier',
            Input => {
                Type => 'Checkbox',
            },
        },
    ];

    return $Attributes;
}

=item SearchAttributesGet()

get the search object attributes of an object as array/hash reference

    my $AttributeList = $ObjectBackend->SearchAttributesGet(
        TemplateID => 123,
        UserID     => 1,
    );

=cut

sub SearchAttributesGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TemplateID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get object data
    my $ObjectData = $Kernel::OM->Get('Kernel::System::ImportExport')->ObjectDataGet(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    return [] if !$ObjectData;
    return [] if ref $ObjectData ne 'HASH';
    return [] if !$ObjectData->{ClassID};

    # get definition
    my $XMLDefinition = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->DefinitionGet(
        ClassID => $ObjectData->{ClassID},
    );

    return [] if !$XMLDefinition;
    return [] if ref $XMLDefinition ne 'HASH';
    return [] if !$XMLDefinition->{DefinitionRef};
    return [] if ref $XMLDefinition->{DefinitionRef} ne 'ARRAY';

    # get deployment state list
    my $DeplStateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    ) || {};

    # get incident state list
    my $InciStateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::Core::IncidentState',
    ) || {};

    my $AttributeList = [
        {
            Key   => 'Number',
            Name  => 'Number',
            Input => {
                Type      => 'Text',
                Size      => 80,
                MaxLength => 255,
            },
        },
        {
            Key   => 'Name',
            Name  => 'Name',
            Input => {
                Type      => 'Text',
                Size      => 80,
                MaxLength => 255,
            },
        },
        {
            Key   => 'DeplStateIDs',
            Name  => 'Deployment State',
            Input => {
                Type        => 'Selection',
                Data        => $DeplStateList,
                Translation => 1,
                Size        => 5,
                Multiple    => 1,
            },
        },
        {
            Key   => 'InciStateIDs',
            Name  => 'Incident State',
            Input => {
                Type        => 'Selection',
                Data        => $InciStateList,
                Translation => 1,
                Size        => 5,
                Multiple    => 1,
            },
        },
    ];

    # add xml attributes
    $Self->_SearchAttributesGet(
        XMLDefinition => $XMLDefinition->{DefinitionRef},
        AttributeList => $AttributeList,
    );

    return $AttributeList;
}

=item ExportDataGet()

get export data as 2D-array-hash reference

    my $ExportData = $ObjectBackend->ExportDataGet(
        TemplateID => 123,
        UserID     => 1,
    );

=cut

sub ExportDataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TemplateID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get object data
    my $ObjectData = $Kernel::OM->Get('Kernel::System::ImportExport')->ObjectDataGet(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    # check object data
    if ( !$ObjectData || ref $ObjectData ne 'HASH' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No object data found for the template id $Param{TemplateID}",
        );
        return;
    }

    # get class list
    my $ClassList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    return if !$ClassList || ref $ClassList ne 'HASH';

    # check the class id
    if ( !$ObjectData->{ClassID} || !$ClassList->{ $ObjectData->{ClassID} } ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No valid class id found for the template id $Param{TemplateID}",
        );
        return;
    }

    # get the mapping list
    my $MappingList = $Kernel::OM->Get('Kernel::System::ImportExport')->MappingList(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    # check the mapping list
    if ( !$MappingList || ref $MappingList ne 'ARRAY' || !@{$MappingList} ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No valid mapping list found for the template id $Param{TemplateID}",
        );
        return;
    }

    # create the mapping object list
    my @MappingObjectList;
    for my $MappingID ( @{$MappingList} ) {

        # get mapping object data
        my $MappingObjectData = $Kernel::OM->Get('Kernel::System::ImportExport')->MappingObjectDataGet(
            MappingID => $MappingID,
            UserID    => $Param{UserID},
        );

        # check mapping object data
        if ( !$MappingObjectData || ref $MappingObjectData ne 'HASH' ) {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "No valid mapping list found for the template id $Param{TemplateID}",
            );
            return;
        }

        push @MappingObjectList, $MappingObjectData;
    }

    # get search data
    my $SearchData = $Kernel::OM->Get('Kernel::System::ImportExport')->SearchDataGet(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    return if !$SearchData || ref $SearchData ne 'HASH';

    # get deployment state list
    my $DeplStateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    # check deployment state list
    if ( !$DeplStateList || ref $DeplStateList ne 'HASH' ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't get the general catalog list ITSM::ConfigItem::DeploymentState!",
        );
        return;
    }

    # get incident state list
    my $InciStateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::Core::IncidentState',
    );

    # check incident state list
    if ( !$InciStateList || ref $InciStateList ne 'HASH' ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't get the general catalog list ITSM::Core::IncidentState!",
        );
        return;
    }

    # get current definition of this class
    my $DefinitionData = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->DefinitionGet(
        ClassID => $ObjectData->{ClassID},
        UserID  => $Param{UserID},
    );

    my %SearchParams;

    # add number to the search params
    if ( $SearchData->{Number} ) {
        $SearchParams{Number} = delete $SearchData->{Number};
    }

    # add name to the search params
    if ( $SearchData->{Name} ) {
        $SearchParams{Name} = delete $SearchData->{Name};
    }

    # add deployment state to the search params
    if ( $SearchData->{DeplStateIDs} ) {
        my @DeplStateIDs = split '#####', $SearchData->{DeplStateIDs};
        $SearchParams{DeplStateIDs} = \@DeplStateIDs;
        delete $SearchData->{DeplStateIDs};
    }

    # add incident state to the search params
    if ( $SearchData->{InciStateIDs} ) {
        my @InciStateIDs = split '#####', $SearchData->{InciStateIDs};
        $SearchParams{InciStateIDs} = \@InciStateIDs;
        delete $SearchData->{InciStateIDs};
    }

    # add all XML data to the search params
    my @SearchParamsWhat;
    $Self->_ExportXMLSearchDataPrepare(
        XMLDefinition => $DefinitionData->{DefinitionRef},
        What          => \@SearchParamsWhat,
        SearchData    => $SearchData,
    );

    # add XML search params to the search hash
    if (@SearchParamsWhat) {
        $SearchParams{What} = \@SearchParamsWhat;
    }

    # search the config items
    my $ConfigItemList = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->ConfigItemSearchExtended(
        %SearchParams,
        ClassIDs              => [ $ObjectData->{ClassID} ],
        PreviousVersionSearch => 0,
        UserID                => $Param{UserID},
    );

    my @ExportData;
    CONFIGITEMID:
    for my $ConfigItemID ( @{$ConfigItemList} ) {

        # get last version
        my $VersionData = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionGet(
            ConfigItemID => $ConfigItemID,
        );

        next CONFIGITEMID if !$VersionData;
        next CONFIGITEMID if ref $VersionData ne 'HASH';

        # translate xmldata to a 2d hash
        my %XMLData2D;
        $Self->_ExportXMLDataPrepare(
            XMLDefinition => $DefinitionData->{DefinitionRef},
            XMLData       => $VersionData->{XMLData}->[1]->{Version}->[1],
            XMLData2D     => \%XMLData2D,
        );

        # add data to the export data array
        my @Item;
        MAPPINGOBJECT:
        for my $MappingObject (@MappingObjectList) {

            # extract key
            my $Key = $MappingObject->{Key};

            # handle empty key
            if ( !$Key ) {
                push @Item, '';
                next MAPPINGOBJECT;
            }

            # handle config item number
            if ( $Key eq 'Number' ) {
                push @Item, $VersionData->{Number};
                next MAPPINGOBJECT;
            }

            # handle current config item name
            if ( $Key eq 'Name' ) {
                push @Item, $VersionData->{Name};
                next MAPPINGOBJECT;
            }

            # handle deployment state
            if ( $Key eq 'DeplState' ) {
                $VersionData->{DeplStateID} ||= 'DUMMY';
                push @Item, $DeplStateList->{ $VersionData->{DeplStateID} };
                next MAPPINGOBJECT;
            }

            # handle incident state
            if ( $Key eq 'InciState' ) {
                $VersionData->{InciStateID} ||= 'DUMMY';
                push @Item, $InciStateList->{ $VersionData->{InciStateID} };
                next MAPPINGOBJECT;
            }

            # handle all XML data elements
            push @Item, $XMLData2D{$Key};
        }

        push @ExportData, \@Item;
    }

    return \@ExportData;
}

=item ImportDataSave()

imports a single entity of the import data. The C<TemplateID> points to the definition
of the current import. C<ImportDataRow> holds the data. C<Counter> is only used in
error messages, for indicating which item was not imported successfully.

The current version of the config item will never be deleted. When there are no
changes in the data, the import will be skipped. When there is new or changed data,
then a new config item or a new version is created.

In the case of changed data, the new version of the config item will contain the
attributes of the C<ImportDataRow> plus the old attributes that are
not part of the import definition.
Thus ImportDataSave() guarantees to not overwrite undeclared attributes.

The behavior when imported attributes are empty depends on the setting in the object data.
When C<EmptyFieldsLeaveTheOldValues> is not set, then empty values will wipe out
the old data. This is the default behavior. When C<EmptyFieldsLeaveTheOldValues> is set,
then empty values will leave the old values.

The decision what constitute an empty value is a bit hairy.
Here are the rules.
Fields that are not even mentioned in the Import definition are empty. These are the 'not defined' fields.
Empty strings and undefined values constitute empty fields.
Fields with with only one or more whitespace characters are not empty.
Fields with the digit '0' are not empty.

    my ( $ConfigItemID, $RetCode ) = $ObjectBackend->ImportDataSave(
        TemplateID    => 123,
        ImportDataRow => $ArrayRef,
        Counter       => 367,
        UserID        => 1,
    );

An empty C<ConfigItemID> indicates failure. Otherwise it indicates the
location of the imported data.
C<RetCode> is either 'Created', 'Updated' or 'Skipped'. 'Created' means that a new
config item has been created. 'Updated' means that a new version has been added to
an existing config item. 'Skipped' means that no new version has been created,
as the new data is identical to the latest version of an existing config item.

No codes have yet been defined for the failure case.

=cut

sub ImportDataSave {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(TemplateID ImportDataRow Counter UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check import data row
    if ( ref $Param{ImportDataRow} ne 'ARRAY' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message =>
                "Can't import entity $Param{Counter}: "
                . "ImportDataRow must be an array reference",
        );
        return;
    }

    # get object data
    my $ObjectData = $Kernel::OM->Get('Kernel::System::ImportExport')->ObjectDataGet(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    # check object data
    if ( !$ObjectData || ref $ObjectData ne 'HASH' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message =>
                "Can't import entity $Param{Counter}: "
                . "No object data found for the template id '$Param{TemplateID}'",
        );
        return;
    }

    # just for convenience
    my $EmptyFieldsLeaveTheOldValues = $ObjectData->{EmptyFieldsLeaveTheOldValues};

    # get class list
    my $ClassList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    # check class list
    if ( !$ClassList || ref $ClassList ne 'HASH' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message =>
                "Can't import entity $Param{Counter}: "
                . "Can't get the general catalog list ITSM::ConfigItem::Class",
        );
        return;
    }

    # check the class id
    if ( !$ObjectData->{ClassID} || !$ClassList->{ $ObjectData->{ClassID} } ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message =>
                "Can't import entity $Param{Counter}: "
                . "No class found for the template id '$Param{TemplateID}'",
        );
        return;
    }

    # get the mapping list
    my $MappingList = $Kernel::OM->Get('Kernel::System::ImportExport')->MappingList(
        TemplateID => $Param{TemplateID},
        UserID     => $Param{UserID},
    );

    # check the mapping list
    if ( !$MappingList || ref $MappingList ne 'ARRAY' || !@{$MappingList} ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message =>
                "Can't import entity $Param{Counter}: "
                . "No valid mapping list found for the template id '$Param{TemplateID}'",
        );
        return;
    }

    # create the mapping object list
    my @MappingObjectList;
    for my $MappingID ( @{$MappingList} ) {

        # get mapping object data
        my $MappingObjectData = $Kernel::OM->Get('Kernel::System::ImportExport')->MappingObjectDataGet(
            MappingID => $MappingID,
            UserID    => $Param{UserID},
        );

        # check mapping object data
        if ( !$MappingObjectData || ref $MappingObjectData ne 'HASH' ) {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Can't import entity $Param{Counter}: "
                    . "No mapping object data found for the mapping id '$MappingID'",
            );
            return;
        }

        push @MappingObjectList, $MappingObjectData;
    }

    # check and remember the Identifiers
    # the Identifiers identify the config item that should be updated
    my %Identifier;
    my $RowIndex = 0;
    MAPPINGOBJECTDATA:
    for my $MappingObjectData (@MappingObjectList) {

        next MAPPINGOBJECTDATA if !$MappingObjectData->{Identifier};

        # check if identifier already exists
        if ( $Identifier{ $MappingObjectData->{Key} } ) {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Can't import entity $Param{Counter}: "
                    . "'$MappingObjectData->{Key}' has been used multiple times as an identifier",
            );
            return;
        }

        # set identifier value
        $Identifier{ $MappingObjectData->{Key} } = $Param{ImportDataRow}->[$RowIndex];

        next MAPPINGOBJECTDATA if $MappingObjectData->{Key} && $Param{ImportDataRow}->[$RowIndex];

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message =>
                "Can't import entity $Param{Counter}: "
                . "Identifier field is empty",
        );

        return;
    }
    continue {
        $RowIndex++;
    }

    # get deployment state list
    my $DeplStateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    # check deployment state list
    if ( !$DeplStateList || ref $DeplStateList ne 'HASH' ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message =>
                "Can't import entity $Param{Counter}: "
                . "Can't get the general catalog list ITSM::ConfigItem::DeploymentState!",
        );
        return;
    }

    # reverse the deployment state list
    my %DeplStateListReverse = reverse %{$DeplStateList};

    # get incident state list
    my $InciStateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::Core::IncidentState',
    );

    # check incident state list
    if ( !$InciStateList || ref $InciStateList ne 'HASH' ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message =>
                "Can't import entity $Param{Counter}: "
                . "Can't get the general catalog list ITSM::Core::IncidentState",
        );
        return;
    }

    # reverse the incident state list
    my %InciStateListReverse = reverse %{$InciStateList};

    # get current definition of this class
    my $DefinitionData = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->DefinitionGet(
        ClassID => $ObjectData->{ClassID},
        UserID  => $Param{UserID},
    );

    # check definition data
    if ( !$DefinitionData || ref $DefinitionData ne 'HASH' ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message =>
                "Can't import entity $Param{Counter}: "
                . "Can't get the definition of class id $ObjectData->{ClassID}",
        );
        return;
    }

    # try to get config item ids, when there are identifiers
    my $ConfigItemID;
    if (%Identifier) {

        my %SearchParams;

        # add number to the search params
        if ( $Identifier{Number} ) {
            $SearchParams{Number} = delete $Identifier{Number};
        }

        # add name to the search params
        if ( $Identifier{Name} ) {
            $SearchParams{Name} = delete $Identifier{Name};
        }

        # add deployment state to the search params
        if ( $Identifier{DeplState} ) {

            # extract deployment state id
            my $DeplStateID = $DeplStateListReverse{ $Identifier{DeplState} } || '';

            if ( !$DeplStateID ) {

                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message =>
                        "Can't import entity $Param{Counter}: "
                        . "The deployment state '$Identifier{DeplState}' is invalid",
                );
                return;
            }

            $SearchParams{DeplStateIDs} = [$DeplStateID];
            delete $Identifier{DeplState};
        }

        # add incident state to the search params
        if ( $Identifier{InciState} ) {

            # extract incident state id
            my $InciStateID = $InciStateListReverse{ $Identifier{InciState} } || '';

            if ( !$InciStateID ) {

                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message =>
                        "Can't import entity $Param{Counter}: "
                        . "The incident state '$Identifier{InciState}' is invalid",
                );
                return;
            }

            $SearchParams{InciStateIDs} = [$InciStateID];
            delete $Identifier{InciState};
        }

        # add all XML data to the search params
        my @SearchParamsWhat;
        $Self->_ImportXMLSearchDataPrepare(
            XMLDefinition => $DefinitionData->{DefinitionRef},
            What          => \@SearchParamsWhat,
            Identifier    => \%Identifier,
        );

        # add XML search params to the search hash
        if (@SearchParamsWhat) {
            $SearchParams{What} = \@SearchParamsWhat;
        }

        # search existing config item with the same identifiers
        my $ConfigItemList = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->ConfigItemSearchExtended(
            %SearchParams,
            ClassIDs              => [ $ObjectData->{ClassID} ],
            PreviousVersionSearch => 0,
            UsingWildcards        => 0,
            UserID                => $Param{UserID},
        );

        if ( scalar @{$ConfigItemList} > 1 ) {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Can't import entity $Param{Counter}: "
                    . "Identifier fields NOT unique!",
            );
            return;
        }

        $ConfigItemID = $ConfigItemList->[0];
    }

    # get version data of the config item
    my $VersionData = {};
    if ($ConfigItemID) {

        # get latest version
        $VersionData = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionGet(
            ConfigItemID => $ConfigItemID,
        );

        # remove empty xml data
        if (
            !$VersionData->{XMLData}
            || ref $VersionData->{XMLData} ne 'ARRAY'
            || !@{ $VersionData->{XMLData} }
            )
        {
            delete $VersionData->{XMLData};
        }
    }

    # set up fields in VersionData and in the XML attributes
    my %XMLData2D;
    $RowIndex = 0;
    for my $MappingObjectData (@MappingObjectList) {

        # just for convenience
        my $Key   = $MappingObjectData->{Key};
        my $Value = $Param{ImportDataRow}->[ $RowIndex++ ];

        if ( $Key eq 'Number' ) {

            # do nothing
            # Import does not override the config item number
        }
        elsif ( $Key eq 'Name' ) {

            if ( $EmptyFieldsLeaveTheOldValues && ( !defined $Value || $Value eq '' ) ) {

                # do nothing, keep the old value
            }
            else {
                if ( !$Value ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message =>
                            "Can't import entity $Param{Counter}: "
                            . "The name '$Value' is invalid!",
                    );
                    return;
                }

                $VersionData->{$Key} = $Value;
            }
        }
        elsif ( $Key eq 'DeplState' ) {

            if ( $EmptyFieldsLeaveTheOldValues && ( !defined $Value || $Value eq '' ) ) {

                # do nothing, keep the old value
            }
            else {

                # extract deployment state id
                my $DeplStateID = $DeplStateListReverse{$Value} || '';
                if ( !$DeplStateID ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message =>
                            "Can't import entity $Param{Counter}: "
                            . "The deployment state '$Value' is invalid!",
                    );
                    return;
                }

                $VersionData->{DeplStateID} = $DeplStateID;
            }
        }
        elsif ( $Key eq 'InciState' ) {

            if ( $EmptyFieldsLeaveTheOldValues && ( !defined $Value || $Value eq '' ) ) {

                # do nothing, keep the old value
            }
            else {

                # extract the deployment state id
                my $InciStateID = $InciStateListReverse{$Value} || '';
                if ( !$InciStateID ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message =>
                            "Can't import entity $Param{Counter}: "
                            . "The incident state '$Value' is invalid!",
                    );
                    return;
                }

                $VersionData->{InciStateID} = $InciStateID;
            }
        }
        else {

            # handle xml data
            $XMLData2D{$Key} = $Value;
        }
    }

    # set up empty container, in case there is no previous data
    $VersionData->{XMLData}->[1]->{Version}->[1] ||= {};

    # Edit XMLDataPrev, so that the values in XMLData2D take precedence.
    my $MergeOk = $Self->_ImportXMLDataMerge(
        XMLDefinition                => $DefinitionData->{DefinitionRef},
        XMLDataPrev                  => $VersionData->{XMLData}->[1]->{Version}->[1],
        XMLData2D                    => \%XMLData2D,
        EmptyFieldsLeaveTheOldValues => $EmptyFieldsLeaveTheOldValues,
    );

    # bail out, when the was a problem in _ImportXMLDataMerge()
    if ( !$MergeOk ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message =>
                "Can't import entity $Param{Counter}: "
                . "Could not prepare the input!",
        );
        return;
    }

    my $RetCode = $ConfigItemID ? 'Changed' : 'Created';

    # check if the feature to check for a unique name is enabled
    if (
        IsStringWithData( $VersionData->{Name} )
        && $Kernel::OM->Get('Kernel::Config')->Get('UniqueCIName::EnableUniquenessCheck')
        )
    {

        if ( $Kernel::OM->Get('Kernel::Config')->{Debug} > 0 ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'debug',
                Message  => "Checking for duplicate names (ClassID: $ObjectData->{ClassID}, "
                    . "Name: $VersionData->{Name}, ConfigItemID: " . $ConfigItemID || 'NEW' . ')',
            );
        }

        my $NameDuplicates = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->UniqueNameCheck(
            ConfigItemID => $ConfigItemID || 'NEW',
            ClassID      => $ObjectData->{ClassID},
            Name         => $VersionData->{Name},
        );

        # stop processing if the name is not unique
        if ( IsArrayRefWithData($NameDuplicates) ) {

            # build a string of all duplicate IDs
            my $NameDuplicatesString = join ', ', @{$NameDuplicates};

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "The name $VersionData->{Name} is already in use by the ConfigItemID(s): "
                    . $NameDuplicatesString,
            );

            # set the return code to also include the duplicate name
            $RetCode = "DuplicateName '$VersionData->{Name}'";

            # return undef for the config item id so it will be counted as 'Failed'
            return undef, $RetCode;    ## no critic
        }
    }

    my $LatestVersionID = 0;
    if ($ConfigItemID) {

        # the specified config item already exists
        # get id of the latest version, for checking later whether a version was created
        my $VersionList = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionList(
            ConfigItemID => $ConfigItemID,
        ) || [];
        if ( scalar @{$VersionList} ) {
            $LatestVersionID = $VersionList->[-1];
        }
    }
    else {

        # no config item was found, so add new config item
        $ConfigItemID = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->ConfigItemAdd(
            ClassID => $ObjectData->{ClassID},
            UserID  => $Param{UserID},
        );

        # check the new config item id
        if ( !$ConfigItemID ) {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Can't import entity $Param{Counter}: "
                    . "Error when adding the new config item.",
            );
            return;
        }
    }

    # add new version
    my $VersionID = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionAdd(
        ConfigItemID => $ConfigItemID,
        Name         => $VersionData->{Name},
        DefinitionID => $DefinitionData->{DefinitionID},
        DeplStateID  => $VersionData->{DeplStateID},
        InciStateID  => $VersionData->{InciStateID},
        XMLData      => $VersionData->{XMLData},
        UserID       => $Param{UserID},
    );

    # the import was successful, when we get a version id
    if ($VersionID) {

        # When VersionAdd() returns the previous latest version ID, we know that
        # no new version has been added.
        # The import of this config item has been skipped.
        if ( $LatestVersionID && $VersionID == $LatestVersionID ) {
            $RetCode = 'Skipped';
        }

        return $ConfigItemID, $RetCode;
    }

    if ( $RetCode eq 'Created' ) {

        # delete the new config item
        $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->ConfigItemDelete(
            ConfigItemID => $ConfigItemID,
            UserID       => $Param{UserID},
        );
    }

    $Kernel::OM->Get('Kernel::System::Log')->Log(
        Priority => 'error',
        Message =>
            "Can't import entity $Param{Counter}: "
            . "Error when adding the new config item version.",
    );

    return;
}

=begin Internal:

=item _MappingObjectAttributesGet()

recursion function for MappingObjectAttributesGet().
Definitions for object attributes are passed in C<XMLDefinition>.
The new object attributes are appended to C<ElementList>.
C<CountMaxLimit> limits the max length of importable arrays.

    $ObjectBackend->_MappingObjectAttributesGet(
        XMLDefinition => $ArrayRef,
        ElementList   => $ArrayRef,
        CountMaxLimit => 10,
    );

=cut

sub _MappingObjectAttributesGet {
    my ( $Self, %Param ) = @_;

    return if !$Param{CountMaxLimit};
    return if !$Param{XMLDefinition};
    return if !$Param{ElementList};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{ElementList} ne 'ARRAY';

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # limit the length of importable arrays, even if more elements can be set via the GUI
        my $CountMax = min( $Item->{CountMax}, $Param{CountMaxLimit} );

        COUNT:
        for my $Count ( 1 .. $CountMax ) {

            # create key string
            my $Key = $Item->{Key} . '::' . $Count;

            # add prefix to key
            if ( $Param{KeyPrefix} ) {
                $Key = $Param{KeyPrefix} . '::' . $Key;
            }

            # create value string
            my $Value = $Item->{Key};

            # add count if required
            if ( $CountMax > 1 || $Item->{Sub} ) {
                $Value .= '::' . $Count;
            }

            # add prefix to key
            if ( $Param{ValuePrefix} ) {
                $Value = $Param{ValuePrefix} . '::' . $Value;
            }

            # add row
            my %Row = (
                Key   => $Key,
                Value => $Value,
            );
            push @{ $Param{ElementList} }, \%Row;

            next COUNT if !$Item->{Sub};

            # start recursion
            $Self->_MappingObjectAttributesGet(
                XMLDefinition => $Item->{Sub},
                ElementList   => $Param{ElementList},
                KeyPrefix     => $Key,
                ValuePrefix   => $Value,
                CountMaxLimit => $Param{CountMaxLimit} || '10',
            );
        }
    }

    return 1;
}

=item _SearchAttributesGet()

recursion function for MappingObjectAttributesGet()

    $ObjectBackend->_SearchAttributesGet(
        XMLDefinition => $ArrayRef,
        AttributeList => $ArrayRef,
    );

=cut

sub _SearchAttributesGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{AttributeList};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{AttributeList} ne 'ARRAY';

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # set prefix
        my $Key  = $Item->{Key};
        my $Name = $Item->{Name};

        if ( $Param{KeyPrefix} ) {
            $Key = $Param{KeyPrefix} . '::' . $Key;
        }

        if ( $Param{NamePrefix} ) {
            $Name = $Param{NamePrefix} . '::' . $Name;
        }

        # add attribute, if marked as searchable
        if ( $Item->{Searchable} ) {

            if ( $Item->{Input}->{Type} eq 'Text' || $Item->{Input}->{Type} eq 'TextArea' ) {

                my %Row = (
                    Key   => $Key,
                    Name  => $Name,
                    Input => {
                        Type        => 'Text',
                        Translation => $Item->{Input}->{Input}->{Translation},
                        Size        => $Item->{Input}->{Input}->{Size} || 60,
                        MaxLength   => $Item->{Input}->{Input}->{MaxLength},
                    },
                );

                push @{ $Param{AttributeList} }, \%Row;
            }
            elsif ( $Item->{Input}->{Type} eq 'GeneralCatalog' ) {

                # get general catalog list
                my $GeneralCatalogList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
                    Class => $Item->{Input}->{Class},
                ) || {};

                my %Row = (
                    Key   => $Key,
                    Name  => $Name,
                    Input => {
                        Type        => 'Selection',
                        Data        => $GeneralCatalogList,
                        Translation => $Item->{Input}->{Input}->{Translation},
                        Size        => 5,
                        Multiple    => 1,
                    },
                );

                push @{ $Param{AttributeList} }, \%Row;
            }
        }

        next ITEM if !$Item->{Sub};

        # start recursion, if "Sub" was found
        $Self->_SearchAttributesGet(
            XMLDefinition => $Item->{Sub},
            AttributeList => $Param{AttributeList},
            KeyPrefix     => $Key,
            NamePrefix    => $Name,
        );
    }

    return 1;
}

=item _ExportXMLSearchDataPrepare()

recursion function to prepare the export XML search params

    $ObjectBackend->_ExportXMLSearchDataPrepare(
        XMLDefinition => $ArrayRef,
        What          => $ArrayRef,
        SearchData    => $HashRef,
    );

=cut

sub _ExportXMLSearchDataPrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{What};
    return if !$Param{SearchData};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{What} ne 'ARRAY';
    return if ref $Param{SearchData} ne 'HASH';

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # create key
        my $Key = $Param{Prefix} ? $Param{Prefix} . '::' . $Item->{Key} : $Item->{Key};

        # prepare value
        my $Values = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->XMLExportSearchValuePrepare(
            Item  => $Item,
            Value => $Param{SearchData}->{$Key},
        );

        if ($Values) {

            # create search key
            my $SearchKey = $Key;
            $SearchKey =~ s{ :: }{\'\}[%]\{\'}xmsg;

            # create search hash
            my $SearchHash = {
                '[1]{\'Version\'}[1]{\'' . $SearchKey . '\'}[%]{\'Content\'}' => $Values,
            };

            push @{ $Param{What} }, $SearchHash;
        }

        next ITEM if !$Item->{Sub};

        # start recursion, if "Sub" was found
        $Self->_ExportXMLSearchDataPrepare(
            XMLDefinition => $Item->{Sub},
            What          => $Param{What},
            SearchData    => $Param{SearchData},
            Prefix        => $Key,
        );
    }

    return 1;
}

=item _ExportXMLDataPrepare()

recursion function to prepare the export XML data

    $ObjectBackend->_ExportXMLDataPrepare(
        XMLDefinition => $ArrayRef,
        XMLData       => $HashRef,
        XMLData2D     => $HashRef,
    );

=cut

sub _ExportXMLDataPrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{XMLData};
    return if !$Param{XMLData2D};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{XMLData} ne 'HASH';
    return if ref $Param{XMLData2D} ne 'HASH';

    if ( $Param{Prefix} ) {
        $Param{Prefix} .= '::';
    }
    $Param{Prefix} ||= '';

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {
        COUNTER:
        for my $Counter ( 1 .. $Item->{CountMax} ) {

            # stop loop, if no content was given
            last COUNTER if !defined $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content};

            # create key
            my $Key = $Param{Prefix} . $Item->{Key} . '::' . $Counter;

            # prepare value
            $Param{XMLData2D}->{$Key} = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->XMLExportValuePrepare(
                Item  => $Item,
                Value => $Param{XMLData}->{ $Item->{Key} }->[$Counter]->{Content},
            );

            next COUNTER if !$Item->{Sub};

            # start recursion, if "Sub" was found
            $Self->_ExportXMLDataPrepare(
                XMLDefinition => $Item->{Sub},
                XMLData       => $Param{XMLData}->{ $Item->{Key} }->[$Counter],
                XMLData2D     => $Param{XMLData2D},
                Prefix        => $Key,
            );
        }
    }

    return 1;
}

=item _ImportXMLSearchDataPrepare()

recursion function to prepare the import XML search params

    $ObjectBackend->_ImportXMLSearchDataPrepare(
        XMLDefinition => $ArrayRef,
        What          => $ArrayRef,
        Identifier    => $HashRef,
    );

=cut

sub _ImportXMLSearchDataPrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{What};
    return if !$Param{Identifier};
    return if ref $Param{XMLDefinition} ne 'ARRAY';
    return if ref $Param{What} ne 'ARRAY';
    return if ref $Param{Identifier} ne 'HASH';

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        # create key
        my $Key = $Param{Prefix} ? $Param{Prefix} . '::\d+::' . $Item->{Key} : $Item->{Key};
        $Key .= '::\d+';

        my $IdentifierKey;
        IDENTIFIERKEY:
        for my $IdentKey ( sort keys %{ $Param{Identifier} } ) {

            next IDENTIFIERKEY if $IdentKey !~ m{ \A $Key \z }xms;

            $IdentifierKey = $IdentKey;
        }

        if ($IdentifierKey) {

            # prepare value
            my $Value = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->XMLImportSearchValuePrepare(
                Item  => $Item,
                Value => $Param{Identifier}->{$IdentifierKey},
            );

            if ($Value) {

                # prepare key
                my $Counter = 0;
                while ( $IdentifierKey =~ m{ :: }xms ) {

                    if ( $Counter % 2 ) {
                        $IdentifierKey =~ s{ :: }{]\{'}xms;
                    }
                    else {
                        $IdentifierKey =~ s{ :: }{'\}[}xms;
                    }

                    $Counter++;
                }

                # create search hash
                my $SearchHash = {
                    '[1]{\'Version\'}[1]{\'' . $IdentifierKey . ']{\'Content\'}' => $Value,
                };

                push @{ $Param{What} }, $SearchHash;
            }
        }

        next ITEM if !$Item->{Sub};

        # start recursion, if "Sub" was found
        $Self->_ImportXMLSearchDataPrepare(
            XMLDefinition => $Item->{Sub},
            What          => $Param{What},
            Identifier    => $Param{Identifier},
            Prefix        => $Key,
        );
    }

    return 1;
}

=item _ImportXMLDataMerge()

recursive function to inplace edit the import XML data.

    my $MergeOk = $ObjectBackend->_ImportXMLDataMerge(
        XMLDefinition => $ArrayRef,
        XMLDataPrev   => $HashRef,
        XMLData2D     => $HashRef,
    );

The return value indicates wheter the merge was successful.
A merge fails when for example a general catalog item name can't be mapped to an id.

=cut

sub _ImportXMLDataMerge {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{XMLDefinition};
    return if !$Param{XMLData2D};
    return if !$Param{XMLDataPrev};
    return if ref $Param{XMLDefinition} ne 'ARRAY';    # the attributes of the config item class
    return if ref $Param{XMLData2D} ne 'HASH';         # hash with values that should be imported
    return if ref $Param{XMLDataPrev} ne 'HASH';       # hash with current values of the config item

    my $XMLData = $Param{XMLDataPrev};

    # default value for prefix
    $Param{Prefix} ||= '';

    ITEM:
    for my $Item ( @{ $Param{XMLDefinition} } ) {

        COUNTER:
        for my $Counter ( 1 .. $Item->{CountMax} ) {

            # create inputkey
            my $Key = $Param{Prefix} . $Item->{Key} . '::' . $Counter;

            # start recursion, if "Sub" was found
            if ( $Item->{Sub} ) {
                $XMLData->{ $Item->{Key} }->[$Counter]
                    ||= {};    # empty container, in case there is no previous data
                my $MergeOk = $Self->_ImportXMLDataMerge(
                    XMLDefinition                => $Item->{Sub},
                    XMLData2D                    => $Param{XMLData2D},
                    XMLDataPrev                  => $XMLData->{ $Item->{Key} }->[$Counter],
                    Prefix                       => $Key . '::',
                    EmptyFieldsLeaveTheOldValues => $Param{EmptyFieldsLeaveTheOldValues},
                );

                return if !$MergeOk;
            }

            # When the data point is not part of the input definition,
            # then do not overwrite the previous setting.
            # False values are OK.
            next COUNTER if !exists $Param{XMLData2D}->{$Key};

            if ( $Param{EmptyFieldsLeaveTheOldValues} ) {

                # do not override old value with an empty field is imported
                next COUNTER if !defined $Param{XMLData2D}->{$Key};
                next COUNTER if $Param{XMLData2D}->{$Key} eq '';
            }

            # prepare value
            my $Value = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->XMLImportValuePrepare(
                Item  => $Item,
                Value => $Param{XMLData2D}->{$Key},
            );

            # let merge fail, when a value cannot be prepared
            return if !defined $Value;

            # save the prepared value
            $XMLData->{ $Item->{Key} }->[$Counter]->{Content} = $Value;
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
