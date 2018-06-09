# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMWorkOrderZoom;

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

    # get needed object
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get needed WorkOrderID
    my $WorkOrderID = $ParamObject->GetParam( Param => 'WorkOrderID' );

    # check needed stuff
    if ( !$WorkOrderID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No WorkOrderID is given!'),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get needed objects
    my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    # get config of frontend module
    $Self->{Config} = $ConfigObject->Get("ITSMWorkOrder::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $WorkOrderObject->Permission(
        Type        => $Self->{Config}->{Permission},
        Action      => $Self->{Action},
        WorkOrderID => $WorkOrderID,
        UserID      => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'You need %s permissions!', $Self->{Config}->{Permission} ),
            WithHeader => 'yes',
        );
    }

    # get workorder data
    my $WorkOrder = $WorkOrderObject->WorkOrderGet(
        WorkOrderID => $WorkOrderID,
        UserID      => $Self->{UserID},
    );

    # check error
    if ( !$WorkOrder ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'WorkOrder "%s" not found in database!', $WorkOrderID ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # clean the rich text fields from active HTML content
    ATTRIBUTE:
    for my $Attribute (qw(Instruction Report)) {

        next ATTRIBUTE if !$WorkOrder->{$Attribute};

        # remove active html content (scripts, applets, etc...)
        my %SafeContent = $Kernel::OM->Get('Kernel::System::HTMLUtils')->Safety(
            String       => $WorkOrder->{$Attribute},
            NoApplet     => 1,
            NoObject     => 1,
            NoEmbed      => 1,
            NoIntSrcLoad => 0,
            NoExtSrcLoad => 0,
            NoJavaScript => 1,
        );

        # take the safe content if neccessary
        if ( $SafeContent{Replace} ) {
            $WorkOrder->{$Attribute} = $SafeContent{String};
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
        if ( $Field ne 'Instruction' && $Field ne 'Report' ) {
            $LogObject->Log(
                Message  => "Unknown field: $Field! Field must be either Instruction or Report!",
                Priority => 'error',
            );
            return;
        }

        # get the Field content
        my $FieldContent = $WorkOrder->{$Field};

        # build base URL for in-line images if no session cookies are used
        my $SessionID = '';
        if ( $Self->{SessionID} && !$Self->{SessionIDCookie} ) {
            $SessionID = ';' . $Self->{SessionName} . '=' . $Self->{SessionID};
            $FieldContent =~ s{
                (Action=AgentITSMWorkOrderZoom;Subaction=DownloadAttachment;Filename=.+;WorkOrderID=\d+)
            }{$1$SessionID}gmsx;
        }

        # get HTML utils object
        my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');

        # detect all plain text links and put them into an HTML <a> tag
        $FieldContent = $HTMLUtilsObject->LinkQuote(
            String => $FieldContent,
        );

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
        my $Type     = $ParamObject->GetParam( Param => 'Type' );
        my $AttachmentData = $WorkOrderObject->WorkOrderAttachmentGet(
            WorkOrderID    => $WorkOrderID,
            Filename       => $Filename,
            AttachmentType => $Type,
        );

        # return error if file does not exist
        if ( !$AttachmentData ) {
            $LogObject->Log(
                Message  => "No such attachment ($Filename)! May be an attack!!!",
                Priority => 'error',
            );
            return $LayoutObject->ErrorScreen();
        }

        return $LayoutObject->Attachment(
            %{$AttachmentData},
            Type => 'attachment',
        );
    }

    # check if LayoutObject has TranslationObject
    if ( $LayoutObject->{LanguageObject} ) {

        # translate parameter
        PARAM:
        for my $Param (qw(WorkOrderType)) {

            # check for parameter
            next PARAM if !$WorkOrder->{$Param};

            # translate
            $WorkOrder->{$Param} = $LayoutObject->{LanguageObject}->Translate(
                $WorkOrder->{$Param},
            );
        }
    }

    # get session object
    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

    # Store LastWorkOrderView, for backlinks from workorder specific pages
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastWorkOrderView',
        Value     => $Self->{RequestedURL},
    );

    # Store LastScreenOverview, for backlinks from AgentLinkObject
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenOverView',
        Value     => $Self->{RequestedURL},
    );

    # Store LastScreenOverview, for backlinks from 'AgentLinkObject'
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenView',
        Value     => $Self->{RequestedURL},
    );

    # get the change that workorder belongs to
    my $Change = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
        ChangeID => $WorkOrder->{ChangeID},
        UserID   => $Self->{UserID},
    );

    # run workorder menu modules
    if ( ref $ConfigObject->Get('ITSMWorkOrder::Frontend::MenuModule') eq 'HASH' ) {

        # get items for menu
        my %Menus   = %{ $ConfigObject->Get('ITSMWorkOrder::Frontend::MenuModule') };
        my $Counter = 0;

        for my $Menu ( sort keys %Menus ) {

            # load module
            if ( $Kernel::OM->Get('Kernel::System::Main')->Require( $Menus{$Menu}->{Module} ) ) {
                my $Object = $Menus{$Menu}->{Module}->new(
                    %{$Self},
                    WorkOrderID => $WorkOrder->{WorkOrderID},
                );

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
                    WorkOrder => $WorkOrder,
                    Counter   => $Counter,
                    Config    => $Menus{$Menu},
                    MenuID    => $Menu,
                );
            }
            else {
                return $LayoutObject->FatalError();
            }
        }
    }

    # output header
    my $Output = $LayoutObject->Header(
        Title => $WorkOrder->{WorkOrderTitle},
    );
    $Output .= $LayoutObject->NavigationBar();

    # get user object
    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # get create user data
    my %CreateUser = $UserObject->GetUserData(
        UserID => $WorkOrder->{CreateBy},
        Cached => 1,
    );

    # get CreateBy user information
    for my $Postfix (qw(UserLogin UserFirstname UserLastname)) {
        $WorkOrder->{ 'Create' . $Postfix } = $CreateUser{$Postfix};
    }

    # get change user data
    my %ChangeUser = $UserObject->GetUserData(
        UserID => $WorkOrder->{ChangeBy},
        Cached => 1,
    );

    # get ChangeBy user information
    for my $Postfix (qw(UserLogin UserFirstname UserLastname)) {
        $WorkOrder->{ 'Change' . $Postfix } = $ChangeUser{$Postfix};
    }

    # output meta block
    $LayoutObject->Block(
        Name => 'Meta',
        Data => {
            %{$WorkOrder},
        },
    );

    # show values or dash ('-')
    for my $BlockName (
        qw(WorkOrderType PlannedStartTime PlannedEndTime ActualStartTime ActualEndTime)
        )
    {
        if ( $WorkOrder->{$BlockName} ) {
            $LayoutObject->Block(
                Name => $BlockName,
                Data => {
                    $BlockName => $WorkOrder->{$BlockName},
                },
            );
        }
        else {
            $LayoutObject->Block(
                Name => 'Empty' . $BlockName,
            );
        }
    }

    # show configurable blocks
    BLOCKNAME:
    for my $BlockName (qw(PlannedEffort AccountedTime)) {

        # skip if block is switched off in SysConfig
        next BLOCKNAME if !$Self->{Config}->{$BlockName};

        # show block
        $LayoutObject->Block(
            Name => 'Show' . $BlockName,
        );

        # show value or dash
        if ( $WorkOrder->{$BlockName} ) {
            $LayoutObject->Block(
                Name => $BlockName,
                Data => {
                    $BlockName => $WorkOrder->{$BlockName},
                },
            );
        }
        else {
            $LayoutObject->Block(
                Name => 'Empty' . $BlockName,
            );
        }
    }

    # get the dynamic fields for this screen
    my $DynamicField = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => 'ITSMWorkOrder',
        FieldFilter => $Self->{Config}->{DynamicField} || {},
    );

    # get dynamic field backend object
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    # cycle trough the activated Dynamic Fields
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        my $Value = $DynamicFieldBackendObject->ValueGet(
            DynamicFieldConfig => $DynamicFieldConfig,
            ObjectID           => $WorkOrderID,
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
            Data => {
                Label => $Label,
            },
        );

        if ( $ValueStrg->{Link} ) {

            # output link element
            $LayoutObject->Block(
                Name => 'DynamicFieldLink',
                Data => {
                    %{$WorkOrder},
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

    # get change builder user
    my %ChangeBuilderUser;
    if ( $Change->{ChangeBuilderID} ) {
        %ChangeBuilderUser = $UserObject->GetUserData(
            UserID => $Change->{ChangeBuilderID},
            Cached => 1,
        );
    }

    # get change builder information
    for my $Postfix (qw(UserLogin UserFirstname UserLastname)) {
        $WorkOrder->{ 'ChangeBuilder' . $Postfix } = $ChangeBuilderUser{$Postfix} || '';
    }

    # output change builder block
    if (%ChangeBuilderUser) {

        # show name and mail address if user exists
        $LayoutObject->Block(
            Name => 'ChangeBuilder',
            Data => {
                %{$WorkOrder},
            },
        );
    }
    else {

        # show dash if no change builder exists
        $LayoutObject->Block(
            Name => 'EmptyChangeBuilder',
            Data => {},
        );
    }

    # get workorder agent user
    if ( $WorkOrder->{WorkOrderAgentID} ) {
        my %WorkOrderAgentUser = $UserObject->GetUserData(
            UserID => $WorkOrder->{WorkOrderAgentID},
            Cached => 1,
        );

        if (%WorkOrderAgentUser) {

            # get WorkOrderAgent information
            for my $Postfix (qw(UserLogin UserFirstname UserLastname)) {
                $WorkOrder->{ 'WorkOrderAgent' . $Postfix } = $WorkOrderAgentUser{$Postfix} || '';
            }

            # output WorkOrderAgent information
            $LayoutObject->Block(
                Name => 'WorkOrderAgent',
                Data => {
                    %{$WorkOrder},
                },
            );
        }
    }

    # output if no WorkOrderAgent is found
    if ( !$WorkOrder->{WorkOrderAgentUserLogin} ) {
        $LayoutObject->Block(
            Name => 'EmptyWorkOrderAgent',
            Data => {},
        );
    }

    # get agents preferences
    my %UserPreferences = $UserObject->GetPreferences(
        UserID => $Self->{UserID},
    );

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
        $LayoutObject->Block(
            Name => 'BrowserLinkMessage',
        );
    }

    # get security restriction setting for iframes
    # security="restricted" may break SSO - disable this feature if requested
    my $MSSecurityRestricted;
    if ( $ConfigObject->Get('DisableMSIFrameSecurityRestricted') ) {
        $Param{MSSecurityRestricted} = '';
    }
    else {
        $Param{MSSecurityRestricted} = 'security="restricted"';
    }

    # show the HTML field blocks as iframes
    for my $Field (qw(Instruction Report)) {

        $LayoutObject->Block(
            Name => 'ITSMContent',
            Data => {
                WorkOrderID          => $WorkOrderID,
                Field                => $Field,
                MSSecurityRestricted => $MSSecurityRestricted,
            },
        );
    }

    # get linked objects
    my $LinkListWithData = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkListWithData(
        Object => 'ITSMWorkOrder',
        Key    => $WorkOrderID,
        State  => 'Valid',
        UserID => $Self->{UserID},
    );

    # get link table view mode
    my $LinkTableViewMode = $ConfigObject->Get('LinkObject::ViewMode');

    # create the link table
    my $LinkTableStrg = $LayoutObject->LinkObjectTableCreate(
        LinkListWithData => $LinkListWithData,
        ViewMode         => $LinkTableViewMode,
        Object           => 'ITSMWorkOrder',
        Key              => $WorkOrderID,
    );

    # output the link table
    if ($LinkTableStrg) {
        $LayoutObject->Block(
            Name => 'LinkTable' . $LinkTableViewMode,
            Data => {
                LinkTableStrg => $LinkTableStrg,
            },
        );
    }

    # get attachments
    my @Attachments = $WorkOrderObject->WorkOrderAttachmentList(
        WorkOrderID => $WorkOrderID,
    );

    # show attachments
    ATTACHMENT:
    for my $Filename (@Attachments) {

        # get info about file
        my $AttachmentData = $WorkOrderObject->WorkOrderAttachmentGet(
            WorkOrderID => $WorkOrderID,
            Filename    => $Filename,
        );

        # check for attachment information
        next ATTACHMENT if !$AttachmentData;

        # do not show inline attachments in attachments list (they have a content id)
        next ATTACHMENT if $AttachmentData->{Preferences}->{ContentID};

        # show block
        $LayoutObject->Block(
            Name => 'AttachmentRow',
            Data => {
                %{$WorkOrder},
                %{$AttachmentData},
            },
        );
    }

    # get report attachments
    my @ReportAttachments = $WorkOrderObject->WorkOrderReportAttachmentList(
        WorkOrderID => $WorkOrderID,
    );

    # show report attachments
    ATTACHMENT:
    for my $Filename (@ReportAttachments) {

        # get info about file
        my $AttachmentData = $WorkOrderObject->WorkOrderAttachmentGet(
            WorkOrderID    => $WorkOrderID,
            Filename       => $Filename,
            AttachmentType => 'WorkOrderReport',
        );

        # check for attachment information
        next ATTACHMENT if !$AttachmentData;

        # do not show inline attachments in attachments list (they have a content id)
        next ATTACHMENT if $AttachmentData->{Preferences}->{ContentID};

        # show block
        $LayoutObject->Block(
            Name => 'ReportAttachmentRow',
            Data => {
                %{$WorkOrder},
                %{$AttachmentData},
            },
        );
    }

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMWorkOrderZoom',
        Data         => {
            %{$Change},
            %{$WorkOrder},
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer();

    return $Output;
}

1;
