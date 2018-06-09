# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMTemplateEditCAB;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

## nofilter(TidyAll::Plugin::OTRS::Perl::Dumper)
use Data::Dumper;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMChange::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $Kernel::OM->Get('Kernel::System::ITSMChange')->Permission(
        Type   => $Self->{Config}->{Permission},
        Action => $Self->{Action},
        UserID => $Self->{UserID},
    );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'You need %s permission!', $Self->{Config}->{Permission} ),
            WithHeader => 'yes',
        );
    }

    # store all needed parameters in %GetParam to make it reloadable
    my %GetParam;
    for my $ParamName (
        qw(TemplateID TemplateContent NewCABMember NewCABMemberSelected NewCABMemberType AddCABMember)
        )
    {
        $GetParam{$ParamName} = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => $ParamName );
    }

    # check needed stuff
    if ( !$GetParam{TemplateID} ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No TemplateID is given!'),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get template object
    my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template');

    # get template data
    my $Template = $TemplateObject->TemplateGet(
        TemplateID => $GetParam{TemplateID},
        UserID     => $Self->{UserID},
    );

    # check error
    if ( !$Template ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}
                ->Translate( 'Template "%s" not found in database!', $GetParam{TemplateID} ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # on first page load we fill the template content string parameter from the templete
    if ( !$Self->{Subaction} ) {
        $GetParam{TemplateContent} = $Template->{Content};
    }

    # de-serialize the CAB content
    my $CABReference = $Self->_CABDeSerialize(
        Content => $GetParam{TemplateContent},
        UserID  => $Self->{UserID},
    );

    # is cab member delete requested
    my %DeleteMember = $Self->_IsMemberDeletion(
        CABReference => $CABReference,
    );
    if (%DeleteMember) {

        # find users who are still member of CAB
        my $Type = $DeleteMember{Type};
        my @StillMembers = grep { $_ ne $DeleteMember{ID} } @{ $CABReference->{CABAdd}->{$Type} };

        # store the remaining members
        $CABReference->{CABAdd}->{$Type} = \@StillMembers;

        # reset the "save" subaction, because we only want to show the updated member list
        $Self->{Subaction} = '';
    }

    # server error hash, to store the items with ServerError class
    my %ServerError;

    # Remember the reason why saving was not attempted.
    # The entries are the names of the dtl validation error blocks.
    my @ValidationErrors;

    # add a CAB member
    if ( $GetParam{AddCABMember} && $GetParam{NewCABMember} ) {

        # add a member
        my %CABUpdateInfo = $Self->_IsNewCABMemberOk(
            CABReference => $CABReference,
            %GetParam,
        );

        # if member is valid
        if (%CABUpdateInfo) {

            # add new member
            $CABReference->{CABAdd}->{ $GetParam{NewCABMemberType} } = $CABUpdateInfo{ $GetParam{NewCABMemberType} };

            # do not display a name in autocomplete field
            # and do not set values in hidden fields as the
            # user was already added
            delete @GetParam{qw(NewCABMember NewCABMemberSelected NewCABMemberType)};
        }

        # if member is invalid
        else {
            $ServerError{NewCABMemberError} = 'ServerError';
        }

        # reset the "save" subaction, because we only want to show the updated member list
        $Self->{Subaction} = '';
    }

    # save the CAB template
    if ( $Self->{Subaction} eq 'Save' ) {

        # update the template
        my $UpdateSuccess = $TemplateObject->TemplateUpdate(
            TemplateID => $GetParam{TemplateID},
            Content    => $GetParam{TemplateContent},
            UserID     => $Self->{UserID},
        );

        if ($UpdateSuccess) {

            # redirect to template overview
            # load new URL in parent window and close popup
            return $LayoutObject->PopupClose(
                URL => "Action=AgentITSMTemplateOverview",
            );
        }
        else {

            # show error message
            return $LayoutObject->ErrorScreen(
                Message => $LayoutObject->{LanguageObject}
                    ->Translate( 'Was not able to update Template "%s"!', $GetParam{TemplateID} ),
                Comment => Translatable('Please contact the admin.'),
            );
        }
    }

    # check if CAB contains anyone
    if ( @{ $CABReference->{CABAdd}->{CABAgents} } || @{ $CABReference->{CABAdd}->{CABCustomers} } )
    {
        $LayoutObject->Block( Name => 'CABMemberTable' );
    }

    USERID:
    for my $UserID ( @{ $CABReference->{CABAdd}->{CABAgents} } ) {

        # get user data
        my %UserData = $Kernel::OM->Get('Kernel::System::User')->GetUserData(
            UserID => $UserID,
        );

        # next if no user data can be found
        next USERID if !%UserData;

        # display cab member info
        $LayoutObject->Block(
            Name => 'CABMemberRow',
            Data => {
                UserType         => 'Agent',
                InternalUserType => 'CABAgents',
                %UserData,
            },
        );
    }

    # show all customer members of CAB
    CUSTOMERLOGIN:
    for my $CustomerLogin ( @{ $CABReference->{CABAdd}->{CABCustomers} } ) {

        # get user data
        my %CustomerUserData = $Kernel::OM->Get('Kernel::System::CustomerUser')->CustomerUserDataGet(
            User  => $CustomerLogin,
            Valid => 1,
        );

        # next if no user data can be found
        next CUSTOMERLOGIN if !%CustomerUserData;

        # display cab member info
        $LayoutObject->Block(
            Name => 'CABMemberRow',
            Data => {
                UserType         => 'Customer',
                InternalUserType => 'CABCustomers',
                %CustomerUserData,
            },
        );
    }

    # serialize the CAB to be used as parameter in hidden field
    $GetParam{TemplateContent} = $Self->_CABSerialize(
        Content => $CABReference,
        UserID  => 1,
    );

    # search init
    $LayoutObject->Block(
        Name => 'CABMemberSearchInit',
        Data => {
            ItemID => 'NewCABMember',
        },
    );

    # output header and navigation
    my $Output = $LayoutObject->Header(
        Title => Translatable('Edit CAB Template'),
        Type  => 'Small',
    );

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMTemplateEditCAB',
        Data         => {
            %Param,
            %{$Template},
            %GetParam,
            %ServerError,
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer( Type => 'Small' );

    return $Output;
}

sub _IsMemberDeletion {
    my ( $Self, %Param ) = @_;

    # do not detect deletion when no subaction is given
    return if !$Self->{Subaction};

    # info about what to delete
    my %DeleteInfo;

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # check possible agent ids
    AGENTID:
    for my $AgentID ( @{ $Param{CABReference}->{CABAdd}->{CABAgents} } ) {
        if ( $ParamObject->GetParam( Param => 'DeleteCABAgents' . $AgentID ) ) {

            # save info
            %DeleteInfo = (
                Type => 'CABAgents',
                ID   => $AgentID,
            );

            last AGENTID;
        }
    }

    if ( !%DeleteInfo ) {

        # check possible customer ids
        CUSTOMERID:
        for my $CustomerID ( @{ $Param{CABReference}->{CABAdd}->{CABCustomers} } ) {
            if ( $ParamObject->GetParam( Param => 'DeleteCABCustomers' . $CustomerID ) ) {

                # save info
                %DeleteInfo = (
                    Type => 'CABCustomers',
                    ID   => $CustomerID,
                );

                last CUSTOMERID;
            }
        }
    }

    return %DeleteInfo;
}

sub _IsNewCABMemberOk {
    my ( $Self, %Param ) = @_;

    # The member info will be returned.
    my %MemberInfo;

    # CABCustomers or CABAgents?
    my $MemberType = $Param{NewCABMemberType};

    # member lookup
    my %CurrentMemberLookup;

    # an agent is requested to be added
    if ( $MemberType eq 'CABAgents' ) {

        # get user object
        my $UserObject = $Kernel::OM->Get('Kernel::System::User');

        my %User = $UserObject->GetUserData(
            UserID => $Param{NewCABMemberSelected},
        );

        if (%User) {

            # check current users
            USERID:
            for my $UserID ( @{ $Param{CABReference}->{CABAdd}->{$MemberType} } ) {

                # get user data
                my %UserData = $UserObject->GetUserData(
                    UserID => $UserID,
                    Valid  => 1,
                );

                # remove invalid users from CAB
                next USERID if !$UserData{UserID};

                # store in lookup
                $CurrentMemberLookup{$UserID} = 1;
            }

            # Compare input value with user data.
            # Look for exact match at beginning,
            # as $User{UserLastname} might contain a trailing 'out of office' note.
            # Note that this won't catch deletions of $Param{NewCABMember} at the end.
            my $CheckString = sprintf '"%s %s" <%s>',
                $User{UserFirstname},
                $User{UserLastname},
                $User{UserEmail};
            if ( index( $CheckString, $Param{NewCABMember} ) == 0 ) {

                $CurrentMemberLookup{ $User{UserID} } = 1;

                # save member infos
                %MemberInfo = (
                    $MemberType => [ sort keys %CurrentMemberLookup ],
                );
            }
        }
    }

    # an customer is requested to be added
    else {

        # get customer user object
        my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');

        # check current customer users
        CUSTOMERUSER:
        for my $CustomerUser ( @{ $Param{CABReference}->{CABAdd}->{$MemberType} } ) {

            # get customer user data
            my %CustomerUserData = $CustomerUserObject->CustomerUserDataGet(
                User  => $CustomerUser,
                Valid => 1,
            );

            # remove invalid customer users from CAB
            next CUSTOMERUSER if !%CustomerUserData;

            # store in lookup
            $CurrentMemberLookup{$CustomerUser} = 1;
        }

        # check if customer can be found
        my %CustomerUser = $CustomerUserObject->CustomerSearch(
            UserLogin => $Param{NewCABMemberSelected},
        );

        if ( $CustomerUser{ $Param{NewCABMemberSelected} } ) {

            $CurrentMemberLookup{ $Param{NewCABMemberSelected} } = 1;

            # save member infos
            %MemberInfo = (
                $MemberType => [ sort keys %CurrentMemberLookup ],
            );
        }
    }

    return %MemberInfo;
}

sub _CABDeSerialize {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID Content)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get the Perl datastructure
    my $VAR1;

    return if !eval "\$VAR1 = $Param{Content}; 1;";    ## no critic

    return if !$VAR1;
    return if ref $VAR1 ne 'HASH';

    return $VAR1;
}

sub _CABSerialize {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(UserID Content)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # no indentation (saves space)
    local $Data::Dumper::Indent = 0;

    # do not use cross-referencing
    local $Data::Dumper::Deepcopy = 1;

    # serialize the data (do not use $VAR1, but $TemplateData for Dumper output)
    my $SerializedData = $Kernel::OM->Get('Kernel::System::Main')->Dump( $Param{Content}, 'binary' );

    return $SerializedData;
}

1;
