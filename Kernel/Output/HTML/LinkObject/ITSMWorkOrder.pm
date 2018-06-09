# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::LinkObject::ITSMWorkOrder;

use strict;
use warnings;

use Kernel::Output::HTML::Layout;
use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Language',
    'Kernel::System::JSON',
    'Kernel::System::Log',
    'Kernel::System::User',
    'Kernel::System::Web::Request',
);

=head1 NAME

Kernel::Output::HTML::LinkObject::ITSMWorkOrder - layout backend module

=head1 SYNOPSIS

All layout functions of link object (workorder)

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::LinkObject::ITSMWorkOrder->new(
        UserLanguage => 'en',
        UserID       => 1,
    );

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Needed (qw(UserLanguage UserID)) {
        $Self->{$Needed} = $Param{$Needed} || die "Got no $Needed!";
    }

    # We need our own LayoutObject instance to avoid blockdata collisions
    #   with the main page.
    $Self->{LayoutObject} = Kernel::Output::HTML::Layout->new( %{$Self} );

    # define needed variables
    $Self->{ObjectData} = {
        Object     => 'ITSMWorkOrder',
        Realname   => 'Workorder',
        ObjectName => 'SourceObjectID',
    };

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get config
    $Self->{ChangeHook}    = $ConfigObject->Get('ITSMChange::Hook');
    $Self->{WorkOrderHook} = $ConfigObject->Get('ITSMWorkOrder::Hook');

    return $Self;
}

=item TableCreateComplex()

return an array with the block data

Return

    @BlockData = (
        Object    => 'ITSMWorkOrder',
        Blockname => 'WorkOrder',
        Headline  => [
            {
                Content => '',
                Width   => 20,
            },
            {
                Content => 'Workorder#',
                Width   => 200,
            },
            {
                Content => 'Workorder Title',
                Width   => 200,
            },
            {
                Content => 'Change Title',
                Width   => 200,
            },
            {
                Content => 'Workorder State',
                Width   => 100,
            },
            {
                Content => 'Changed',
                Width   => 150,
            },
        ],
        ItemList => [
            [
                {
                    Type           => 'WorkOrderStateSignal',
                    Key            => 2,
                    Content        => 'greenled',
                    WorkOrderState => 'ready',
                },
                {
                    Type    => 'Link',
                    Content => '2009100112345778-3',
                    Link    => 'Action=AgentITSMWorkOrderZoom;WorkOrderID=2',
                },
                {
                    Type      => 'Text',
                    Content   => 'Workorder Title',
                    MaxLength => 70,
                },
                {
                    Type      => 'Text',
                    Content   => 'Change Title',
                    MaxLength => 70,
                },
                {
                    Type    => 'Text',
                    Content => 'ready',
                },
                {
                    Type    => 'TimeLong',
                    Content => '2009-01-01 12:12:00',
                },
            ],
            [
                {
                    Type           => 'WorkOrderStateSignal',
                    Key            => 4,
                    Content        => 'redled',
                    WorkOrderState => 'canceld',
                },
                {
                    Type    => 'Link',
                    Content => '2009100112345778-4',
                    Link    => 'Action=AgentITSMWorkOrderZoom;WorkOrderID=4',
                },
                {
                    Type      => 'Text',
                    Content   => 'Workorder Title',
                    MaxLength => 70,
                },
                {
                    Type      => 'Text',
                    Content   => 'Change Title',
                    MaxLength => 70,
                },
                {
                    Type    => 'Text',
                    Content => 'accepted',
                },
                {
                    Type    => 'TimeLong',
                    Content => '2009-02-02 13:13:00',
                },
            ],
        ],
    );

    @BlockData = $LinkObject->TableCreateComplex(
        ObjectLinkListWithData => $ObjectLinkListRef,
    );

=cut

