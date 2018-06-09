# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeInvolvedPersons;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

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

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get needed ChangeID
    my $ChangeID = $ParamObject->GetParam( Param => 'ChangeID' );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    if ( !$ChangeID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No ChangeID is given!'),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get change object
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMChange::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $ChangeObject->Permission(
        Type     => $Self->{Config}->{Permission},
        Action   => $Self->{Action},
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'You need %s permissions!', $Self->{Config}->{Permission} ),
            WithHeader => 'yes',
        );
    }

    # get change data
    my $Change = $ChangeObject->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # check if change is found
    if ( !$Change ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}->Translate( 'Change "%s" not found in database!', $ChangeID ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # store all needed parameters in %GetParam to make it reloadable
    my %GetParam;
    for my $ParamName (
        qw(ChangeBuilder ChangeBuilderSelected ChangeManager ChangeManagerSelected
        NewCABMember NewCABMemberSelected NewCABMemberType CABTemplate AddCABMember
        AddCABTemplate TemplateID NewTemplate Submit)
        )
    {
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }

    # server error hash, to store the items with ServerError class
    my %ServerError;

    # Remember the reason why saving was not attempted.
    # The entries are the names of the dtl validation error blocks.
    my @ValidationErrors;

    # get needed objects
    my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template');
    my $UserObject     = $Kernel::OM->Get('Kernel::System::User');

    if ( $Self->{Subaction} eq 'Save' ) {

        # go to store the new template
        if ( $GetParam{NewTemplate} ) {
            return $LayoutObject->Redirect(
                OP => "Action=AgentITSMChangeCABTemplate;ChangeID=$ChangeID",
            );
        }

        # change manager and change builder are required for an update
        my %ErrorAllRequired = $Self->_CheckChangeManagerAndChangeBuilder(
            %GetParam,
        );

        # is cab member delete requested
        my %DeleteMember = $Self->_IsMemberDeletion(
            Change => $Change,
        );

        # update change
        if ( $GetParam{AddCABMember} && $GetParam{NewCABMember} ) {

            # add a member
            my %CABUpdateInfo = $Self->_IsNewCABMemberOk(
                %GetParam,
                Change => $Change,
            );

            # if member is valid
            if (%CABUpdateInfo) {

                # update change CAB
                my $CouldUpdateCAB = $ChangeObject->ChangeCABUpdate(
                    %CABUpdateInfo,
                    ChangeID => $Change->{ChangeID},
                    UserID   => $Self->{UserID},
                );

                # if update was successful
                if ($CouldUpdateCAB) {

                    # get new change data as a member was added
                    $Change = $ChangeObject->ChangeGet(
                        ChangeID => $Change->{ChangeID},
                        UserID   => $Self->{UserID},
                    );

                    # do not display a name in autocomplete field
                    # and do not set values in hidden fields as the
                    # user was already added
                    delete @GetParam{qw(NewCABMember NewCABMemberSelected NewCABMemberType)};
                }
                else {

                    # show error message
                    return $LayoutObject->ErrorScreen(
                        Message => $LayoutObject->{LanguageObject}->Translate(
                            'Was not able to update Change CAB for Change %s!', $ChangeID
                        ),
                        Comment => Translatable('Please contact the admin.'),
                    );
                }
            }

            # if member is invalid
            else {
                $ServerError{NewCABMemberError} = 'ServerError';
            }
        }
        elsif ( $GetParam{AddCABTemplate} ) {

            if ( $GetParam{TemplateID} ) {

                # create CAB based on the template
                my $CreatedID = $TemplateObject->TemplateDeSerialize(
                    TemplateID => $GetParam{TemplateID},
                    UserID     => $Self->{UserID},
                    ChangeID   => $ChangeID,
                );

                # redirect to involved person, when adding was successful
                return $LayoutObject->Redirect(
                    OP => "Action=AgentITSMChangeInvolvedPersons;ChangeID=$ChangeID",
                );
            }

            # notify about the missing template id
            $ServerError{TemplateIDError} = 'ServerError';
        }
        elsif (%DeleteMember) {

            # find users who are still member of CAB
            my $Type = $DeleteMember{Type};
            my @StillMembers = grep { $_ ne $DeleteMember{ID} } @{ $Change->{$Type} };

            # update ChangeCAB
            my $CouldUpdateCABMember = $ChangeObject->ChangeCABUpdate(
                ChangeID => $Change->{ChangeID},
                $Type    => \@StillMembers,
                UserID   => $Self->{UserID},
            );

            # check successful update
            if ( !$CouldUpdateCABMember ) {

                # show error message
                return $LayoutObject->ErrorScreen(
                    Message => $LayoutObject->{LanguageObject}->Translate(
                        'Was not able to update Change CAB for Change %s!', $ChangeID
                    ),
                    Comment => Translatable('Please contact the admin.'),
                );
            }

            # get new change data as a member was removed
            $Change = $ChangeObject->ChangeGet(
                ChangeID => $Change->{ChangeID},
                UserID   => $Self->{UserID},
            );
        }

        # just update change when submit button clicked
        elsif ( !%ErrorAllRequired && $GetParam{Submit} ) {

            # update change
            my $CanUpdateChange = $ChangeObject->ChangeUpdate(
                ChangeID        => $ChangeID,
                ChangeManagerID => $GetParam{ChangeManagerSelected},
                ChangeBuilderID => $GetParam{ChangeBuilderSelected},
                UserID          => $Self->{UserID},
            );

            # check successful update
            if ($CanUpdateChange) {

                # redirect to change zoom mask
                # load new URL in parent window and close popup
                return $LayoutObject->PopupClose(
                    URL => "Action=AgentITSMChangeZoom;ChangeID=$ChangeID",
                );
            }
            else {

                # show error message
                return $LayoutObject->ErrorScreen(
                    Message =>
                        $LayoutObject->{LanguageObject}->Translate( 'Was not able to update Change %s!', $ChangeID ),
                    Comment => Translatable('Please contact the admin.'),
                );
            }
        }

        # show field errors just when submit
        elsif ( %ErrorAllRequired && $GetParam{Submit} ) {

            # show error message for change builder
            if ( $ErrorAllRequired{ChangeBuilder} ) {
                $ServerError{ChangeBuilderError} = 'ServerError';
            }

            # show error message for change manager
            if ( $ErrorAllRequired{ChangeManager} ) {
                $ServerError{ChangeManagerError} = 'ServerError';
            }
        }

        # use the selected change and builder managers
        if ( $GetParam{ChangeManagerSelected} ) {
            $Change->{ChangeManagerID} = $GetParam{ChangeManagerSelected};
        }

        if ( $GetParam{ChangeBuilderSelected} ) {
            $Change->{ChangeBuilderID} = $GetParam{ChangeBuilderSelected};
        }
    }

    # set default values if it is not 'Save' subaction
    else {

        # initialize variables
        my $ChangeManager = '';
        my $ChangeBuilder = '';

        # get changemanager string
        if ( $Change->{ChangeManagerID} ) {

            # get changemanager data
            my %ChangeManagerData = $UserObject->GetUserData(
                UserID => $Change->{ChangeManagerID},
            );

            if (%ChangeManagerData) {

                # build string to display
                $ChangeManager = sprintf '"%s %s" <%s>',
                    $ChangeManagerData{UserFirstname},
                    $ChangeManagerData{UserLastname},
                    $ChangeManagerData{UserEmail};
            }
        }

        # get changebuilder string
        if ( $Change->{ChangeBuilderID} ) {

            # get changebuilder data
            my %ChangeBuilderData = $UserObject->GetUserData(
                UserID => $Change->{ChangeBuilderID},
            );

            if (%ChangeBuilderData) {

                # build string to display
                $ChangeBuilder = sprintf '"%s %s" <%s>',
                    $ChangeBuilderData{UserFirstname},
                    $ChangeBuilderData{UserLastname},
                    $ChangeBuilderData{UserEmail};
            }
        }

        # fill GetParam hash
        %GetParam = (
            ChangeManager   => $ChangeManager,
            ChangeManagerID => $Change->{ChangeManagerID},
            ChangeBuilder   => $ChangeBuilder,
            ChangeBuilderID => $Change->{ChangeBuilderID},
        );
    }

    # show all agent members of CAB
    if ( @{ $Change->{CABAgents} } || @{ $Change->{CABCustomers} } ) {
        $LayoutObject->Block( Name => 'CABMemberTable' );
    }

    USERID:
    for my $UserID ( @{ $Change->{CABAgents} } ) {

        # get user data
        my %UserData = $UserObject->GetUserData(
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

    # get customer user object
    my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');

    # show all customer members of CAB
    CUSTOMERLOGIN:
    for my $CustomerLogin ( @{ $Change->{CABCustomers} } ) {

        # get user data
        my %CustomerUserData = $CustomerUserObject->CustomerUserDataGet(
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

    # code and return blocks for change builder and change manager (AgentITSMUserSearch.dtl)
    for my $ItemID (qw(ChangeManager ChangeBuilder)) {
        $LayoutObject->Block(
            Name => 'UserSearchInit',
            Data => {
                ItemID => $ItemID,
            },
        );

    }

    # show validation errors in CABTemplate block
    my %ValidationErrorNames;
    my $TemplateError = '';

    $ValidationErrorNames{@ValidationErrors} = (1) x @ValidationErrors;

    for my $ChangeTemplateValidationError (qw(InvalidTemplate)) {
        if ( $ValidationErrorNames{$ChangeTemplateValidationError} ) {
            $ServerError{TemplateIDError} = 'ServerError';
        }
    }

    # build template dropdown
    my $TemplateList = $TemplateObject->TemplateList(
        UserID        => $Self->{UserID},
        CommentLength => 15,
        TemplateType  => 'CAB',
    );

    my $TemplateDropDown = $LayoutObject->BuildSelection(
        Name         => 'TemplateID',
        Data         => $TemplateList,
        PossibleNone => 1,
        Class        => 'Modernize',
    );

    # show block with template dropdown
    $LayoutObject->Block(
        Name => 'CABTemplate',
        Data => {
            CABTemplateStrg => $TemplateDropDown,
        },
    );

    # if CAB Members show New Template Button
    if ( @{ $Change->{CABAgents} } || @{ $Change->{CABCustomers} } ) {
        $LayoutObject->Block( Name => 'NewTemplateButton' );
    }

    # search init
    $LayoutObject->Block(
        Name => 'CABMemberSearchInit',
        Data => {
            ItemID => 'NewCABMember',
        },
    );

    # output header and navigation
    my $Output = $LayoutObject->Header(
        Title => Translatable('Involved Persons'),
        Type  => 'Small',
    );

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMChangeInvolvedPersons',
        Data         => {
            %Param,
            %{$Change},
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

    # check needed stuff
    return if !$Param{Change};

    # info about what to delete
    my %DeleteInfo;

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # check possible agent ids
    AGENTID:
    for my $AgentID ( @{ $Param{Change}->{CABAgents} } ) {
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
        for my $CustomerID ( @{ $Param{Change}->{CABCustomers} } ) {
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

sub _CheckChangeManagerAndChangeBuilder {
    my ( $Self, %Param ) = @_;

    # The hash with the error info will be returned.
    my %Errors;

    ROLE:
    for my $Role (qw(ChangeBuilder ChangeManager)) {

        # check the role
        if ( !$Param{$Role} || !$Param{ $Role . 'Selected' } ) {
            $Errors{$Role} = 1;
            next ROLE;
        }

        # get user data
        my %User = $Kernel::OM->Get('Kernel::System::User')->GetUserData(
            UserID => $Param{ $Role . 'Selected' },
        );

        # show error if user does not exist
        if ( !%User ) {
            $Errors{$Role} = 1;
            next ROLE;
        }

        # Check whether the input has been manually edited.
        # Look for exact match at beginning,
        # as $User{UserLastname} might contain a trailing 'out of office' note.
        # Note that this won't catch deletions of $Param{$Role} at the end.
        my $CheckString = sprintf '"%s %s" <%s>',
            $User{UserFirstname},
            $User{UserLastname},
            $User{UserEmail};
        if ( index( $CheckString, $Param{$Role} ) != 0 ) {
            $Errors{$Role} = 1;
        }
    }

    return %Errors
}

sub _IsNewCABMemberOk {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    return if !$Param{Change};

    # The member info will be returned.
    my %MemberInfo;

    # CABCustomers or CABAgents?
    my $MemberType = $Param{NewCABMemberType};

    # current members
    my @CurrentMembers;

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
            for my $UserID ( @{ $Param{Change}->{$MemberType} } ) {

                # get user data
                my %UserData = $UserObject->GetUserData(
                    UserID => $UserID,
                    Valid  => 1,
                );

                # remove invalid users from CAB
                next USERID if !$UserData{UserID};

                push @CurrentMembers, $UserID;
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

                # save member infos
                %MemberInfo = (
                    $MemberType => [ @CurrentMembers, $User{UserID} ],
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
        for my $CustomerUser ( @{ $Param{Change}->{$MemberType} } ) {

            # get customer user data
            my %CustomerUserData = $CustomerUserObject->CustomerUserDataGet(
                User  => $CustomerUser,
                Valid => 1,
            );

            # remove invalid customer users from CAB
            next CUSTOMERUSER if !%CustomerUserData;

            push @CurrentMembers, $CustomerUser;
        }

        # check if customer can be found
        my %CustomerUser = $CustomerUserObject->CustomerSearch(
            UserLogin => $Param{NewCABMemberSelected},
        );

        if ( $CustomerUser{ $Param{NewCABMemberSelected} } ) {

            # save member infos
            %MemberInfo = (
                $MemberType => [ @CurrentMembers, $Param{NewCABMemberSelected} ],
            );
        }
    }

    return %MemberInfo;
}

1;
