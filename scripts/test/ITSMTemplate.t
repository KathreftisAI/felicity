# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars qw($Self);

use Data::Dumper;
use List::Util qw(max);

## nofilter(TidyAll::Plugin::OTRS::Perl::TestSubs)

# ---------------------------------------------------------------------------- #
# Note for developers:
# Please note that the keys in %ChangeDefinitions (resp. WorkOrderDefinitions )
# have to be identical with the key names in %TemplateDefinitions
# ---------------------------------------------------------------------------- #

# ------------------------------------------------------------ #
# make preparations
# ------------------------------------------------------------ #
my $TestCount = 1;

# create common objects
my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');
my $ValidObject        = $Kernel::OM->Get('Kernel::System::Valid');
my $ChangeObject       = $Kernel::OM->Get('Kernel::System::ITSMChange');
my $ConditionObject    = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition');
my $WorkOrderObject    = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');
my $TemplateObject     = $Kernel::OM->Get('Kernel::System::ITSMChange::Template');
my $HTMLUtilsObject    = $Kernel::OM->Get('Kernel::System::HTMLUtils');

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

# test if change object was created successfully
$Self->True(
    $TemplateObject,
    "Test " . $TestCount++ . ' - construction of template object',
);
$Self->Is(
    ref $TemplateObject,
    'Kernel::System::ITSMChange::Template',
    "Test " . $TestCount++ . ' - class of template object',
);

# define needed variable
my $RandomID     = $Helper->GetRandomID();
my $RandomNumber = $Helper->GetRandomNumber();

# ------------------------------------------------------------ #
# create needed users and customer users
# ------------------------------------------------------------ #
my @CustomerUserIDs;    # a list of existing and valid customer user ids, a list of strings

# disable email checks to create new user
my $CheckEmailAddressesOrg = $ConfigObject->Get('CheckEmailAddresses');
if ( !defined $CheckEmailAddressesOrg ) {
    $CheckEmailAddressesOrg = 1;
}
$ConfigObject->Set(
    Key   => 'CheckEmailAddresses',
    Value => 0,
);

for my $Counter ( 1 .. 3 ) {

    # create new customers for the tests
    my $CustomerUserID = $CustomerUserObject->CustomerUserAdd(
        Source         => 'CustomerUser',
        UserFirstname  => 'ITSMChangeCustomer' . $Counter,
        UserLastname   => 'UnitTestCustomer',
        UserCustomerID => 'UCT' . $Counter . $RandomID,
        UserLogin      => 'UnitTest-ITSMTemplate-Customer-' . $Counter . $RandomID,
        UserEmail      => 'UnitTest-ITSMTemplate-Customer-'
            . $Counter
            . $RandomID
            . '@localhost',
        ValidID => $ValidObject->ValidLookup( Valid => 'valid' ),
        UserID  => 1,
    );
    push @CustomerUserIDs, $CustomerUserID;
}

# ------------------------------------------------------------ #
# test Template API
# ------------------------------------------------------------ #

# define public interface (in alphabetical order)
my @ObjectMethods = qw(
    TemplateAdd
    TemplateDelete
    TemplateUpdate
    TemplateSearch
    TemplateSerialize
    TemplateDeSerialize
    TemplateTypeLookup
    TemplateList
    TemplateGet
);

# check if subs are available
for my $ObjectMethod (@ObjectMethods) {
    $Self->True(
        $TemplateObject->can($ObjectMethod),
        "Test " . $TestCount++ . " - check 'can $ObjectMethod'",
    );
}

# ------------------------------------------------------------ #
# search for default Template types
# ------------------------------------------------------------ #

# define default Template types
my @DefaultTypes = qw(
    ITSMChange
    ITSMWorkOrder
    ITSMCondition
    CAB
);

# investigate the default types
for my $Type (@DefaultTypes) {

    # look up the state name
    my $LookedUpTypeID = $TemplateObject->TemplateTypeLookup(
        TemplateType => $Type,
    );

    $Self->True(
        $LookedUpTypeID,
        "Look up type '$Type'",
    );

    # do the reverse lookup
    my $LookedUpType = $TemplateObject->TemplateTypeLookup(
        TemplateTypeID => $LookedUpTypeID,
    );

    $Self->Is(
        $LookedUpType,
        $Type,
        "Look up type id '$LookedUpTypeID'",
    );
}

