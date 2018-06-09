# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeZoom;

use strict;
use warnings;

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

    # get needed objects
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $DBObject     = $Kernel::OM->Get('Kernel::System::DB');
    my $WorkOrderObject
        = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');
    my $UserObject  = $Kernel::OM->Get('Kernel::System::User');
    my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

    # get params
    my $ChangeID = $ParamObject->GetParam( Param => "ChangeID" );

    return
        if !$DBObject->Prepare(
        SQL =>
            'SELECT id, change_id, workorder_state_id, workorder_agent_id FROM change_workorder WHERE change_id =? and workorder_agent_id=? and workorder_type_id=130 ',
        Bind => [ \$ChangeID, \$Self->{UserID} ],
        );

    my @WOOrders;
    my %WODisplay;
    my @WOOrderAgent;

    while ( my @RowsofWOs = $DBObject->FetchrowArray() ) {
        my $temp_wo = $WorkOrderObject->WorkOrderGet(
            UserID      => $Self->{UserID},
            WorkOrderID => $RowsofWOs[0],
        );

        # check for state lock
        my $StateLock
            = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')
            ->ConditionMatchStateLock(
            ObjectName => 'ITSMWorkOrder',
            Selector   => $RowsofWOs[0],
            StateID    => $temp_wo->{WorkOrderStateID},
            UserID     => $Self->{UserID},
            );

        # next if $StateLock;
        if ( !$StateLock ) {
            my %temp_woagent = $UserObject->GetUserData(
                UserID => $RowsofWOs[3],
                Cached => 1,
            );

            my $temp_woagent_fullname = ${temp_woagent}{'UserFullname'};
            $temp_wo->{"WAgentFullname"} = ${temp_woagent_fullname};
            push @WOOrders,     $temp_wo;
            push @WOOrderAgent, $temp_woagent_fullname;

        }
    }

    $WODisplay{"ChangeID"}            = $ChangeID;
    $WODisplay{"WorkOrderArray"}      = \@{WOOrders};
    $WODisplay{"WorkOrderAgentArray"} = \@{WOOrderAgent};

    # check needed stuff
    if ( !$ChangeID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No ChangeID is given!'),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get needed objects
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get config of frontend module
    $Self->{Config}
        = $ConfigObject->Get("ITSMChange::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $ChangeObject->Permission(
        Type     => $Self->{Config}->{Permission},
        Action   => $Self->{Action},
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # error screen, don't show change zoom
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message => $LayoutObject->{LanguageObject}->Translate(
                'You need %s permissions!',
                $Self->{Config}->{Permission}
            ),
            WithHeader => 'yes',
        );
    }

    # get change data
    my $Change = $ChangeObject->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # check error
    if ( !$Change ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}->Translate(
                'Change "%s" not found in database!', $ChangeID
            ),
            Comment => Translatable('Please contact the admin.'),
        );
    }
    $Change->{"WOD"}  = $WODisplay{"WorkOrderArray"};
    $Change->{"WODA"} = $WODisplay{"WorkOrderAgentArray"};

    ###### Added ITSM Change Group Name to Change By Milan########
    $Change->{ITSMChangeGroup}
        = $GroupObject->GroupLookup( GroupID => $Change->{ITSMChangeGroupID},
        );
    ###############################################################

    # clean the rich text fields from active HTML content
