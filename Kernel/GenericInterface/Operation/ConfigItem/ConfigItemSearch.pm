# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::ConfigItem::ConfigItemSearch;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

use base qw(
    Kernel::GenericInterface::Operation::Common
    Kernel::GenericInterface::Operation::ConfigItem::Common
);

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::GenericInterface::Operation::ConfigItem::ConfigItemSearch - GenericInterface ConfigItem ConfigItemSearch Operation backend

=head1 SYNOPSIS

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

usually, you want to create an instance of this
by using Kernel::GenericInterface::Operation->new();

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Needed (qw( DebuggerObject WebserviceID )) {
        if ( !$Param{$Needed} ) {
            return {
                Success      => 0,
                ErrorMessage => "Got no $Needed!",
            };
        }

        $Self->{$Needed} = $Param{$Needed};
    }

    $Self->{OperationName} = 'ConfigItemSearch';

    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get('GenericInterface::Operation::ConfigItemSearch');

    $Self->{Config}->{DefaultValue} = 'Not Defined';

    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

    # get a list of all config item classes
    $Self->{ClassList} = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::Class',
    );

    if ( !IsHashRefWithData( $Self->{ClassList} ) ) {
        return $Self->{DebuggerObject}->Error(
            Summary => 'Error when trying to get class listing of ITSM::ConfigItem::Class',
        );
    }

    # get a list of all incistates
    $Self->{InciStateList} = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::Core::IncidentState',
    );

    if ( !IsHashRefWithData( $Self->{InciStateList} ) ) {
        return $Self->{DebuggerObject}->Error(
            Summary => 'Error when trying to get incident state listing of'
                . ' ITSM::Core::IncidentState',
        );
    }

    # get a list of all deplstates
    $Self->{DeplStateList} = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::DeploymentState',
    );

    if ( !IsHashRefWithData( $Self->{DeplStateList} ) ) {
        return $Self->{DebuggerObject}->Error(
            Summary => 'Error when trying to get incident state listing of'
                . ' ITSM::ConfigItem::DeploymentState',
        );
    }

    # also provide the classlist in reversed form for easier reverse lookups
    my %ReverseClassList = reverse %{ $Self->{ClassList} };
    $Self->{ReverseClassList} = \%ReverseClassList;

    # also provide the incistatelist in reversed form for easier reverse lookups
    my %ReverseInciStateList = reverse %{ $Self->{InciStateList} };
    $Self->{ReverseInciStateList} = \%ReverseInciStateList;

    # also provide the deplstatelist in reversed form for easier reverse lookups
    my %ReverseDeplStateList = reverse %{ $Self->{DeplStateList} };
    $Self->{ReverseDeplStateList} = \%ReverseDeplStateList;

    return $Self;
}

=item Run()