# now some param checks for ChangeStateLookup
my $LookupOk = $TemplateObject->TemplateTypeLookup();

$Self->False(
    $LookupOk,
    'No params passed to TemplateTypeLookup()',
);

$LookupOk = $TemplateObject->TemplateTypeLookup(
    TemplateType   => 'approved',
    TemplateTypeID => 2,
);

$Self->False(
    $LookupOk,
    'Exclusive params passed to TemplateTypeLookup()',
);

$LookupOk = $TemplateObject->TemplateTypeLookup(
    TemplateTypes => 'ITSMAnything',
);

$Self->False(
    $LookupOk,
    "Incorrect param 'TemplateTypes' passed to TemplateTypeLookup()",
);

# ------------------------------------------------------------ #
# general template tests
# ------------------------------------------------------------ #

# store current TestCount for better test case recognition
my $TestCountMisc = $TestCount;

# An unique identifier, so that data from different test runs
# won't be mixed up. The string is formated to a constant length,
# as the conversion to plain text with ToAscii() depends on the string length.
my $UniqueSignature = sprintf 'UnitTest-ITSMTemplate-%06d_%010d',
    $RandomNumber,
    time();

my %ChangeDefinitions = (
    BaseChange => {
        ChangeTitle     => 'ASCII Change - Title - ' . $UniqueSignature,
        Description     => 'ASCII Change - Description - ' . $UniqueSignature,
        Justification   => 'ASCII Change - Justification - ' . $UniqueSignature,
        ChangeManagerID => 1,
        ChangeBuilderID => 1,
        CABAgents       => [
            1,
        ],
        CABCustomers => [
            @CustomerUserIDs,
        ],
    },
    UnicodeChange => {
        ChangeTitle   => "Unicode Change - Title äöü - $UniqueSignature",
        Description   => 'Unicode Change - Description - ' . $UniqueSignature,
        Justification => "Unicode Change - Justification "
            . "\x{167}\x{b6}\x{20ac}\@\x{142}\x{142}\x{138}j\x{f0}\x{b5}\x{ab}\x{df}\x{bb} "
            . "- $UniqueSignature",
        ChangeManagerID => 1,
        ChangeBuilderID => 1,
        CABAgents       => [
            1,
        ],
    },
    EntityChange => {
        ChangeTitle => 'Entity Change - Title - ' . $UniqueSignature,
        Description =>
            'Entity Change - Description - registered:"&reg;" - non-blocking-space:"&nbsp;" - '
            . $UniqueSignature,
        Justification =>
            'Entity Change - Justification - registered:"&reg;" - non-blocking-space:"&nbsp;" - '
            . $UniqueSignature,
        ChangeManagerID => 1,
        ChangeBuilderID => 1,
        CABAgents       => [
            1,
        ],
        CABCustomers => [
            @CustomerUserIDs,
        ],
    },
    ContainerChange => {
        ChangeTitle     => 'Container Change - Title - ' . $UniqueSignature,
        Description     => 'Container Change - Description - ' . $UniqueSignature,
        Justification   => 'Container Change - Justification - ' . $UniqueSignature,
        ChangeManagerID => 1,
        ChangeBuilderID => 1,
        CABAgents       => [
            1,
        ],
    },
    TargetChange => {
        ChangeTitle     => 'Target Change - Title - ' . $UniqueSignature,
        Description     => 'Target Change - Description - ' . $UniqueSignature,
        Justification   => 'Target Change - Justification - ' . $UniqueSignature,
        ChangeManagerID => 1,
        ChangeBuilderID => 1,
        CABAgents       => [
            1,
        ],
    },
);

# create change that should act as the base for the template test
my %CreatedChangeID;

for my $ChangeName ( sort keys %ChangeDefinitions ) {
    $CreatedChangeID{$ChangeName} = $ChangeObject->ChangeAdd(
        %{ $ChangeDefinitions{$ChangeName} },
        UserID => 1,
    );

    $Self->True(
        $CreatedChangeID{$ChangeName},
        "Test $TestCount: ChangeAdd() - $CreatedChangeID{$ChangeName} created ($ChangeName)",
    );
}

