# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::LinkObject::ITSMConfigItem;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::ITSMConfigItem',
    'Kernel::System::Log',
);

=head1 NAME

Kernel/System/LinkObject/ITSMConfigItem.pm - LinkObject module for ITSMConfigItem

=over 4

=cut

=item new()

create an object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $LinkObjectITSMConfigItemObject = $Kernel::OM->Get('Kernel::System::LinkObject::ITSMConfigItem');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item LinkListWithData()

fill up the link list with data

    $Success = $LinkObjectBackend->LinkListWithData(
        LinkList => $HashRef,
        UserID   => 1,
    );

=cut

sub LinkListWithData {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(LinkList UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check link list
    if ( ref $Param{LinkList} ne 'HASH' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'LinkList must be a hash reference!',
        );
        return;
    }

    for my $LinkType ( sort keys %{ $Param{LinkList} } ) {

        for my $Direction ( sort keys %{ $Param{LinkList}->{$LinkType} } ) {

            CONFIGITEMID:
            for my $ConfigItemID ( sort keys %{ $Param{LinkList}->{$LinkType}->{$Direction} } ) {

                # get last version data
                my $VersionData = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionGet(
                    ConfigItemID => $ConfigItemID,
                    XMLDataGet   => 0,
                    UserID       => $Param{UserID},
                );

                # remove id from hash if config item can not get
                if ( !$VersionData || ref $VersionData ne 'HASH' || !%{$VersionData} ) {
                    delete $Param{LinkList}->{$LinkType}->{$Direction}->{$ConfigItemID};
                    next CONFIGITEMID;
                }

                # add version data
                $Param{LinkList}->{$LinkType}->{$Direction}->{$ConfigItemID} = $VersionData;
            }
        }
    }

    return 1;
}

=item ObjectPermission()

checks read permission for a given object and UserID.

    $Permission = $LinkObject->ObjectPermission(
        Object  => 'ITSMConfigItem',
        Key     => 123,
        UserID  => 1,
    );

=cut

sub ObjectPermission {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Object Key UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get config of configitem zoom frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get('ITSMConfigItem::Frontend::AgentITSMConfigItemZoom');

    # check for access rights
    my $Access = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->Permission(
        Scope  => 'Item',
        ItemID => $Param{Key},
        UserID => $Param{UserID},
        Type   => $Self->{Config}->{Permission},
    );

    return $Access;
}

=item ObjectDescriptionGet()

return a hash of object descriptions

Return
    %Description = (
        Normal => "ConfigItem# 1234455",
        Long   => "ConfigItem# 1234455: The Config Item Title",
    );

    %Description = $LinkObject->ObjectDescriptionGet(
        Key     => 123,
        UserID  => 1,
    );

=cut

sub ObjectDescriptionGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Object Key UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # create description
    my %Description = (
        Normal => 'ConfigItem',
        Long   => 'ConfigItem',
    );

    return %Description if $Param{Mode} && $Param{Mode} eq 'Temporary';

    # get last version data
    my $VersionData = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionGet(
        ConfigItemID => $Param{Key},
        XMLDataGet   => 0,
        UserID       => $Param{UserID},
    );

    return if !$VersionData;
    return if ref $VersionData ne 'HASH';
    return if !%{$VersionData};

    # create description
    %Description = (
        Normal => "ConfigItem# $VersionData->{Number}",
        Long   => "ConfigItem# $VersionData->{Number}: $VersionData->{Name}",
    );

    return %Description;
}

=item ObjectSearch()

return a hash list of the search results

Return
    $SearchList = {
        NOTLINKED => {
            Source => {
                12  => $DataOfItem12,
                212 => $DataOfItem212,
                332 => $DataOfItem332,
            },
        },
    };

    $SearchList = $LinkObjectBackend->ObjectSearch(
        SubObject    => '25',        # (optional)
        SearchParams => $HashRef,    # (optional)
        UserID       => 1,
    );

=cut