perform ConfigItemCreate Operation. This will return the created config item number.

    my $Result = $OperationObject->Run(
        Data => {
            UserLogin         => 'some agent login',                        # UserLogin or SessionID is
            SessionID         => 123,                                       #   required


            Password  => 'some password',                                   # if UserLogin is sent then
                                                                            #   Password is required
            ConfigItem => {
                Class        => 'The ConfigItem Class',                     # (optional)
                Number       => 'The ConfigItem Number',                    # (optional)
                Name         => 'The ConfigItem Name',                      # (optional)
                DeplStates   => ['deployment state'],                       # (optional)
                InciStates   => ['incident state'],                         # (optional)

                # config items with created time after ...
                ConfigItemCreateTimeNewerDate => '2006-01-09 00:00:01',     # (optional)

                # config items with created time before then ....
                ConfigItemCreateTimeOlderDate => '2006-01-19 23:59:59',     # (optional)

                # config items with changed time after ...
                ConfigItemChangeTimeNewerDate => '2006-01-09 00:00:01',     # (optional)

                # config items with changed time before then ....
                ConfigItemChangeTimeOlderDate => '2006-01-19 23:59:59',     # (optional)

                CIXMLData    => $ArrayHashRef,                              # (optional), it depends on the Configuration
                                                                            #   Item class and definition

                PreviousVersionSearch => 1,  # (optional) default 0 (0|1)

                OrderBy => [ 'ConfigItemID', 'Number' ],                    # (optional)
                # default: [ 'ConfigItemID' ]
                # (ConfigItemID, Number, ClassID, DeplStateID, InciStateID,
                # CreateTime, CreateBy, ChangeTime, ChangeBy)

                # Additional information for OrderBy:
                # The OrderByDirection can be specified for each OrderBy attribute.
                # The pairing is made by the array indices.

                OrderByDirection => [ 'Down', 'Up' ],                       # (optional)
                # default: [ 'Down' ]
                # (Down | Up)

                Limit          => 122,                                      # (optional)
            },
        },
    );

    $Result = {
        Success         => 1,                       # 0 or 1
        ErrorMessage    => '',                      # in case of error
        Data            => {                        # result data payload after Operation
            ConfigItemID     => [123, 456],         # Configuration Item  IDs number in OTRS::ITSM (Service desk system)
            Error => {                              # should not return errors
                    ErrorCode    => 'ConfigItemSearch.ErrorCode'
                    ErrorMessage => 'Error Description'
            },
        },
    };

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $Result = $Self->Init(
        WebserviceID => $Self->{WebserviceID},
    );

    if ( !$Result->{Success} ) {
        $Self->ReturnError(
            ErrorCode    => 'Webservice.InvalidConfiguration',
            ErrorMessage => $Result->{ErrorMessage},
        );
    }

    # check needed stuff
    if (
        !$Param{Data}->{UserLogin}
        && !$Param{Data}->{SessionID}
        )
    {
        return $Self->ReturnError(
            ErrorCode => "$Self->{OperationName}.MissingParameter",
            ErrorMessage =>
                "$Self->{OperationName}: UserLogin or SessionID is required!",
        );
    }

    if ( $Param{Data}->{UserLogin} ) {

        if ( !$Param{Data}->{Password} )
        {
            return $Self->ReturnError(
                ErrorCode    => "$Self->{OperationName}.MissingParameter",
                ErrorMessage => "$Self->{OperationName}: Password or SessionID is required!",
            );
        }
    }

    # authenticate user
    my ( $UserID, $UserType ) = $Self->Auth(%Param);

    if ( !$UserID ) {
        return $Self->ReturnError(
            ErrorCode    => "$Self->{OperationName}.AuthFail",
            ErrorMessage => "$Self->{OperationName}: User could not be authenticated!",
        );
    }

    # check needed hashes
    for my $Needed (qw(ConfigItem)) {
        if ( !IsHashRefWithData( $Param{Data}->{$Needed} ) ) {
            return $Self->ReturnError(
                ErrorCode => "$Self->{OperationName}.MissingParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: $Needed parameter is missing or not valid!",
            );
        }
    }

    # isolate config item parameter
    my $ConfigItem = $Param{Data}->{ConfigItem};

    # remove leading and trailing spaces
    for my $Attribute ( sort keys %{$ConfigItem} ) {
        if ( ref $Attribute ne 'HASH' && ref $Attribute ne 'ARRAY' ) {

            #remove leading spaces
            $ConfigItem->{$Attribute} =~ s{\A\s+}{};

            #remove trailing spaces
            $ConfigItem->{$Attribute} =~ s{\s+\z}{};
        }
    }

    if ( defined $ConfigItem->{CIXMLData} ) {
        if ( !IsHashRefWithData( $ConfigItem->{CIXMLData} ) ) {
            return $Self->ReturnError(
                ErrorCode    => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage => "$Self->{OperationName}: ConfigItem->CIXMLData is invalid!",
            );
        }

        # remove leading and trailing spaces for CIXMLData
        $Self->_CleanXMLData( XMLData => $ConfigItem->{CIXMLData} );
    }

    if ( !( $ConfigItem->{Class} ) ) {
        return $Self->ReturnError(
            ErrorCode => "$Self->{OperationName}.MissingParameter",
            ErrorMessage =>
                "$Self->{OperationName}: ConfigItem->Class parameter is missing!",
        );
    }

    # convert search params to arrays
    if ( defined $ConfigItem->{InciStates} ) {
        my @InciStates;
        if ( IsStringWithData( $ConfigItem->{InciStates} ) ) {
            @InciStates = split( /,/, $ConfigItem->{InciStates} );
        }
        elsif ( IsArrayRefWithData( $ConfigItem->{InciStates} ) ) {
            @InciStates = @{ $ConfigItem->{InciStates} };
        }
        else {
            return $Self->ReturnError(
                ErrorCode => "$Self->{OperationName}.WrongStructure",
                ErrorMessage =>
                    "$Self->{OperationName}: Structure for ConfigItem->InciStates is not correct!",
            );
        }
        $ConfigItem->{InciStates} = \@InciStates;
    }

    if ( defined $ConfigItem->{DeplStates} ) {
        my @DeplStates;
        if ( IsStringWithData( $ConfigItem->{DeplStates} ) ) {
            @DeplStates = split( /,/, $ConfigItem->{DeplStates} );
        }
        elsif ( IsArrayRefWithData( $ConfigItem->{DeplStates} ) ) {
            @DeplStates = @{ $ConfigItem->{DeplStates} };
        }
        else {
            return $Self->ReturnError(
                ErrorCode    => "$Self->{OperationName}.WrongStructure",
                ErrorMessage => "$Self->{OperationName}: Structure for DeplStates is not correct!",
            );
        }
        $ConfigItem->{DeplStates} = \@DeplStates;
    }

    if ( defined $ConfigItem->{OrderBy} ) {
        my @OrderBy;
        if ( IsStringWithData( $ConfigItem->{OrderBy} ) ) {
            @OrderBy = split( /,/, $ConfigItem->{OrderBy} );
        }
        elsif ( IsArrayRefWithData( $ConfigItem->{OrderBy} ) ) {
            @OrderBy = @{ $ConfigItem->{OrderBy} };
        }
        else {
            return $Self->ReturnError(
                ErrorCode    => "$Self->{OperationName}.WrongStructure",
                ErrorMessage => "$Self->{OperationName}: Structure for OrderBy is not correct!",
            );
        }
        $ConfigItem->{OrderBy} = \@OrderBy;
    }

    if ( defined $ConfigItem->{OrderByDirection} ) {
        my @OrderByDirection;
        if ( IsStringWithData( $ConfigItem->{OrderByDirection} ) ) {
            @OrderByDirection = split( /,/, $ConfigItem->{OrderByDirection} );
        }
        elsif ( IsArrayRefWithData( $ConfigItem->{OrderByDirection} ) ) {
            @OrderByDirection = @{ $ConfigItem->{OrderByDirection} };
        }
        else {
            return $Self->ReturnError(
                ErrorCode => "$Self->{OperationName}.WrongStructure",
                ErrorMessage =>
                    "$Self->{OperationName}: Structure for OrderByDirection is not correct!",
            );
        }
        $ConfigItem->{OrderByDirection} = \@OrderByDirection;
    }

    # check ConfigItem attribute values
    my $ConfigItemCheck = $Self->_CheckConfigItem( ConfigItem => $ConfigItem );

    if ( !$ConfigItemCheck->{Success} ) {
        return $Self->ReturnError( %{$ConfigItemCheck} );
    }

    # check search permissions
    my $Permission = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->Permission(
        Scope   => 'Class',
        ClassID => $Self->{ReverseClassList}->{ $ConfigItem->{Class} },
        UserID  => $UserID,
        Type    => $Self->{Config}->{Permission},
    );

    if ( !$Permission ) {
        return $Self->ReturnError(
            ErrorCode    => "$Self->{OperationName}.AccessDenied",
            ErrorMessage => "$Self->{OperationName}: Can not search configuration items!",
        );
    }

    return $Self->_ConfigItemSearch(
        ConfigItem => $ConfigItem,
        UserID     => $UserID,
    );
}

