# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMConfigItem::XML;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::System::ITSMConfigItem::XML - sub module of Kernel::System::ITSMConfigItem

=head1 SYNOPSIS

All xml functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item XMLValueLookup()

lookup a xml value

    my $Value = $ConfigItemObject->XMLValueLookup(
        Item  => $ItemRef,
        Value => 5,
    );

=cut

sub XMLValueLookup {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} || ( $Param{Item} && ref $Param{Item} ne 'HASH' ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    # load backend
    my $BackendObject = $Kernel::OM->Get(
        'Kernel::System::ITSMConfigItem::XML::Type::' . $Param{Item}->{Input}->{Type}
    );

    return '' if !$BackendObject;

    # lookup item value
    my $Value = $BackendObject->ValueLookup(%Param);

    return $Value;
}

=item XMLStatsAttributeCreate()

create a attribute array for the stats framework

    my $Value = $ConfigItemObject->XMLStatsAttributeCreate(
        Item => $ItemRef,
    );

=cut

sub XMLStatsAttributeCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    # load backend
    my $BackendObject = $Kernel::OM->Get(
        'Kernel::System::ITSMConfigItem::XML::Type::' . $Param{Item}->{Input}->{Type}
    );

    return if !$BackendObject;

    # create stats attribute array
    my $Attribute = $BackendObject->StatsAttributeCreate(%Param);

    return $Attribute;
}

=item XMLExportSearchValuePrepare()

prepare xml search data for export

    my $ArrayRef = $ConfigItemObject->XMLExportSearchValuePrepare(
        Item  => $ItemRef,
        Value => 5,
    );

=cut

sub XMLExportSearchValuePrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} || ( $Param{Item} && ref $Param{Item} ne 'HASH' ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    # load backend
    my $BackendObject = $Kernel::OM->Get(
        'Kernel::System::ITSMConfigItem::XML::Type::' . $Param{Item}->{Input}->{Type}
    );

    return if !$BackendObject;

    # prepare value
    my $Array = $BackendObject->ExportSearchValuePrepare(%Param);

    return $Array;
}

=item XMLExportValuePrepare()

prepare xml data for export

    my $Value = $ConfigItemObject->XMLExportValuePrepare(
        Item  => $ItemRef,
        Value => 5,
    );

=cut

sub XMLExportValuePrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} || ( $Param{Item} && ref $Param{Item} ne 'HASH' ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    # load backend
    my $BackendObject = $Kernel::OM->Get(
        'Kernel::System::ITSMConfigItem::XML::Type::' . $Param{Item}->{Input}->{Type}
    );

    return if !$BackendObject;

    # prepare value
    my $Value = $BackendObject->ExportValuePrepare(%Param);

    return $Value;
}

=item XMLImportSearchValuePrepare()

prepare xml search data for import

    my $ArrayRef = $ConfigItemObject->XMLImportSearchValuePrepare(
        Item  => $ItemRef,
        Value => 5,
    );

=cut

sub XMLImportSearchValuePrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} || ( $Param{Item} && ref $Param{Item} ne 'HASH' ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    # load backend
    my $BackendObject = $Kernel::OM->Get(
        'Kernel::System::ITSMConfigItem::XML::Type::' . $Param{Item}->{Input}->{Type}
    );

    return if !$BackendObject;

    # prepare value
    my $Array = $BackendObject->ImportSearchValuePrepare(%Param);

    return $Array;
}

=item XMLImportValuePrepare()

prepare xml data for import

    my $Value = $ConfigItemObject->XMLImportValuePrepare(
        Item  => $ItemRef,
        Value => 5,
    );

=cut

sub XMLImportValuePrepare {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Item} || ref $Param{Item} ne 'HASH' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Item!',
        );
        return;
    }

    # load backend
    my $BackendObject = $Kernel::OM->Get(
        'Kernel::System::ITSMConfigItem::XML::Type::' . $Param{Item}->{Input}->{Type}
    );

    return if !$BackendObject;

    # prepare value
    my $Value = $BackendObject->ImportValuePrepare(%Param);

    return $Value;
}

=item _XMLVersionSearch()