for my $ChangeName ( sort keys %CreatedChangeID ) {
    my $ChangeID = $CreatedChangeID{$ChangeName};

    $Self->True(
        $ChangeID,
        "Test $TestCount: ChangeAdd() - $ChangeID created ($ChangeName)",
    );

    my $Change = $ChangeObject->ChangeGet(
        ChangeID => $CreatedChangeID{$ChangeName},
        UserID   => 1,
    );

    # check change attributes
    for my $RequestedAttribute ( sort keys %{ $ChangeDefinitions{$ChangeName} } ) {

        # turn off all pretty print
        local $Data::Dumper::Indent = 0;
        local $Data::Dumper::Useqq  = 1;

        # dump the attribute from ChangeGet() and the reference attribute
        ## no critic
        my $ChangeAttribute    = Data::Dumper::Dumper( $Change->{$RequestedAttribute} );
        my $ReferenceAttribute = Data::Dumper::Dumper( $ChangeDefinitions{$ChangeName}->{$RequestedAttribute} );
        ## use critic

        $Self->Is(
            $ChangeAttribute,
            $ReferenceAttribute,
            "Test $TestCount: |- $RequestedAttribute (ChangeID: $ChangeID)",
        );
    }

    $TestCount++;
}

# add workorders
my %WorkOrderDefinitions = (
    ASCIIWorkOrder => {
        ChangeID       => $CreatedChangeID{ContainerChange},
        WorkOrderTitle => 'Just an ASCII workorder title - ' . $UniqueSignature,
    },
    UmlautsWorkOrder => {
        ChangeID       => $CreatedChangeID{ContainerChange},
        WorkOrderTitle => 'Workorder title with german umlauts äöü- ' . $UniqueSignature,
    },
    UnicodeWorkOrder => {
        ChangeID       => $CreatedChangeID{ContainerChange},
        WorkOrderTitle => 'Workorder title with unicode chars \x{167}\x{b6}\x{20ac} - '
            . $UniqueSignature,
    },
);

my %CreatedWorkOrderID;
for my $WorkOrderName ( sort keys %WorkOrderDefinitions ) {

    # add workorder
    $CreatedWorkOrderID{$WorkOrderName} = $WorkOrderObject->WorkOrderAdd(
        %{ $WorkOrderDefinitions{$WorkOrderName} },
        UserID => 1,
    );

    my $WorkOrderID = $CreatedWorkOrderID{$WorkOrderName};

    # get workorder
    my $WorkOrder = $WorkOrderObject->WorkOrderGet(
        WorkOrderID => $WorkOrderID,
        UserID      => 1,
    );

    # check workorder attributes
    for my $RequestedAttribute ( sort keys %{ $WorkOrderDefinitions{$WorkOrderName} } ) {

        # turn off all pretty print
        local $Data::Dumper::Indent = 0;
        local $Data::Dumper::Useqq  = 1;

        # dump the attribute from ChangeGet() and the reference attribute
        ## no critic
        my $WorkOrderAttribute = Data::Dumper::Dumper( $WorkOrder->{$RequestedAttribute} );
        my $ReferenceAttribute = Data::Dumper::Dumper( $WorkOrderDefinitions{$WorkOrderName}->{$RequestedAttribute} );
        ## use critic

        $Self->Is(
            $WorkOrderAttribute,
            $ReferenceAttribute,
            "Test $TestCount: |- $RequestedAttribute (WorkOrderID: $WorkOrderID)",
        );

        $TestCount++;
    }
}

# add conditions
my %ConditionDefinitions = (
    SimpleCondition => {
        ConditionAdd => {
            ChangeID              => $CreatedChangeID{BaseChange},
            Name                  => 'Simple Condition - ' . $UniqueSignature,
            ExpressionConjunction => 'all',
            ValidID               => $ValidObject->ValidLookup( Valid => 'valid' ),
            UserID                => 1,
        },
        ExpressionAdd => {
            ObjectID => {
                ObjectLookup => {
                    Name => 'ITSMChange',
                },
            },
            AttributeID => {
                AttributeLookup => {
                    Name => 'ChangeTitle',
                },
            },
            OperatorID => {
                OperatorLookup => {
                    Name => 'is',
                },
            },

            # static fields
            #ConditionID  => ..., # This is filled by following code
            Selector     => $CreatedChangeID{BaseChange},
            CompareValue => 'DummyCompareValue1',
            UserID       => 1,
        },
        ActionAdd => {
            ObjectID => {
                ObjectLookup => {
                    Name   => 'ITSMChange',
                    UserID => 1,
                },
            },
            AttributeID => {
                AttributeLookup => {
                    Name   => 'ChangeTitle',
                    UserID => 1,
                },
            },
            OperatorID => {
                OperatorLookup => {
                    Name   => 'set',
                    UserID => 1,
                },
            },

            # static fields
            #ConditionID  => ..., # This is filled by following code
            Selector    => $CreatedChangeID{BaseChange},
            ActionValue => 'New Change Title' . $UniqueSignature . $RandomID,
            UserID      => 1,
            }
    },
);