=begin Internal:

=item _CleanXMLData()

removed trailing and leading white spaces in the XMLData.

    my $XMLDataClean = $OperationObject->_CleanXMLData(
        Definition => $DefinitionArrayRef,          # Config Item Definition ot just part of it
        XMLData    => $XMLDataHashRef,
    );

    returns:

    $XMLDataClean = {
        Success => 1,                               # if everything is OK
    }

    $XMLDataClean = {
        ErrorCode    => 'Function.Error',           # if error
        ErrorMessage => 'Error description',
    }

=cut

sub _CleanXMLData {
    my ( $Self, %Param ) = @_;

    my $XMLData = $Param{XMLData};

    KEY:
    for my $Key ( sort keys %{$XMLData} ) {
        if ( ref $XMLData->{$Key} eq 'ARRAY' ) {
            ELEMENT:
            for my $Element ( @{ $XMLData->{$Key} } ) {
                if ( ref $Element eq 'HASH' ) {

                    # start recursion
                    $Self->_CleanXMLData( XMLData => $Element );
                    next ELEMENT;
                }
                elsif ( ref $Element eq '' ) {

                    #remove leading spaces
                    $Element =~ s{\A\s+}{};

                    #remove trailing spaces
                    $Element =~ s{\s+\z}{};
                }
            }
        }
        elsif ( ref $XMLData->{$Key} eq 'HASH' ) {

            # start recursion
            $Self->_CleanXMLData( XMLData => $XMLData->{$Key} );
            next KEY;

        }
        elsif ( ref $XMLData->{$Key} eq '' ) {

            #remove leading spaces
            $XMLData->{$Key} =~ s{\A\s+}{};

            #remove trailing spaces
            $XMLData->{$Key} =~ s{\s+\z}{};
        }
    }
}

