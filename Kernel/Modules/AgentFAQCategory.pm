# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentFAQCategory;

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

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # permission check
    if ( !$Self->{AccessRw} ) {
        return $LayoutObject->NoPermission(
            Message    => Translatable('You need rw permission!'),
            WithHeader => 'yes',
        );
    }

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get parameters
    my %GetParam;
    for my $ParamName (qw(CategoryID Name ParentID Comment ValidID)) {
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }

    # set default category id
    $GetParam{CategoryID} ||= 0;

    # set default parent id
    $GetParam{ParentID} ||= 0;

    # get array parameters
    @{ $GetParam{PermissionGroups} } = $ParamObject->GetArray( Param => 'PermissionGroups' );

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # ------------------------------------------------------------ #
    # change
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'Change' ) {

        # check required parameters
        if ( !$GetParam{CategoryID} ) {
            $LayoutObject->FatalError(
                Message => Translatable('Need CategoryID!'),
            );
        }

        # get category data
        my %CategoryData = $FAQObject->CategoryGet(
            CategoryID => $GetParam{CategoryID},
            UserID     => $Self->{UserID},
        );

        # get permission groups
        $CategoryData{PermissionGroups} = $FAQObject->CategoryGroupGet(
            CategoryID => $GetParam{CategoryID},
            UserID     => $Self->{UserID},
        );

        # header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # HTML output
        $Self->_Edit(
            Action => 'Change',
            %CategoryData,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentFAQCategory',
            Data         => \%Param,
        );

        # footer
        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # change action
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'ChangeAction' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        # header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # check required parameters
        for my $ParamName (qw(ParentID ValidID)) {
            if ( !defined $GetParam{$ParamName} ) {

                return $LayoutObject->FatalError(
                    Message => $LayoutObject->{LanguageObject}->Translate( 'Need %s!', $ParamName ),
                );
            }
        }

        # check required parameters
        my %Error;
        for my $ParamName (qw(Name Comment PermissionGroups)) {

            # if required field is not given
            if ( !$GetParam{$ParamName} ) {

                # add server error error class
                $Error{ $ParamName . 'ServerError' } = 'ServerError';

                # add server error string for category name field
                if ( $ParamName eq 'Name' ) {
                    $Error{NameServerErrorMessage} = Translatable('A category should have a name!');
                }
            }
        }

        # send server error if any required parameter is missing
        if (%Error) {

            # HTML output
            $Self->_Edit(
                Action => 'Change',
                %GetParam,
                %Error,
            );
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AgentFAQCategory',
                Data         => \%Param,
            );

            # footer
            $Output .= $LayoutObject->Footer();

            return $Output;
        }

        # check for duplicate category name with the same parent category
        my $CategoryExistsAlready = $FAQObject->CategoryDuplicateCheck(
            CategoryID => $GetParam{CategoryID},
            Name       => $GetParam{Name},
            ParentID   => $GetParam{ParentID},
            UserID     => $Self->{UserID},
        );

        # show the edit screen again
        if ($CategoryExistsAlready) {

            # set server errors
            $GetParam{NameServerError}        = 'ServerError';
            $GetParam{NameServerErrorMessage} = Translatable('This category already exists');

            # HTML output
            $Self->_Edit(
                Action => 'Change',
                %GetParam,
            );
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AgentFAQCategory',
                Data         => \%Param,
            );

            # footer
            $Output .= $LayoutObject->Footer();

            return $Output;
        }

        # update category
        my $CategoryUpdateSuccessful = $FAQObject->CategoryUpdate(
            %GetParam,
            UserID => $Self->{UserID},
        );

        # check error
        if ( !$CategoryUpdateSuccessful ) {
            return $LayoutObject->ErrorScreen();
        }

        # set category group
        $FAQObject->SetCategoryGroup(
            CategoryID => $GetParam{CategoryID},
            GroupIDs   => $GetParam{PermissionGroups},
            UserID     => $Self->{UserID},
        );

        # show notification
        $Output .= $LayoutObject->Notify(
            Info => Translatable('FAQ category updated!'),
        );

        # show overview
        $Self->_Overview();
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentFAQCategory',
            Data         => \%Param,
        );

        # footer
        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # add
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Add' ) {

        # header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # HTML output
        $Self->_Edit(
            Action => 'Add',
            %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentFAQCategory',
            Data         => \%Param,
        );

        # footer
        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # add action
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AddAction' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        # header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # check required parameters
        for my $ParamName (qw(ParentID ValidID)) {
            if ( !defined $GetParam{$ParamName} ) {
                return $LayoutObject->FatalError(
                    Message => $LayoutObject->{LanguageObject}->Translate( 'Need %s!', $ParamName ),
                );
            }
        }

        # check required parameters
        my %Error;
        for my $ParamName (qw(Name Comment PermissionGroups)) {

            # if required field is not given
            if ( !$GetParam{$ParamName} ) {

                # add validation class and server error error class
                if ( $ParamName eq 'PermissionGroups' ) {
                    $Error{ $ParamName . 'ServerError' } = 'ServerError';
                }

                # add server error string for category name field
                if ( $ParamName eq 'Name' ) {
                    $Error{NameServerErrorMessage} = Translatable('A category should have a name!');
                }
            }
        }

        # send server error if any required parameters are missing
        if (%Error) {

            # HTML output
            $Self->_Edit(
                Action => 'Add',
                %GetParam,
                %Error,
            );
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AgentFAQCategory',
                Data         => \%Param,
            );

            # footer
            $Output .= $LayoutObject->Footer();

            return $Output;
        }

        # check for duplicate category name with the same parent category
        my $CategoryExistsAlready = $FAQObject->CategoryDuplicateCheck(
            CategoryID => $GetParam{CategoryID},
            Name       => $GetParam{Name},
            ParentID   => $GetParam{ParentID},
            UserID     => $Self->{UserID},
        );

        # show the edit screen again
        if ($CategoryExistsAlready) {

            # set server errors
            $GetParam{NameServerError}        = 'ServerError';
            $GetParam{NameServerErrorMessage} = Translatable('This category already exists!');

            # HTML output
            $Self->_Edit(
                Action => 'Add',
                %GetParam,
            );
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AgentFAQCategory',
                Data         => \%Param,
            );

            # footer
            $Output .= $LayoutObject->Footer();

            return $Output;
        }

        # add new category
        my $CategoryID = $FAQObject->CategoryAdd(
            %GetParam,
            UserID => $Self->{UserID},
        );

        # check error
        if ( !$CategoryID ) {
            return $LayoutObject->ErrorScreen();
        }

        # set category group
        $FAQObject->SetCategoryGroup(
            CategoryID => $CategoryID,
            GroupIDs   => $GetParam{PermissionGroups},
            UserID     => $Self->{UserID},
        );

        # show notification
        $Output .= $LayoutObject->Notify(
            Info => Translatable('FAQ category added!'),
        );

        # show overview
        $Self->_Overview();
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentFAQCategory',
            Data         => \%Param,
        );

        # footer
        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # delete
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Delete' ) {

        # get the CategoryID
        my $CategoryID = $ParamObject->GetParam( Param => 'CategoryID' ) || '';

        # check required parameters
        if ( !$CategoryID ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No CategoryID is given!'),
                Comment => Translatable('Please contact the administrator.'),
            );
        }

        # get category data
        my %CategoryData = $FAQObject->CategoryGet(
            CategoryID => $CategoryID,
            UserID     => $Self->{UserID},
        );

        if ( !%CategoryData ) {
            return $LayoutObject->ErrorScreen();
        }

        # get all affected FAQ articles
        my @AffectedItems = $FAQObject->FAQSearch(
            CategoryIDs => [$CategoryID],
            UserID      => 1,
        );

        # get all affected SubCcategories
        my $AffectedSubCategories = $FAQObject->CategorySubCategoryIDList(
            ParentID => $CategoryID,
            Mode     => 'Agent',
            UserID   => 1,
        );

        # call Delete block
        $LayoutObject->Block(
            Name => 'Delete',
            Data => {%CategoryData},
        );

        # set the dialog type. As default, the dialog will have 2 buttons: Yes and No
        my $DialogType = 'Confirmation';

        # display list of affected FAQ articles or SubCategories
        if ( @AffectedItems || @{$AffectedSubCategories} ) {

            # set the dialog type to have only 1 button: OK
            $DialogType = 'Message';

            $LayoutObject->Block(
                Name => 'Affected',
                Data => {},
            );

            # display Affected FAQ articles
            if (@AffectedItems) {

                $LayoutObject->Block(
                    Name => 'AffectedItems',
                    Data => {},
                );

                ITEMID:
                for my $ItemID (@AffectedItems) {

                    # get FAQ article
                    my %FAQData = $FAQObject->FAQGet(
                        ItemID     => $ItemID,
                        ItemFields => 0,
                        UserID     => $Self->{UserID},
                    );

                    # check FAQ article
                    next ITEMID if !%FAQData;

                    $LayoutObject->Block(
                        Name => 'AffectedItemsRow',
                        Data => {
                            %FAQData,
                            %Param,
                        },
                    );
                }
            }

            # display Affected Subcategories
            if ( @{$AffectedSubCategories} ) {

                # get categories long names
                my $CategoryLongNames = $FAQObject->GetUserCategoriesLongNames(
                    Type   => 'ro',
                    UserID => 1,
                );
                $LayoutObject->Block(
                    Name => 'AffectedSubCategories',
                    Data => {},
                );
                CATEGORYID:
                for my $CategoryID ( @{$AffectedSubCategories} ) {

                    # get category
                    my %CategoryData = $FAQObject->CategoryGet(
                        CategoryID => $CategoryID,
                        UserID     => $Self->{UserID},
                    );

                    # set category long name
                    $CategoryData{LongName} = $CategoryLongNames->{$CategoryID};

                    # check category
                    next CATEGORYID if !%CategoryData;

                    $LayoutObject->Block(
                        Name => 'AffectedSubCategoriesRow',
                        Data => {
                            %CategoryData,
                            %Param,
                        },
                    );
                }
            }

        }
        else {
            $LayoutObject->Block(
                Name => 'NoAffected',
                Data => {%CategoryData},
            );
        }

        # output content
        my $Output = $LayoutObject->Output(
            TemplateFile => 'AgentFAQCategory',
            Data         => {},
        );

        # build the returned data structure
        my %Data = (
            HTML       => $Output,
            DialogType => $DialogType,
        );

        # return JSON-String because of AJAX-Mode
        my $OutputJSON = $LayoutObject->JSONEncode( Data => \%Data );

        return $LayoutObject->Attachment(
            ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
            Content     => $OutputJSON,
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    # ------------------------------------------------------------ #
    # delete action
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'DeleteAction' ) {

        # get the CategoryID
        my $CategoryID = $ParamObject->GetParam( Param => 'CategoryID' ) || '';

        # check required parameters
        if ( !$CategoryID ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No CategoryID is given!'),
                Comment => Translatable('Please contact the administrator.'),
            );
        }

        # get category data
        my %CategoryData = $FAQObject->CategoryGet(
            CategoryID => $CategoryID,
            UserID     => $Self->{UserID},
        );

        if ( !%CategoryData ) {
            return $LayoutObject->ErrorScreen();
        }

        # delete the category
        my $CouldDeleteCategory = $FAQObject->CategoryDelete(
            CategoryID => $CategoryID,
            UserID     => $Self->{UserID},
        );

        if ($CouldDeleteCategory) {

            # redirect to explorer, when the deletion was successful
            return $LayoutObject->Redirect(
                OP => "Action=AgentFAQCategory",
            );
        }
        else {

            # show error message, when delete failed
            return $LayoutObject->ErrorScreen(
                Message => $LayoutObject->{LanguageObject}->Translate(
                    'Was not able to delete the category %s!',
                    $CategoryID,
                ),
                Comment => Translatable('Please contact the administrator.'),
            );
        }
    }

    # ---------------------------------------------------------- #
    # overview
    # ---------------------------------------------------------- #
    else {

        # header
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        # HTML output
        $Self->_Overview();
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentFAQCategory',
            Data         => {
                %Param,
                %GetParam,
            },
        );

        # footer
        $Output .= $LayoutObject->Footer();

        return $Output;
    }
}