sub TableCreateComplex {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ObjectLinkListWithData} || ref $Param{ObjectLinkListWithData} ne 'HASH' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ObjectLinkListWithData!',
        );
        return;
    }

    # convert the list
    my %LinkList;
    for my $LinkType ( sort keys %{ $Param{ObjectLinkListWithData} } ) {

        # extract link type List
        my $LinkTypeList = $Param{ObjectLinkListWithData}->{$LinkType};

        for my $Direction ( sort keys %{$LinkTypeList} ) {

            # extract direction list
            my $DirectionList = $Param{ObjectLinkListWithData}->{$LinkType}->{$Direction};

            for my $WorkOrderID ( sort keys %{$DirectionList} ) {

                $LinkList{$WorkOrderID}->{Data} = $DirectionList->{$WorkOrderID};
            }
        }
    }

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $ComplexTableData = $ConfigObject->Get("LinkObject::ComplexTable");
    my $DefaultColumns;
    if (
        $ComplexTableData
        && IsHashRefWithData($ComplexTableData)
        && $ComplexTableData->{ITSMWorkOrder}
        && IsHashRefWithData( $ComplexTableData->{ITSMWorkOrder} )
        )
    {
        $DefaultColumns = $ComplexTableData->{"ITSMWorkOrder"}->{"DefaultColumns"};
    }

    my @TimeLongTypes = (
        'CreateTime',
        'ChangeTime',
        'PlannedStartTime',
        'PlannedEndTime',
        'ActualStartTime',
        'ActualEndTime',
    );

    my @TranslateTypes = ();

    # always show the change state flag and the change number
    my @Headline = (
        {
            Content => 'WorkOrderState',
        },
        {
            Content => $Self->{WorkOrderHook},
        },
    );

    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # Load user preferences.
    my %Preferences = $UserObject->GetPreferences(
        UserID => $Self->{UserID},
    );

    if ( !$DefaultColumns || !IsHashRefWithData($DefaultColumns) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Missing configuration for LinkObject::ComplexTable###ITSMWorkOrder!',
        );
        return;
    }

    # Get default column priority from SysConfig.
    # Each column in table (Title, State,...) has defined Priority in SysConfig. System use this
    #   priority to sort columns, if user doesn't have own settings.
    my %SortOrder;
    if (
        $ComplexTableData->{"ITSMWorkOrder"}->{"Priority"}
        && IsHashRefWithData( $ComplexTableData->{"ITSMWorkOrder"}->{"Priority"} )
        )
    {
        %SortOrder = %{ $ComplexTableData->{"ITSMWorkOrder"}->{"Priority"} };
    }

    my %UserColumns = %{$DefaultColumns};

    if ( $Preferences{'LinkObject::ComplexTable-ITSMWorkOrder'} ) {

        my $ColumnsEnabled = $Kernel::OM->Get('Kernel::System::JSON')->Decode(
            Data => $Preferences{'LinkObject::ComplexTable-ITSMWorkOrder'},
        );

        if (
            $ColumnsEnabled
            && IsHashRefWithData($ColumnsEnabled)
            && $ColumnsEnabled->{Order}
            && IsArrayRefWithData( $ColumnsEnabled->{Order} )
            )
        {
            # Clear sort order.
            %SortOrder = ();

            DEFAULTCOLUMN:
            for my $DefaultColumn ( sort keys %UserColumns ) {
                my $Index = 0;

                for my $UserSetting ( @{ $ColumnsEnabled->{Order} } ) {
                    $Index++;
                    if ( $DefaultColumn eq $UserSetting ) {
                        $UserColumns{$DefaultColumn} = 2;
                        $SortOrder{$DefaultColumn}   = $Index;

                        next DEFAULTCOLUMN;
                    }
                }

                # Not found, means user chose to hide this item.
                if ( $UserColumns{$DefaultColumn} == 2 ) {
                    $UserColumns{$DefaultColumn} = 1;
                }

                if ( !$SortOrder{$DefaultColumn} ) {
                    $SortOrder{$DefaultColumn} = 0;    # Set 0, it system will hide this item anyways
                }
            }
        }
    }
    else {

        # User has no own settings.
        for my $Column ( sort keys %UserColumns ) {
            if ( !$SortOrder{$Column} ) {
                $SortOrder{$Column} = 0;               # Set 0, it system will hide this item anyways
            }
        }
    }

    # Define Headline columns.
    COLUMN:
    for my $Column ( sort { $SortOrder{$a} <=> $SortOrder{$b} } keys %UserColumns ) {

        # if enabled by default.
        if ( $UserColumns{$Column} == 2 ) {
            my $ColumnName = '';

            if ( $Column eq 'CreateTime' ) {
                $ColumnName = 'Created';
            }
            elsif ( $Column eq 'ChangeTime' ) {
                $ColumnName = 'Changed';
            }

            # all other fields
            else {
                $ColumnName = $Column;
            }

            push @Headline, {
                Content => $ColumnName,
            };
        }
    }

    # create the item list, sort by ChangeID Down, then by WorkOrderID Up
    my @ItemList;
    for my $WorkOrderID (
        sort {
            $LinkList{$b}{Data}->{ChangeID} <=> $LinkList{$a}{Data}->{ChangeID}
                || $a <=> $b
        } keys %LinkList
        )
    {

        # extract workorder data
        my $WorkOrder = $LinkList{$WorkOrderID}->{Data};

        my @ItemColumns = (
            {
                Type           => 'WorkOrderStateSignal',
                Key            => $WorkOrderID,
                Content        => $WorkOrder->{WorkOrderStateSignal},
                WorkOrderState => $WorkOrder->{WorkOrderState},
            },
            {
                Type    => 'Link',
                Content => $WorkOrder->{ChangeData}->{ChangeNumber}
                    . '-' . $WorkOrder->{WorkOrderNumber},
                Link => $Self->{LayoutObject}->{Baselink}
                    . 'Action=AgentITSMWorkOrderZoom;WorkOrderID='
                    . $WorkOrderID,
                Title => $Self->{ChangeHook} . $WorkOrder->{ChangeData}->{ChangeNumber} . '-'
                    . $Self->{WorkOrderHook}
                    . $WorkOrder->{WorkOrderNumber} . ': '
                    . $WorkOrder->{WorkOrderTitle},
            },
        );

        COLUMN:
        for my $Column ( sort { $SortOrder{$a} <=> $SortOrder{$b} } keys %UserColumns ) {

            # if enabled by default
            if ( $UserColumns{$Column} == 2 ) {

                my %Hash;
                if ( grep { $_ eq $Column } @TimeLongTypes ) {
                    $Hash{'Type'} = 'TimeLong';
                }
                else {
                    $Hash{'Type'} = 'Text';
                }

                if ( grep { $_ eq $Column } @TranslateTypes ) {
                    $Hash{'Translate'} = 1;
                }

                $Hash{'Content'} = $WorkOrder->{$Column};

                push @ItemColumns, \%Hash;
            }
        }

        push @ItemList, \@ItemColumns;
    }

    return if !@ItemList;

    # Define the block data.
    my %Block = (
        Object     => $Self->{ObjectData}->{Object},
        Blockname  => $Self->{ObjectData}->{Object},
        ObjectName => $Self->{ObjectData}->{ObjectName},
        ObjectID   => $Param{ObjectID},
        Headline   => \@Headline,
        ItemList   => \@ItemList,
    );

    return ( \%Block );

}