ATTRIBUTE:
    for my $Attribute (qw(Description Justification)) {

        next ATTRIBUTE if !$Change->{$Attribute};

        # remove active html content (scripts, applets, etc...)
        my %SafeContent
            = $Kernel::OM->Get('Kernel::System::HTMLUtils')->Safety(
            String       => $Change->{$Attribute},
            NoApplet     => 1,
            NoObject     => 1,
            NoEmbed      => 1,
            NoIntSrcLoad => 0,
            NoExtSrcLoad => 0,
            NoJavaScript => 1,
            );

        # take the safe content if neccessary
        if ( $SafeContent{Replace} ) {
            $Change->{$Attribute} = $SafeContent{String};
        }
    }

    # get log object
    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    # handle HTMLView
    if ( $Self->{Subaction} eq 'HTMLView' ) {

        # get param
        my $Field = $ParamObject->GetParam( Param => "Field" );

        # needed param
        if ( !$Field ) {
            $LogObject->Log(
                Message  => "Needed Param: $Field!",
                Priority => 'error',
            );
            return;
        }

        # error checking
        if ( $Field ne 'Description' && $Field ne 'Justification' ) {
            $LogObject->Log(
                Message =>
                    "Unknown field: $Field! Field must be either Description or Justification!",
                Priority => 'error',
            );
            return;
        }

        # get the Field content
        my $FieldContent = $Change->{$Field};

        # build base URL for in-line images if no session cookies are used
        my $SessionID = '';
        if ( $Self->{SessionID} && !$Self->{SessionIDCookie} ) {
            $SessionID
                = ';' . $Self->{SessionName} . '=' . $Self->{SessionID};
            $FieldContent =~ s{
                (Action=AgentITSMChangeZoom;Subaction=DownloadAttachment;Filename=.+;ChangeID=\d+)
            }{$1$SessionID}gmsx;
        }

        # get HTML utils object
        my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');

        # detect all plain text links and put them into an HTML <a> tag
        $FieldContent
            = $HTMLUtilsObject->LinkQuote( String => $FieldContent, );

        # set target="_blank" attribute to all HTML <a> tags
        # the LinkQuote function needs to be called again
        $FieldContent = $HTMLUtilsObject->LinkQuote(
            String    => $FieldContent,
            TargetAdd => 1,
        );

        # add needed HTML headers
        $FieldContent = $HTMLUtilsObject->DocumentComplete(
            String  => $FieldContent,
            Charset => 'utf-8',
        );

        # return complete HTML as an attachment
        return $LayoutObject->Attachment(
            Type        => 'inline',
            ContentType => 'text/html',
            Content     => $FieldContent,
        );
    }

    # handle DownloadAttachment
    elsif ( $Self->{Subaction} eq 'DownloadAttachment' ) {

        # get data for attachment
        my $Filename = $ParamObject->GetParam( Param => 'Filename' );
        my $AttachmentData = $ChangeObject->ChangeAttachmentGet(
            ChangeID => $ChangeID,
            Filename => $Filename,
        );

        # return error if file does not exist
        if ( !$AttachmentData ) {
            $LogObject->Log(
                Message =>
                    "No such attachment ($Filename)! May be an attack!!!",
                Priority => 'error',
            );
            return $LayoutObject->ErrorScreen();
        }

        return $LayoutObject->Attachment( %{$AttachmentData},
            Type => 'attachment', );
    }

    # get session object
    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

    # Store LastChangeView, for backlinks from change specific pages
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastChangeView',
        Value     => $Self->{RequestedURL},
    );

    # Store LastScreenOverview, for backlinks from AgentLinkObject
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenOverview',
        Value     => $Self->{RequestedURL},
    );

    # Store LastScreenOverview, for backlinks from AgentLinkObject
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenView',
        Value     => $Self->{RequestedURL},
    );

    # Store LastScreenWorkOrders, for backlinks from ITSMWorkOrderZoom
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenWorkOrders',
        Value     => $Self->{RequestedURL},
    );

    # run change menu modules
    if (ref $ConfigObject->Get('ITSMChange::Frontend::MenuModule') eq 'HASH' )
    {

        # get items for menu
        my %Menus
            = %{ $ConfigObject->Get('ITSMChange::Frontend::MenuModule') };
        my $Counter = 0;

        for my $Menu ( sort keys %Menus ) {

            # load module
            if ( $Kernel::OM->Get('Kernel::System::Main')
                ->Require( $Menus{$Menu}->{Module} ) )
            {
                my $Object = $Menus{$Menu}->{Module}
                    ->new( %{$Self}, ChangeID => $ChangeID, );

                # set classes
                if ( $Menus{$Menu}->{Target} ) {

                    if ( $Menus{$Menu}->{Target} eq 'PopUp' ) {
                        $Menus{$Menu}->{MenuClass} = 'AsPopup';
                    }
                    elsif ( $Menus{$Menu}->{Target} eq 'Back' ) {
                        $Menus{$Menu}->{MenuClass} = 'HistoryBack';
                    }
                }

                # run module
                $Counter = $Object->Run(
                    %Param,
                    Change  => $Change,
                    Counter => $Counter,
                    Config  => $Menus{$Menu},
                    MenuID  => $Menu,
                );
            }
            else {
                return $LayoutObject->FatalError();
            }
        }
    }

    # output header
    my $Output = $LayoutObject->Header( Value => $Change->{ChangeTitle}, );
    $Output .= $LayoutObject->NavigationBar();

    # get needed objects
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $DynamicFieldBackendObject
        = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    # build workorder graph in layout object
    my $WorkOrderGraph = $LayoutObject->ITSMChangeBuildWorkOrderGraph(
        Change => $Change,
        WorkOrderObject =>
            $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder'),
        DynamicFieldObject => $DynamicFieldObject,
        BackendObject      => $DynamicFieldBackendObject,
    );

    # display graph within an own block
    $LayoutObject->Block(
        Name => 'WorkOrderGraph',
        Data => { WorkOrderGraph => $WorkOrderGraph, },
    );

    # get user object
    # my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # get agents preferences
    my %UserPreferences
        = $UserObject->GetPreferences( UserID => $Self->{UserID}, );

    # remember if user already closed message about links in iframes
    if ( !defined $Self->{DoNotShowBrowserLinkMessage} ) {
        if ( $UserPreferences{UserAgentDoNotShowBrowserLinkMessage} ) {
            $Self->{DoNotShowBrowserLinkMessage} = 1;
        }
        else {
            $Self->{DoNotShowBrowserLinkMessage} = 0;
        }
    }

    # show message about links in iframes, if user didn't close it already
    if ( !$Self->{DoNotShowBrowserLinkMessage} ) {
        $LayoutObject->Block( Name => 'BrowserLinkMessage', );
    }

    # get security restriction setting for iframes
    # security="restricted" may break SSO - disable this feature if requested
    my $MSSecurityRestricted;
    if ( $ConfigObject->Get('DisableMSIFrameSecurityRestricted') ) {
        $MSSecurityRestricted = '';
    }
    else {
        $MSSecurityRestricted = 'security="restricted"';
    }

    # show the HTML field blocks as iframes
    for my $Field (qw(Description Justification)) {

        $LayoutObject->Block(
            Name => 'ITSMContent',
            Data => {
                ChangeID             => $ChangeID,
                Field                => $Field,
                MSSecurityRestricted => $MSSecurityRestricted,
            },
        );
    }

    # get change builder data
    my %ChangeBuilderUser = $UserObject->GetUserData(
        UserID => $Change->{ChangeBuilderID},
        Cached => 1,
    );

    # get create user data
    my %CreateUser = $UserObject->GetUserData(
        UserID => $Change->{CreateBy},
        Cached => 1,
    );

    # get change user data
    my %ChangeUser = $UserObject->GetUserData(
        UserID => $Change->{ChangeBy},
        Cached => 1,
    );

    # all postfixes needed for user information
    my @Postfixes = qw(UserLogin UserFirstname UserLastname);

    # get user information for ChangeBuilder, CreateBy, ChangeBy
    for my $Postfix (@Postfixes) {
        $Change->{ 'ChangeBuilder' . $Postfix }
            = $ChangeBuilderUser{$Postfix};
        $Change->{ 'Create' . $Postfix } = $CreateUser{$Postfix};
        $Change->{ 'Change' . $Postfix } = $ChangeUser{$Postfix};
    }

    # output meta block
    $LayoutObject->Block(
        Name => 'Meta',
        Data => { %{$Change}, },
    );

    # show values or dash ('-')
    for my $BlockName (
        qw(PlannedStartTime PlannedEndTime ActualStartTime ActualEndTime))
    {
        if ( $Change->{$BlockName} ) {
            $LayoutObject->Block(
                Name => $BlockName,
                Data => { $BlockName => $Change->{$BlockName}, },
            );
        }
        else {
            $LayoutObject->Block( Name => 'Empty' . $BlockName, );
        }
    }

    # show configurable blocks