my %CreatedConditionID;

CONDITIONNAME:
for my $ConditionName ( sort keys %ConditionDefinitions ) {
    my $ConditionData = $ConditionDefinitions{$ConditionName}->{ConditionAdd};
    my $ConditionID   = $ConditionObject->ConditionAdd(
        %{$ConditionData},
    );

    $Self->True(
        $ConditionID,
        "Test $TestCount: Add Condition $ConditionName",
    );

    next CONDITIONNAME if !$ConditionID;

    $CreatedConditionID{$ConditionName} = $ConditionID;

    my $ExpressionData = $ConditionDefinitions{$ConditionName}->{ExpressionAdd};
    my $ExpressionID = _ExpressionAdd( $ExpressionData, $ConditionID );

    my $ActionData = $ConditionDefinitions{$ConditionName}->{ActionAdd};
    my $ActionID = _ActionAdd( $ActionData, $ConditionID );
}
continue {
    $TestCount++;
}

# ------------------------------- #
# create templates
# ------------------------------- #
my %TestedTemplateID;
my %TestedTemplateStrings;

my %TemplateDefinitions = (
    BaseChange => {
        Name     => 'Base Change Template - ' . $UniqueSignature,
        Type     => 'ITSMChange',
        ValidID  => $ValidObject->ValidLookup( Valid => 'valid' ),
        ChangeID => $CreatedChangeID{BaseChange},
        UserID   => 1,
    },
    UnicodeChange => {
        Name     => 'Unicode Change Template - ' . $UniqueSignature,
        Type     => 'ITSMChange',
        ValidID  => $ValidObject->ValidLookup( Valid => 'valid' ),
        ChangeID => $CreatedChangeID{UnicodeChange},
        UserID   => 1,
    },
    EntityChange => {
        Name     => 'Entity Change Template - ' . $UniqueSignature,
        Type     => 'ITSMChange',
        ValidID  => $ValidObject->ValidLookup( Valid => 'valid' ),
        ChangeID => $CreatedChangeID{EntityChange},
        UserID   => 1,
    },
    ASCIIWorkOrder => {
        Name        => 'Ascii WorkOrder Template - ' . $UniqueSignature,
        Type        => 'ITSMWorkOrder',
        ValidID     => $ValidObject->ValidLookup( Valid => 'valid' ),
        WorkOrderID => $CreatedWorkOrderID{ASCIIWorkOrder},
        UserID      => 1,
    },
    UmlautsWorkOrder => {
        Name        => 'Umlauts WorkOrder Template - ' . $UniqueSignature,
        Type        => 'ITSMWorkOrder',
        ValidID     => $ValidObject->ValidLookup( Valid => 'valid' ),
        WorkOrderID => $CreatedWorkOrderID{UmlautsWorkOrder},
        UserID      => 1,
    },
    UnicodeWorkOrder => {
        Name        => 'Unicode WorkOrder Template - ' . $UniqueSignature,
        Type        => 'ITSMWorkOrder',
        ValidID     => $ValidObject->ValidLookup( Valid => 'valid' ),
        WorkOrderID => $CreatedWorkOrderID{UnicodeWorkOrder},
        UserID      => 1,
    },
    CABCustomerAgent => {
        Name     => 'Customer and Agent CAB Template - ' . $UniqueSignature,
        Type     => 'CAB',
        ValidID  => $ValidObject->ValidLookup( Valid => 'valid' ),
        ChangeID => $CreatedChangeID{BaseChange},
        UserID   => 1,
    },
    SimpleCondition => {
        Name        => 'Simple Condition Template - ' . $UniqueSignature,
        Type        => 'ITSMCondition',
        ValidID     => $ValidObject->ValidLookup( Valid => 'valid' ),
        ConditionID => $CreatedConditionID{SimpleCondition},
        UserID      => 1,
    },
);