=item _CheckConfigItem()

checks if the given config item parameters are valid.

    my $ConfigItemCheck = $OperationObject->_CheckConfigItem(
        ConfigItem => $ConfigItem,                  # all config item parameters
    );

    returns:

    $ConfigItemCheck = {
        Success => 1,                               # if everything is OK
    }

    $ConfigItemCheck = {
        ErrorCode    => 'Function.Error',           # if error
        ErrorMessage => 'Error description',
    }

=cut

sub _CheckConfigItem {
    my ( $Self, %Param ) = @_;

    my $ConfigItem = $Param{ConfigItem};

    # check config item internally
    # check needed stuff
    for my $Needed (qw(Class)) {
        if ( !$ConfigItem->{$Needed} ) {
            return {
                ErrorCode    => "$Self->{OperationName}.MissingParameter",
                ErrorMessage => "$Self->{OperationName}: ConfigItem->$Needed parameter is missing!",
            };
        }
    }

    # check ConfigItem->Class
    if ( !$Self->ValidateClass( %{$ConfigItem} ) ) {
        return {
            ErrorCode => "$Self->{OperationName}.InvalidParameter",
            ErrorMessage =>
                "$Self->{OperationName}: ConfigItem->Class parameter is invalid!",
        };
    }

    # check optional stuff
    if ( IsArrayRefWithData( $ConfigItem->{InciStates} ) ) {

        for my $InciState ( @{ $ConfigItem->{InciStates} } ) {

            # check ConfigItem->InciStates
            if ( !$Self->ValidateInciState( InciState => $InciState ) ) {
                return {
                    ErrorCode => "$Self->{OperationName}.InvalidParameter",
                    ErrorMessage =>
                        "$Self->{OperationName}: ConfigItem->InciStates parameter is invalid!",
                };
            }
        }
    }

    if ( IsArrayRefWithData( $ConfigItem->{DeplStates} ) ) {

        for my $DeplState ( @{ $ConfigItem->{DeplStates} } ) {

            # check ConfigItem->InciStates
            if ( !$Self->ValidateDeplState( DeplState => $DeplState ) ) {
                return {
                    ErrorCode => "$Self->{OperationName}.InvalidParameter",
                    ErrorMessage =>
                        "$Self->{OperationName}: ConfigItem->DeplStates parameter is invalid!",
                };
            }
        }
    }

    for my $TimeParam (
        qw(CreateTimeNewerDate CreateTimeOlderDate ChangeTimeNewerDate ChangeTimeOlderDate)
        )
    {
        if ( defined $ConfigItem->{"ConfigItem$TimeParam"} ) {
            if (
                !$Self->ValidateInputDateTime(
                    Value => $ConfigItem->{"ConfigItem$TimeParam"},
                )
                )
            {
                return {
                    ErrorCode => "$Self->{OperationName}.InvalidParameter",
                    ErrorMessage =>
                        "$Self->{OperationName}: ConfigItem->ConfigItem$TimeParam parameter is invalid!",
                };
            }
        }
    }

    if ( defined $ConfigItem->{Limit} ) {
        if ( !IsNumber( $ConfigItem->{Limit} ) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->Limit parameter is invalid!",
            };
        }
    }

    if ( IsHashRefWithData( $ConfigItem->{CIXMLData} ) ) {

        # get last config item defintion
        my $DefinitionData = $Kernel::OM->Get('Kernel::System::ITSMConfigItem')->DefinitionGet(
            ClassID => $Self->{ReverseClassList}->{ $ConfigItem->{Class} },
        );

        my $XMLDataCheckResult = $Self->_CheckSearchXMLData(
            Definition => $DefinitionData->{DefinitionRef},
            XMLData    => $ConfigItem->{CIXMLData},
        );

        if ( !$XMLDataCheckResult->{Success} ) {
            return $XMLDataCheckResult;
        }
    }

    # if everything is OK then return Success
    return {
        Success => 1,
    };
}

