package Kernel::Modules::AgentCustomPrinter;

use strict;
use warnings;
use Data::Dumper;
use Kernel::Language qw(Translatable);
use Kernel::System::VariableCheck qw(:all);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get ticket object
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');

    my $Output;
    my $QueueID
        = $TicketObject->TicketQueueID( TicketID => $Self->{TicketID} );
    my $ArticleID = $ParamObject->GetParam( Param => 'ArticleID' );

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    if ( !$Self->{TicketID} || !$QueueID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('Need TicketID!'), );
    }

    # check permissions
    my $Access = $TicketObject->TicketPermission(
        Type     => 'ro',
        TicketID => $Self->{TicketID},
        UserID   => $Self->{UserID}
    );

    return $LayoutObject->NoPermission( WithHeader => 'yes' ) if !$Access;

    # get ACL restrictions
    my %PossibleActions = ( 1 => $Self->{Action} );

    my $ACL = $TicketObject->TicketAcl(
        Data          => \%PossibleActions,
        Action        => 'AgentTicketPrint',
        TicketID      => $Self->{TicketID},
        ReturnType    => 'Action',
        ReturnSubType => '-',
        UserID        => $Self->{UserID},
    );
    my %AclAction = $TicketObject->TicketAclActionData();

    # check if ACL restrictions exist
    if ( $ACL || IsHashRefWithData( \%AclAction ) ) {

        my %AclActionLookup = reverse %AclAction;

        # show error screen if ACL prohibits this action
        if ( !$AclActionLookup{ $Self->{Action} } ) {
            return $LayoutObject->NoPermission( WithHeader => 'yes' );
        }
    }

    # get linked objects
    my $LinkObject       = $Kernel::OM->Get('Kernel::System::LinkObject');
    my $LinkListWithData = $LinkObject->LinkListWithData(
        Object => 'Ticket',
        Key    => $Self->{TicketID},
        State  => 'Valid',
        UserID => $Self->{UserID},
        ObjectParameters =>
            { Ticket => { IgnoreLinkedTicketStateTypes => 1, }, },
    );

    # get link type list
    my %LinkTypeList = $LinkObject->TypeList( UserID => $Self->{UserID}, );

    # get the link data
    my %LinkData;
    if (   $LinkListWithData
        && ref $LinkListWithData eq 'HASH'
        && %{$LinkListWithData} )
    {
        %LinkData = $LayoutObject->LinkObjectTableCreate(
            LinkListWithData => $LinkListWithData,
            ViewMode         => 'SimpleRaw',
        );
    }

    for my $LinkTypeLinkDirection ( sort { lc $a cmp lc $b } keys %LinkData )
    {

        # investigate link type name
        my @LinkData = split q{::}, $LinkTypeLinkDirection;
        my $LinkTypeName
            = $LinkTypeList{ $LinkData[0] }->{ $LinkData[1] . 'Name' };
        $LinkTypeName
            = $LayoutObject->{LanguageObject}->Translate($LinkTypeName);

        my %LinkType;
        $LinkType{Name} = $LinkTypeName;

        $LayoutObject->Block(
            Name => 'LinkType',
            Data => \%LinkType,
        );

        my $ObjectList = $LinkData{$LinkTypeLinkDirection};
        for my $Object ( sort { lc $a cmp lc $b } keys %{$ObjectList} ) {

            for my $Item ( @{ $ObjectList->{$Object} } ) {
                my %Itemdata = %$Item;
                $LayoutObject->Block(
                    Name => 'LinkedObject',
                    Data => \%Itemdata,
                );

             # $TableParam{CellData}[$Row][0]{Content} ||= '';
             # $TableParam{CellData}[$Row][1]{Content} = $Item->{Title} || '';
            }
            continue {
                # $Row++;
            }
        }

    }

    # get content
    my %Ticket = $TicketObject->TicketGet(
        TicketID      => $Self->{TicketID},
        DynamicFields => 1,
        UserID        => $Self->{UserID},
    );

    @Param{ keys %Ticket } = values %Ticket;

    $LayoutObject->Block(
        Name => 'Ticket',
        Data => \%Param,
    );

    # get user object
    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # user info
    my %UserInfo = $UserObject->GetUserData( User => $Ticket{Owner}, );

    # responsible info
    my %ResponsibleInfo;
    if ( $ConfigObject->Get('Ticket::Responsible') && $Ticket{Responsible} ) {
        %ResponsibleInfo
            = $UserObject->GetUserData( User => $Ticket{Responsible}, );
    }

    # customer info
    my %CustomerData;
    if ( $Ticket{CustomerUserID} ) {
        %CustomerData = $Kernel::OM->Get('Kernel::System::CustomerUser')
            ->CustomerUserDataGet( User => $Ticket{CustomerUserID}, );
    }

    # do some html quoting
    $Ticket{Age} = $LayoutObject->CustomerAge(
        Age   => $Ticket{Age},
        Space => ' ',
    );

    if ( $Ticket{UntilTime} ) {
        $Ticket{PendingUntil} = $LayoutObject->CustomerAge(
            Age   => $Ticket{UntilTime},
            Space => ' ',
        );
    }

    # get needed objects
    my $PDFObject  = $Kernel::OM->Get('Kernel::System::PDF');
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    my $PrintedBy = $LayoutObject->{LanguageObject}->Translate('Printed by');
    my $Time      = $LayoutObject->{LanguageObject}
        ->FormatTimeString( $TimeObject->CurrentTimestamp(), 'DateFormat', );

    $Param{Title} = $Ticket{Title};

    # output title
    $LayoutObject->Block(
        Name => 'Title',
        Data => \%Param,
    );
    $Param{PrintedBy}
        = "$PrintedBy $Self->{UserFirstname}$Self->{UserLastname} ($Self->{UserEmail}), $Time";

    # output "printed by"
    $LayoutObject->Block(
        Name => 'PrintedBy',
        Data => \%Param,
    );

    # output ticket infos
    my %table = $Self->_PDFOutputTicketInfos(
        TicketData      => \%Ticket,
        UserData        => \%UserInfo,
        ResponsibleData => \%ResponsibleInfo,
    );

    $Param{Table} = %table;

    $LayoutObject->Block(
        Name => 'Table',
        Data => \%table,
    );

    $LayoutObject->Block(
        Name => 'CustomerInfo',
        Data => \%CustomerData,
    );

    # GetArticleList
    my @ArticleBox = $TicketObject->ArticleContentIndex(
        TicketID                   => $Self->{TicketID},
        StripPlainBodyAsAttachment => 1,
        UserID                     => $Self->{UserID},
        DynamicFields              => 0,
    );

    # check if only one article need printed
    if ($ArticleID) {

    ARTICLE:
        for my $Article (@ArticleBox) {
            if ( $Article->{ArticleID} == $ArticleID ) {
                @ArticleBox = ($Article);
                last ARTICLE;
            }
        }
    }
    for my $Keys ( 0 .. $#ArticleBox ) {

        next if !$ArticleBox[$Keys]{AttachmentIDOfHTMLBody};

        # get a attachment
        my %Data = $TicketObject->ArticleAttachment(
            ArticleID => $ArticleBox[$Keys]{ArticleID},
            FileID    => $ArticleBox[$Keys]{AttachmentIDOfHTMLBody},
            UserID    => $Self->{UserID},
        );
        if ( $Data{Content} ) {
            $ArticleBox[$Keys]{Body} = $Data{Content};
        }
    }
    $Param{ArtileTree} = $Self->_ArticleList( ArticleBox => \@ArticleBox, );

    $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentCustomPrinter',
        Data         => \%Param,
    );

    return $Output;

}