Search xml data of a version and return a hash reference.
The C<What> parameter is a bit like the parameter used in L<SQL::Abstract>.
The returned hash reference has C<VersionID>s as keys and C<1> as value.

    my $VersionIDs = $ConfigItemObject->_XMLVersionSearch(
        ClassIDs => [1, 2, 3],  # (optional)

        What => [
            # each array element is a and condition
            {
                # or condition in hash
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => '%contentA%',
                "[%]{'Version'}[%]{'ConfigItemAttrC'}[%]{'Content'}" => '%contentA%',
            },
            {
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => '%contentB%',
                "[%]{'Version'}[%]{'ConfigItemAttrC'}[%]{'Content'}" => '%contentB%',
            },
            {
                # use array reference if different content with same key was searched
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => [
                    '%contentC%',
                    '%contentD%',
                    '%contentE%',
                ],
                "[%]{'Version'}[%]{'ConfigItemAttrC'}[%]{'Content'}" => [
                    '%contentC%',
                    '%contentD%',
                    '%contentE%',
                ],
            },
            {
                # use hash reference for specifying comparison ops, apart from the default 'LIKE'
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => { '<'        => 'alphabetically_lower_or_equal' },
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => { '<='       => 'alphabetically_less_or_equal' },
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => { '='        => 'exact_match' },
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => { '>='       => 'alphabetically_larger_or_equal' },
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => { '>'        => 'alphabetically_larger' },
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => { '-between' => [ 'lower_bound', 'upper_bound' ] },
            },
        ],

        PreviousVersionSearch => 1,  # (optional) default 0 (0|1)
    );

=cut

sub _XMLVersionSearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{What} || ref $Param{What} ne 'ARRAY' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need What as array reference!",
        );
        return;
    }

    if ( !$Param{ClassIDs} || ref $Param{ClassIDs} ne 'ARRAY' || !@{ $Param{ClassIDs} } ) {

        # get class list
        my $ClassList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
            Class => 'ITSM::ConfigItem::Class',
        );

        @{ $Param{ClassIDs} } = keys %{$ClassList};
    }

    # search in active versions
    my %VersionIDs;
    for my $ClassID ( @{ $Param{ClassIDs} } ) {

        # start xml search
        my @Keys = $Self->_XMLHashSearch(
            Type => "ITSM::ConfigItem::$ClassID",
            What => $Param{What},
        );

        # add all ids to version id hash
        for my $VersionID (@Keys) {
            $VersionIDs{$VersionID} = 1;
        }
    }

    return \%VersionIDs if !$Param{PreviousVersionSearch};

    # search also in old versions (archiv)
    for my $ClassID ( @{ $Param{ClassIDs} } ) {

        # start xml search
        my @Keys = $Self->_XMLHashSearch(
            Type => "ITSM::ConfigItem::Archiv::$ClassID",
            What => $Param{What},
        );

        # add all ids to version id hash
        for my $VersionID (@Keys) {
            $VersionIDs{$VersionID} = 1;
        }
    }

    return \%VersionIDs;
}

=item _XMLVersionGet()

get the xml data of a version

    my $ArrayRef = $ConfigItemObject->_XMLVersionGet(
        ClassID   => 1,
        VersionID => 123,
    );

=cut

sub _XMLVersionGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ClassID VersionID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get version
    my @XML = $Kernel::OM->Get('Kernel::System::XML')->XMLHashGet(
        Type => "ITSM::ConfigItem::$Param{ClassID}",
        Key  => $Param{VersionID},
    );

    return \@XML if @XML;

    # get version from archiv
    @XML = $Kernel::OM->Get('Kernel::System::XML')->XMLHashGet(
        Type => "ITSM::ConfigItem::Archiv::$Param{ClassID}",
        Key  => $Param{VersionID},
    );

    return \@XML;
}

=item _XMLVersionAdd()

add the xml data of a new version and move old xml versions in archiv class

    my $XMLID = $ConfigItemObject->_XMLVersionAdd(
        ClassID      => 1,
        ConfigItemID => 222,
        VersionID    => 123,
        XMLData      => $ArrayRef,
    );

=cut