for my $TemplateDefinitionName ( sort keys %TemplateDefinitions ) {

    # create simple change template
    $TemplateDefinitions{$TemplateDefinitionName}->{Content} =
        $TemplateObject->TemplateSerialize(
        %{ $TemplateDefinitions{$TemplateDefinitionName} },
        TemplateType => $TemplateDefinitions{$TemplateDefinitionName}->{Type},
        );

    # check serialization
    $Self->True(
        $TemplateDefinitions{$TemplateDefinitionName}->{Content},
        "Test $TestCount: TemplateSerialize for $TemplateDefinitionName",
    );

    # add template
    $TestedTemplateID{$TemplateDefinitionName} = $TemplateObject->TemplateAdd(
        %{ $TemplateDefinitions{$TemplateDefinitionName} },
        TemplateType => $TemplateDefinitions{$TemplateDefinitionName}->{Type},
    );

    my $TemplateID = $TestedTemplateID{$TemplateDefinitionName};

    # check template ID
    $Self->True(
        $TemplateID,
        "Test $TestCount: |- TemplateAdd for $TemplateDefinitionName",
    );

    # get created template
    my $Template = $TemplateObject->TemplateGet(
        TemplateID => $TemplateID,
        UserID     => 1,
    );

    # check template attributes name, type and content
    for my $Attribute (qw(Name Type Content)) {
        $Self->Is(
            $Template->{$Attribute},
            $TemplateDefinitions{$TemplateDefinitionName}->{$Attribute},
            "Test $TestCount: |- $Attribute (TemplateID: $TemplateID)",
        );
    }

    $TestCount++;
}

# create objects based on templates
my @ChangeIDs;

CHANGETEMPLATENAME:
for my $ChangeTemplateName ( sort keys %CreatedChangeID ) {

    # get template id
    my $TemplateID = $TestedTemplateID{$ChangeTemplateName};

    next CHANGETEMPLATENAME if !$TemplateID;

    # deserialize template
    my $ChangeID = $TemplateObject->TemplateDeSerialize(
        TemplateID => $TemplateID,
        UserID     => 1,
    );

    # check change id
    $Self->True(
        $ChangeID,
        "Test $TestCount: Create change based on template (TemplateID: $TemplateID)",
    );

    # get change data
    my $Change = $ChangeObject->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => 1,
    );

    # check change attributes
    for my $RequestedAttribute ( sort keys %{ $ChangeDefinitions{$ChangeTemplateName} } ) {

        # turn off all pretty print
        local $Data::Dumper::Indent = 0;
        local $Data::Dumper::Useqq  = 1;

        # dump the attribute from ChangeGet() and the reference attribute
        ## no critic
        my $ChangeAttribute    = Data::Dumper::Dumper( $Change->{$RequestedAttribute} );
        my $ReferenceAttribute = Data::Dumper::Dumper(
            $ChangeDefinitions{$ChangeTemplateName}->{$RequestedAttribute}
        );
        ## use critic

        $Self->Is(
            $ChangeAttribute,
            $ReferenceAttribute,
            "Test $TestCount: |- $RequestedAttribute (ChangeID: $ChangeID)",
        );
    }

    # check plain version of some arguments, especially whether the result of ToAscii
    # is correctly saved into the database
    ARGUMENT:
    for my $Attribute (qw(Description Justification)) {
        next ARGUMENT if !$ChangeDefinitions{$ChangeTemplateName}->{$Attribute};

        my $ChangeAttribute = $Change->{"${Attribute}Plain"} || '';
        my $ReferenceAttribute = $HTMLUtilsObject->ToAscii(
            String => $ChangeDefinitions{$ChangeTemplateName}->{$Attribute},
        );

        $Self->Is(
            $ChangeAttribute,
            $ReferenceAttribute,
            "Test $TestCount: |- ${Attribute}Plain (ChangeID: $ChangeID)",
        );
    }

    push @ChangeIDs, $ChangeID;

    $TestCount++;
}