=item _ConfigItemSearch()

search a configuration items.

    my $Response = $OperationObject->_ConfigItemSearch(
        ConfigItem     => $ConfigItem,             # all configuration item parameters
        UserID         => 123,
    );

    returns:

    $Response = {
        Success => 1,                               # if everething is OK
        Data => {
            ConfigItemIDs => [123, 456],
        }
    }

    $Response = {
        Success      => 0,                         # if unexpected error
        ErrorMessage => "$Param{ErrorCode}: $Param{ErrorMessage}",
    }

=cut

sub _ConfigItemSearch {
    my ( $Self, %Param ) = @_;

    my $ConfigItem = $Param{ConfigItem};

    my %SearchParams;

    # set search parameters that does not need any conversion
    for my $PlainParam (
        qw(
        Name Number PreviousVersionSearch OrderBy OrderByDirection Limit
        ConfigItemCreateTimeNewerDate ConfigItemCreateTimeOlderDate ConfigItemChangeTimeNewerDate
        ConfigItemChangeTimeOlderDate
        )
        )
    {
        if ( defined $ConfigItem->{$PlainParam} ) {
            $SearchParams{$PlainParam} = $ConfigItem->{$PlainParam};
        }
    }

    # set seach class
    my $ClassID = $Self->{ReverseClassList}->{ $ConfigItem->{Class} };
    $SearchParams{ClassIDs} = [$ClassID];

    # set search incident states
    if ( defined $ConfigItem->{InciStates} ) {
        my @InciStateIDs;
        for my $InciState ( @{ $ConfigItem->{InciStates} } ) {
            my $InciStateID = $Self->{ReverseInciStateList}->{$InciState};
            push @InciStateIDs, $InciStateID;
        }
        $SearchParams{InciStateIDs} = \@InciStateIDs
    }

    # set search deployment states
    if ( defined $ConfigItem->{DeplStates} ) {
        my @DeplStateIDs;
        for my $DeplState ( @{ $ConfigItem->{DeplStates} } ) {
            my $DeplStateID = $Self->{ReverseDeplStateList}->{$DeplState};
            push @DeplStateIDs, $DeplStateID;
        }
        $SearchParams{DeplStateIDs} = \@DeplStateIDs
    }

    my $RawXMLData = $ConfigItem->{CIXMLData};

    my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

    if ( IsHashRefWithData($RawXMLData) ) {

        # get last config item defintion
        my $DefinitionData = $ConfigItemObject->DefinitionGet(
            ClassID => $Self->{ReverseClassList}->{ $ConfigItem->{Class} },
        );

        # replace date, date time, customer, company and general catalog values
        my $ReplacedXMLData = $Self->ReplaceXMLData(
            XMLData    => $RawXMLData,
            Definition => $DefinitionData->{DefinitionRef},
        );

        # create an XMLData structure suitable for ConfigItemSearch
        my $XMLData = $Self->_FormatSearchXMLData(
            XMLData => $ReplacedXMLData,
        );

        if ( IsArrayRefWithData($XMLData) ) {
            $SearchParams{What} = $XMLData;
        }
    }

    $Self->{DebuggerObject}->Info(
        Summary => "$Self->{OperationName}: Search Parameters",
        Data    => \%SearchParams,
    );

    my $ConfigItemIDs = $ConfigItemObject->ConfigItemSearchExtended(%SearchParams);

    if ( IsArrayRefWithData($ConfigItemIDs) ) {
        return {
            Success => 1,
            Data    => {
                ConfigItemIDs => $ConfigItemIDs,
            },
        };
    }
    return {
        Success => 1,
        Data    => {
            ConfigItemIDs => '',
        },
    };
}

