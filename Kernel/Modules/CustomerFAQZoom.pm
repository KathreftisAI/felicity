# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::CustomerFAQZoom;

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

    if ( !defined $Self->{DoNotShowBrowserLinkMessage} ) {
        my %UserPreferences = $Kernel::OM->Get('Kernel::System::CustomerUser')->GetPreferences(
            UserID => $Self->{UserID},
        );

        if ( $UserPreferences{UserCustomerDoNotShowBrowserLinkMessage} ) {
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

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get params
    my %GetParam;
    $GetParam{ItemID} = $ParamObject->GetParam( Param => 'ItemID' );
    $GetParam{Rate}   = $ParamObject->GetParam( Param => 'Rate' );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # save, if browser link message was closed
    if ( $Self->{Subaction} eq 'BrowserLinkMessage' ) {

        $Kernel::OM->Get('Kernel::System::CustomerUser')->SetPreferences(
            UserID => $Self->{UserID},
            Key    => 'UserCustomerDoNotShowBrowserLinkMessage',
            Value  => 1,
        );

        return $LayoutObject->Attachment(
            ContentType => 'text/html',
            Content     => 1,
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    # check needed stuff
    if ( !$GetParam{ItemID} ) {
        return $LayoutObject->CustomerFatalError(
            Message => Translatable('Need ItemID!'),
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
        return $LayoutObject->CustomerFatalError();
    }

    # get the valid ids
    my @ValidIDs = $Kernel::OM->Get('Kernel::System::Valid')->ValidIDsGet();
    my %ValidIDLookup = map { $_ => 1 } @ValidIDs;

    # check user permission
    my $Permission = $FAQObject->CheckCategoryCustomerPermission(
        CustomerUser => $Self->{UserLogin},
        CategoryID   => $FAQData{CategoryID},
        UserID       => $Self->{UserID},
    );

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get interface state list
    my $InterfaceStates = $FAQObject->StateTypeList(
        Types  => $ConfigObject->Get('FAQ::Customer::StateTypes'),
        UserID => $Self->{UserID},
    );

    # permission check
    if (
        !$Permission
        || !$FAQData{Approved}
        || !$ValidIDLookup{ $FAQData{ValidID} }
        || !$InterfaceStates->{ $FAQData{StateTypeID} }
        )
    {
        return $LayoutObject->CustomerNoPermission( WithHeader => 'yes' );
    }

    # store the last screen in session
    $Kernel::OM->Get('Kernel::System::AuthSession')->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenView',
        Value     => $Self->{RequestedURL},
    );

    # ---------------------------------------------------------- #
    # HTMLView Subaction
    # ---------------------------------------------------------- #
    if ( $Self->{Subaction} eq 'HTMLView' ) {

        # get params
        my $Field = $ParamObject->GetParam( Param => "Field" );

        # needed params
        for my $Needed (qw( ItemID Field )) {
            if ( !$Needed ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Needed Param: $Needed!",
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

        # rewrite handle and action
        $FieldContent
            =~ s{ index[.]pl [?] Action=AgentFAQZoom }{customer.pl?Action=CustomerFAQZoom}gxms;

        # take care of old style before FAQ 2.0.x
        $FieldContent =~ s{
            index[.]pl [?] Action=AgentFAQ [&](amp;)? Subaction=Download [&](amp;)?
        }{customer.pl?Action=CustomerFAQZoom;Subaction=DownloadAttachment;}gxms;

        # build base URL for inline images
        my $SessionID = '';
        if ( $Self->{SessionID} && !$Self->{SessionIDCookie} ) {
            $SessionID = ';' . $Self->{SessionName} . '=' . $Self->{SessionID};
            $FieldContent =~ s{
                (Action=CustomerFAQZoom;Subaction=DownloadAttachment;ItemID=\d+;FileID=\d+)
            }{$1$SessionID}gmsx;
        }

        my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');

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
    # DownloadAttachment Subaction
    # ---------------------------------------------------------- #
    if ( $Self->{Subaction} eq 'DownloadAttachment' ) {

        # manage parameters
        $GetParam{FileID} = $ParamObject->GetParam( Param => 'FileID' );
        if ( !defined $GetParam{FileID} ) {
            return $LayoutObject->CustomerFatalError(
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
            return $LayoutObject->CustomerFatalError();
        }
    }

    # output header
    my $Output = $LayoutObject->CustomerHeader(
        Value => $FAQData{Title},
    );
    $Output .= $LayoutObject->CustomerNavigationBar();

    # set default interface settings
    my $Interface = $FAQObject->StateTypeGet(
        Name   => 'external',
        UserID => $Self->{UserID},
    );

    # get voting default option
    my $Voting = $ConfigObject->Get('FAQ::Voting');

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
    # Vote Subaction
    # ---------------------------------------------------------- #
    if ( $Self->{Subaction} eq 'Vote' ) {

        # customer can't use this subaction if is not enabled
        if ( !$Voting ) {
            $LayoutObject->CustomerFatalError(
                Message => Translatable('The voting mechanism is not enabled!'),
            );
        }

        # user can vote only once per FAQ revision
        if ($AlreadyVoted) {
            $Output .= $LayoutObject->Notify(
                Priority => 'Error',
                Info     => Translatable('You have already voted!'),
            );
        }

        # set the vote if any
        elsif ( defined $GetParam{Rate} ) {

            # get rates config
            my $VotingRates = $ConfigObject->Get('FAQ::Item::Voting::Rates');
            my $Rate        = $GetParam{Rate};

            # send error if rate is not defined in config
            if ( !$VotingRates->{$Rate} ) {
                $LayoutObject->CustomerFatalError(
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
                    ItemID     => $GetParam{ItemID},
                    ItemFields => 1,
                    UserID     => $Self->{UserID},
                );
                if ( !%FAQData ) {
                    return $LayoutObject->CustomerFatalError();
                }

                $Output .= $LayoutObject->Notify(
                    Info => Translatable('Thanks for your vote!'),
                );
            }
        }

        # user is able to vote but no rate has been selected
        else {
            $Output .= $LayoutObject->Notify(
                Priority => 'Error',
                Info     => Translatable('No rate selected!'),
            );
        }
    }

    # prepare fields data (Still needed for PlainText)
    FIELD:
    for my $Field (qw(Field1 Field2 Field3 Field4 Field5 Field6)) {
        next FIELD if !$FAQData{$Field};

        # rewrite links to embedded images for customer interface
        if ( $Interface->{Name} eq 'external' ) {

            # rewrite handle and action
            $FAQData{$Field}
                =~ s{ index[.]pl [?] Action=AgentFAQZoom }{customer.pl?Action=CustomerFAQZoom}gxms;

            # take care of old style before FAQ 2.0.x
            $FAQData{$Field} =~ s{
                index[.]pl [?] Action=AgentFAQ [&](amp;)? Subaction=Download [&](amp;)?
            }{customer.pl?Action=CustomerFAQZoom;Subaction=DownloadAttachment;}gxms;
        }

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

    # set voting results
    $Param{VotingResultColor} = $LayoutObject->GetFAQItemVotingRateColor(
        Rate => $FAQData{VoteResult},
    );

    if ( !$Param{VotingResultColor} || $FAQData{Votes} eq '0' ) {
        $Param{VotingResultColor} = 'Gray';
    }

    # show back link
    $LayoutObject->Block(
        Name => 'Back',
        Data => \%Param,
    );

    # get multi-language default option
    my $MultiLanguage = $ConfigObject->Get('FAQ::MultiLanguage');

    # show language
    if ($MultiLanguage) {
        $LayoutObject->Block(
            Name => 'Language',
            Data => {%FAQData},
        );
    }

    # show votes
    if ($Voting) {

        # always displays Votes result even if its 0
        $LayoutObject->Block(
            Name => 'ViewVotes',
            Data => {%FAQData},
        );
    }

    # show FAQ path
    my $ShowFAQPath = $LayoutObject->FAQPathShow(
        FAQObject   => $FAQObject,
        CategoryID  => $FAQData{CategoryID},
        PathForItem => 1,
        UserID      => $Self->{UserID},
    );
    if ($ShowFAQPath) {
        $LayoutObject->Block(
            Name => 'FAQPathItemElement',
            Data => {%FAQData},
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

    # output rating stars
    if ($Voting) {
        $LayoutObject->FAQRatingStarsShow(
            VoteResult => $FAQData{VoteResult},
            Votes      => $FAQData{Votes},
        );
    }

    # output attachments if any
    my @AttachmentIndex = $FAQObject->AttachmentIndex(
        ItemID     => $GetParam{ItemID},
        ShowInline => 0,
        UserID     => $Self->{UserID},
    );

    # output attachments
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

    # show message about links in iframes, if user didn't close it already
    if ( !$Self->{DoNotShowBrowserLinkMessage} ) {
        $LayoutObject->Block(
            Name => 'BrowserLinkMessage',
        );
    }

    # show FAQ Content
    $LayoutObject->FAQContentShow(
        FAQObject       => $FAQObject,
        InterfaceStates => $InterfaceStates,
        FAQData         => {%FAQData},
        UserID          => $Self->{UserID},
    );

    # get config of frontend module
    my $Config = $ConfigObject->Get("FAQ::Frontend::$Self->{Action}");

    # get the dynamic fields for this screen
    my $DynamicField = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => 'FAQ',
        FieldFilter => $Config->{DynamicField} || {},
    );

    # get dynamic field backend object
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    # cycle trough the activated Dynamic Fields for ticket object
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        my $Value = $DynamicFieldBackendObject->ValueGet(
            DynamicFieldConfig => $DynamicFieldConfig,
            ObjectID           => $GetParam{ItemID},
        );

        # get print string for this dynamic field
        my $ValueStrg = $DynamicFieldBackendObject->DisplayValueRender(
            DynamicFieldConfig => $DynamicFieldConfig,
            Value              => $Value,
            ValueMaxChars      => 250,
            LayoutObject       => $LayoutObject,
        );

        my $Label = $DynamicFieldConfig->{Label};

        $LayoutObject->Block(
            Name => 'FAQDynamicField',
            Data => {
                Label => $Label,
                Value => $ValueStrg->{Value},
                Title => $ValueStrg->{Title},
            },
        );

        # example of dynamic fields order customization
        $LayoutObject->Block(
            Name => 'FAQDynamicField_' . $DynamicFieldConfig->{Name},
            Data => {
                Label => $Label,
                Value => $ValueStrg->{Value},
                Title => $ValueStrg->{Title},
            },
        );
    }

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

    # log access to this FAQ item
    $FAQObject->FAQLogAdd(
        ItemID    => $ParamObject->GetParam( Param => 'ItemID' ),
        Interface => $Interface->{Name},
        UserID    => $Self->{UserID},
    );

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'CustomerFAQZoom',
        Data         => {
            %FAQData,
            %GetParam,
            %Param,
        },
    );

    # add footer
    $Output .= $LayoutObject->CustomerFooter();

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