WORKORDERTEMPLATENAME:
for my $WorkOrderTemplateName ( sort keys %CreatedWorkOrderID ) {

    # get template id
    my $TemplateID = $TestedTemplateID{$WorkOrderTemplateName};

    next WORKORDERTEMPLATENAME if !$TemplateID;

    # deserialize template
    my $WorkOrderID = $TemplateObject->TemplateDeSerialize(
        TemplateID => $TemplateID,
        ChangeID   => $CreatedChangeID{TargetChange},
        UserID     => 1,
    );

    # check workorder id
    $Self->True(
        $WorkOrderID,
        "Test $TestCount: Create workorder based on template (TemplateID: $TemplateID)",
    );

    # get workorder data
    my $WorkOrder = $WorkOrderObject->WorkOrderGet(
        WorkOrderID => $WorkOrderID,
        UserID      => 1,
    );

    # check workorder attributes
    REQUESTEDATTRIBUTE:
    for my $RequestedAttribute ( sort keys %{ $WorkOrderDefinitions{$WorkOrderTemplateName} } ) {

        next REQUESTEDATTRIBUTE if $RequestedAttribute eq 'ChangeID';

        # turn off all pretty print
        local $Data::Dumper::Indent = 0;
        local $Data::Dumper::Useqq  = 1;

        # dump the attribute from ChangeGet() and the reference attribute
        ## no critic
        my $WorkOrderAttribute = Data::Dumper::Dumper( $WorkOrder->{$RequestedAttribute} );
        my $ReferenceAttribute = Data::Dumper::Dumper(
            $WorkOrderDefinitions{$WorkOrderTemplateName}->{$RequestedAttribute}
        );
        ## use critic

        $Self->Is(
            $WorkOrderAttribute,
            $ReferenceAttribute,
            "Test $TestCount: |- $RequestedAttribute (WorkOrder: $WorkOrderID)",
        );
    }

    $Self->Is(
        $WorkOrder->{ChangeID},
        $CreatedChangeID{TargetChange},
        "Test $TestCount: |- ChangeID (WorkOrder: $WorkOrderID)",
    );

    $TestCount++;
}

CONDITIONTEMPLATENAME:
for my $ConditionTemplateName ( sort keys %CreatedConditionID ) {

    # get template id
    my $TemplateID = $TestedTemplateID{$ConditionTemplateName};

    next CONDITIONTEMPLATENAME if !$TemplateID;

    # deserialize template
    my $ConditionID = $TemplateObject->TemplateDeSerialize(
        TemplateID => $TemplateID,
        ChangeID   => $CreatedChangeID{TargetChange},
        UserID     => 1,
    );

    # check change id
    $Self->True(
        $ConditionID,
        "Test $TestCount: Create condition based on template (TemplateID: $TemplateID)",
    );

    $TestCount++;
}

# get names of CAB templates
my @CABTemplateNames = grep { $TemplateDefinitions{$_}->{Type} eq 'CAB' } keys %TestedTemplateID;

CABTEMPLATENAME:
for my $CABTemplateName (@CABTemplateNames) {

    # get template id
    my $TemplateID = $TestedTemplateID{$CABTemplateName};

    next CABTEMPLATENAME if !$TemplateID;

    # deserialize template
    my $ChangeID = $TemplateObject->TemplateDeSerialize(
        TemplateID => $TemplateID,
        UserID     => 1,
        ChangeID   => $CreatedChangeID{TargetChange},
    );

    # check change id
    $Self->True(
        $ChangeID,
        "Test $TestCount: Create CAB based on template (TemplateID: $TemplateID)",
    );

    # get change data
    my $Change = $ChangeObject->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => 1,
    );

    # get original change
    my $OrigChange = $ChangeObject->ChangeGet(
        ChangeID => $CreatedChangeID{BaseChange},
        UserID   => 1,
    );

    # turn off all pretty print
    local $Data::Dumper::Indent = 0;
    local $Data::Dumper::Useqq  = 1;

    # dump the attribute from ChangeGet() and the reference attribute
    ## no critic
    my $ChangeAttribute    = Data::Dumper::Dumper( [ $Change->{CABAgents},     $Change->{CABCustomers} ] );
    my $ReferenceAttribute = Data::Dumper::Dumper( [ $OrigChange->{CABAgents}, $OrigChange->{CABCustomers} ] );
    ## use critic

    $Self->Is(
        $ChangeAttribute,
        $ReferenceAttribute,
        "Test $TestCount: |- CAB from template (ChangeID: $ChangeID)",
    );

    $TestCount++;
}

