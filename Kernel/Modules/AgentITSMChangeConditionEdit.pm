# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeConditionEdit;

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

    # store needed parameters in %GetParam
    my %GetParam;
    for my $ParamName (
        qw(
        ChangeID ConditionID Name Comment ExpressionConjunction ValidID DeleteExpressionID DeleteActionID
        Save AddAction AddExpression NewExpression NewAction ElementChanged UpdateDivName)
        )
    {
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    for my $Needed (qw(ChangeID ConditionID)) {
        if ( !$GetParam{$Needed} ) {
            $LayoutObject->ErrorScreen(
                Message => $LayoutObject->{LanguageObject}->Translate( 'No %s is given!', $Needed ),
                Comment => Translatable('Please contact the admin.'),
            );
            return;
        }
    }

    # get change object
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMChange::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $ChangeObject->Permission(
        Type     => $Self->{Config}->{Permission},
        Action   => $Self->{Action},
        ChangeID => $GetParam{ChangeID},
        UserID   => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message => $LayoutObject->{LanguageObject}->Translate(
                'You need %s permissions!', $Self->{Config}->{Permission}
            ),
            WithHeader => 'yes',
        );
    }

    # get change data
    my $ChangeData = $ChangeObject->ChangeGet(
        ChangeID => $GetParam{ChangeID},
        UserID   => $Self->{UserID},
    );

    # check if change exists
    if ( !$ChangeData ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'Change "%s" not found in database!', $GetParam{ChangeID} ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get valid object
    my $ValidObject = $Kernel::OM->Get('Kernel::System::Valid');

    # get valid list
    my %ValidList = $ValidObject->ValidList();

    my $ExpressionIDsRef = [];
    my $ActionIDsRef     = [];

    # get condition object
    my $ConditionObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition');

    # only get expression list and action list if condition exists already
    if ( $GetParam{ConditionID} ne 'NEW' ) {

        # get all expression ids for the given condition id
        $ExpressionIDsRef = $ConditionObject->ExpressionList(
            ConditionID => $GetParam{ConditionID},
            UserID      => $Self->{UserID},
        );

        # get all action ids for the given condition id
        $ActionIDsRef = $ConditionObject->ActionList(
            ConditionID => $GetParam{ConditionID},
            UserID      => $Self->{UserID},
        );
    }

    # Remember the reason why saving was not attempted.
    # These entries are the names of the dtl validation error blocks.
    my @ValidationErrors;

    # ---------------------------------------------------------------- #
    # condition save (also add/delete expression and add/delete action)
    # ---------------------------------------------------------------- #
    if ( $Self->{Subaction} eq 'Save' ) {

        # update only if ConditionName is given
        if ( !$GetParam{Name} ) {
            $Param{InvalidName} = 'ServerError';
            push @ValidationErrors, 'InvalidName';
        }

        # check if condition name is already used
        else {

            # check if condition name exists already for this change
            my $ConditionID = $ConditionObject->ConditionLookup(
                Name     => $GetParam{Name},
                ChangeID => $GetParam{ChangeID},
            );

            # it is only an error if another condition of this change uses this name
            # changing the name of a condition is still possible
            if ( $ConditionID && ( $GetParam{ConditionID} ne $ConditionID ) ) {
                $Param{DuplicateName} = 'ServerError';
                push @ValidationErrors, 'DuplicateName';
            }
        }

        # if all passed data is valid
        if ( !@ValidationErrors ) {

            # add a new condition
            if ( $GetParam{ConditionID} eq 'NEW' ) {

                # create a new condition
                $GetParam{ConditionID} = $ConditionObject->ConditionAdd(
                    ChangeID              => $GetParam{ChangeID},
                    Name                  => $GetParam{Name},
                    ExpressionConjunction => $GetParam{ExpressionConjunction},
                    Comment               => $GetParam{Comment},
                    ValidID               => $GetParam{ValidID},
                    UserID                => $Self->{UserID},
                );

                # check error
                if ( !$GetParam{ConditionID} ) {
                    $LayoutObject->ErrorScreen(
                        Message => Translatable('Could not create new condition!'),
                        Comment => Translatable('Please contact the admin.'),
                    );
                    return;
                }
            }

            # update an existing condition
            else {

                # update the condition
                my $Success = $ConditionObject->ConditionUpdate(
                    ConditionID           => $GetParam{ConditionID},
                    Name                  => $GetParam{Name},
                    ExpressionConjunction => $GetParam{ExpressionConjunction},
                    Comment               => $GetParam{Comment},
                    ValidID               => $GetParam{ValidID},
                    UserID                => $Self->{UserID},
                );

                # check error
                if ( !$Success ) {
                    $LayoutObject->ErrorScreen(
                        Message => $LayoutObject->{LanguageObject}->Translate(
                            'Could not update ConditionID %s!', $GetParam{ConditionID}
                        ),
                        Comment => Translatable('Please contact the admin.'),
                    );
                    return;
                }
            }

            # save all existing expression fields
            for my $ExpressionID ( @{$ExpressionIDsRef} ) {

                # get expression fields
                my %ExpressionData;
                for my $Field (qw(ObjectID Selector AttributeID OperatorID CompareValue)) {
                    $ExpressionData{$Field} = $ParamObject->GetParam(
                        Param => 'ExpressionID-' . $ExpressionID . '-' . $Field,
                    );
                }

                # check if existing expression is complete
                # (all required fields must be filled, CompareValue can be empty)
                my $FieldsOk = 1;
                FIELD:
                for my $Field (qw(ObjectID Selector AttributeID OperatorID)) {

                    # new expression is not complete
                    if ( !$ExpressionData{$Field} ) {
                        $FieldsOk = 0;
                        last FIELD;
                    }
                }

                # update existing expression only if all fields are complete
                if ($FieldsOk) {

                    # update the expression
                    my $Success = $ConditionObject->ExpressionUpdate(
                        ExpressionID => $ExpressionID,
                        ObjectID     => $ExpressionData{ObjectID},
                        AttributeID  => $ExpressionData{AttributeID},
                        OperatorID   => $ExpressionData{OperatorID},
                        Selector     => $ExpressionData{Selector},
                        CompareValue => defined $ExpressionData{CompareValue}
                        ? $ExpressionData{CompareValue}
                        : '',
                        UserID => $Self->{UserID},
                    );

                    # check error
                    if ( !$Success ) {
                        return $LayoutObject->ErrorScreen(
                            Message => $LayoutObject->{LanguageObject}->Translate(
                                'Could not update ExpressionID %s!', $ExpressionID
                            ),
                            Comment => Translatable('Please contact the admin.'),
                        );
                    }
                }
            }

            # get new expression fields
            my %ExpressionData;
            for my $Field (qw(ObjectID Selector AttributeID OperatorID CompareValue)) {
                $ExpressionData{$Field} = $ParamObject->GetParam(
                    Param => 'ExpressionID-NEW-' . $Field,
                );
            }

            # check if new expression is complete
            # (all required fields must be filled, CompareValue can be empty)
            my $FieldsOk = 1;
            FIELD:
            for my $Field (qw(ObjectID Selector AttributeID OperatorID)) {

                # new expression is not complete
                if ( !$ExpressionData{$Field} ) {
                    $FieldsOk = 0;
                    last FIELD;
                }
            }

            # add new expression
            if ($FieldsOk) {

                # add new expression
                my $ExpressionID = $ConditionObject->ExpressionAdd(
                    ConditionID  => $GetParam{ConditionID},
                    ObjectID     => $ExpressionData{ObjectID},
                    AttributeID  => $ExpressionData{AttributeID},
                    OperatorID   => $ExpressionData{OperatorID},
                    Selector     => $ExpressionData{Selector},
                    CompareValue => defined $ExpressionData{CompareValue}
                    ? $ExpressionData{CompareValue}
                    : '',
                    UserID => $Self->{UserID},
                );

                # check error
                if ( !$ExpressionID ) {
                    return $LayoutObject->ErrorScreen(
                        Message => Translatable('Could not add new Expression!'),
                        Comment => Translatable('Please contact the admin.'),
                    );
                }
            }

            # save all existing action fields
            for my $ActionID ( @{$ActionIDsRef} ) {

                # get action fields
                my %ActionData;
                for my $Field (qw(ObjectID Selector AttributeID OperatorID ActionValue)) {
                    $ActionData{$Field} = $ParamObject->GetParam(
                        Param => 'ActionID-' . $ActionID . '-' . $Field,
                    );
                }

                # check if existing action is complete
                # (all required fields must be filled, ActionValue can be empty)
                my $FieldsOk = 1;
                FIELD:
                for my $Field (qw(ObjectID Selector AttributeID OperatorID)) {

                    # new action is not complete
                    if ( !$ActionData{$Field} ) {
                        $FieldsOk = 0;
                        last FIELD;
                    }
                }

                # update existing action only if all fields are complete
                if ($FieldsOk) {

                    # update the action
                    my $Success = $ConditionObject->ActionUpdate(
                        ActionID    => $ActionID,
                        ObjectID    => $ActionData{ObjectID},
                        AttributeID => $ActionData{AttributeID},
                        OperatorID  => $ActionData{OperatorID},
                        Selector    => $ActionData{Selector},
                        ActionValue => $ActionData{ActionValue} || '',
                        UserID      => $Self->{UserID},
                    );

                    # check error
                    if ( !$Success ) {
                        return $LayoutObject->ErrorScreen(
                            Message => $LayoutObject->{LanguageObject}
                                ->Translate( 'Could not update ActionID %s!', $ActionID ),
                            Comment => Translatable('Please contact the admin.'),
                        );
                    }
                }
            }

            # get new action fields
            my %ActionData;
            for my $Field (qw(ObjectID Selector AttributeID OperatorID ActionValue)) {
                $ActionData{$Field} = $ParamObject->GetParam(
                    Param => 'ActionID-NEW-' . $Field,
                );
            }

            # check if new action is complete
            # (all required fields must be filled, ActionValue can be empty)
            $FieldsOk = 1;
            FIELD:
            for my $Field (qw(ObjectID Selector AttributeID OperatorID)) {

                # new action is not complete
                if ( !$ActionData{$Field} ) {
                    $FieldsOk = 0;
                    last FIELD;
                }
            }

            # add new action
            if ($FieldsOk) {

                # add new action
                my $ActionID = $ConditionObject->ActionAdd(
                    ConditionID => $GetParam{ConditionID},
                    ObjectID    => $ActionData{ObjectID},
                    AttributeID => $ActionData{AttributeID},
                    OperatorID  => $ActionData{OperatorID},
                    Selector    => $ActionData{Selector},
                    ActionValue => $ActionData{ActionValue} || '',
                    UserID      => $Self->{UserID},
                );

                # check error
                if ( !$ActionID ) {
                    return $LayoutObject->ErrorScreen(
                        Message => Translatable('Could not add new Action!'),
                        Comment => Translatable('Please contact the admin.'),
                    );
                }
            }

            # just the save button was pressed, redirect to condition overview
            if ( $GetParam{Save} ) {
                return $LayoutObject->Redirect(
                    OP => "Action=AgentITSMChangeCondition;ChangeID=$GetParam{ChangeID}",
                );
            }

            # expression add button was pressed
            elsif ( $GetParam{AddExpression} ) {

                # show the edit view again, but now with a new empty expression line
                return $LayoutObject->Redirect(
                    OP => "Action=AgentITSMChangeConditionEdit;ChangeID=$GetParam{ChangeID};"
                        . "ConditionID=$GetParam{ConditionID};NewExpression=1",
                );
            }

            # action add button was pressed
            elsif ( $GetParam{AddAction} ) {

                # show the edit view again, but now with a new empty action line
                return $LayoutObject->Redirect(
                    OP => "Action=AgentITSMChangeConditionEdit;ChangeID=$GetParam{ChangeID};"
                        . "ConditionID=$GetParam{ConditionID};NewAction=1",
                );
            }

            # check if an expression should be deleted
            if ( $GetParam{DeleteExpressionID} && $GetParam{DeleteExpressionID} ne 'NEW' ) {

                # delete the expression
                my $Success = $ConditionObject->ExpressionDelete(
                    ExpressionID => $GetParam{DeleteExpressionID},
                    UserID       => $Self->{UserID},
                );

                # check error
                if ( !$Success ) {
                    return $LayoutObject->ErrorScreen(
                        Message => $LayoutObject->{LanguageObject}->Translate(
                            'Could not delete ExpressionID %s!', $GetParam{DeleteExpressionID}
                        ),
                        Comment => Translatable('Please contact the admin.'),
                    );
                }

                # show the edit view again
                return $LayoutObject->Redirect(
                    OP => "Action=AgentITSMChangeConditionEdit;ChangeID=$GetParam{ChangeID};"
                        . "ConditionID=$GetParam{ConditionID}",
                );
            }

            # check if an action should be deleted
            if ( $GetParam{DeleteActionID} && $GetParam{DeleteActionID} ne 'NEW' ) {

                # delete the action
                my $Success = $ConditionObject->ActionDelete(
                    ActionID => $GetParam{DeleteActionID},
                    UserID   => $Self->{UserID},
                );

                # check error
                if ( !$Success ) {
                    return $LayoutObject->ErrorScreen(
                        Message => $LayoutObject->{LanguageObject}->Translate(
                            'Could not delete ActionID %s!', $GetParam{DeleteActionID}
                        ),
                        Comment => Translatable('Please contact the admin.'),
                    );
                }

                # show the edit view again
                return $LayoutObject->Redirect(
                    OP => "Action=AgentITSMChangeConditionEdit;ChangeID=$GetParam{ChangeID};"
                        . "ConditionID=$GetParam{ConditionID}",
                );
            }

            # show the edit view again
            return $LayoutObject->Redirect(
                OP => "Action=AgentITSMChangeConditionEdit;ChangeID=$GetParam{ChangeID};"
                    . "ConditionID=$GetParam{ConditionID}",
            );
        }
    }

    # ------------------------------------------------------------ #
    # handle AJAXUpdate (change the content of dropdownlists)
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AJAXUpdate' ) {

        # to store the JSON output
        my $JSON;

        # expression or action field was changed
        if ( $GetParam{ElementChanged} =~ m{ \A ( ExpressionID | ActionID ) - ( \d+ | NEW ) }xms )
        {

            # get id name of the involved element ( 'ExpressionID' or 'ActionID' )
            my $IDName = $1;

            # get id of the involved element
            my $ID = $2;

            # get value field name
            my $ValueFieldName;
            if ( $IDName eq 'ExpressionID' ) {
                $ValueFieldName = 'CompareValue';
            }
            elsif ( $IDName eq 'ActionID' ) {
                $ValueFieldName = 'ActionValue';
            }

            # get expression or action fields
            for my $Field (qw(ObjectID Selector AttributeID OperatorID CompareValue ActionValue)) {
                $GetParam{$Field} = $ParamObject->GetParam(
                    Param => $IDName . '-' . $ID . '-' . $Field,
                );
            }

            # get object selection list
            my $ObjectList = $Self->_GetObjectSelection();

            # get selector selection list
            my $SelectorList = $Self->_GetSelectorSelection(
                ObjectID    => $GetParam{ObjectID},
                ConditionID => $GetParam{ConditionID},
                $IDName     => $ID,
            );

            # get attribute selection list
            my $AttributeList = $Self->_GetAttributeSelection(
                ObjectID => $GetParam{ObjectID},
                Selector => $GetParam{Selector},
                $IDName  => $ID,
            );

            # get operator selection list
            my $OperatorList = $Self->_GetOperatorSelection(
                ObjectID    => $GetParam{ObjectID},
                AttributeID => $GetParam{AttributeID},
                $IDName     => $ID,
            );

            # add an empty selector selection if no list is available or nothing is selected
            my $PossibleNoneSelector = 0;
            if (
                !$SelectorList
                || !ref $SelectorList eq 'HASH'
                || !%{$SelectorList}
                || $GetParam{ElementChanged} eq $IDName . '-' . $ID . '-ObjectID'
                )
            {
                $PossibleNoneSelector = 1;
            }

            # add an empty attribute selection if no list is available or nothing is selected
            my $PossibleNoneAttributeID = 0;
            if (
                !$AttributeList
                || !ref $AttributeList eq 'HASH'
                || !%{$AttributeList}
                || $GetParam{ElementChanged} eq $IDName . '-' . $ID . '-ObjectID'
                || $GetParam{ElementChanged} eq $IDName . '-' . $ID . '-Selector'
                )
            {
                $PossibleNoneAttributeID = 1;
            }

            # add an empty operator selection if no list is available or nothing is selected
            my $PossibleNoneOperatorID = 0;
            if (
                !$OperatorList
                || !ref $OperatorList eq 'HASH'
                || !%{$OperatorList}
                || $GetParam{ElementChanged} eq $IDName . '-' . $ID . '-ObjectID'
                || $GetParam{ElementChanged} eq $IDName . '-' . $ID . '-Selector'
                || $GetParam{ElementChanged} eq $IDName . '-' . $ID . '-AttributeID'
                )
            {
                $PossibleNoneOperatorID = 1;
            }

            # if object was changed, reset the attribute and operator list
            if ( $GetParam{ElementChanged} eq $IDName . '-' . $ID . '-ObjectID' ) {
                $AttributeList = {};
                $OperatorList  = {};
            }

            # build json
            $JSON = $LayoutObject->BuildSelectionJSON(
                [
                    {
                        Name         => $IDName . '-' . $ID . '-ObjectID',
                        Data         => $ObjectList,
                        SelectedID   => $GetParam{ObjectID},
                        PossibleNone => 0,
                        Translation  => 1,
                        Max          => 100,
                    },
                    {
                        Name         => $IDName . '-' . $ID . '-Selector',
                        Data         => $SelectorList,
                        SelectedID   => $PossibleNoneSelector ? '' : $GetParam{Selector},
                        PossibleNone => $PossibleNoneSelector,
                        Translation  => 1,
                        Max          => 100,
                    },
                    {
                        Name         => $IDName . '-' . $ID . '-AttributeID',
                        Data         => $AttributeList,
                        SelectedID   => $GetParam{AttributeID} || '',
                        PossibleNone => $PossibleNoneAttributeID,
                        Translation  => 1,
                        Max          => 100,
                    },
                    {
                        Name         => $IDName . '-' . $ID . '-OperatorID',
                        Data         => $OperatorList,
                        SelectedID   => $GetParam{OperatorID} || '',
                        PossibleNone => $PossibleNoneOperatorID,
                        Translation  => 1,
                        Max          => 100,
                    },
                ],
            );
        }

        # return json
        return $LayoutObject->Attachment(
            ContentType => 'text/plain; charset=' . $LayoutObject->{Charset},
            Content     => $JSON,
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    # ------------------------------------------------------------------------------------- #
    # handle AJAXUpdate (replace the field type, e.g. replace a text field with a selection
    # ------------------------------------------------------------------------------------- #
    elsif ( $Self->{Subaction} eq 'AJAXContentUpdate' ) {

        # to store the HTML string which is returned to the browser
        my $HTMLString;

        # expression or action field was changed
        if ( $GetParam{ElementChanged} =~ m{ \A ( ExpressionID | ActionID ) \- ( \d+ | NEW ) }xms )
        {

            # get id name of the involved element ( 'ExpressionID' or 'ActionID' )
            my $IDName = $1;

            # get id of the involved element
            my $ID = $2;

            # get value field name
            my $ValueFieldName;
            if ( $IDName eq 'ExpressionID' ) {
                $ValueFieldName = 'CompareValue';
            }
            elsif ( $IDName eq 'ActionID' ) {
                $ValueFieldName = 'ActionValue';
            }

            # get expression or action fields
            for my $Field (qw(ObjectID Selector AttributeID OperatorID CompareValue ActionValue)) {
                $GetParam{$Field} = $ParamObject->GetParam(
                    Param => $IDName . '-' . $ID . '-' . $Field,
                );
            }

            # get compare value field type
            my $FieldType = $Self->_GetCompareValueFieldType(%GetParam);

            # build CompareValue selection
            if ( $FieldType eq 'Selection' ) {

                # get compare value selection list
                my $CompareValueList = $Self->_GetCompareValueSelection(%GetParam);

                # add an empty selection if no list is available or nothing is selected
                my $PossibleNone = 0;
                if (
                    $Param{PossibleNone}
                    || !$Param{$ValueFieldName}
                    || !$CompareValueList
                    || ( ref $CompareValueList eq 'HASH'  && !%{$CompareValueList} )
                    || ( ref $CompareValueList eq 'ARRAY' && !@{$CompareValueList} )
                    )
                {
                    $PossibleNone = 1;
                }

                # generate ValueOptionString
                $HTMLString = $LayoutObject->BuildSelection(
                    Data         => $CompareValueList,
                    Name         => $IDName . '-' . $ID . '-' . $ValueFieldName,
                    SelectedID   => $GetParam{$ValueFieldName},
                    PossibleNone => $PossibleNone,
                    Translation  => 1,
                );
            }

            # build text input field
            elsif ( $FieldType eq 'Text' ) {

                # build an empty input field
                $HTMLString = ''
                    . '<input type="text" '
                    . 'id="' . $IDName . '-' . $ID . '-' . $ValueFieldName . '" '
                    . 'name="' . $IDName . '-' . $ID . '-' . $ValueFieldName . '" '
                    . 'value="" clas="W75pc" maxlength="250" />';
            }

            # show error for unknown field type
            else {
                $HTMLString = '<span><b>'
                    . $LayoutObject->{LanguageObject}->Translate( 'Error: Unknown field type "%s"!', $FieldType )
                    . '</b></span>';
            }
        }

        # return HTML
        return $LayoutObject->Attachment(
            ContentType => 'text/html',
            Charset     => $LayoutObject->{UserCharset},
            Content     => $HTMLString,
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    # ------------------------------------------------------------ #
    # condition edit view
    # ------------------------------------------------------------ #

    my %ConditionData;

    # get ConditionID
    $ConditionData{ConditionID} = $GetParam{ConditionID};

    # if this is an existing condition
    if ( $ConditionData{ConditionID} ne 'NEW' ) {

        # get condition data
        my $Condition = $ConditionObject->ConditionGet(
            ConditionID => $ConditionData{ConditionID},
            UserID      => $Self->{UserID},
        );

        # check if the condition belongs to the given change
        if ( $Condition->{ChangeID} ne $GetParam{ChangeID} ) {
            return $LayoutObject->ErrorScreen(
                Message => $LayoutObject->{LanguageObject}->Translate(
                    'ConditionID %s does not belong to the given ChangeID %s!',
                    $ConditionData{ConditionID},
                    $GetParam{ChangeID}
                ),
                Comment => Translatable('Please contact the administrator.'),
            );
        }

        # add data from condition
        %ConditionData = ( %ConditionData, %{$Condition} );

        # show existing expressions
        $Self->_ExpressionOverview(
            %{$ChangeData},
            %ConditionData,
            ExpressionIDs => $ExpressionIDsRef,
            NewExpression => $GetParam{NewExpression},
        );

        # show existing actions
        $Self->_ActionOverview(
            %{$ChangeData},
            %ConditionData,
            ActionIDs => $ActionIDsRef,
            NewAction => $GetParam{NewAction},
        );
    }
    else {
        $LayoutObject->Block( Name => 'ExpressionOverviewRowNoData' );
        $LayoutObject->Block( Name => 'ActionOverviewRowNoData' );
    }

    # get expression conjunction from condition
    if ( !$GetParam{ExpressionConjunction} ) {
        $GetParam{ExpressionConjunction} = $ConditionData{ExpressionConjunction} || '';
    }

    # set radio buttons for expression conjunction
    if ( $GetParam{ExpressionConjunction} eq 'all' ) {
        $ConditionData{allselected} = 'checked="checked"';
    }
    else {
        $ConditionData{anyselected} = 'checked="checked"';
    }

    # output header
    my $Output = $LayoutObject->Header( Type => 'Small' );

    # generate ValidOptionString
    $ConditionData{ValidOptionString} = $LayoutObject->BuildSelection(
        Data        => \%ValidList,
        Name        => 'ValidID',
        SelectedID  => $ConditionData{ValidID} || ( $ValidObject->ValidIDsGet() )[0],
        Sort        => 'NumericKey',
        Translation => 1,
        Class       => 'Modernize',
    );

    # add the validation error messages
    for my $BlockName (@ValidationErrors) {
        $LayoutObject->Block(
            Name => $BlockName,
            Data => {
                %GetParam,
            },
        );
    }

    # generate output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMChangeConditionEdit',
        Data         => {
            %Param,
            %{$ChangeData},
            %ConditionData,
        },
    );
    $Output .= $LayoutObject->Footer(
        Type => 'Small',
    );

    return $Output;
}

# show existing expressions
sub _ExpressionOverview {
    my ( $Self, %Param ) = @_;

    return if !$Param{ExpressionIDs};
    return if ref $Param{ExpressionIDs} ne 'ARRAY';

    my @ExpressionIDs = @{ $Param{ExpressionIDs} };

    # also show a new empty expression line
    if ( $Param{NewExpression} ) {
        push @ExpressionIDs, 'NEW';
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    if ( !@ExpressionIDs ) {
        $LayoutObject->Block( Name => 'ExpressionOverviewRowNoData' );
        return;
    }

    EXPRESSIONID:
    for my $ExpressionID ( sort { $a cmp $b } @ExpressionIDs ) {

        # to store the date of an expression
        my $ExpressionData = {};

        # set expression id to 'NEW' for further function calls
        if ( $ExpressionID eq 'NEW' ) {
            $ExpressionData->{ExpressionID} = $ExpressionID;
        }

        # get data for an existing expression
        else {

            # get condition data
            $ExpressionData = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ExpressionGet(
                ExpressionID => $ExpressionID,
                UserID       => $Self->{UserID},
            );

            next EXPRESSIONID if !$ExpressionData;
        }

        # output overview row
        $LayoutObject->Block(
            Name => 'ExpressionOverviewRow',
            Data => {
                %Param,
                %{$ExpressionData},
            },
        );

        # show object selection
        $Self->_ShowObjectSelection(
            %Param,
            %{$ExpressionData},
        );

        # show selecor selection
        $Self->_ShowSelectorSelection(
            %Param,
            %{$ExpressionData},
        );

        # show attribute selection
        $Self->_ShowAttributeSelection(
            %Param,
            %{$ExpressionData},
        );

        # show operator selection
        $Self->_ShowOperatorSelection(
            %Param,
            %{$ExpressionData},
        );

        # show compare value field
        $Self->_ShowCompareValueField(
            %Param,
            %{$ExpressionData},
        );
    }

    return 1;
}

# show existing actions
sub _ActionOverview {
    my ( $Self, %Param ) = @_;

    return if !$Param{ActionIDs};
    return if ref $Param{ActionIDs} ne 'ARRAY';

    my @ActionIDs = @{ $Param{ActionIDs} };

    # also show a new empty action line
    if ( $Param{NewAction} ) {
        push @ActionIDs, 'NEW';
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    if ( !@ActionIDs ) {
        $LayoutObject->Block( Name => 'ActionOverviewRowNoData' );
        return;
    }

    ActionID:
    for my $ActionID ( sort { $a cmp $b } @ActionIDs ) {

        # to store the date of an action
        my $ActionData = {};

        # set action id to 'NEW' for further function calls
        if ( $ActionID eq 'NEW' ) {
            $ActionData->{ActionID} = $ActionID;
        }

        # get data for an existing action
        else {

            # get condition data
            $ActionData = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ActionGet(
                ActionID => $ActionID,
                UserID   => $Self->{UserID},
            );

            next ActionID if !$ActionData;
        }

        # output overview row
        $LayoutObject->Block(
            Name => 'ActionOverviewRow',
            Data => {
                %Param,
                %{$ActionData},
            },
        );

        # show object selection
        $Self->_ShowObjectSelection(
            %Param,
            %{$ActionData},
        );

        # show selecor selection
        $Self->_ShowSelectorSelection(
            %Param,
            %{$ActionData},
        );

        # show attribute selection
        $Self->_ShowAttributeSelection(
            %Param,
            %{$ActionData},
        );

        # show operator selection
        $Self->_ShowOperatorSelection(
            %Param,
            %{$ActionData},
        );

        # show compare value field
        $Self->_ShowCompareValueField(
            %Param,
            %{$ActionData},
        );
    }

    return 1;
}

# show object dropdown field
sub _ShowObjectSelection {
    my ( $Self, %Param ) = @_;

    # get object selection list
    my $ObjectList = $Self->_GetObjectSelection(%Param);

    # add an empty selection if no list is available or nothing is selected
    my $PossibleNone = 0;
    if (
        !$ObjectList
        || !ref $ObjectList eq 'HASH'
        || !%{$ObjectList}
        || !$Param{ObjectID}
        )
    {
        $PossibleNone = 1;
    }

    # name of the div that should be updated
    my $UpdateDivName;

    # id name of the involved element ( 'ExpressionID' or 'ActionID' )
    my $IDName;

    # block name for the output layout block
    my $BlockName;

    # for expression elements
    if ( $Param{ExpressionID} ) {
        $UpdateDivName = "ExpressionID-$Param{ExpressionID}-CompareValue-Div";
        $IDName        = 'ExpressionID';
        $BlockName     = 'ExpressionOverviewRowElementObject';
    }

    # for action elements
    elsif ( $Param{ActionID} ) {
        $UpdateDivName = "ActionID-$Param{ActionID}-ActionValue-Div";
        $IDName        = 'ActionID';
        $BlockName     = 'ActionOverviewRowElementObject';
    }

    # parameters for ajax
    $Param{ObjectOptionName} = $IDName . '-' . $Param{$IDName} . '-ObjectID';
    $Param{IDName}           = $IDName;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # generate ObjectOptionString
    my $ObjectOptionString = $LayoutObject->BuildSelection(
        Data         => $ObjectList,
        Name         => $Param{ObjectOptionName},
        SelectedID   => $Param{ObjectID},
        PossibleNone => $PossibleNone,
        Translation  => 1,
    );

    # output object selection
    $LayoutObject->Block(
        Name => $BlockName,
        Data => {
            %Param,
            ObjectOptionString => $ObjectOptionString,
        },
    );

    return 1;
}

# show selector dropdown field
sub _ShowSelectorSelection {
    my ( $Self, %Param ) = @_;

    # get selector selection list
    my $SelectorList = $Self->_GetSelectorSelection(%Param);

    # add an empty selection if no list is available or nothing is selected
    my $PossibleNone = 0;
    if (
        !$SelectorList
        || !ref $SelectorList eq 'HASH'
        || !%{$SelectorList}
        || !$Param{Selector}
        )
    {
        $PossibleNone = 1;
    }

    # id name of the involved element ( 'ExpressionID' or 'ActionID' )
    my $IDName;

    # block name for the output layout block
    my $BlockName;

    # for expression elements
    if ( $Param{ExpressionID} ) {
        $IDName    = 'ExpressionID';
        $BlockName = 'ExpressionOverviewRowElementSelector';
    }

    # for action elements
    elsif ( $Param{ActionID} ) {
        $IDName    = 'ActionID';
        $BlockName = 'ActionOverviewRowElementSelector';
    }

    # parameters for ajax
    $Param{ObjectOptionName} = $IDName . '-' . $Param{$IDName} . '-Selector';
    $Param{IDName}           = $IDName;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # generate SelectorOptionString
    my $SelectorOptionString = $LayoutObject->BuildSelection(
        Data         => $SelectorList,
        Name         => $Param{ObjectOptionName},
        SelectedID   => $Param{Selector},
        PossibleNone => $PossibleNone,
        Translation  => 1,
    );

    # output selector selection
    $LayoutObject->Block(
        Name => $BlockName,
        Data => {
            %Param,
            SelectorOptionString => $SelectorOptionString,
        },
    );

    return 1;
}

# show attribute dropdown field
sub _ShowAttributeSelection {
    my ( $Self, %Param ) = @_;

    # name of the div that should be updated
    my $UpdateDivName;

    # id name of the involved element ( 'ExpressionID' or 'ActionID' )
    my $IDName;

    # block name for the output layout block
    my $BlockName;

    # name of the value field ( CompareValue or ActionValue )
    my $ValueFieldName;

    # for expression elements
    if ( $Param{ExpressionID} ) {
        $UpdateDivName  = "ExpressionID-$Param{ExpressionID}-CompareValue-Div";
        $IDName         = 'ExpressionID';
        $BlockName      = 'ExpressionOverviewRowElementAttribute';
        $ValueFieldName = 'CompareValue';
    }

    # for action elements
    elsif ( $Param{ActionID} ) {
        $UpdateDivName  = "ActionID-$Param{ActionID}-ActionValue-Div";
        $IDName         = 'ActionID';
        $BlockName      = 'ActionOverviewRowElementAttribute';
        $ValueFieldName = 'ActionValue';
    }

    # get attribute selection list
    my $AttributeList = $Self->_GetAttributeSelection(
        ObjectID => $Param{ObjectID},
        Selector => $Param{Selector},
        $IDName  => $Param{$IDName},
    );

    # add an empty selection if no list is available or nothing is selected
    my $PossibleNone = 0;
    if (
        !$AttributeList
        || !ref $AttributeList eq 'HASH'
        || !%{$AttributeList}
        || !$Param{AttributeID}
        )
    {
        $PossibleNone = 1;
    }

    # parameters for ajax
    $Param{ObjectOptionName} = $IDName . '-' . $Param{$IDName} . '-AttributeID';
    $Param{IDName}           = $IDName;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # generate AttributeOptionString
    my $AttributeOptionString = $LayoutObject->BuildSelection(
        Data         => $AttributeList,
        Name         => $Param{ObjectOptionName},
        SelectedID   => $Param{AttributeID},
        PossibleNone => $PossibleNone,
        Translation  => 1,
    );

    # output attribute selection
    $LayoutObject->Block(
        Name => $BlockName,
        Data => {
            %Param,
            AttributeOptionString => $AttributeOptionString,
        },
    );

    return 1;
}

# show operator dropdown field
sub _ShowOperatorSelection {
    my ( $Self, %Param ) = @_;

    # id name of the involved element ( 'ExpressionID' or 'ActionID' )
    my $IDName;

    # block name for the output layout block
    my $BlockName;

    # for expression elements
    if ( $Param{ExpressionID} ) {
        $IDName    = 'ExpressionID';
        $BlockName = 'ExpressionOverviewRowElementOperator';
    }

    # for action elements
    elsif ( $Param{ActionID} ) {
        $IDName    = 'ActionID';
        $BlockName = 'ActionOverviewRowElementOperator';
    }

    # get operator selection list
    my $OperatorList = $Self->_GetOperatorSelection(
        ObjectID    => $Param{ObjectID},
        AttributeID => $Param{AttributeID},
        $IDName     => $Param{$IDName},
    );

    # add an empty selection if no list is available or nothing is selected
    my $PossibleNone = 0;
    if (
        !$OperatorList
        || !ref $OperatorList eq 'HASH'
        || !%{$OperatorList}
        || !$Param{OperatorID}
        )
    {
        $PossibleNone = 1;
    }

    # parameters for ajax
    $Param{ObjectOptionName} = $IDName . '-' . $Param{$IDName} . '-OperatorID';
    $Param{IDName}           = $IDName;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # generate OperatorOptionString
    my $OperatorOptionString = $LayoutObject->BuildSelection(
        Data         => $OperatorList,
        Name         => $Param{ObjectOptionName},
        SelectedID   => $Param{OperatorID},
        PossibleNone => $PossibleNone,
        Translation  => 1,
    );

    # output operator selection
    $LayoutObject->Block(
        Name => $BlockName,
        Data => {
            %Param,
            OperatorOptionString => $OperatorOptionString,
        },
    );

    return 1;
}

# show compare value field
sub _ShowCompareValueField {
    my ( $Self, %Param ) = @_;

    # get compare value field type
    my $FieldType = $Self->_GetCompareValueFieldType(%Param);

    # id name of the involved element ( 'ExpressionID' or 'ActionID' )
    my $IDName;

    # block names for the output layout block
    my $BlockNameText;
    my $BlockNameSelection;

    my $ValueFieldName;

    # for expression elements
    if ( $Param{ExpressionID} ) {
        $IDName             = 'ExpressionID';
        $BlockNameText      = 'ExpressionOverviewRowElementCompareValueText';
        $BlockNameSelection = 'ExpressionOverviewRowElementCompareValueSelection';
        $ValueFieldName     = 'CompareValue';
    }

    # for action elements
    elsif ( $Param{ActionID} ) {
        $IDName             = 'ActionID';
        $BlockNameText      = 'ActionOverviewRowElementActionValueText';
        $BlockNameSelection = 'ActionOverviewRowElementActionValueSelection';
        $ValueFieldName     = 'ActionValue';
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # compare value is a text field
    if ( $FieldType eq 'Text' ) {
        $LayoutObject->Block(
            Name => $BlockNameText,
            Data => {
                %Param,
            },
        );
    }

    # compare value is a selection field
    elsif ( $FieldType eq 'Selection' ) {

        # get compare value selection list
        my $CompareValueList = $Self->_GetCompareValueSelection(%Param);

        my $AttributeName;
        if ( $Param{AttributeID} ) {

            # lookup attribute name
            $AttributeName = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->AttributeLookup(
                AttributeID => $Param{AttributeID},
            );
        }

        # add an empty selection if no list is available or nothing is selected
        # or the list is the workorder agent list
        my $PossibleNone = 0;
        if (
            $Param{PossibleNone}
            || !$Param{$ValueFieldName}
            || !$CompareValueList
            || ( ref $CompareValueList eq 'HASH'  && !%{$CompareValueList} )
            || ( ref $CompareValueList eq 'ARRAY' && !@{$CompareValueList} )
            || (
                $ValueFieldName eq 'ActionValue'
                && $AttributeName
                && $AttributeName eq 'WorkOrderAgentID'
            )
            )
        {
            $PossibleNone = 1;
        }

        # generate ValueOptionString
        my $ValueOptionString = $LayoutObject->BuildSelection(
            Data         => $CompareValueList,
            Name         => $IDName . '-' . $Param{$IDName} . '-' . $ValueFieldName,
            SelectedID   => $Param{$ValueFieldName},
            PossibleNone => $PossibleNone,
            Translation  => 1,
        );

        # output selection
        $LayoutObject->Block(
            Name => $BlockNameSelection,
            Data => {
                %Param,
                ValueOptionString => $ValueOptionString,
            },
        );
    }

    # compare value is a date field
    elsif ( $FieldType eq 'Date' ) {

        # TODO : Implement date selection later!
    }

    # compare value is an autocomplete field
    elsif ( $FieldType eq 'Autocomplete' ) {

        # TODO : Implement autocomplete selection later!
    }

    # show empty block if field type is unknown
    else {

        # output empty block
        $LayoutObject->Block(
            Name => $BlockNameSelection,
            Data => {
                %Param,
            },
        );
    }

    return 1;
}

# get compare value field type
sub _GetCompareValueFieldType {
    my ( $Self, %Param ) = @_;

    # set default field type
    my $FieldType = 'Selection';

    # if an attribute is set
    if ( $Param{AttributeID} ) {

        # get condition object
        my $ConditionObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition');

        # lookup attribute name
        my $AttributeName = $ConditionObject->AttributeLookup(
            AttributeID => $Param{AttributeID},
        );

        # check error
        if ( !$AttributeName ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "AttributeID $Param{AttributeID} does not exist!",
            );
            return;
        }

        # get the field type
        $FieldType = $ConditionObject->ConditionCompareValueFieldType(
            ObjectID    => $Param{ObjectID},
            AttributeID => $Param{AttributeID},
            UserID      => $Self->{UserID},
        );

        return if !$FieldType;
    }

    # Workaround for not yet implemented field types
    # TODO: implement these field types later!
    if ( $FieldType eq 'Date' ) {
        $FieldType = 'Text';
    }
    elsif ( $FieldType eq 'Autocomplete' ) {
        $FieldType = 'Selection';
    }

    return $FieldType;
}

# get object dropdown field data
sub _GetObjectSelection {
    my ( $Self, %Param ) = @_;

    # get object list
    my $ObjectList = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ObjectList(
        UserID => $Self->{UserID},
    );

    return $ObjectList;
}

# get selector dropdown field data
sub _GetSelectorSelection {
    my ( $Self, %Param ) = @_;

    my $SelectorList = {};

    # if an object is set
    if ( $Param{ObjectID} ) {

        # get selector list
        $SelectorList = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ObjectSelectorList(
            ObjectID     => $Param{ObjectID},
            ConditionID  => $Param{ConditionID},
            ExpressionID => $Param{ExpressionID},
            ActionID     => $Param{ActionID},
            UserID       => $Self->{UserID},
        );
    }

    return $SelectorList;
}

# get attribute selection list data
sub _GetAttributeSelection {
    my ( $Self, %Param ) = @_;

    # to store the attriutes
    my %Attributes;

    # if a selector is set
    if ( $Param{Selector} ) {

        # get condition object
        my $ConditionObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition');

        # get list of all attributes
        my $AllAttributes = $ConditionObject->AttributeList(
            UserID => $Self->{UserID},
        );

        # lookup object name
        my $ObjectName = $ConditionObject->ObjectLookup(
            ObjectID => $Param{ObjectID},
        );

        # check error
        if ( !$ObjectName ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "ObjectID $Param{ObjectID} does not exist!",
            );
            return;
        }

        # get object attribute mapping from sysconfig
        my $ObjectAttributeMapping;

        # get config object
        my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

        # get mapping config for expressions or actions
        if ( $Param{ExpressionID} ) {
            $ObjectAttributeMapping = $ConfigObject->Get(
                $ObjectName . '::Mapping::Expression::Object::Attribute',
            );
        }
        elsif ( $Param{ActionID} ) {
            $ObjectAttributeMapping = $ConfigObject->Get(
                $ObjectName . '::Mapping::Action::Object::Attribute',
            );
        }

        # get the list of dynamic fields (change or workorder)
        my $DynamicFields = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
            Valid      => 0,
            ObjectType => $ObjectName,
        );

        # build a lookup hash for all dynamic fields for this object (change or workorder)
        my %DynamicFieldName;
        for my $DynamicField ( @{$DynamicFields} ) {
            $DynamicFieldName{ $DynamicField->{Name} } = 1;
        }

        # get the valid attributes for the given object
        ATTRIBUTEID:
        for my $AttributeID ( sort keys %{$AllAttributes} ) {

            # check if attribute is in the mapping
            if ( $ObjectAttributeMapping->{ $AllAttributes->{$AttributeID} } ) {
                $Attributes{$AttributeID} = $AllAttributes->{$AttributeID};
            }
            else {

                # get attribute name
                my $AttributeName = $AllAttributes->{$AttributeID};

                # check if the attribute is a dynamic field and dynamic fields should be used as attributes
                next ATTRIBUTEID if !$ObjectAttributeMapping->{DynamicField};
                next ATTRIBUTEID if $AttributeName !~ m{ \A DynamicField_ (\w+) }xms;

                # remove the prefix 'DynamicField_' from dynamic fields for nicer display
                my $AttributeWithoutPrefix = $1;

                # check if it is a dynamic field for the correct object
                next ATTRIBUTEID if !$DynamicFieldName{$AttributeWithoutPrefix};

                # add the dynamic field to attribute list
                $Attributes{$AttributeID} = $AttributeWithoutPrefix;
            }
        }

        for my $Attribute ( values %Attributes ) {

            # remove 'ID' at the end of the attribute name for nicer display
            $Attribute =~ s{ ID \z }{}xms;
        }
    }

    return \%Attributes;
}

# get operator list data
sub _GetOperatorSelection {
    my ( $Self, %Param ) = @_;

    # to store the operators
    my %Operators;

    # if an atribute is set
    if ( $Param{AttributeID} ) {

        # get condition object
        my $ConditionObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition');

        # lookup object name
        my $ObjectName = $ConditionObject->ObjectLookup(
            ObjectID => $Param{ObjectID},
        );

        # get log object
        my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

        # check error
        if ( !$ObjectName ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "ObjectID $Param{ObjectID} does not exist!",
            );
            return;
        }

        # lookup attribute name
        my $AttributeName = $ConditionObject->AttributeLookup(
            AttributeID => $Param{AttributeID},
        );

        # check error
        if ( !$AttributeName ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "AttributeID $Param{AttributeID} does not exist!",
            );
            return;
        }

        # get list of all operators
        my $AllOperators = $ConditionObject->OperatorList(
            UserID => $Self->{UserID},
        );

        # get attribute operator mapping from sysconfig
        my $MappingConfig;

        # get config object
        my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

        # get mapping config for expressions or actions
        if ( $Param{ExpressionID} ) {
            $MappingConfig = $ConfigObject->Get(
                $ObjectName . '::Mapping::Expression::Attribute::Operator'
            );
        }
        elsif ( $Param{ActionID} ) {
            $MappingConfig = $ConfigObject->Get(
                $ObjectName . '::Mapping::Action::Attribute::Operator'
            );
        }

        # remove the name part of the dynamic field and replace only with the string "DynamicField"
        $AttributeName =~ s{ \A DynamicField_ (\w+) }{DynamicField}xms;

        my $AttributeOperatorMapping;
        if ($MappingConfig) {
            $AttributeOperatorMapping = $MappingConfig->{$AttributeName} || {};
        }

        # get allowed operators for the given attribute
        OPERATORID:
        for my $OperatorID ( sort keys %{$AllOperators} ) {

            # get operator name
            my $OperatorName = $AllOperators->{$OperatorID};

            # check if operator is allowed for this attribute
            next OPERATORID if !$AttributeOperatorMapping->{$OperatorName};

            # remember the operator
            $Operators{$OperatorID} = $OperatorName;
        }
    }

    return \%Operators;
}

# get compare value list
sub _GetCompareValueSelection {
    my ( $Self, %Param ) = @_;

    # to store the compare value list
    my $CompareValueList = {};

    # if an attribute is set
    if ( $Param{AttributeID} ) {

        # get condition object
        my $ConditionObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition');

        # lookup attribute name
        my $AttributeName = $ConditionObject->AttributeLookup(
            AttributeID => $Param{AttributeID},
        );

        # check error
        if ( !$AttributeName ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "AttributeID $Param{AttributeID} does not exist!",
            );
            return;
        }

        # get compare value list
        $CompareValueList = $ConditionObject->ObjectCompareValueList(
            ObjectID      => $Param{ObjectID},
            AttributeName => $AttributeName,
            UserID        => $Self->{UserID},
        );
    }

    return $CompareValueList;
}

1;