=item _CheckSearchXMLData()

checks if the given XMLData value are valid.

    my $XMLDataCheck = $CommonObject->_CheckSearchXMLData(
        Definition => $DefinitionArrayRef,          # Config Item Definition ot just part of it
        XMLData    => $XMLDataHashRef,
        Parent     => 'some parent',
    );

    returns:

    $XMLDataCheck = {
        Success => 1,                               # if everything is OK
    }

    $XMLDataCheck = {
        ErrorCode    => 'Function.Error',           # if error
        ErrorMessage => 'Error description',
    }

=cut

sub _CheckSearchXMLData {
    my ( $Self, %Param ) = @_;

    my $Definition = $Param{Definition};
    my $XMLData    = $Param{XMLData};
    my $Parent     = $Param{Parent} || '';

    my $CheckValueResult;
    for my $DefItem ( @{$Definition} ) {
        my $ItemKey = $DefItem->{Key};

        if ( ref $XMLData->{$ItemKey} eq 'ARRAY' ) {
            for my $ArrayItem ( @{ $XMLData->{$ItemKey} } ) {
                if ( ref $ArrayItem eq 'HASH' ) {
                    $CheckValueResult = $Self->_CheckValue(
                        Value   => $ArrayItem->{$ItemKey},
                        Input   => $DefItem->{Input},
                        ItemKey => $ItemKey,
                        Parent  => $Parent,
                    );
                    if ( !$CheckValueResult->{Success} ) {
                        return $CheckValueResult;
                    }
                }
                elsif ( ref $ArrayItem eq '' ) {
                    $CheckValueResult = $Self->_CheckValue(
                        Value   => $ArrayItem,
                        Input   => $DefItem->{Input},
                        ItemKey => $ItemKey,
                        Parent  => $Parent,
                    );
                    if ( !$CheckValueResult->{Success} ) {
                        return $CheckValueResult;
                    }
                }
                else {
                    return {
                        ErrorCode => "$Self->{OperationName}.InvalidParameter",
                        ErrorMessage =>
                            "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter"
                            . " is invalid!",
                    };
                }
            }
        }
        elsif ( ref $XMLData->{$ItemKey} eq 'HASH' ) {
            if ( $XMLData->{$ItemKey}->{$ItemKey} ) {
                $CheckValueResult = $Self->_CheckValue(
                    Value   => $XMLData->{$ItemKey}->{$ItemKey},
                    Input   => $DefItem->{Input},
                    ItemKey => $ItemKey,
                    Parent  => $Parent,
                );
                if ( !$CheckValueResult->{Success} ) {
                    return $CheckValueResult;
                }
            }
        }
        else {

            # only perform checks if item really exits in the XMLData
            # CountNin checks was verified and passed before!, so it is safe to skip if needed
            if ( $XMLData->{$ItemKey} ) {
                $CheckValueResult = $Self->_CheckValue(
                    Value   => $XMLData->{$ItemKey},
                    Input   => $DefItem->{Input},
                    ItemKey => $ItemKey,
                    Parent  => $Parent,
                );
                if ( !$CheckValueResult->{Success} ) {
                    return $CheckValueResult;
                }
            }
        }

        # check if there is a sub and start recursion
        if ( defined $DefItem->{Sub} ) {

            if ( ref $XMLData->{$ItemKey} eq 'ARRAY' ) {
                my $Counter = 0;
                for my $ArrayItem ( @{ $XMLData->{$ItemKey} } ) {

                    # start recursion for each array item
                    my $XMLDataCheck = $Self->_CheckSearchXMLData(
                        Definition => $DefItem->{Sub},
                        XMLData    => $ArrayItem,
                        Parent     => $Parent . $ItemKey . "[$Counter]->",
                    );
                    if ( !$XMLDataCheck->{Success} ) {
                        return $XMLDataCheck;
                    }
                    $Counter++;
                }
            }
            elsif ( ref $XMLData->{$ItemKey} eq 'HASH' ) {

                # start recursion
                my $XMLDataCheck = $Self->_CheckSearchXMLData(
                    Definition => $DefItem->{Sub},
                    XMLData    => $XMLData->{$ItemKey},
                    Parent     => $Parent . $ItemKey . '->',
                );
                if ( !$XMLDataCheck->{Success} ) {
                    return $XMLDataCheck;
                }
            }
            else {

                # start recusrsion
                my $XMLDataCheck = $Self->_CheckSearchXMLData(
                    Definition => $DefItem->{Sub},
                    XMLData    => {},
                    Parent     => $Parent . $ItemKey . '->',
                );
                if ( !$XMLDataCheck->{Success} ) {
                    return $XMLDataCheck;
                }
            }
        }
    }

    return {
        Success => 1,
        }
}