sub _XMLVersionAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ClassID ConfigItemID VersionID XMLData)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # add xml version
    my $XMLID = $Kernel::OM->Get('Kernel::System::XML')->XMLHashAdd(
        Type    => "ITSM::ConfigItem::$Param{ClassID}",
        Key     => $Param{VersionID},
        XMLHash => $Param{XMLData},
    );

    # get last versions
    my $OldVersionIDs = $Self->VersionList(
        ConfigItemID => $Param{ConfigItemID},
    );

    # Find Version to move
    my $MoveVersion;
    OLDVERSIONID:
    for my $OldVersionID ( @{$OldVersionIDs} ) {
        last OLDVERSIONID if $OldVersionID eq $Param{VersionID};

        $MoveVersion = $OldVersionID;
    }

    return $XMLID if !$MoveVersion;

    # move old version in archiv
    $Kernel::OM->Get('Kernel::System::XML')->XMLHashMove(
        OldType => "ITSM::ConfigItem::$Param{ClassID}",
        OldKey  => $MoveVersion,
        NewType => "ITSM::ConfigItem::Archiv::$Param{ClassID}",
        NewKey  => $MoveVersion,
    );

    return $XMLID;
}

=item _XMLVersionDelete()

delete the xml data of a version

    my $True = $ConfigItemObject->_XMLVersionDelete(
        VersionID => 123,
        UserID    => 1,
    );

=cut

sub _XMLVersionDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(VersionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # get version data
    my $Version = $Self->VersionGet(
        VersionID => $Param{VersionID},
    );

    return if !$Version;

    # delete xml data from a version
    $Kernel::OM->Get('Kernel::System::XML')->XMLHashDelete(
        Type => "ITSM::ConfigItem::$Version->{ClassID}",
        Key  => $Param{VersionID},
    );

    # delete xml data from archiv
    $Kernel::OM->Get('Kernel::System::XML')->XMLHashDelete(
        Type => "ITSM::ConfigItem::Archiv::$Version->{ClassID}",
        Key  => $Param{VersionID},
    );

    return 1;
}

=item _XMLHashSearch()

Search a xml hash from database.
This method is based on Kernel::System::XMLHashSearch, but has support for some extra features.
A specific operator can be specified in a hash.
The syntax is based on L<SQL::Abstract>.

    my @Keys = $ConfigItemObject->_XMLHashSearch(
        Type => 'SomeType',
        What => [
            # each array element is a and condition
            {
                # or condition in hash
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => '%contentA%',
                "[%]{'Version'}[%]{'ConfigItemAttrC'}[%]{'Content'}" => '%contentA%',
            },
            {
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => '%contentB%',
                "[%]{'Version'}[%]{'ConfigItemAttrC'}[%]{'Content'}" => '%contentB%',
            },
            {
                # use array reference if different content with same key was searched
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => ['%contentC%', '%contentD%', '%contentE%'],
                "[%]{'Version'}[%]{'ConfigItemAttrC'}[%]{'Content'}" => ['%contentC%', '%contentD%', '%contentE%'],
            },
            {
                # use hash reference for specifying comparison ops, apart from the default 'LIKE'
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => { '<'         => 'alphabetically_lower_or_equal' },
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => { '<='        => 'alphabetically_less_or_equal' },
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => { '='         => 'exact_match' },
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => { '!='        => 'exact_match' },
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => { '>='        => 'alphabetically_larger_or_equal' },
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => { '>'         => 'alphabetically_larger' },
                "[%]{'Version'}[%]{'ConfigItemAttrB'}[%]{'Content'}" => { '-between'  => [ 'lower_bound', 'upper_bound' ] },
            },
        ],
    );

=cut