sub ObjectSearch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );
        return;
    }

    # set default params
    $Param{SearchParams} ||= {};

    # set focus
    my %Search;
    for my $Element (qw(Number Name)) {
        if ( $Param{SearchParams}->{$Element} ) {
            $Search{$Element} = '*' . $Param{SearchParams}->{$Element} . '*';
        }
    }

    if ( !$Param{SubObject} ) {

        # get the config with the default subobjects
        my $DefaultSubobject = $Kernel::OM->Get('Kernel::Config')->Get('LinkObject::DefaultSubObject') || {};

        # extract default class name
        my $DefaultClass = $DefaultSubobject->{ITSMConfigItem} || '';

        # get class list
        my $ClassList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
            Class => 'ITSM::ConfigItem::Class',
        );

        return if !$ClassList;
        return if ref $ClassList ne 'HASH';

        # lookup the class id
        my %ClassListReverse = reverse %{$ClassList};
        $Param{SubObject} = $ClassListReverse{$DefaultClass} || '';
    }

    return if !$Param{SubObject};

    # search the config items
    my $ConfigItemIDs = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->ConfigItemSearchExtended(
        %{ $Param{SearchParams} },
        %Search,
        ClassIDs              => [ $Param{SubObject} ],
        PreviousVersionSearch => 0,
        UsingWildcards        => 1,
        OrderBy               => ['Number'],
        OrderByDirection      => ['Up'],
        Limit                 => 50,
        UserID                => $Param{UserID},
    );

    my %SearchList;
    CONFIGITEMID:
    for my $ConfigItemID ( @{$ConfigItemIDs} ) {

        # get last version data
        my $VersionData = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->VersionGet(
            ConfigItemID => $ConfigItemID,
            XMLDataGet   => 0,
            UserID       => $Param{UserID},
        );

        next CONFIGITEMID if !$VersionData;
        next CONFIGITEMID if ref $VersionData ne 'HASH';
        next CONFIGITEMID if !%{$VersionData};

        # add version data
        $SearchList{NOTLINKED}->{Source}->{$ConfigItemID} = $VersionData;
    }

    return \%SearchList;
}

=item LinkAddPre()

link add pre event module

    $True = $LinkObject->LinkAddPre(
        Key          => 123,
        SourceObject => 'ITSMConfigItem',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkAddPre(
        Key          => 123,
        TargetObject => 'ITSMConfigItem',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkAddPre {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # do not trigger event for temporary links
    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

=item LinkAddPost()

link add pre event module

    $True = $LinkObject->LinkAddPost(
        Key          => 123,
        SourceObject => 'ITSMConfigItem',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkAddPost(
        Key          => 123,
        TargetObject => 'ITSMConfigItem',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkAddPost {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # do not trigger event for temporary links
    return 1 if $Param{State} eq 'Temporary';

    # get information about linked object
    my $ID     = $Param{TargetKey}    || $Param{SourceKey};
    my $Object = $Param{TargetObject} || $Param{SourceObject};

    # recalculate the current incident state of this CI
    $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->CurInciStateRecalc(
        ConfigItemID => $Param{Key},
    );

    # trigger LinkAdd event
    $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->EventHandler(
        Event => 'LinkAdd',
        Data  => {
            ConfigItemID => $Param{Key},
            Comment      => $ID . '%%' . $Object,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item LinkDeletePre()

link delete pre event module

    $True = $LinkObject->LinkDeletePre(
        Key          => 123,
        SourceObject => 'ITSMConfigItem',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkDeletePre(
        Key          => 123,
        TargetObject => 'ITSMConfigItem',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkDeletePre {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # do not trigger event for temporary links
    return 1 if $Param{State} eq 'Temporary';

    return 1;
}

=item LinkDeletePost()

link delete post event module

    $True = $LinkObject->LinkDeletePost(
        Key          => 123,
        SourceObject => 'ITSMConfigItem',
        SourceKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

    or

    $True = $LinkObject->LinkDeletePost(
        Key          => 123,
        TargetObject => 'ITSMConfigItem',
        TargetKey    => 321,
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => 1,
    );

=cut

sub LinkDeletePost {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Key Type State UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # do not trigger event for temporary links
    return 1 if $Param{State} eq 'Temporary';

    # get information about linked object
    my $ID     = $Param{TargetKey}    || $Param{SourceKey};
    my $Object = $Param{TargetObject} || $Param{SourceObject};

    # recalculate the current incident state of this CI
    $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->CurInciStateRecalc(
        ConfigItemID => $Param{Key},
    );

    # trigger LinkDelete event
    $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->EventHandler(
        Event => 'LinkDelete',
        Data  => {
            ConfigItemID => $Param{Key},
            Comment      => $ID . '%%' . $Object,
        },
        UserID => $Param{UserID},
    );

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