BLOCKNAME:
    for my $BlockName (qw(RequestedTime PlannedEffort AccountedTime)) {

        # skip if block is switched off in SysConfig
        next BLOCKNAME if !$Self->{Config}->{$BlockName};

        # show block
        $LayoutObject->Block( Name => 'Show' . $BlockName, );

        # show value or dash
        if ( $Change->{$BlockName} ) {
            $LayoutObject->Block(
                Name => $BlockName,
                Data => { $BlockName => $Change->{$BlockName}, },
            );
        }
        else {
            $LayoutObject->Block( Name => 'Empty' . $BlockName, );
        }
    }

    # show CIP
    for my $Type (qw(Category Impact Priority)) {
        $LayoutObject->Block(
            Name => $Type,
            Data => { %{$Change} },
        );
    }

    # get the dynamic fields for this screen
    my $DynamicField = $DynamicFieldObject->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => 'ITSMChange',
        FieldFilter => $Self->{Config}->{DynamicField} || {},
    );

    # cycle trough the activated Dynamic Fields
DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        my $Value = $DynamicFieldBackendObject->ValueGet(
            DynamicFieldConfig => $DynamicFieldConfig,
            ObjectID           => $ChangeID,
        );

        # get print string for this dynamic field
        my $ValueStrg = $DynamicFieldBackendObject->DisplayValueRender(
            DynamicFieldConfig => $DynamicFieldConfig,
            Value              => $Value,
            ValueMaxChars      => 100,
            LayoutObject       => $LayoutObject,
        );

        # for empty values
        if ( !$ValueStrg->{Value} ) {
            $ValueStrg->{Value} = '-';
        }

        my $Label = $DynamicFieldConfig->{Label};

        $LayoutObject->Block(
            Name => 'DynamicField',
            Data => { Label => $Label, },
        );

        if ( $ValueStrg->{Link} ) {

            # output link element
            $LayoutObject->Block(
                Name => 'DynamicFieldLink',
                Data => {
                    %{$Change},
                    Value                       => $ValueStrg->{Value},
                    Title                       => $ValueStrg->{Title},
                    Link                        => $ValueStrg->{Link},
                    $DynamicFieldConfig->{Name} => $ValueStrg->{Title}
                },
            );
        }
        else {

            # output non link element
            $LayoutObject->Block(
                Name => 'DynamicFieldPlain',
                Data => {
                    Value => $ValueStrg->{Value},
                    Title => $ValueStrg->{Title},
                },
            );
        }

        # example of dynamic fields order customization
        $LayoutObject->Block(
            Name => 'DynamicField' . $DynamicFieldConfig->{Name},
            Data => {
                Label => $Label,
                Value => $ValueStrg->{Value},
                Title => $ValueStrg->{Title},
            },
        );
    }

    # get change manager data
    my %ChangeManagerUser;
    if ( $Change->{ChangeManagerID} ) {

        # get change manager data
        %ChangeManagerUser = $UserObject->GetUserData(
            UserID => $Change->{ChangeManagerID},
            Cached => 1,
        );
    }

    # get change manager information
    for my $Postfix (qw(UserLogin UserFirstname UserLastname)) {
        $Change->{ 'ChangeManager' . $Postfix }
            = $ChangeManagerUser{$Postfix} || '';
    }

    # output change manager block
    if (%ChangeManagerUser) {

        # show name and mail address if user exists
        $LayoutObject->Block(
            Name => 'ChangeManager',
            Data => { %{$Change}, },
        );
    }
    else {

        # show dash if no change manager exists
        $LayoutObject->Block(
            Name => 'EmptyChangeManager',
            Data => {},
        );
    }

    # get customer user object
    my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');

    # show CAB block when there is a CAB
    if ( @{ $Change->{CABAgents} } || @{ $Change->{CABCustomers} } ) {

        # output CAB block
        $LayoutObject->Block(
            Name => 'CAB',
            Data => { %{$Change}, },
        );

        # build and output CAB agents
    CABAGENT:
        for my $CABAgent ( @{ $Change->{CABAgents} } ) {
            next CABAGENT if !$CABAgent;

            my %CABAgentUserData = $UserObject->GetUserData(
                UserID => $CABAgent,
                Cache  => 1,
            );

            next CABAGENT if !%CABAgentUserData;

            # build content for agent block
            my %CABAgentData;
            for my $Postfix (@Postfixes) {
                $CABAgentData{ 'CABAgent' . $Postfix }
                    = $CABAgentUserData{$Postfix};
            }

            # output agent block
            $LayoutObject->Block(
                Name => 'CABAgent',
                Data => { %CABAgentData, },
            );
        }

        # build and output CAB customers
    CABCUSTOMER:
        for my $CABCustomer ( @{ $Change->{CABCustomers} } ) {
            next CABCUSTOMER if !$CABCustomer;

            my %CABCustomerUserData
                = $CustomerUserObject->CustomerUserDataGet(
                User => $CABCustomer, );

            next CABCUSTOMER if !%CABCustomerUserData;

            # build content for CAB customer block
            my %CABCustomerData;
            for my $Postfix (@Postfixes) {
                $CABCustomerData{ 'CABCustomer' . $Postfix }
                    = $CABCustomerUserData{$Postfix};
            }

            # output CAB customer block
            $LayoutObject->Block(
                Name => 'CABCustomer',
                Data => { %CABCustomerData, },
            );
        }
    }

    # show dash when no CAB exists
    else {
        $LayoutObject->Block( Name => 'EmptyCAB', );
    }

    # get link object
    my $LinkObject = $Kernel::OM->Get('Kernel::System::LinkObject');

    # get linked objects which are directly linked with this change object
    my $LinkListWithData = $LinkObject->LinkListWithData(
        Object => 'ITSMChange',
        Key    => $ChangeID,
        State  => 'Valid',
        UserID => $Self->{UserID},
    );

    # get change initiators (customer users of linked tickets)
    my $TicketsRef = $LinkListWithData->{Ticket} || {};
    my %ChangeInitiatorsID;
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    for my $LinkType ( sort keys %{$TicketsRef} ) {

        my $TicketRef = $TicketsRef->{$LinkType}->{Source};

        for my $TicketID ( sort keys %{$TicketRef} ) {

            #Get Linked Ticket Info
            my %Ticket = $TicketObject->TicketGet(
                TicketID => $TicketID,
                UserID   => $Self->{UserID},
            );

            my $UserObject = $Kernel::OM->Get('Kernel::System::User');
            my %UserFullName = ( CreateBy => 'CreateBy', OwnerID => 'Owner' );
            for my $keys (qw(CreateBy OwnerID)) {
                my %User
                    = $UserObject->GetUserData( UserID => $Ticket{$keys}, );
                $Ticket{ $UserFullName{$keys} }
                    = "$User{UserFirstname} $User{UserLastname}";
            }

            my @ArticleBox = $TicketObject->ArticleContentIndex(
                TicketID => $TicketID,
                UserID   => $Self->{UserID},
            );
            $Ticket{Articles} = \@ArticleBox;

            $Param{Ticket}{ $Ticket{TicketNumber} } = \%Ticket;

            # get id of customer user
            my $CustomerUserID = $TicketRef->{$TicketID}->{CustomerUserID};

            # if a customer
            if ($CustomerUserID) {
                $ChangeInitiatorsID{$CustomerUserID} = 'CustomerUser';
            }
            else {
                my $OwnerID = $TicketRef->{$TicketID}->{OwnerID};
                $ChangeInitiatorsID{$OwnerID} = 'User';
            }
        }
    }

    # get change initiators info
    if ( keys %ChangeInitiatorsID ) {
        $LayoutObject->Block( Name => 'ChangeInitiatorExists', );
    }

    my $ChangeInitiators = '';
    for my $UserID ( sort keys %ChangeInitiatorsID ) {
        my %User;

        # get customer user info if CI is a customer user
        if ( $ChangeInitiatorsID{$UserID} eq 'CustomerUser' ) {
            %User = $CustomerUserObject->CustomerUserDataGet( User => $UserID,
            );
        }

        # otherwise get user info
        else {
            %User = $UserObject->GetUserData( UserID => $UserID, );
        }

        # if user info exist
        if (%User) {
            $LayoutObject->Block(
                Name => 'ChangeInitiator',
                Data => {%User},
            );

            $User{UserLogin}     ||= '';
            $User{UserFirstname} ||= '';
            $User{UserLastname}  ||= '';

            $ChangeInitiators .= sprintf "%s (%s %s)",
                $User{UserLogin},
                $User{UserFirstname},
                $User{UserLastname};
        }
    }

    # show dash if no change initiator exists
    if ( !$ChangeInitiators ) {
        $LayoutObject->Block( Name => 'EmptyChangeInitiators', );
    }

    # display a string with all changeinitiators
    $Change->{'Change Initators'} = $ChangeInitiators;

    # store the combined linked objects from all workorders of this change
    my $LinkListWithDataCombinedWorkOrders = {};
    for my $WorkOrderID ( @{ $Change->{WorkOrderIDs} } ) {

        # get linked objects of this workorder
        my $LinkListWithDataWorkOrder = $LinkObject->LinkListWithData(
            Object => 'ITSMWorkOrder',
            Key    => $WorkOrderID,
            State  => 'Valid',
            UserID => $Self->{UserID},
        );

    OBJECT:
        for my $Object ( sort keys %{$LinkListWithDataWorkOrder} ) {

            # only show linked services and config items of workorder
            if ( $Object ne 'Service' && $Object ne 'ITSMConfigItem' ) {
                next OBJECT;
            }

        LINKTYPE:
            for my $LinkType (
                sort keys %{ $LinkListWithDataWorkOrder->{$Object} } )
            {

            DIRECTION:
                for my $Direction (
                    sort keys
                    %{ $LinkListWithDataWorkOrder->{$Object}->{$LinkType} } )
                {

                ID:
                    for my $ID (
                        sort
                        keys %{
                            $LinkListWithDataWorkOrder->{$Object}
                                ->{$LinkType}->{$Direction}
                        }
                        )
                    {

                        # combine the linked object data from all workorders
                        $LinkListWithDataCombinedWorkOrders->{$Object}
                            ->{$LinkType}->{$Direction}->{$ID}
                            = $LinkListWithDataWorkOrder->{$Object}
                            ->{$LinkType}->{$Direction}->{$ID};
                    }
                }
            }
        }
    }