=item _CheckValue()

checks if the given value is valid.

    my $ValueCheck = $CommonObject->_CheckValue(
        Value   => $Value                        # $Value could be a string, a time stamp,
                                                 #   general catalog class name, or a integer
        Input   => $InputDefinitionHashRef,      # The definition of the element input extracted
                                                 #   from the Configuration Item definition for
                                                 #   for each value
        ItemKey => 'some key',                   # The name of the value as sent in the SOAP
                                                 #   request
        Parent  => 'soem parent key->',          # The name of the parent followed by -> or empty
                                                 #   for root key items
    );

    returns:

    $ValueCheck = {
        Success => 1,                            # if everything is OK
    }

    $ValueCheck = {
        ErrorCode    => 'Function.Error',        # if error
        ErrorMessage => 'Error description',
    }

=cut

sub _CheckValue {
    my ( $Self, %Param ) = @_;

    my $Parent  = $Param{Parent};
    my $ItemKey = $Param{ItemKey};

    if ( $Param{Input}->{Type} eq 'Text' || $Param{Input}->{Type} eq 'TextArea' ) {

        # run Text validations
        if ( !$Self->ValidateInputText(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " excedes the maxium length!",
            };
        }
    }
    elsif ( $Param{Input}->{Type} eq 'Date' ) {

        # run Date validations
        if ( !$Self->ValidateInputDate(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " is not a valid Date format!",
            };
        }
    }
    elsif ( $Param{Input}->{Type} eq 'DateTime' ) {

        # run DateTime validations
        if ( !$Self->ValidateInputDateTime(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " is not a valid DateTime format!",
            };
        }
    }
    elsif ( $Param{Input}->{Type} eq 'Customer' ) {

        # run Customer validations
        if ( !$Self->ValidateInputCustomer(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " is not a valid customer!",
            };
        }
    }
    elsif ( $Param{Input}->{Type} eq 'CustomerCompany' ) {

        # run CustomerCompany validations
        if ( !$Self->ValidateInputCustomerCompany(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " is not a valid customer company!",
            };
        }
    }
    elsif ( $Param{Input}->{Type} eq 'Integer' ) {

        # run Integer validations
        if ( !$Self->ValidateInputInteger(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " is not a valid Integer or out of range!",
            };
        }
    }
    elsif ( $Param{Input}->{Type} eq 'GeneralCatalog' ) {

        # run General Catalog validations
        if ( !$Self->ValidateInputGeneralCatalog(%Param) ) {
            return {
                ErrorCode => "$Self->{OperationName}.InvalidParameter",
                ErrorMessage =>
                    "$Self->{OperationName}: ConfigItem->CIXMLData->$Parent$ItemKey parameter value"
                    . " is not a valid for General Catalog '$Param{Input}->{Class}'!",
            };
        }
    }
    else {

        # The type is dummy, do nothing
    }

    return {
        Success => 1,
    };
}