sub _Edit {
    my ( $Self, %Param ) = @_;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # show overview
    $LayoutObject->Block(
        Name => 'Overview',
        Data => \%Param,
    );

    # output overview blocks
    $LayoutObject->Block(
        Name => 'ActionList',
        Data => {},
    );
    $LayoutObject->Block(
        Name => 'ActionOverview',
        Data => {},
    );

    # get the valid list
    my %ValidList        = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();
    my %ValidListReverse = reverse %ValidList;

    my %Data;

    # build the valid selection
    $Data{ValidOption} = $LayoutObject->BuildSelection(
        Data       => \%ValidList,
        Name       => 'ValidID',
        SelectedID => $Param{ValidID} || $ValidListReverse{valid},
        Class      => 'Modernize',
    );

    # get all valid groups
    my %Groups = $Kernel::OM->Get('Kernel::System::Group')->GroupList(
        Valid => 1,
    );

    # set no server error class as default
    $Param{PermissionGroupsServerError} ||= '';

    # build the group selection
    $Data{GroupOption} = $LayoutObject->BuildSelection(
        Data       => \%Groups,
        Name       => 'PermissionGroups',
        Multiple   => 1,
        Class      => 'Validate_Required Modernize ' . $Param{PermissionGroupsServerError},
        SelectedID => $Param{PermissionGroups},
    );

    # get all categories with their long names
    my $CategoryTree = $Kernel::OM->Get('Kernel::System::FAQ')->CategoryTreeList(
        Valid  => 0,
        UserID => $Self->{UserID},
    );

    # build the category selection
    $Data{CategoryOption} = $LayoutObject->BuildSelection(
        Data           => $CategoryTree,
        Name           => 'ParentID',
        SelectedID     => $Param{ParentID},
        PossibleNone   => 1,
        DisabledBranch => $CategoryTree->{ $Param{CategoryID} } || '',
        Translation    => 0,
        Class          => 'Modernize',
    );

    $LayoutObject->Block(
        Name => 'OverviewUpdate',
        Data => {
            %Param,
            %Data,
        },
    );

    # show header
    if ( $Param{Action} eq 'Change' ) {
        $LayoutObject->Block(
            Name => 'HeaderEdit',
            Data => {},
        );
    }
    else {
        $LayoutObject->Block(
            Name => 'HeaderAdd',
            Data => {},
        );
    }

    return 1;
}