sub _XMLHashSearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Type} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Type!',
        );
        return;
    }

    # get like escape string needed for some databases (e.g. oracle)
    my $LikeEscapeString = $Kernel::OM->Get('Kernel::System::DB')->GetDatabaseFunction('LikeEscapeString');

    # get all entries if we have no restriction
    if ( !$Param{What} || ref $Param{What} ne 'ARRAY' ) {
        return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL  => 'SELECT DISTINCT(xml_key) FROM xml_storage WHERE xml_type = ?',
            Bind => [ \$Param{Type} ],
        );

        my @Keys;
        while ( my @Data = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
            push @Keys, $Data[0];
        }

        return @Keys;
    }

    # otherwise only get entries restricted by 'What' parameter

    my %OpIsSupported = map { $_ => 1 } ( '<', '<=', '=', '!=', '>=', '>', '-between' );

    # the array elements are 'and' combined
    my $Intersect = 0;
    my %Hash;
    for my $And ( @{ $Param{What} } ) {

        # the key/value pairs are 'or' combined
        my @OrConditions;
        for my $Key ( sort keys %{$And} ) {
            my $Value = $And->{$Key};

            $Self->_PrepareLikeString( \$Key );

            if ( $Value && ref $Value eq 'ARRAY' ) {

                # when an array of possible values is given,
                # we use 'LIKE'-conditions and combine them with 'OR'
                for my $Element ( @{$Value} ) {

                    $Self->_PrepareLikeString( \$Element );

                    push @OrConditions,
                        " (xml_content_key LIKE '$Key' $LikeEscapeString "
                        . "AND xml_content_value LIKE '$Element' $LikeEscapeString)";
                }
            }
            elsif ( $Value && ref $Value eq 'HASH' ) {

                # a hashref indicates a specific comparison op
                # currently only a single op, with a single value, is supported

                # Under Oracle the attribute 'xml_content_value' is a CLOB,
                # a Character Locator Object. While selection with LIKE is possible,
                # the alphabetical comparison ops are not supported.
                # See http://download.oracle.com/docs/cd/B12037_01/appdev.101/b10796/\
                # adlob_sq.htm#1006215
                # As a workaround we cast the CLOB to a VARCHAR2 with TO_CHAR().
                my $XMLContentValueColumn = 'xml_content_value';
                if (
                    $Kernel::OM->Get('Kernel::System::DB')->GetDatabaseFunction('Type') eq
                    'oracle'
                    )
                {
                    $XMLContentValueColumn = 'TO_CHAR(xml_content_value)';
                }

                my ($Op) = keys %{$Value};
                my $Element = $Value->{$Op};
                if ( $Op && $Op eq '-between' && ref $Element eq 'ARRAY' ) {
                    my $LowerBound = $Kernel::OM->Get('Kernel::System::DB')->Quote( $Element->[0] );
                    my $UpperBound = $Kernel::OM->Get('Kernel::System::DB')->Quote( $Element->[1] );
                    push @OrConditions,
                        " ( xml_content_key LIKE '$Key' $LikeEscapeString "
                        . "AND $XMLContentValueColumn >= '$LowerBound' "
                        . "AND $XMLContentValueColumn <= '$UpperBound' )";
                }
                elsif ( $Op && $OpIsSupported{$Op} && !ref $Element ) {
                    $Element = $Kernel::OM->Get('Kernel::System::DB')->Quote($Element) // '';
                    push @OrConditions,
                        " ( xml_content_key LIKE '$Key' $LikeEscapeString "
                        . "AND $XMLContentValueColumn $Op '$Element' )";
                }
                else {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message  => 'Got unexpected data in search!',
                    );
                    push @OrConditions, '( 1 = 1 )';
                }
            }
            else {

                # when a single  possible value is given,
                # we use a 'LIKE'-condition
                $Self->_PrepareLikeString( \$Value );

                push @OrConditions,
                    " (xml_content_key LIKE '$Key' $LikeEscapeString "
                    . "AND xml_content_value LIKE '$Value' $LikeEscapeString)";
            }
        }

        # assemble the SQL
        my $SQL = 'SELECT DISTINCT(xml_key) FROM xml_storage WHERE xml_type = ? ';
        if (@OrConditions) {
            $SQL .= 'AND ( ' . join( ' OR ', @OrConditions ) . ' )';
        }

        # execute
        $Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL  => $SQL,
            Bind => [ \$Param{Type} ],
        );

        # intersection between the current key set, and the keys from the last 'SELECT'
        # only the keys which are in all results survive
        my %HashNew;
        while ( my @Data = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
            if ( !$Intersect || $Hash{ $Data[0] } ) {
                $HashNew{ $Data[0] } = 1;
            }
        }
        %Hash = %HashNew;

        # remember to later intersect results
        ++$Intersect;
    }

    my @Keys = keys %Hash;

    return @Keys;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