=item TableCreateSimple()

return a hash with the link output data

Return

    %LinkOutputData = (
        Normal::Source => {
            ITSMWorkOrder => [
                {
                    Type    => 'Link',
                    Content => 'WO:2009100112354321-1',
                    Title   => 'Change# 2009101610005402 - Workorder# 1: The WorkOrder Title',
                    Css     => 'style="text-decoration: line-through"',
                },
                {
                    Type    => 'Link',
                    Content => 'WO:2009100112354321-6',
                    Title   => 'Change# 2009101610007634 - Workorder# 6: The WorkOrder Title',
                },
            ],
        },
        ParentChild::Target => {
            ITSMWorkOrder => [
                {
                    Type    => 'Link',
                    Content => 'WO:2009100112354321-3',
                    Title   => 'Change# 20091016100044331 - Workorder# 3: The WorkOrder Title',
                },
            ],
        },
    );

    %LinkOutputData = $LinkObject->TableCreateSimple(
        ObjectLinkListWithData => $ObjectLinkListRef,
    );

=cut

sub TableCreateSimple {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ObjectLinkListWithData} || ref $Param{ObjectLinkListWithData} ne 'HASH' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ObjectLinkListWithData!',
        );
        return;
    }

    my %LinkOutputData;
    for my $LinkType ( sort keys %{ $Param{ObjectLinkListWithData} } ) {

        # extract link type List
        my $LinkTypeList = $Param{ObjectLinkListWithData}->{$LinkType};

        for my $Direction ( sort keys %{$LinkTypeList} ) {

            # extract direction list
            my $DirectionList = $Param{ObjectLinkListWithData}->{$LinkType}->{$Direction};

            # create the item list, sort by ChangeID Down, then by WorkOrderNumber Up
            my @ItemList;
            for my $WorkOrderID (
                sort {
                    $DirectionList->{$b}->{ChangeID} <=> $DirectionList->{$a}->{ChangeID}
                        || $a <=> $b
                } keys %{$DirectionList}
                )
            {

                # extract workorder data
                my $WorkOrder = $DirectionList->{$WorkOrderID};

                # define item data
                my %Item = (
                    Type    => 'Link',
                    Content => 'WO:' . $WorkOrder->{ChangeData}->{ChangeNumber} . '-'
                        . $WorkOrder->{WorkOrderNumber},
                    Title => $Self->{ChangeHook} . $WorkOrder->{ChangeData}->{ChangeNumber} . '-'
                        . $Self->{WorkOrderHook}
                        . $WorkOrder->{WorkOrderNumber} . ': '
                        . $WorkOrder->{WorkOrderTitle},
                    Link => $Self->{LayoutObject}->{Baselink}
                        . 'Action=AgentITSMWorkOrderZoom;WorkOrderID='
                        . $WorkOrderID,
                    MaxLength => 20,
                );

                push @ItemList, \%Item;
            }

            # add item list to link output data
            $LinkOutputData{ $LinkType . '::' . $Direction }->{ITSMWorkOrder} = \@ItemList;
        }
    }

    return %LinkOutputData;
}