sub _Overview {
    my ( $Self, %Param ) = @_;

    my $Output = '';

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # output overview blocks
    $LayoutObject->Block(
        Name => 'Overview',
        Data => {},
    );
    $LayoutObject->Block(
        Name => 'ActionList',
        Data => {},
    );
    $LayoutObject->Block(
        Name => 'ActionAdd',
        Data => {},
    );
    $LayoutObject->Block(
        Name => 'OverviewResult',
        Data => {},
    );

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # get all categories with their long names
    my $CategoryTree = $FAQObject->CategoryTreeList(
        Valid  => 0,
        UserID => $Self->{UserID},
    );

    # if there are any categories, they are shown
    if ( $CategoryTree && ref $CategoryTree eq 'HASH' && %{$CategoryTree} ) {

        # get the valid list
        my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList();

        # sort the category ids by the long category name
        my @CategoryIDsSorted = sort { $CategoryTree->{$a} cmp $CategoryTree->{$b} } keys %{$CategoryTree};

        # show all categories
        for my $CategoryID (@CategoryIDsSorted) {

            # get category data
            my %CategoryData = $FAQObject->CategoryGet(
                CategoryID => $CategoryID,
                UserID     => $Self->{UserID},
            );

            # get valid string based on ValidID
            $CategoryData{Valid} = $ValidList{ $CategoryData{ValidID} };

            # overwrite the name with the long name
            $CategoryData{Name} = $CategoryTree->{$CategoryID};

            # output the category data
            $LayoutObject->Block(
                Name => 'OverviewResultRow',
                Data => {%CategoryData},
            );
        }
    }

    # otherwise a no data found message is displayed
    else {
        $LayoutObject->Block(
            Name => 'NoDataFoundMsg',
        );
    }

    return 1;
}

1;