sub _ArticleList {
    my ( $Self, %Param ) = @_;
    my @ArticleBox   = @{ $Param{ArticleBox} };
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $i;
    for my $ArticleTmp (@ArticleBox) {

        my %Article = %$ArticleTmp;
        $i++;
        $Article{ArticleNo} = $i;
        $LayoutObject->Block(
            Name => 'ArticleItem',
            Data => \%Article,
        );
    }
}

sub _PDFOutputTicketInfos {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(TicketData UserData)) {
        if ( !defined( $Param{$Needed} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }
    my %Ticket   = %{ $Param{TicketData} };
    my %UserInfo = %{ $Param{UserData} };

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # create left table
    my $TableLeft = [
        {   Key => $LayoutObject->{LanguageObject}->Translate('State'),
            Value =>
                $LayoutObject->{LanguageObject}->Translate( $Ticket{State} ),
        },

# ---
# ITSMIncidentProblemManagement
# ---
#        {
#            Key   => $LayoutObject->{LanguageObject}->Translate('Priority'),
#            Value => $LayoutObject->{LanguageObject}->Translate( $Ticket{Priority} ),
#        },
# ---
        {   Key   => $LayoutObject->{LanguageObject}->Translate('Queue'),
            Value => $Ticket{Queue},
        },
        {   Key => $LayoutObject->{LanguageObject}->Translate('Lock'),
            Value =>
                $LayoutObject->{LanguageObject}->Translate( $Ticket{Lock} ),
        },
        {   Key   => $LayoutObject->{LanguageObject}->Translate('CustomerID'),
            Value => $Ticket{CustomerID},
        },
        {   Key   => $LayoutObject->{LanguageObject}->Translate('Owner'),
            Value => $Ticket{Owner} . ' ('
                . $UserInfo{UserFirstname} . ' '
                . $UserInfo{UserLastname} . ')',
        },
    ];

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # add responsible row, if feature is enabled
    if ( $ConfigObject->Get('Ticket::Responsible') ) {
        my $Responsible = '-';
        if ( $Ticket{Responsible} ) {
            $Responsible
                = $Ticket{Responsible} . ' ('
                . $Param{ResponsibleData}->{UserFirstname} . ' '
                . $Param{ResponsibleData}->{UserLastname} . ')';
        }
        my $Row = {
            Key => $LayoutObject->{LanguageObject}->Translate('Responsible'),
            Value => $Responsible,
        };
        push( @{$TableLeft}, $Row );
    }

    # add type row, if feature is enabled
    if ( $ConfigObject->Get('Ticket::Type') ) {
        my $Row = {
            Key   => $LayoutObject->{LanguageObject}->Translate('Type'),
            Value => $Ticket{Type},
        };
        push( @{$TableLeft}, $Row );
    }

    # add service and sla row, if feature is enabled
    if ( $ConfigObject->Get('Ticket::Service') ) {
        my $RowService = {
            Key   => $LayoutObject->{LanguageObject}->Translate('Service'),
            Value => $Ticket{Service} || '-',
        };
        push( @{$TableLeft}, $RowService );
        my $RowSLA = {
            Key   => $LayoutObject->{LanguageObject}->Translate('SLA'),
            Value => $Ticket{SLA} || '-',
        };
        push( @{$TableLeft}, $RowSLA );
    }

    # ---
    # ITSMIncidentProblemManagement
    # ---
    my $TableLeftExtended = [
        {   Key => $LayoutObject->{LanguageObject}->Translate('Criticality'),
            Value => $LayoutObject->{LanguageObject}
                ->Translate( $Ticket{Criticality} ) || '-',
        },
        {   Key => $LayoutObject->{LanguageObject}->Translate('Impact'),
            Value =>
                $LayoutObject->{LanguageObject}->Translate( $Ticket{Impact} )
                || '-',
        },
        {   Key   => $LayoutObject->{LanguageObject}->Translate('Priority'),
            Value => $LayoutObject->{LanguageObject}
                ->Translate( $Ticket{Priority} ),
        },
    ];
    push @{$TableLeft}, @{$TableLeftExtended};

    # ---

    # create right table
    my $TableRight = [
        {   Key => $LayoutObject->{LanguageObject}->Translate('Age'),
            Value =>
                $LayoutObject->{LanguageObject}->Translate( $Ticket{Age} ),
        },
        {   Key   => $LayoutObject->{LanguageObject}->Translate('Created'),
            Value => $LayoutObject->{LanguageObject}
                ->FormatTimeString( $Ticket{Created}, 'DateFormat', ),
        },
    ];

    # show created by if different then User ID 1
    if ( $Ticket{CreateBy} > 1 ) {
        my $Row = {
            Key   => $LayoutObject->{LanguageObject}->Translate('Created by'),
            Value => $Kernel::OM->Get('Kernel::System::User')
                ->UserName( UserID => $Ticket{CreateBy} ),
        };
        push( @{$TableRight}, $Row );
    }

    if ( $ConfigObject->Get('Ticket::Frontend::AccountTime') ) {
        my $Row = {
            Key =>
                $LayoutObject->{LanguageObject}->Translate('Accounted time'),
            Value => $Ticket{TicketTimeUnits} || '0',
        };
        push( @{$TableRight}, $Row );
    }

    # only show pending until unless it is really pending
    if ( $Ticket{PendingUntil} ) {
        my $Row = {
            Key => $LayoutObject->{LanguageObject}->Translate('Pending till'),
            Value => $Ticket{PendingUntil},
        };
        push( @{$TableRight}, $Row );
    }

    # add first response time row
    if ( defined( $Ticket{FirstResponseTime} ) ) {
        my $Row = {
            Key => $LayoutObject->{LanguageObject}
                ->Translate('First Response Time'),
            Value => $LayoutObject->{LanguageObject}->FormatTimeString(
                $Ticket{FirstResponseTimeDestinationDate}, 'DateFormat',
                'NoSeconds',
            ),
        };
        push( @{$TableRight}, $Row );
    }

    # add update time row
    if ( defined( $Ticket{UpdateTime} ) ) {
        my $Row = {
            Key => $LayoutObject->{LanguageObject}->Translate('Update Time'),
            Value => $LayoutObject->{LanguageObject}->FormatTimeString(
                $Ticket{UpdateTimeDestinationDate}, 'DateFormat',
                'NoSeconds',
            ),
        };
        push( @{$TableRight}, $Row );
    }

    # add solution time row
    if ( defined( $Ticket{SolutionTime} ) ) {
        my $Row = {
            Key =>
                $LayoutObject->{LanguageObject}->Translate('Solution Time'),
            Value => $LayoutObject->{LanguageObject}->FormatTimeString(
                $Ticket{SolutionTimeDestinationDate}, 'DateFormat',
                'NoSeconds',
            ),
        };
        push( @{$TableRight}, $Row );
    }

    my $Rows = @{$TableLeft};
    if ( @{$TableRight} > $Rows ) {
        $Rows = @{$TableRight};
    }
    my %LeftTable;
    my %RightTable;
    my %TableParam;
    for my $Row ( 1 .. $Rows ) {
        $Row--;
        if ( $TableLeft->[$Row]{Value} ) {
            $LeftTable{ $TableLeft->[$Row]{Key} } = $TableLeft->[$Row]{Value};
        }
        if ( $TableRight->[$Row]{Value} ) {
            $RightTable{ $TableRight->[$Row]{Key} }
                = $TableRight->[$Row]{Value};
        }
    }

    my %table;
    %table = %LeftTable;
    for my $keys ( keys %RightTable ) {
        $table{$keys} = $RightTable{$keys};
    }

    return %table;
}

1;