# ------------------------------------------------------------ #
# test
# ------------------------------------------------------------ #

# test TemplateList()
my $ChangeTemplateList = $TemplateObject->TemplateList(
    TemplateType => 'ITSMChange',
    UserID       => 1,
);

my @ChangeTemplateNames = grep {
    $TemplateDefinitions{$_}->{Type} eq 'ITSMChange'
} keys %TestedTemplateID;

for my $ChangeTemplateName (@ChangeTemplateNames) {
    my $TemplateID = $TestedTemplateID{$ChangeTemplateName};

    $Self->True(
        exists $ChangeTemplateList->{$TemplateID},
        "Test $TestCount: |- Check ChangeTemplate $TemplateID in TemplateList",
    );

    $TestCount++;
}

my @WorkOrderTemplateNames = grep {
    $TemplateDefinitions{$_}->{Type} eq 'ITSMWorkOrder'
} keys %TestedTemplateID;

my $WorkOrderTemplateList = $TemplateObject->TemplateList(
    TemplateType => 'ITSMWorkOrder',
    UserID       => 1,
);

for my $WorkOrderTemplateName (@WorkOrderTemplateNames) {
    my $TemplateID = $TestedTemplateID{$WorkOrderTemplateName};

    $Self->True(
        exists $WorkOrderTemplateList->{$TemplateID},
        "Test $TestCount: |- Check WorkOrderTemplate $TemplateID in TemplateList",
    );

    $TestCount++;
}

my @ConditionTemplateNames = grep {
    $TemplateDefinitions{$_}->{Type} eq 'ITSMCondition'
} keys %TestedTemplateID;

my $ConditionTemplateList = $TemplateObject->TemplateList(
    TemplateType => 'ITSMCondition',
    UserID       => 1,
);

for my $ConditionTemplateName (@ConditionTemplateNames) {
    my $TemplateID = $TestedTemplateID{$ConditionTemplateName};

    $Self->True(
        exists $ConditionTemplateList->{$TemplateID},
        "Test $TestCount: |- Check ConditionTemplate $TemplateID in TemplateList",
    );

    $TestCount++;
}

my $CABTemplateList = $TemplateObject->TemplateList(
    TemplateType => 'CAB',
    UserID       => 1,
);

for my $CABTemplateName (@CABTemplateNames) {
    my $TemplateID = $TestedTemplateID{$CABTemplateName};

    $Self->True(
        exists $CABTemplateList->{$TemplateID},
        "Test $TestCount: |- Check CABTemplate $TemplateID in TemplateList",
    );

    $TestCount++;
}

# test TemplateSearch()

# test TemplateUpdate()
my %NewValues;

# ------------------------------------------------------------ #
# clean the system
# ------------------------------------------------------------ #

# restore original email check param
$ConfigObject->Set(
    Key   => 'CheckEmailAddresses',
    Value => $CheckEmailAddressesOrg,
);

# delete the test templates
for my $TemplateName ( sort keys %TestedTemplateID ) {
    my $TemplateID = $TestedTemplateID{$TemplateName};

    my $DeleteOk = $TemplateObject->TemplateDelete(
        TemplateID => $TemplateID,
        UserID     => 1,
    );
    $Self->True(
        $DeleteOk,
        "Test $TestCount: TemplateDelete()"
    );

    # double check if change is really deleted
    my $TemplateData = $TemplateObject->TemplateGet(
        TemplateID => $TemplateID,
        UserID     => 1,
    );

    $Self->False(
        $TemplateData->{TemplateID},
        "Test $TestCount: TemplateDelete() - double check",
    );
}
continue {
    $TestCount++;
}

# cleanup is done by RestoreDatabase