# add combined linked objects from workorder to linked objects from change object
    $LinkListWithData
        = { %{$LinkListWithData}, %{$LinkListWithDataCombinedWorkOrders}, };

    # get link table view mode
    my $LinkTableViewMode = $ConfigObject->Get('LinkObject::ViewMode');

    # create the link table
    my $LinkTableStrg = $LayoutObject->LinkObjectTableCreate(
        LinkListWithData => $LinkListWithData,
        ViewMode         => $LinkTableViewMode,
        Object           => 'ITSMChange',
        Key              => $ChangeID,
    );

    # output the link table
    if ($LinkTableStrg) {
        $LayoutObject->Block(
            Name => 'LinkTable' . $LinkTableViewMode,
            Data => { LinkTableStrg => $LinkTableStrg, },
        );
    }

    # get attachments
    my @Attachments
        = $ChangeObject->ChangeAttachmentList( ChangeID => $ChangeID, );

    # show attachments
ATTACHMENT:
    for my $Filename (@Attachments) {

        # get info about file
        my $AttachmentData = $ChangeObject->ChangeAttachmentGet(
            ChangeID => $ChangeID,
            Filename => $Filename,
        );

        # check for attachment information
        next ATTACHMENT if !$AttachmentData;

 # do not show inline attachments in attachments list (they have a content id)
        next ATTACHMENT if $AttachmentData->{Preferences}->{ContentID};

        # show block
        $LayoutObject->Block(
            Name => 'AttachmentRow',
            Data => { %{$Change}, %{$AttachmentData}, },
        );
    }

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMChangeZoom',
        Data         => { %{$Change}, %Param, },
    );

    # add footer
    $Output .= $LayoutObject->Footer();

    return $Output;
}

1;
