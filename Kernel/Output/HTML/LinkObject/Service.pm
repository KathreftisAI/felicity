# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::LinkObject::Service;

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

Kernel::Output::HTML::LinkObject::Service - layout backend module

=head1 SYNOPSIS

All layout functions of link object (service)

=over 4

=cut

=item new()

create an object

    $BackendObject = Kernel::Output::HTML::LinkObject::Service->new(
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

    # we need our own LayoutObject instance to avoid blockdata collisions
    # with the main page.
    $Self->{LayoutObject} = Kernel::Output::HTML::Layout->new( %{$Self} );

    # define needed variables
    $Self->{ObjectData} = {
        Object     => 'Service',
        Realname   => 'Service',
        ObjectName => 'SourceObjectID',
    };

    return $Self;
}

=item TableCreateComplex()

return an array with the block data

Return

    @BlockData = (

        ObjectName  => 'ServiceID',
        ObjectID    => '123',

        Object    => 'Service',
        Blockname => 'Service',
        Headline  => [
            {
                Content => '',
                Width   => 20,
            },
            {
                Content => 'Service',
            },
            {
                Content => 'Type',
                Width   => 100,
            },
            {
                Content => 'Criticality',
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
                    Type             => 'InciSignal',
                    Key              => 123,
                    Content          => 'Operational',
                    CurInciStateType => 'Operational',
                },
                {
                    Type      => 'Link',
                    Content   => 'Service Bla',
                    Link      => 'Action=AgentITSMServiceZoom;ServiceID=123',
                    MaxLength => 70,
                },
                {
                    Type    => 'Text',
                    Content => 'Other',
                    Translate => 1,
                },
                {
                    Type    => 'Text',
                    Content => 'High',
                    Translate => 1,
                },
                {
                    Type    => 'TimeLong',
                    Content => '2008-01-01 12:12:00',
                },
            ],
            [
                {
                    Type             => 'InciSignal',
                    Key              => 321,
                    Content          => 'Operational',
                    CurInciStateType => 'Operational',
                },
                {
                    Type      => 'Link',
                    Content   => 'Service Bla',
                    Link      => 'Action=AgentITSMServiceZoom;ServiceID=321',
                    MaxLength => 70,
                },
                {
                    Type    => 'Text',
                    Content => 'Other',
                    Translate => 1,
                },
                {
                    Type    => 'Text',
                    Content => 'Low',
                    Translate => 1,
                },
                {
                    Type    => 'TimeLong',
                    Content => '2007-02-02 22:12:00',
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

            for my $ServiceID ( sort keys %{$DirectionList} ) {

                $LinkList{$ServiceID}->{Data} = $DirectionList->{$ServiceID};
            }
        }
    }

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $ComplexTableData = $ConfigObject->Get("LinkObject::ComplexTable");
    my $DefaultColumns;
    if (
        $ComplexTableData
        && IsHashRefWithData($ComplexTableData)
        && $ComplexTableData->{Service}
        && IsHashRefWithData( $ComplexTableData->{Service} )
        )
    {
        $DefaultColumns = $ComplexTableData->{"Service"}->{"DefaultColumns"};
    }

    my @TimeLongTypes = (
        'CreateTime',
        'ChangeTime',
    );

    my @TranslateTypes = (
        'Type',
        'Criticality',
    );

    # always show the incident state flag and the service name
    my @Headline = (
        {
            Content => 'Incident State',
        },
        {
            Content => 'Service',
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
            Message  => 'Missing configuration for LinkObject::ComplexTable###Service!',
        );
        return;
    }

    # Get default column priority from SysConfig.
    # Each column in table (Title, State,...) has defined Priority in SysConfig. System use this
    #   priority to sort columns, if user doesn't have own settings.
    my %SortOrder;
    if (
        $ComplexTableData->{"Service"}->{"Priority"}
        && IsHashRefWithData( $ComplexTableData->{"Service"}->{"Priority"} )
        )
    {
        %SortOrder = %{ $ComplexTableData->{"Service"}->{"Priority"} };
    }

    my %UserColumns = %{$DefaultColumns};

    if ( $Preferences{'LinkObject::ComplexTable-Service'} ) {

        my $ColumnsEnabled = $Kernel::OM->Get('Kernel::System::JSON')->Decode(
            Data => $Preferences{'LinkObject::ComplexTable-Service'},
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

            if ( $Column eq 'CurInciState' ) {
                $ColumnName = 'Incident State';
            }
            elsif ( $Column eq 'CreateTime' ) {
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

    # create the item list (table content)
    my @ItemList;
    for my $ServiceID (
        sort { lc $LinkList{$a}{Data}->{Name} cmp lc $LinkList{$b}{Data}->{Name} }
        keys %LinkList
        )
    {

        # extract service data
        my $Service = $LinkList{$ServiceID}->{Data};

        # CurInciSignal must always be present, as well as service name
        # (because it contains the master link to the Service).
        my @ItemColumns = (
            {
                Type             => 'CurInciSignal',
                Key              => $ServiceID,
                Content          => $Service->{CurInciState},
                CurInciStateType => $Service->{CurInciStateType},
            },
            {
                Type    => 'Link',
                Content => $Service->{Name},
                Link    => $Self->{LayoutObject}->{Baselink}
                    . 'Action=AgentITSMServiceZoom;ServiceID='
                    . $ServiceID,
                Title     => "Service: $Service->{Name}",
                MaxLength => 70,
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

                if ( $Column eq 'Comment' ) {
                    $Hash{MaxLength} = 30;
                }

                if ( grep { $_ eq $Column } @TranslateTypes ) {
                    $Hash{'Translate'} = 1;
                }

                $Hash{'Content'} = $Service->{$Column};

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
            Service => [
                {
                    Type    => 'Link',
                    Content => 'S:The servic[..]',
                    Title   => 'Service: The service name',
                    Css     => 'style="text-decoration: line-through"',
                },
                {
                    Type    => 'Link',
                    Content => 'S:Name of servic[..]',
                    Title   => 'Service: Name of service 2',
                },
            ],
        },
        ParentChild::Target => {
            Service => [
                {
                    Type    => 'Link',
                    Content => 'S:Service nam[..]',
                    Title   => 'Service: Service name',
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

            my @ItemList;
            for my $ServiceID (
                sort {
                    lc $DirectionList->{$a}->{NameShort} cmp lc $DirectionList->{$b}->{NameShort}
                } keys %{$DirectionList}
                )
            {

                # extract service data
                my $Service = $DirectionList->{$ServiceID};

                # define item data
                my %Item = (
                    Type    => 'Link',
                    Content => "S:$Service->{NameShort}",
                    Title   => "Service: $Service->{Name}",
                    Link    => $Self->{LayoutObject}->{Baselink}
                        . 'Action=AgentITSMServiceZoom;ServiceID='
                        . $ServiceID,
                    MaxLength => 20,
                );

                push @ItemList, \%Item;
            }

            # add item list to link output data
            $LinkOutputData{ $LinkType . '::' . $Direction }->{Service} = \@ItemList;
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

    return if $Content->{Type} ne 'CurInciSignal';

    # set incident signal
    my %InciSignals = (
        incident    => 'redled',
        operational => 'greenled',
        unknown     => 'grayled',
        warning     => 'yellowled',
    );

    # investigate current incident signal
    $Content->{CurInciStateType} ||= 'unknown';
    my $CurInciSignal = $InciSignals{ $Content->{CurInciStateType} };
    $CurInciSignal ||= $InciSignals{unknown};

    my $String = $Self->{LayoutObject}->Output(
        Template => '<div class="Flag Small" title="[% Data.CurInciState | html %]"> '
            . '<span class="[% Data.CurInciSignal | html %]"></span> </div>',

        Data => {
            CurInciSignal => $CurInciSignal,
            CurInciState  => $Content->{Content} || '',
        },
    );

    return $String;
}

=item SelectableObjectList()

return an array hash with select-able objects

Return

    @SelectableObjectList = (
        {
            Key   => 'Service',
            Value => 'Service',
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
            Key       => 'Name',
            Name      => 'Service',
            InputStrg => $FormString,
            FormData  => 'Service Name',
        },
    );

    @SearchOptionList = $LinkObject->SearchOptionList();

=cut

sub SearchOptionList {
    my ( $Self, %Param ) = @_;

    # search option list
    my @SearchOptionList = (
        {
            Key  => 'Name',
            Name => 'Service',
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
        $Row->{FormData} = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => $Row->{FormKey} );

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