sub _ActionAdd {
    my ( $ActionData, $ConditionID ) = @_;

    return if !$ActionData;
    return if ref $ActionData ne 'HASH';

    # hash for adding
    my %ActionAdd;

    # set static fields
    my @StaticFields = qw( Selector ActionValue UserID ConditionID );

    STATICFIELD:
    for my $StaticField (@StaticFields) {

        # omit static field if it is not set
        next STATICFIELD if !exists $ActionData->{$StaticField};
        next STATICFIELD if !defined $ActionData->{$StaticField};

        # safe data
        $ActionAdd{$StaticField} = $ActionData->{$StaticField};
    }

    # get all fields for ActionAdd
    ACTIONADDVALUE:
    for my $ActionAddValue ( sort keys %{$ActionData} ) {

        # omit static fields
        next ACTIONADDVALUE if grep { $_ eq $ActionAddValue } @StaticFields;

        # get values for fields
        for my $FieldValue ( sort keys %{ $ActionData->{$ActionAddValue} } ) {

            # store gathered information in hash for adding
            $ActionAdd{$ActionAddValue} = $ConditionObject->$FieldValue(
                %{ $ActionData->{$ActionAddValue}->{$FieldValue} },
            );
        }
    }

    # add action
    my $ActionID = $ConditionObject->ActionAdd(
        %ActionAdd,
        ConditionID => $ConditionID,
    ) || 0;

    $Self->True(
        $ActionID,
        'Test ' . $TestCount++ . " - ActionAdd -> $ActionID",
    );

    # check for ActionID
    return if !$ActionID;

    # check the added action
    my $ActionGet = $ConditionObject->ActionGet(
        ActionID => $ActionID,
        UserID   => $ActionAdd{UserID},
    );
    $Self->True(
        $ActionGet,
        'Test ' . $TestCount++ . ' - ActionAdd(): ActionGet',
    );

    # delete UserID, it is not returned
    delete $ActionAdd{UserID};

    # test values
    for my $TestValue ( sort keys %ActionAdd ) {
        $Self->Is(
            $ActionGet->{$TestValue},
            $ActionAdd{$TestValue},
            'Test ' . $TestCount++ . " - ActionAdd(): ActionGet -> $TestValue",
        );
    }

    return $ActionID;
}

sub _ExpressionAdd {
    my ( $ExpressionData, $ConditionID ) = @_;
    my %ExpressionAddSourceData = %{$ExpressionData};

    my %ExpressionAddData;

    # set static fields
    my @StaticFields = qw( Selector CompareValue UserID ConditionID );

    STATICFIELD:
    for my $StaticField (@StaticFields) {

        # omit static field if it is not set
        next STATICFIELD if !exists $ExpressionAddSourceData{$StaticField}
            || !defined $ExpressionAddSourceData{$StaticField};

        # safe data
        $ExpressionAddData{$StaticField} = $ExpressionAddSourceData{$StaticField};
    }

    # get all fields for ExpressionAdd
    EXPRESSIONADDVALUE:
    for my $ExpressionAddValue ( sort keys %ExpressionAddSourceData ) {

        # omit static fields
        next EXPRESSIONADDVALUE if grep { $_ eq $ExpressionAddValue } @StaticFields;

        # get values for fields
        for my $FieldValue ( sort keys %{ $ExpressionAddSourceData{$ExpressionAddValue} } ) {

            # store gathered information in hash for adding
            $ExpressionAddData{$ExpressionAddValue} =
                $ConditionObject->$FieldValue(
                %{ $ExpressionAddSourceData{$ExpressionAddValue}->{$FieldValue} },
                );
        }
    }

    # add expression
    my $ExpressionID = $ConditionObject->ExpressionAdd(
        %ExpressionAddData,
        ConditionID => $ConditionID,
    ) || 0;

    $Self->True(
        $ExpressionID,
        'Test ' . $TestCount++ . " - $ExpressionID",
    );

    next CREATEDATA if !$ExpressionID;

    # check the added expression
    my $ExpressionGetData = $ConditionObject->ExpressionGet(
        ExpressionID => $ExpressionID,
        UserID       => $ExpressionAddData{UserID},
    );
    $Self->True(
        $ExpressionGetData,
        'Test ' . $TestCount++ . ' - ExpressionAdd(): ExpressionGet',
    );

    # test values
    delete $ExpressionAddData{UserID};
    for my $TestValue ( sort keys %ExpressionAddData ) {
        $Self->Is(
            $ExpressionGetData->{$TestValue},
            $ExpressionAddData{$TestValue},
            'Test ' . $TestCount++ . " - ExpressionAdd(): ExpressionGet -> $TestValue",
        );
    }

    return $ExpressionID;
}

1;