=item _FormatSearchXMLData()

Create a XMLData suitable for ConfigItemSeach.

    my $NewXMLData = $OperationObject->_FormatSearchXMLData(
        XMLData    => $XMLDataHashRef,
        Child      => 1,                    # or 0, optional
    );

    returns:

    $NewXMLData = $XMLDataHashRef,                  # suitable for version add

=cut

sub _FormatSearchXMLData {
    my ( $Self, %Param ) = @_;

    my $XMLData = $Param{XMLData};
    my $Parent  = $Param{Parent} || '';
    my $Child   = $Param{Child};

    my $NewXMLData = $Param{NewXMLData} || {};

    for my $RootKey ( sort keys %{$XMLData} ) {
        if ( ref $XMLData->{$RootKey} eq 'ARRAY' ) {

            for my $ArrayItem ( @{ $XMLData->{$RootKey} } ) {
                if ( ref $ArrayItem eq 'HASH' ) {

                    # extract the root key from the hash and assing it to content key
                    my $Content = delete $ArrayItem->{$RootKey};

                    # start recursion
                    my $NewXMLDataPart = $Self->_FormatSearchXMLData(
                        XMLData => $ArrayItem,
                        Parent  => $Parent . $RootKey . '::',
                        Child   => 1,
                    );

                    if ($Content) {
                        push @{ $NewXMLData->{ $Parent . $RootKey } }, $Content;
                    }

                    # assamble the final value from the parts
                    for my $NewKey ( %{$NewXMLDataPart} ) {
                        for my $Item ( @{ $NewXMLDataPart->{$NewKey} } ) {
                            push @{ $NewXMLData->{$NewKey} }, $Item;
                        }
                    }
                }
                elsif ( ref $ArrayItem eq '' ) {
                    push @{ $NewXMLData->{ $Parent . $RootKey } }, $ArrayItem;
                }
            }
        }

        elsif ( ref $XMLData->{$RootKey} eq 'HASH' ) {

            # extract the root key from the hash and assing it to content key
            my $Content = delete $XMLData->{$RootKey}->{$RootKey};

            # start recursion
            my $NewXMLDataPart = $Self->_FormatSearchXMLData(
                XMLData => $XMLData->{$RootKey},
                Parent  => $Parent . $RootKey . "::",
                Child   => 1,
            );

            if ($Content) {
                push @{ $NewXMLData->{ $Parent . $RootKey } }, $Content;
            }

            # assamble the final value from the part
            %{$NewXMLData} = ( %{$NewXMLData}, %{$NewXMLDataPart} );
        }

        elsif ( ref $XMLData->{$RootKey} eq '' ) {
            push @{ $NewXMLData->{ $Parent . $RootKey } }, $XMLData->{$RootKey};
        }
    }

    # return only the part on recursion
    if ($Child) {
        return $NewXMLData;
    }

    # return the complete XMLData as needed for ConfigItemSearch
    my @ReturnStructure;
    for my $SearchParam ( sort keys %{$NewXMLData} ) {
        my $SearchKey = $SearchParam;
        $SearchKey =~ s{ :: }{\'\}[%]\{\'}xmsg;
        $SearchKey = "[1]{'Version'}[1]{'$SearchKey'}[%]{'Content'}";
        push @ReturnStructure, {
            $SearchKey => $NewXMLData->{$SearchParam},
        };
    }
    return \@ReturnStructure;
}

1;

=end Internal:

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