=item ContentStringCreate()

return a output string

    my $String = $LayoutObject->ContentStringCreate(
        ContentData => $HashRef,
    );

=cut

sub ContentStringCreate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ContentData} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ContentData!',
        );
        return;
    }

    # extract content
    my $Content = $Param{ContentData};

    return if $Content->{Type} ne 'WorkOrderStateSignal';

    # build html for signal LED
    my $String = $Self->{LayoutObject}->Output(
        Template => '<div class="Flag Small" title="[% Data.WorkOrderState | html %]"> '
            . '<span class="[% Data.WorkOrderStateSignal | html %]"></span> </div>',
        Data => {
            WorkOrderStateSignal => $Content->{Content},
            WorkOrderState       => $Content->{WorkOrderState} || '',
        },
    );

    return $String;
}

=item SelectableObjectList()

return an array hash with selectable objects

Return

    @SelectableObjectList = (
        {
            Key   => 'ITSMWorkOrder',
            Value => 'WorkOrder',
        },
    );

    @SelectableObjectList = $LinkObject->SelectableObjectList(
        Selected => $Identifier,  # (optional)
    );

=cut

sub SelectableObjectList {
    my ( $Self, %Param ) = @_;

    my $Selected;
    if ( $Param{Selected} && $Param{Selected} eq $Self->{ObjectData}->{Object} ) {
        $Selected = 1;
    }

    # object select list
    my @ObjectSelectList = (
        {
            Key      => $Self->{ObjectData}->{Object},
            Value    => $Self->{ObjectData}->{Realname},
            Selected => $Selected,
        },
    );

    return @ObjectSelectList;
}

=item SearchOptionList()

return an array hash with search options

Return

    @SearchOptionList = (
        {
            Key       => 'ChangeNumber',
            Name      => 'Change#',
            InputStrg => $FormString,
            FormData  => '2009100112354321',
        },
        {
            Key       => 'ChangeTitle',
            Name      => 'Change Title',
            InputStrg => $FormString,
            FormData  => 'Mail server needs update',
        },
        {
            Key       => 'WorkOrderNumber',
            Name      => 'Workorder#',
            InputStrg => $FormString,
            FormData  => '12',
        },
        {
            Key       => 'WorkOrderTitle',
            Name      => 'WorkOrder Title',
            InputStrg => $FormString,
            FormData  => 'Shutdown old mail server',
        },
    );

    @SearchOptionList = $LinkObject->SearchOptionList();

=cut

sub SearchOptionList {
    my ( $Self, %Param ) = @_;

    # search option list
    my @SearchOptionList = (
        {
            Key  => 'ChangeNumber',
            Name => $Self->{ChangeHook},
            Type => 'Text',
        },
        {
            Key  => 'ChangeTitle',
            Name => 'ChangeTitle',
            Type => 'Text',
        },
        {
            Key  => 'WorkOrderNumber',
            Name => $Self->{WorkOrderHook},
            Type => 'Text',
        },
        {
            Key  => 'WorkOrderTitle',
            Name => 'WorkOrderTitle',
            Type => 'Text',
        },
    );

    # add formkey
    for my $Row (@SearchOptionList) {
        $Row->{FormKey} = 'SEARCH::' . $Row->{Key};
    }

    # add form data and input string
    ROW:
    for my $Row (@SearchOptionList) {

        # get form data
        $Row->{FormData} = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam(
            Param => $Row->{FormKey},
        );

        # parse the input text block
        $Self->{LayoutObject}->Block(
            Name => 'InputText',
            Data => {
                Key   => $Row->{FormKey},
                Value => $Row->{FormData} || '',
            },
        );

        # add the input string
        $Row->{InputStrg} = $Self->{LayoutObject}->Output(
            TemplateFile => 'LinkObject',
        );

        next ROW;
    }

    return @SearchOptionList;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
