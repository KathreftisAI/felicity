# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentFAQZoom;

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

    my %UserPreferences = $Kernel::OM->Get('Kernel::System::User')->GetPreferences(
        UserID => $Self->{UserID},
    );

    if ( !defined $Self->{DoNotShowBrowserLinkMessage} ) {
        if ( $UserPreferences{UserAgentDoNotShowBrowserLinkMessage} ) {
            $Self->{DoNotShowBrowserLinkMessage} = 1;
        }
        else {
            $Self->{DoNotShowBrowserLinkMessage} = 0;
        }
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # permission check
    if ( !$Self->{AccessRo} ) {
        return $LayoutObject->NoPermission(
            Message    => Translatable('You need ro permission!'),
            WithHeader => 'yes',
        );
    }

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get params
    my %GetParam;
    $GetParam{ItemID} = $ParamObject->GetParam( Param => 'ItemID' );
    $GetParam{Rate}   = $ParamObject->GetParam( Param => 'Rate' );

    # get navigation bar option
    my $Nav = $ParamObject->GetParam( Param => 'Nav' ) || '';

    # check needed stuff
    if ( !$GetParam{ItemID} ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No ItemID is given!'),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # get FAQ item data
    my %FAQData = $FAQObject->FAQGet(
        ItemID        => $GetParam{ItemID},
        ItemFields    => 1,
        UserID        => $Self->{UserID},
        DynamicFields => 1,
    );
    if ( !%FAQData ) {
        return $LayoutObject->ErrorScreen();
    }

    # check user permission
    my $Permission = $FAQObject->CheckCategoryUserPermission(
        UserID     => $Self->{UserID},
        CategoryID => $FAQData{CategoryID},
    );

    # show error message
    if ( !$Permission ) {
        return $LayoutObject->NoPermission(
            Message    => Translatable('You have no permission for this category!'),
            WithHeader => 'yes',
        );
    }

    # get HTML utils object
    my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');

    # ---------------------------------------------------------- #
    # HTMLView Sub-action
    # ---------------------------------------------------------- #
    if ( $Self->{Subaction} eq 'HTMLView' ) {

        # get params
        my $Field = $ParamObject->GetParam( Param => "Field" );

        # needed params
        for my $Needed (qw( ItemID Field )) {
            if ( !$Needed ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Message  => "Needed Param: $Needed!",
                    Priority => 'error',
                );
                return;
            }
        }

        # get the Field content
        my $FieldContent = $FAQObject->ItemFieldGet(
            ItemID => $GetParam{ItemID},
            Field  => $Field,
            UserID => $Self->{UserID},
        );

        # rewrite handle and action, take care of old style before FAQ 2.0.x
        $FieldContent =~ s{
            Action=AgentFAQ [&](amp;)? Subaction=Download [&](amp;)?
        }{Action=AgentFAQZoom;Subaction=DownloadAttachment;}gxms;

        # build base URL for in-line images
        my $SessionID = '';
        if ( $Self->{SessionID} && !$Self->{SessionIDCookie} ) {
            $SessionID = ';' . $Self->{SessionName} . '=' . $Self->{SessionID};
            $FieldContent =~ s{
                (Action=AgentFAQZoom;Subaction=DownloadAttachment;ItemID=\d+;FileID=\d+)
            }{$1$SessionID}gmsx;
        }

        # convert content to HTML if needed
        if (
            $Kernel::OM->Get('Kernel::Config')->Get('FAQ::Item::HTML')
            && $LayoutObject->{BrowserRichText}
            && $FAQData{ContentType} ne 'text/html'
            )
        {
            $FieldContent = $HTMLUtilsObject->ToHTML(
                String => $FieldContent,
            ) || '';
        }

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

    # ---------------------------------------------------------- #
    # DownloadAttachment Sub-action
    # ---------------------------------------------------------- #
    if ( $Self->{Subaction} eq 'DownloadAttachment' ) {

        # manage parameters
        $GetParam{FileID} = $ParamObject->GetParam( Param => 'FileID' );

        if ( !defined $GetParam{FileID} ) {
            return $LayoutObject->FatalError(
                Message => Translatable('Need FileID!'),
            );
        }

        # get attachments
        my %File = $FAQObject->AttachmentGet(
            ItemID => $GetParam{ItemID},
            FileID => $GetParam{FileID},
            UserID => $Self->{UserID},
        );
        if (%File) {
            return $LayoutObject->Attachment(%File);
        }
        else {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Message  => "No such attachment ($GetParam{FileID})! May be an attack!!!",
                Priority => 'error',
            );
            return $LayoutObject->ErrorScreen();
        }
    }

    # ---------------------------------------------------------- #
    # other sub-actions continues here
    # ---------------------------------------------------------- #
    my $Output;
    if ( $Nav eq 'None' ) {

        # output header small and no Navbar
        $Output = $LayoutObject->Header( Type => 'Small' );
    }
    else {

        # output header and navigation bar
        $Output = $LayoutObject->Header(
            Value => $FAQData{Title},
        );
        $Output .= $LayoutObject->NavigationBar();
    }

    # define different notifications
    my %Notifications = (
        Thanks => {
            Priority => 'Info',
            Info     => Translatable('Thanks for your vote!'),
        },
        AlreadyVoted => {
            Priority => 'Error',
            Info     => Translatable('You have already voted!'),
        },
        NoRate => {
            Priority => 'Error',
            Info     => Translatable('No rate selected!'),
        },
    );

    # output notifications if any
    my $Notify = $ParamObject->GetParam( Param => 'Notify' ) || '';
    if ( $Notify && IsHashRefWithData( $Notifications{$Notify} ) ) {
        $Output .= $LayoutObject->Notify(
            %{ $Notifications{$Notify} },
        );
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get default options
    my $MultiLanguage = $ConfigObject->Get('FAQ::MultiLanguage');
    my $Voting        = $ConfigObject->Get('FAQ::Voting');

    # set default interface settings
    my $Interface = $FAQObject->StateTypeGet(
        Name   => 'internal',
        UserID => $Self->{UserID},
    );
    my $InterfaceStates = $FAQObject->StateTypeList(
        Types  => $ConfigObject->Get('FAQ::Agent::StateTypes'),
        UserID => $Self->{UserID},
    );

    # get FAQ vote information
    my $VoteData;
    if ($Voting) {
        $VoteData = $FAQObject->VoteGet(
            CreateBy  => $Self->{UserID},
            ItemID    => $FAQData{ItemID},
            Interface => $Interface->{StateID},
            IP        => $ENV{'REMOTE_ADDR'},
            UserID    => $Self->{UserID},
        );
    }

    # check if user already voted this FAQ item
    my $AlreadyVoted;
    if ($VoteData) {

        # get time object
        my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

        # item/change_time > voting/create_time
        my $ItemChangedSystemTime = $TimeObject->TimeStamp2SystemTime(
            String => $FAQData{Changed} || '',
        );
        my $VoteCreatedSystemTime = $TimeObject->TimeStamp2SystemTime(
            String => $VoteData->{Created} || '',
        );

        if ( $ItemChangedSystemTime <= $VoteCreatedSystemTime ) {
            $AlreadyVoted = 1;
        }
    }

    # ---------------------------------------------------------- #
    # Vote Sub-action
    # ---------------------------------------------------------- #
    if ( $Self->{Subaction} eq 'Vote' ) {

        # user can't use this sub-action if is not enabled
        if ( !$Voting ) {
            $LayoutObject->FatalError(
                Message => Translatable('The voting mechanism is not enabled!'),
            );
        }

        # user can vote only once per FAQ revision
        if ($AlreadyVoted) {

            # redirect to FAQ zoom
            return $LayoutObject->Redirect(
                OP => 'Action=AgentFAQZoom;ItemID='
                    . $GetParam{ItemID}
                    . ';Nav=$Nav;Notify=AlreadyVoted'
            );
        }

        # set the vote if any
        elsif ( defined $GetParam{Rate} ) {

            # get rates config
            my $VotingRates = $ConfigObject->Get('FAQ::Item::Voting::Rates');
            my $Rate        = $GetParam{Rate};

            # send error if rate is not defined in config
            if ( !$VotingRates->{$Rate} ) {
                $LayoutObject->FatalError(
                    Message => Translatable('The vote rate is not defined!'),
                );
            }

            # otherwise add the vote
            else {
                $FAQObject->VoteAdd(
                    CreatedBy => $Self->{UserID},
                    ItemID    => $GetParam{ItemID},
                    IP        => $ENV{'REMOTE_ADDR'},
                    Interface => $Interface->{StateID},
                    Rate      => $GetParam{Rate},
                    UserID    => $Self->{UserID},
                );

                # do not show the voting form
                $AlreadyVoted = 1;

                # refresh FAQ item data
                %FAQData = $FAQObject->FAQGet(
                    ItemID        => $GetParam{ItemID},
                    ItemFields    => 1,
                    UserID        => $Self->{UserID},
                    DynamicFields => 1,
                );
                if ( !%FAQData ) {
                    return $LayoutObject->ErrorScreen();
                }

                # redirect to FAQ zoom
                return $LayoutObject->Redirect(
                    OP => 'Action=AgentFAQZoom;ItemID='
                        . $GetParam{ItemID}
                        . ';Nav=$Nav;Notify=Thanks'
                );
            }
        }

        # user is able to vote but no rate has been selected
        else {
            # redirect to FAQ zoom
            return $LayoutObject->Redirect(
                OP => 'Action=AgentFAQZoom;ItemID=' . $GetParam{ItemID} . ';Nav=$Nav;Notify=NoRate'
            );
        }
    }

    # prepare fields data (Still needed for PlainText)
    FIELD:
    for my $Field (qw(Field1 Field2 Field3 Field4 Field5 Field6)) {
        next FIELD if !$FAQData{$Field};

        # rewrite handle and action, take care of old style before FAQ 2.0.x
        $FAQData{$Field} =~ s{
            Action=AgentFAQ [&](amp;)? Subaction=Download [&](amp;)?
        }{Action=AgentFAQZoom;Subaction=DownloadAttachment;}gxms;

        # no quoting if HTML view is enabled
        next FIELD if $ConfigObject->Get('FAQ::Item::HTML');

        # HTML quoting
        $FAQData{$Field} = $LayoutObject->Ascii2Html(
            NewLine        => 0,
            Text           => $FAQData{$Field},
            VMax           => 5000,
            HTMLResultMode => 1,
            LinkFeature    => 1,
        );
    }

    # get user object
    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # get user info (CreatedBy)
    my %UserInfo = $UserObject->GetUserData(
        UserID => $FAQData{CreatedBy}
    );
    $Param{CreatedByUser} = "$UserInfo{UserFirstname} $UserInfo{UserLastname}";

    # get user info (ChangedBy)
    %UserInfo = $UserObject->GetUserData(
        UserID => $FAQData{ChangedBy}
    );
    $Param{ChangedByUser} = "$UserInfo{UserFirstname} $UserInfo{UserLastname}";

    # set voting results
    $Param{VotingResultColor} = $LayoutObject->GetFAQItemVotingRateColor(
        Rate => $FAQData{VoteResult},
    );

    if ( !$Param{VotingResultColor} || $FAQData{Votes} eq '0' ) {
        $Param{VotingResultColor} = 'Gray';
    }

    if ( $Nav ne 'None' ) {

        # run FAQ menu modules
        if ( ref $ConfigObject->Get('FAQ::Frontend::MenuModule') eq 'HASH' ) {
            my %Menus   = %{ $ConfigObject->Get('FAQ::Frontend::MenuModule') };
            my $Counter = 0;
            for my $Menu ( sort keys %Menus ) {

                # load module
                if ( $Kernel::OM->Get('Kernel::System::Main')->Require( $Menus{$Menu}->{Module} ) ) {
                    my $Object = $Menus{$Menu}->{Module}->new(
                        %{$Self},
                        ItemID => $FAQData{ItemID},
                    );

                    # set classes
                    if ( $Menus{$Menu}->{Target} ) {

                        if ( $Menus{$Menu}->{Target} eq 'PopUp' ) {
                            $Menus{$Menu}->{Class} = 'AsPopup';
                        }
                        elsif ( $Menus{$Menu}->{Target} eq 'Back' ) {
                            $Menus{$Menu}->{Class} = 'HistoryBack';
                        }
                        elsif ( $Menus{$Menu}->{Target} eq 'ConfirmationDialog' ) {
                            $Menus{$Menu}->{Class} = 'AsConfirmationDialog';
                        }

                    }

                    # run module
                    $Counter = $Object->Run(
                        %Param,
                        FAQItem => {%FAQData},
                        Counter => $Counter,
                        Config  => $Menus{$Menu},
                        MenuID  => 'Menu' . $Menu,
                    );
                }
                else {
                    return $LayoutObject->FatalError();
                }
            }
        }
    }

    # output approval state
    if ( $ConfigObject->Get('FAQ::ApprovalRequired') ) {
        $Param{Approval} = $FAQData{Approved} ? 'Yes' : 'No';
        $LayoutObject->Block(
            Name => 'ViewApproval',
            Data => {%Param},
        );
    }

    if ($Voting) {

        # output votes number if any
        if ( $FAQData{Votes} ) {
            $LayoutObject->Block(
                Name => 'ViewVotes',
                Data => {%FAQData},
            );
        }

        # otherwise display a No Votes found message
        else {
            $LayoutObject->Block( Name => 'ViewNoVotes' );
        }
    }

    # show FAQ path
    my $ShowFAQPath = $LayoutObject->FAQPathShow(
        FAQObject   => $FAQObject,
        CategoryID  => $FAQData{CategoryID},
        UserID      => $Self->{UserID},
        PathForItem => 1,
        Nav         => $Nav,
    );
    if ($ShowFAQPath) {
        $LayoutObject->Block(
            Name => 'FAQPathItemElement',
            Data => {%FAQData},
            Nav  => $Nav,
        );
    }

    # show keywords as search links
    if ( $FAQData{Keywords} ) {

        # replace commas and semicolons
        $FAQData{Keywords} =~ s/,/ /g;
        $FAQData{Keywords} =~ s/;/ /g;

        my @Keywords = split /\s+/, $FAQData{Keywords};
        for my $Keyword (@Keywords) {
            $LayoutObject->Block(
                Name => 'Keywords',
                Data => {
                    Keyword => $Keyword,
                },
            );
        }
    }

    # show languages
    if ($MultiLanguage) {
        $LayoutObject->Block(
            Name => 'Language',
            Data => {
                %FAQData,
            },
        );
    }

    # output rating stars
    if ($Voting) {
        $LayoutObject->FAQRatingStarsShow(
            VoteResult => $FAQData{VoteResult},
            Votes      => $FAQData{Votes},
        );
    }
    if ( $Nav ne 'None' ) {

        # output existing attachments
        my @AttachmentIndex = $FAQObject->AttachmentIndex(
            ItemID     => $GetParam{ItemID},
            ShowInline => 0,
            UserID     => $Self->{UserID},
        );

        # output header and all attachments
        if (@AttachmentIndex) {
            $LayoutObject->Block(
                Name => 'AttachmentHeader',
            );
            for my $Attachment (@AttachmentIndex) {
                $LayoutObject->Block(
                    Name => 'AttachmentRow',
                    Data => {
                        %FAQData,
                        %{$Attachment},
                    },
                );
            }
        }
    }

    # show message about links in iframes, if user didn't close it already
    if ( !$Self->{DoNotShowBrowserLinkMessage} ) {
        $LayoutObject->Block(
            Name => 'BrowserLinkMessage',
        );
    }

    # show FAQ Content
    my $FAQBody = $LayoutObject->FAQContentShow(
        FAQObject       => $FAQObject,
        InterfaceStates => $InterfaceStates,
        FAQData         => {%FAQData},
        UserID          => $Self->{UserID},
        ReturnContent   => 1,
    );

    # get config of frontend module
    my $Config = $ConfigObject->Get("FAQ::Frontend::$Self->{Action}");

    # get the dynamic fields for this screen
    my $DynamicField = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => 'FAQ',
        FieldFilter => $Config->{DynamicField} || {},
    );

    # cycle trough the activated Dynamic Fields for faq object
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # get print string for this dynamic field
        my $ValueStrg = $Kernel::OM->Get('Kernel::System::DynamicField::Backend')->DisplayValueRender(
            DynamicFieldConfig => $DynamicFieldConfig,
            Value              => $FAQData{ 'DynamicField_' . $DynamicFieldConfig->{Name} },
            ValueMaxChars      => 250,
            LayoutObject       => $LayoutObject,
        );

        my $Label = $DynamicFieldConfig->{Label};

        $LayoutObject->Block(
            Name => 'FAQDynamicField',
            Data => {
                Label => $Label,
            },
        );

        if ( $ValueStrg->{Link} ) {
            $LayoutObject->Block(
                Name => 'FAQDynamicFieldLink',
                Data => {
                    Value                       => $ValueStrg->{Value},
                    Title                       => $ValueStrg->{Title},
                    Link                        => $ValueStrg->{Link},
                    $DynamicFieldConfig->{Name} => $ValueStrg->{Title},
                },
            );
        }
        else {
            $LayoutObject->Block(
                Name => 'FAQDynamicFieldPlain',
                Data => {
                    Value => $ValueStrg->{Value},
                    Title => $ValueStrg->{Title},
                },
            );
        }

        # example of dynamic fields order customization
        $LayoutObject->Block(
            Name => 'FAQDynamicField_' . $DynamicFieldConfig->{Name},
            Data => {
                Label => $Label,
            },
        );

        $LayoutObject->Block(
            Name => 'FAQDynamicField_' . $DynamicFieldConfig->{Name} . '_Plain',
            Data => {
                Value => $ValueStrg->{Value},
                Title => $ValueStrg->{Title},
            },
        );
    }

    if ( $Nav ne 'None' ) {

        # show FAQ Voting
        if ($Voting) {

            # get voting config
            my $ShowVotingConfig = $ConfigObject->Get('FAQ::Item::Voting::Show');
            if ( $ShowVotingConfig->{ $Interface->{Name} } ) {

                # check if the user already voted after last change
                if ( !$AlreadyVoted ) {
                    $Self->_FAQVoting( FAQData => {%FAQData} );
                }
            }
        }

        # get linked objects
        my $LinkListWithData = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkListWithData(
            Object => 'FAQ',
            Key    => $GetParam{ItemID},
            State  => 'Valid',
            UserID => $Self->{UserID},
        );

        # get link table view mode
        my $LinkTableViewMode = $ConfigObject->Get('LinkObject::ViewMode');

        # create the link table
        my $LinkTableStrg = $LayoutObject->LinkObjectTableCreate(
            LinkListWithData => $LinkListWithData,
            ViewMode         => $LinkTableViewMode,
            Object           => 'FAQ',
            Key              => $GetParam{ItemID},
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
    }

    # log access to this FAQ item
    $FAQObject->FAQLogAdd(
        ItemID    => $ParamObject->GetParam( Param => 'ItemID' ),
        Interface => $Interface->{Name},
        UserID    => $Self->{UserID},
    );

    # start template output
    if ( $Nav && $Nav eq 'None' ) {

        # only convert HTML to plain text if rich text editor is not used
        if ( $ConfigObject->Get('Frontend::RichText') ) {
            $FAQData{FullBody} = $FAQBody;
        }
        else {
            $FAQData{FullBody} = $HTMLUtilsObject->ToAscii(
                String => $FAQBody,
            );
        }

        # get the public state type
        my $PublicStateType = $FAQObject->StateTypeGet(
            Name   => 'public',
            UserID => $Self->{UserID},
        );

        # remove in-line image links to FAQ images
        $FAQData{FullBody}
            =~ s{ <img [^<>]+ Action=(Agent|Customer|Public)FAQ [^<>]+ > }{}gxms;

        # get configuration options for Ticket Compose
        my $TicketComposeConfig = $ConfigObject->Get('FAQ::TicketCompose');

        $Param{UpdateArticleSubject} = $TicketComposeConfig->{UpdateArticleSubject} || 0;
        if ( $Param{UpdateArticleSubject} ) {
            $LayoutObject->Block(
                Name => 'UpdateArticleSubject',
                Data => {},
            );
        }

        my $ShowOrBlock;

        # show "Insert Text" button
        if ( $TicketComposeConfig->{ShowInsertTextButton} ) {
            if (
                defined $TicketComposeConfig->{InsertMethod}
                && $TicketComposeConfig->{InsertMethod} eq 'Full'
                )
            {
                $LayoutObject->Block(
                    Name => 'InsertFull',
                    Data => {},
                );
            }
            else {
                $LayoutObject->Block(
                    Name => 'InsertText',
                    Data => {},
                );
            }

            $ShowOrBlock = 1;
        }

        # check if FAQ article is public
        if ( $FAQData{StateTypeID} == $PublicStateType->{StateID} ) {

            my $HTTPType = $ConfigObject->Get('HttpType');
            my $FQDN     = $ConfigObject->Get('FQDN');
            my $Baselink = $LayoutObject->{Baselink};

            # rewrite handle
            $Baselink
                =~ s{ index[.]pl [?] }{public.pl?}gxms;

            $FAQData{Publiclink} = $HTTPType . '://' . $FQDN . $Baselink
                . "Action=PublicFAQZoom;ItemID=$FAQData{ItemID}";

            # show "Insert Link" button
            if ( $TicketComposeConfig->{ShowInsertLinkButton} ) {
                $LayoutObject->Block(
                    Name => 'InsertLink',
                    Data => {},
                );
                $ShowOrBlock = 1;
            }

            # show "Insert Text and Link" button
            if ( $TicketComposeConfig->{ShowInsertTextAndLinkButton} ) {
                if (
                    defined $TicketComposeConfig->{InsertMethod}
                    && $TicketComposeConfig->{InsertMethod} eq 'Full'
                    )
                {
                    $LayoutObject->Block(
                        Name => 'InsertFullAndLink',
                        Data => {},
                    );
                }
                else {
                    $LayoutObject->Block(
                        Name => 'InsertTextAndLink',
                        Data => {},
                    );
                }
                $ShowOrBlock = 1
            }
        }

        my $CancelButtonClass = 'ZoomSmallButton';

        # show the "Or" block between the buttons and the Cancel & close window label
        if ($ShowOrBlock) {
            $LayoutObject->Block(
                Name => 'Or',
                Data => {},
            );

            # set the $CancelButtonClass to '';
            $CancelButtonClass = '';
        }

        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentFAQZoomSmall',
            Data         => {
                %FAQData,
                %GetParam,
                %Param,
                CancelButtonClass => $CancelButtonClass || '',
            },
        );
    }
    else {
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentFAQZoom',
            Data         => {
                %FAQData,
                %GetParam,
                %Param,
            },
        );
    }

    # add footer
    if ( $Nav && $Nav eq 'None' ) {
        $Output .= $LayoutObject->Footer( Type => 'Small' );
    }
    else {
        $Output .= $LayoutObject->Footer();
    }

    return $Output;
}

sub _FAQVoting {
    my ( $Self, %Param ) = @_;

    my %FAQData = %{ $Param{FAQData} };

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # output voting block
    $LayoutObject->Block(
        Name => 'FAQVoting',
        Data => {%FAQData},
    );

    # get Voting rates setting
    my $VotingRates = $Kernel::OM->Get('Kernel::Config')->Get('FAQ::Item::Voting::Rates');
    for my $RateValue ( sort { $a <=> $b } keys %{$VotingRates} ) {

        # create data structure for output
        my %Data = (
            Value => $RateValue,
            Title => $VotingRates->{$RateValue},
        );

        # output vote rating row block
        $LayoutObject->Block(
            Name => 'FAQVotingRateRow',
            Data => {%Data},
        );
    }

    return 1;
}

1;
