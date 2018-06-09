# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangePrint;

use strict;
use warnings;

use List::Util qw(max);
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

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # Find out whether a change or a workorder should be printed.
    # A workorder is to be printed when the WorkOrderID is passed.
    # Otherwise a change should be printed.
    my $WorkOrderID = $ParamObject->GetParam( Param => 'WorkOrderID' );
    my $PrintWorkOrder = $WorkOrderID ? 1 : 0;
    my $PrintChange    = !$WorkOrderID;
    my $WorkOrder      = {};
    my $ChangeID;

    # get needed objects
    my $ChangeObject    = $Kernel::OM->Get('Kernel::System::ITSMChange');
    my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject    = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get config of frontend module
    $Self->{Config} = $ConfigObject->Get("ITSMChange::Frontend::$Self->{Action}");

    if ($PrintWorkOrder) {

        # check permission on the workorder
        my $Access = $WorkOrderObject->Permission(
            Type        => $Self->{Config}->{Permission},
            Action      => $Self->{Action},
            WorkOrderID => $WorkOrderID,
            UserID      => $Self->{UserID},
        );

        # error screen
        if ( !$Access ) {
            return $LayoutObject->NoPermission(
                Message => $LayoutObject->{LanguageObject}
                    ->Translate( 'You need %s permissions!', $Self->{Config}->{Permission} ),
                WithHeader => 'yes',
            );
        }

        # get workorder information
        $WorkOrder = $WorkOrderObject->WorkOrderGet(
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

        # infer the change id from the workorder
        $ChangeID = $WorkOrder->{ChangeID};

        if ( !$ChangeID ) {

            # error page
            return $LayoutObject->ErrorScreen(
                Message => Translatable('Can\'t create output, as the workorder is not attached to a change!'),
                Comment => Translatable('Please contact the admin.'),
            );
        }
    }
    else {

        # the change id is required, as we have no workorder id
        $ChangeID = $ParamObject->GetParam( Param => 'ChangeID' );

        if ( !$ChangeID ) {

            # error page
            return $LayoutObject->ErrorScreen(
                Message => Translatable('Can\'t create output, as no ChangeID is given!'),
                Comment => Translatable('Please contact the admin.'),
            );
        }

        # check permission on the change
        my $Access = $ChangeObject->Permission(
            Type     => $Self->{Config}->{Permission},
            Action   => $Self->{Action},
            ChangeID => $ChangeID,
            UserID   => $Self->{UserID},
        );

        # error screen
        if ( !$Access ) {
            return $LayoutObject->NoPermission(
                Message => $LayoutObject->{LanguageObject}
                    ->Translate( 'You need %s permissions!', $Self->{Config}->{Permission} ),
                WithHeader => 'yes',
            );
        }
    }

    # get change information
    my $Change = $ChangeObject->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => $Self->{UserID},
    );

    # check error
    if ( !$Change ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}->Translate( 'Change "%s" not found in database!', $ChangeID ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # some init for PDF-Output
    # page controls the PDF-generation
    $Self->{Page} = {};
    my $Page = $Self->{Page};

    # get maximum number of pages
    $Page->{MaxPages} = $ConfigObject->Get('PDF::MaxPages');
    if ( !$Page->{MaxPages} || $Page->{MaxPages} < 1 || $Page->{MaxPages} > 1000 ) {
        $Page->{MaxPages} = 100;
    }

    # page layout settings
    $Page->{MarginTop}    = 30;
    $Page->{MarginRight}  = 40;
    $Page->{MarginBottom} = 40;
    $Page->{MarginLeft}   = 40;

    # the second item in the page title is the area in the product 'ITSM Change Management'
    my $HeaderArea = $PrintChange ? 'ITSM Change' : 'ITSM Workorder';
    $HeaderArea = $LayoutObject->{LanguageObject}->Translate($HeaderArea);

    # the last item in the page title is either the change number of the full workorder number
    my $HeaderValue = $PrintChange
        ?
        $Change->{ChangeNumber}
        :
        join( '-', $Change->{ChangeNumber}, $WorkOrder->{WorkOrderNumber} );

    # start the document
    my $Output = $Self->_StartDocument(
        HeaderArea  => $HeaderArea,
        HeaderValue => $HeaderValue,
    );

    # get link object
    my $LinkObject = $Kernel::OM->Get('Kernel::System::LinkObject');

    # the link types are needed for showing the linked objects
    my %LinkTypeList = $LinkObject->TypeList(
        UserID => $Self->{UserID},
    );

    # print the change specific stuff
    if ($PrintChange) {

        # start the first page
        $Output .= $Self->_OutputHeadline(
            HeaderArea     => $HeaderArea,
            HeaderValue    => $HeaderValue,
            Title          => $Change->{ChangeTitle} || Translatable('unknown change title'),
            TemplatePrefix => 'Change',
        );

        # output change info
        $Output .= $Self->_OutputChangeInfo(
            Change         => $Change,
            PrintWorkOrder => $PrintWorkOrder,
        );

        # output change description and justification
        # the plain content will be displayed
        for my $Attribute (qw(Description Justification)) {
            $Output .= $Self->_OutputLongText(
                PrintChange    => $PrintChange,
                PrintWorkOrder => $PrintWorkOrder,
                Title =>
                    $LayoutObject->{LanguageObject}->Translate($Attribute),
                LongText => $Change->{ $Attribute . 'Plain' },
            );
        }

        # get linked objects which are directly linked with this change object
        my $LinkListWithData = $LinkObject->LinkListWithData(
            Object => 'ITSMChange',
            Key    => $ChangeID,
            State  => 'Valid',
            UserID => $Self->{UserID},
        );

        # get the combined linked objects from all workorders of this change
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
                for my $LinkType ( sort keys %{ $LinkListWithDataWorkOrder->{$Object} } ) {

                    DIRECTION:
                    for my $Direction (
                        sort keys %{ $LinkListWithDataWorkOrder->{$Object}->{$LinkType} }
                        )
                    {
                        ID:
                        for my $ID (
                            sort keys %{
                                $LinkListWithDataWorkOrder->{$Object}->{$LinkType}->{$Direction}
                            }
                            )
                        {

                            # combine the linked object data from all workorders
                            $LinkListWithDataCombinedWorkOrders->{$Object}->{$LinkType}
                                ->{$Direction}->{$ID} = $LinkListWithDataWorkOrder->{$Object}->{$LinkType}->{$Direction}
                                ->{$ID};
                        }
                    }
                }
            }
        }

        # add combined linked objects from workorder to linked objects from change object
        $LinkListWithData = {
            %{$LinkListWithData},
            %{$LinkListWithDataCombinedWorkOrders},
        };

        # get the link data
        if ( $LinkListWithData && ref $LinkListWithData eq 'HASH' && %{$LinkListWithData} ) {
            my %LinkData = $LayoutObject->LinkObjectTableCreate(
                LinkListWithData => $LinkListWithData,
                ViewMode         => 'SimpleRaw',
            );

            $Output .= $Self->_OutputLinkedObjects(
                PrintChange    => $PrintChange,
                PrintWorkOrder => $PrintWorkOrder,
                LinkData       => \%LinkData,
                LinkTypeList   => \%LinkTypeList,
            );
        }

        # output an overview over workorders
        my @WorkOrderOverview;
        for my $WorkOrderID ( @{ $Change->{WorkOrderIDs} } ) {

            # get workorder info
            my $WorkOrder = $WorkOrderObject->WorkOrderGet(
                WorkOrderID => $WorkOrderID,
                UserID      => $Self->{UserID},
            );

            # check error
            if ( !$WorkOrder ) {
                return $LayoutObject->ErrorScreen(
                    Message => $LayoutObject->{LanguageObject}
                        ->Translate( 'WorkOrder "%s" not found in database!', $WorkOrderID ),
                    Comment => Translatable('Please contact the admin.'),
                );
            }

            push @WorkOrderOverview,
                [
                $WorkOrder->{WorkOrderNumber},
                $WorkOrder->{WorkOrderTitle},
                $WorkOrder->{WorkOrderState},
                $WorkOrder->{PlannedStartTime},
                $WorkOrder->{PlannedEndTime},
                $WorkOrder->{ActualStartTime},
                $WorkOrder->{ActualEndTime},
                ];
        }

        $Output .= $Self->_OutputWorkOrderOverview(
            WorkOrderOverview => \@WorkOrderOverview,
        );
    }

    # output either a single workorder or all workorders of a change
    my @WorkOrderIDs = $PrintChange
        ?
        @{ $Change->{WorkOrderIDs} || [] }
        :
        ($WorkOrderID);

    for my $WorkOrderID (@WorkOrderIDs) {

        # get workorder info
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

        # start a new page for every workorder
        my $HeaderArea = $LayoutObject->{LanguageObject}->Translate('ITSM Workorder');
        my $HeaderValue = join '-', $Change->{ChangeNumber}, $WorkOrder->{WorkOrderNumber};

        $Output .= $Self->_OutputHeadline(
            HeaderArea     => $HeaderArea,
            HeaderValue    => $HeaderValue,
            Title          => $WorkOrder->{WorkOrderTitle} || Translatable('unknown workorder title'),
            TemplatePrefix => 'WorkOrder',
        );

        $Output .= $Self->_OutputWorkOrderInfo(
            Change    => $Change,
            WorkOrder => $WorkOrder,
        );

        # output workorder instruction and report
        # The plain content will be displayed
        for my $Attribute (qw(Instruction Report)) {
            $Output .= $Self->_OutputLongText(
                PrintChange    => 0,
                PrintWorkOrder => 1,
                Title =>
                    $LayoutObject->{LanguageObject}->Translate($Attribute),
                LongText => $WorkOrder->{ $Attribute . 'Plain' },
            );
        }

        # get linked objects
        my $LinkListWithData = $LinkObject->LinkListWithData(
            Object => 'ITSMWorkOrder',
            Key    => $WorkOrderID,
            State  => 'Valid',
            UserID => $Self->{UserID},
        );

        # get the link data
        if ( $LinkListWithData && ref $LinkListWithData eq 'HASH' && %{$LinkListWithData} ) {
            my %LinkData = $LayoutObject->LinkObjectTableCreate(
                LinkListWithData => $LinkListWithData,
                ViewMode         => 'SimpleRaw',
            );

            $Output .= $Self->_OutputLinkedObjects(
                PrintChange    => 0,
                PrintWorkOrder => 1,
                LinkData       => \%LinkData,
                LinkTypeList   => \%LinkTypeList,
            );
        }
    }

    # generate PDF output
    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    # generate a filename
    my ( $s, $m, $h, $D, $M, $Y ) = $TimeObject->SystemTime2Date(
        SystemTime => $TimeObject->SystemTime(),
    );
    my $Filename = $PrintChange
        ?
        sprintf(
        'change_%s_%02d-%02d-%02d_%02d-%02d.pdf',
        $Change->{ChangeNumber}, $Y, $M, $D, $h, $m
        )
        :
        sprintf(
        'workorder_%s-%s_%02d-%02d-%02d_%02d-%02d.pdf',
        $Change->{ChangeNumber}, $WorkOrder->{WorkOrderNumber}, $Y, $M, $D, $h, $m
        );

    # return the PDF document
    my $PDFString = $Kernel::OM->Get('Kernel::System::PDF')->DocumentOutput();

    return $LayoutObject->Attachment(
        Filename    => $Filename,
        ContentType => 'application/pdf',
        Content     => $PDFString,
        Type        => 'inline',
    );
}

# start the document
sub _StartDocument {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(HeaderArea HeaderValue)) {
        if ( !defined( $Param{$Needed} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # title of the PDF-Document
    my $Product = $Kernel::OM->Get('Kernel::Config')->Get('Product');
    my $Title = sprintf '%s: %s#%s', $Product, $Param{HeaderArea}, $Param{HeaderValue};

    # create new PDF document
    $Kernel::OM->Get('Kernel::System::PDF')->DocumentNew(
        Title  => $Title,
        Encode => $LayoutObject->{UserCharset},
    );

    return '';

}

# output the headline, create a new page
sub _OutputHeadline {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(HeaderArea HeaderValue Title TemplatePrefix)) {
        if ( !defined( $Param{$Needed} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $PrintedBy    = $LayoutObject->{LanguageObject}->Translate('printed by');
    my $Time         = $LayoutObject->{Time};
    my $UserFullName = $Kernel::OM->Get('Kernel::System::User')->UserName(
        UserID => $Self->{UserID},
    );

    # page controls the PDF-generation
    # page headers and footer
    my $Page = $Self->{Page};
    $Page->{HeaderRight} = sprintf '%s#%s', $Param{HeaderArea}, $Param{HeaderValue};
    $Page->{PageText}    = $LayoutObject->{LanguageObject}->Translate('Page');
    $Page->{PageCount}   = $Self->{Page}->{PageCount} // 1;

    # create new PDF page
    $Kernel::OM->Get('Kernel::System::PDF')->PageNew(
        %{$Page},
        FooterRight => $Page->{PageText} . ' ' . $Page->{PageCount},
    );

    $Self->{Page}->{PageCount}++;

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -6,
    );

    # output title
    $PDFObject->Text(
        Text     => $Param{Title},
        FontSize => 13,
    );

    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -6,
    );

    # output "printed by"
    $PDFObject->Text(
        Text => $PrintedBy . ' '
            . $UserFullName . ' '
            . $Time,
        FontSize => 9,
    );

    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -14,
    );

    return '';
}

# a helper for preparing a table row for PDF generation
sub _PrepareAndAddInfoRow {

    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(RowSpec Data)) {
        if ( !defined( $Param{$Needed} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    my ( $RowSpec, $Data ) = @Param{qw(RowSpec Data)};

    # short name, just for convenience
    my $Attribute = $RowSpec->{Attribute};

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMChange::Frontend::$Self->{Action}");

    # skip if row is switched off in SysConfig
    return if $RowSpec->{IsOptional} && !$Self->{Config}->{$Attribute};

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # keys are always translatable
    my $Key = $RowSpec->{Key} || $Attribute;
    $Key = $LayoutObject->{LanguageObject}->Translate($Key);

    # determine the value
    my $Value;
    if ( $RowSpec->{ValueIsTime} ) {

        # format the time value
        $Value = $LayoutObject->Output(
            Template => '[% Data.' . $Attribute . ' | Localize("TimeLong") %]',
            Data     => $Data,
        );
    }
    elsif ( $RowSpec->{ValueIsUser} ) {

        # format the user id
        if ( $Data->{ $Attribute . 'ID' } ) {

            my $UserFullName = $Kernel::OM->Get('Kernel::System::User')->UserName(
                UserID => $Data->{ $Attribute . 'ID' },
            );

            if ($UserFullName) {
                $Value = $UserFullName;
            }
            else {
                $Value = 'ID=' . $Data->{$Attribute};
            }
        }
    }
    elsif ( $RowSpec->{ValueIsDynamicField} ) {
        $Value = $RowSpec->{Value},
    }
    else {

        # take value from the passed in data
        $Value = $Data->{$Attribute};
    }

    # translate the value
    if ( $Value && $RowSpec->{ValueIsTranslatable} ) {
        $Value = $LayoutObject->{LanguageObject}->Translate($Value),
    }

    # add separator between key and value
    $Key .= ':';

    # show row
    push @{ $RowSpec->{Table} },
        {
        Key   => $Key,
        Value => $Value,
        };

    return;
}

# emit information about a change
sub _OutputChangeInfo {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Change PrintWorkOrder)) {
        if ( !defined( $Param{$Needed} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # just for having shorter names
    my $Change = $Param{Change};

    # fill the two tables on top,
    # both tables have two colums: Key and Value
    my ( @TableLeft, @TableRight );

    # determine values that can't easily be determined in _PrepareAndAddInfoRow()
    my %ComplicatedValue;

    # Values for CAB
    for my $Attribute (qw(CABAgents CABCustomers)) {
        my @LongNames;
        if ( $Attribute eq 'CABAgents' && $Change->{$Attribute} ) {

            for my $CABAgent ( @{ $Change->{$Attribute} } ) {

                my $UserFullName = $Kernel::OM->Get('Kernel::System::User')->UserName(
                    UserID => $CABAgent,
                );

                if ($UserFullName) {
                    push @LongNames, $UserFullName;
                }
                else {
                    push @LongNames, 'ID=' . $CABAgent;
                }
            }
        }
        elsif ( $Attribute eq 'CABCustomers' && $Change->{$Attribute} ) {

            for my $CABCustomer ( @{ $Change->{$Attribute} } ) {

                my %UserData = $Kernel::OM->Get('Kernel::System::CustomerUser')->CustomerUserDataGet(
                    User  => $CABCustomer,
                    Cache => 1,
                );
                if (%UserData) {
                    push @LongNames, sprintf '%s (%s %s)',
                        @UserData{qw(UserLogin UserFirstname UserLastname)};
                }
                else {
                    push @LongNames, 'ID=' . $CABCustomer;
                }
            }
        }

        # remember the value
        $ComplicatedValue{ $Attribute . 'Long' } = join( "\n", @LongNames ) || '-';
    }

    # value for attachments
    {

        # get change object
        my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

        my @Attachments = $ChangeObject->ChangeAttachmentList(
            ChangeID => $Change->{ChangeID},
        );

        my @Values;

        ATTACHMENT:
        for my $Filename (@Attachments) {

            # get info about file
            my $AttachmentData = $ChangeObject->ChangeAttachmentGet(
                ChangeID => $Change->{ChangeID},
                Filename => $Filename,
            );

            # check for attachment information
            next ATTACHMENT if !$AttachmentData;

            push @Values, sprintf '%s %s',
                $AttachmentData->{Filename},
                $AttachmentData->{Filesize};
        }

        # show row
        $ComplicatedValue{Attachments} = join( "\n", @Values ) || '-';
    }

    # get the dynamic fields for this screen
    my $DynamicField = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => [ 'ITSMChange', 'ITSMWorkOrder' ],
        FieldFilter => $Self->{Config}->{DynamicField} || {},
    );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # cycle trough the activated Dynamic Fields
    my @DynamicFieldRowSpec;
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # show only change dynamic fields here
        next DYNAMICFIELD if $DynamicFieldConfig->{ObjectType} ne 'ITSMChange';

        # get dynamic field backend object
        my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

        my $Value = $DynamicFieldBackendObject->ValueGet(
            DynamicFieldConfig => $DynamicFieldConfig,
            ObjectID           => $Change->{ChangeID},
        );

        # get print string for this dynamic field
        my $ValueStrg = $DynamicFieldBackendObject->DisplayValueRender(
            DynamicFieldConfig => $DynamicFieldConfig,
            Value              => $Value,
            ValueMaxChars      => 1000,
            LayoutObject       => $LayoutObject,
        );

        # for empty values
        if ( !$ValueStrg->{Value} ) {
            $ValueStrg->{Value} = '-';
        }

        my $Label = $DynamicFieldConfig->{Label};

        push @DynamicFieldRowSpec, {
            Attribute           => $Label,
            Key                 => $Label,
            ValueIsDynamicField => 1,
            Value               => $ValueStrg->{Value},
            Table               => \@TableLeft,
        };
    }

    my @RowSpec = (
        {
            Attribute           => 'ChangeState',
            Table               => \@TableLeft,
            ValueIsTranslatable => 1,
        },
        {
            Attribute  => 'PlannedEffort',
            IsOptional => 1,
            Table      => \@TableLeft,
        },
        {
            Attribute  => 'AccountedTime',
            IsOptional => 1,
            Table      => \@TableLeft,
        },
        {
            Attribute           => 'Category',
            Key                 => 'Category',
            Table               => \@TableLeft,
            ValueIsTranslatable => 1,
        },
        {
            Attribute           => 'Impact',
            Key                 => 'Impact',
            Table               => \@TableLeft,
            ValueIsTranslatable => 1,
        },
        {
            Attribute           => 'Priority',
            Key                 => 'Priority',
            Table               => \@TableLeft,
            ValueIsTranslatable => 1,
        },
        @DynamicFieldRowSpec,
        {
            Attribute   => 'ChangeManager',
            Table       => \@TableLeft,
            ValueIsUser => 1,
        },
        {
            Attribute   => 'ChangeBuilder',
            Table       => \@TableLeft,
            ValueIsUser => 1,
        },
        {
            Attribute => 'CABAgentsLong',
            Key       => 'CAB Agents',
            Table     => \@TableLeft,
        },
        {
            Attribute => 'CABCustomersLong',
            Key       => 'CAB Customers',
            Table     => \@TableLeft,
        },
        {
            Attribute => 'Attachments',
            Key       => 'Attachments',
            Table     => \@TableLeft,
        },
        {
            Attribute   => 'RequestedTime',
            IsOptional  => 1,
            Table       => \@TableRight,
            ValueIsTime => 1,
        },
        {
            Attribute   => 'PlannedStartTime',
            Table       => \@TableRight,
            ValueIsTime => 1,
        },
        {
            Attribute   => 'PlannedEndTime',
            Table       => \@TableRight,
            ValueIsTime => 1,
        },
        {
            Attribute   => 'ActualStartTime',
            Table       => \@TableRight,
            ValueIsTime => 1,
        },
        {
            Attribute   => 'ActualEndTime',
            Table       => \@TableRight,
            ValueIsTime => 1,
        },
        {
            Attribute   => 'CreateTime',
            Key         => 'Created',
            Table       => \@TableRight,
            ValueIsTime => 1,
        },
        {
            Attribute   => 'ChangeTime',
            Key         => 'Changed',
            Table       => \@TableRight,
            ValueIsTime => 1,
        },
    );

    for my $RowSpec (@RowSpec) {

        # fill @TableLeft and @TableRight
        $Self->_PrepareAndAddInfoRow(
            RowSpec => $RowSpec,
            Data    => { %{$Change}, %ComplicatedValue },
        );
    }

    # number of rows in the change info table
    my $Rows = max( scalar(@TableLeft), scalar(@TableRight) );

    my %Table;
    for my $Row ( 0 .. $Rows - 1 ) {
        $Table{CellData}[$Row][0]{Content}         = $TableLeft[$Row]->{Key};
        $Table{CellData}[$Row][0]{Font}            = 'ProportionalBold';
        $Table{CellData}[$Row][1]{Content}         = $TableLeft[$Row]->{Value};
        $Table{CellData}[$Row][2]{Content}         = ' ';
        $Table{CellData}[$Row][2]{BackgroundColor} = '#FFFFFF';
        $Table{CellData}[$Row][3]{Content}         = $TableRight[$Row]->{Key};
        $Table{CellData}[$Row][3]{Font}            = 'ProportionalBold';
        $Table{CellData}[$Row][4]{Content}         = $TableRight[$Row]->{Value};
    }

    $Table{ColumnData}[0]{Width} = 80;
    $Table{ColumnData}[1]{Width} = 170.5;
    $Table{ColumnData}[2]{Width} = 4;
    $Table{ColumnData}[3]{Width} = 80;
    $Table{ColumnData}[4]{Width} = 170.5;

    $Table{Type}                = 'Cut';
    $Table{Border}              = 0;
    $Table{FontSize}            = 6;
    $Table{BackgroundColorEven} = '#DDDDDD';
    $Table{Padding}             = 1;
    $Table{PaddingTop}          = 3;
    $Table{PaddingBottom}       = 3;

    # output table
    $Self->_PDFOutputTable(
        Table => \%Table,
    );

    return '';

}

# emit information about a workorder
sub _OutputWorkOrderInfo {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Change WorkOrder)) {
        if ( !defined( $Param{$Needed} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    my ( $WorkOrder, $Change ) = @Param{qw(WorkOrder Change)};

    my $PrintWorkOrder = $Param{PrintWorkOrder} || 0;

    # fill the two tables on top,
    # both tables have two colums: Key and Value
    my ( @TableLeft, @TableRight );

    # determine values that can't be determined in _PrepareAndAddInfoRow()
    my %ComplicatedValue;

    # value for attachments
    {

        # get work order object
        my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');

        my @Attachments = $WorkOrderObject->WorkOrderAttachmentList(
            WorkOrderID => $WorkOrder->{WorkOrderID},
        );

        my @Values;

        ATTACHMENT:
        for my $Filename (@Attachments) {

            # get info about file
            my $AttachmentData = $WorkOrderObject->WorkOrderAttachmentGet(
                WorkOrderID => $WorkOrder->{WorkOrderID},
                Filename    => $Filename,
            );

            # check for attachment information
            next ATTACHMENT if !$AttachmentData;

            push @Values, sprintf '%s %s',
                $AttachmentData->{Filename},
                $AttachmentData->{Filesize};
        }

        # show row
        $ComplicatedValue{Attachments} = join( "\n", @Values ) || '-';
    }

    # allow wrapping of long words in the change title
    ( $ComplicatedValue{WrappableChangeTitle} = $Change->{ChangeTitle} )
        =~ s{ ( \S{25} ) }{$1 }xmsg;

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMChange::Frontend::$Self->{Action}");

    # get the dynamic fields for this screen
    my $DynamicField = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => [ 'ITSMChange', 'ITSMWorkOrder' ],
        FieldFilter => $Self->{Config}->{DynamicField} || {},
    );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my @DynamicFieldRowSpec;
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # show only workorder dynamic fields here
        next DYNAMICFIELD if $DynamicFieldConfig->{ObjectType} ne 'ITSMWorkOrder';

        # get dynamic field backend object
        my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

        my $Value = $DynamicFieldBackendObject->ValueGet(
            DynamicFieldConfig => $DynamicFieldConfig,
            ObjectID           => $WorkOrder->{WorkOrderID},
        );

        # get print string for this dynamic field
        my $ValueStrg = $DynamicFieldBackendObject->DisplayValueRender(
            DynamicFieldConfig => $DynamicFieldConfig,
            Value              => $Value,
            ValueMaxChars      => 1000,
            LayoutObject       => $LayoutObject,
        );

        # for empty values
        if ( !$ValueStrg->{Value} ) {
            $ValueStrg->{Value} = '-';
        }

        my $Label = $DynamicFieldConfig->{Label};

        push @DynamicFieldRowSpec, {
            Attribute           => $Label,
            Key                 => $Label,
            ValueIsDynamicField => 1,
            Value               => $ValueStrg->{Value},
            Table               => \@TableLeft,
        };
    }

    my @RowSpec = (
        {
            Attribute => 'WrappableChangeTitle',
            Table     => \@TableLeft,
            Key       => 'ChangeTitle',
        },
        {
            Attribute => 'ChangeNumber',
            Table     => \@TableLeft,
            Key       => 'ChangeNumber',
        },
        {
            Attribute           => 'WorkOrderState',
            Table               => \@TableLeft,
            ValueIsTranslatable => 1,
        },
        {
            Attribute           => 'WorkOrderType',
            Table               => \@TableLeft,
            ValueIsTranslatable => 1,
        },
        {
            Attribute   => 'WorkOrderAgent',
            Table       => \@TableLeft,
            ValueIsUser => 1,
        },
        {
            Attribute  => 'PlannedEffort',
            IsOptional => 1,
            Table      => \@TableLeft,
            Key        => 'PlannedEffort',
        },
        {
            Attribute  => 'AccountedTime',
            IsOptional => 1,
            Table      => \@TableLeft,
            Key        => 'AccountedTime',
        },
        @DynamicFieldRowSpec,
        {
            Attribute => 'Attachments',
            Key       => 'Attachments',
            Table     => \@TableLeft,
        },
        {
            Attribute   => 'PlannedStartTime',
            Table       => \@TableRight,
            ValueIsTime => 1,
            Key         => 'PlannedStartTime',
        },
        {
            Attribute   => 'PlannedEndTime',
            Table       => \@TableRight,
            ValueIsTime => 1,
            Key         => 'PlannedEndTime',
        },
        {
            Attribute   => 'ActualStartTime',
            Table       => \@TableRight,
            ValueIsTime => 1,
            Key         => 'ActualStartTime',
        },
        {
            Attribute   => 'ActualEndTime',
            Table       => \@TableRight,
            ValueIsTime => 1,
            Key         => 'ActualEndTime',
        },
        {
            Attribute   => 'CreateTime',
            Key         => 'Created',
            Table       => \@TableRight,
            ValueIsTime => 1,
        },
        {
            Attribute   => 'ChangeTime',
            Key         => 'Changed',
            Table       => \@TableRight,
            ValueIsTime => 1,
        },
    );

    for my $RowSpec (@RowSpec) {

        # fill @TableLeft and @TableRight
        # the workorder data overrides the change data
        $Self->_PrepareAndAddInfoRow(
            RowSpec => $RowSpec,
            Data    => { %{$Change}, %{$WorkOrder}, %ComplicatedValue },
        );
    }

    my $Rows = max( scalar(@TableLeft), scalar(@TableRight) );

    my %Table;
    for my $Row ( 0 .. $Rows - 1 ) {
        $Table{CellData}[$Row][0]{Content}         = $TableLeft[$Row]->{Key};
        $Table{CellData}[$Row][0]{Font}            = 'ProportionalBold';
        $Table{CellData}[$Row][1]{Content}         = $TableLeft[$Row]->{Value};
        $Table{CellData}[$Row][2]{Content}         = ' ';
        $Table{CellData}[$Row][2]{BackgroundColor} = '#FFFFFF';
        $Table{CellData}[$Row][3]{Content}         = $TableRight[$Row]->{Key};
        $Table{CellData}[$Row][3]{Font}            = 'ProportionalBold';
        $Table{CellData}[$Row][4]{Content}         = $TableRight[$Row]->{Value};
    }

    $Table{ColumnData}[0]{Width} = 80;
    $Table{ColumnData}[1]{Width} = 170.5;
    $Table{ColumnData}[2]{Width} = 4;
    $Table{ColumnData}[3]{Width} = 80;
    $Table{ColumnData}[4]{Width} = 170.5;

    $Table{Type}                = 'Cut';
    $Table{Border}              = 0;
    $Table{FontSize}            = 6;
    $Table{BackgroundColorEven} = '#DDDDDD';
    $Table{Padding}             = 1;
    $Table{PaddingTop}          = 3;
    $Table{PaddingBottom}       = 3;

    # output table
    $Self->_PDFOutputTable(
        Table => \%Table,
    );

    return '';

}

# output a body of text, such as a change description
sub _OutputLongText {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(PrintChange PrintWorkOrder Title LongText)) {
        if ( !defined( $Param{$Needed} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    # some vertical whitespace
    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -15,
    );

    # output headline for the section
    $PDFObject->Text(
        Text     => $Param{Title},
        Height   => 7,
        Type     => 'Cut',
        Font     => 'ProportionalBoldItalic',
        FontSize => 7,
        Color    => '#666666',
    );

    # vertical whitespace after title
    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -4,
    );

    # table params common to printing a body of text,
    # actually a table is a bit of overkill for a single text,
    my %Table = (
        Type            => 'Cut',
        Border          => 0,
        Font            => 'Monospaced',
        FontSize        => 7,
        BackgroundColor => '#DDDDDD',
        Padding         => 4,
        PaddingTop      => 8,
        PaddingBottom   => 8,
    );

    # output tables
    $Table{CellData}[0][0]{Content} = $Param{LongText} || '';

    # output table
    $Self->_PDFOutputTable(
        Table => \%Table,
    );

    return '';

}

# output overview over workorders
sub _OutputWorkOrderOverview {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !defined( $Param{WorkOrderOverview} ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need WorkOrderOverview!"
        );
        return;
    }

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    # vertical whitespace before section headline
    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -15,
    );

    # get laytout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # output headline for the section
    my $Translation = $LayoutObject->{LanguageObject};
    my $SectionTitle =
        $Translation->Translate( 'ITSM Workorder Overview (%s)', scalar @{ $Param{WorkOrderOverview} } );
    $PDFObject->Text(
        Text     => $SectionTitle,
        Height   => 7,
        Type     => 'Cut',
        Font     => 'ProportionalBoldItalic',
        FontSize => 7,
        Color    => '#666666',
    );

    # vertical whitespace after section headline
    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -4,
    );

    # output the overview table only if there is at least a single workorder,
    # printing an empty table might create havoc
    if ( @{ $Param{WorkOrderOverview} } ) {

        my %Table;
        my $Row = 0;

        # add table header
        $Table{CellData}[ $Row++ ] = [
            {
                Font    => 'ProportionalBold',
                Content => '#',
            },
            {
                Font    => 'ProportionalBold',
                Content => $Translation->Translate('Title'),
            },
            {
                Font    => 'ProportionalBold',
                Content => $Translation->Translate('State'),
            },
            {
                Font    => 'ProportionalBold',
                Content => $Translation->Translate('PlannedStartTime'),
            },
            {
                Font    => 'ProportionalBold',
                Content => $Translation->Translate('PlannedEndTime'),
            },
            {
                Font    => 'ProportionalBold',
                Content => $Translation->Translate('ActualStartTime'),
            },
            {
                Font    => 'ProportionalBold',
                Content => $Translation->Translate('ActualEndTime'),
            },
        ];

        for my $WorkOrder ( @{ $Param{WorkOrderOverview} } ) {
            $Table{CellData}[ $Row++ ] = [ map { { Content => $_ } } @{$WorkOrder} ];
        }

        $Table{ColumnData}[0]{Width} = 2;
        $Table{ColumnData}[1]{Width} = 63;
        $Table{ColumnData}[2]{Width} = 25;
        $Table{ColumnData}[3]{Width} = 40;
        $Table{ColumnData}[4]{Width} = 40;
        $Table{ColumnData}[5]{Width} = 40;
        $Table{ColumnData}[6]{Width} = 40;

        # table params
        $Table{Type}            = 'Cut';
        $Table{Border}          = 0;
        $Table{FontSize}        = 6;
        $Table{BackgroundColor} = '#DDDDDD';
        $Table{Padding}         = 1;
        $Table{PaddingTop}      = 3;
        $Table{PaddingBottom}   = 3;

        # output table
        $Self->_PDFOutputTable(
            Table => \%Table,
        );
    }

    return 1;
}

# output info about linked objects of a change or a workorder
sub _OutputLinkedObjects {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(PrintChange PrintWorkOrder LinkData LinkTypeList)) {
        if ( !defined( $Param{$Needed} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my %TypeList = %{ $Param{LinkTypeList} };

    my %Table;
    my $Row = 0;
    for my $LinkTypeLinkDirection ( sort { lc $a cmp lc $b } keys %{ $Param{LinkData} } ) {

        # investigate link type name
        my @LinkData = split q{::}, $LinkTypeLinkDirection;
        my $LinkTypeName = $TypeList{ $LinkData[0] }->{ $LinkData[1] . 'Name' };
        $LinkTypeName = $LayoutObject->{LanguageObject}->Translate($LinkTypeName);

        # define headline
        $Table{CellData}[$Row][0]{Content} = $LinkTypeName . ':';
        $Table{CellData}[$Row][0]{Font}    = 'ProportionalBold';
        $Table{CellData}[$Row][1]{Content} = '';

        # extract object list
        my $ObjectList = $Param{LinkData}->{$LinkTypeLinkDirection};

        for my $Object ( sort { lc $a cmp lc $b } keys %{$ObjectList} ) {

            for my $Item ( @{ $ObjectList->{$Object} } ) {

                $Table{CellData}[$Row][0]{Content} ||= '';
                $Table{CellData}[$Row][1]{Content} = $Item->{Title} || '';
            }
            continue {
                $Row++;
            }
        }
    }

    $Table{ColumnData}[0]{Width} = 80;
    $Table{ColumnData}[1]{Width} = 431;

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    # set new position
    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -15,
    );

    # output headline
    $PDFObject->Text(
        Text     => $LayoutObject->{LanguageObject}->Translate('Linked Objects'),
        Height   => 7,
        Type     => 'Cut',
        Font     => 'ProportionalBoldItalic',
        FontSize => 7,
        Color    => '#666666',
    );

    # set new position
    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -4,
    );

    # table params
    $Table{Type}            = 'Cut';
    $Table{Border}          = 0;
    $Table{FontSize}        = 6;
    $Table{BackgroundColor} = '#DDDDDD';
    $Table{Padding}         = 1;
    $Table{PaddingTop}      = 3;
    $Table{PaddingBottom}   = 3;

    # output table
    $Self->_PDFOutputTable(
        Table => \%Table,
    );

    return 1;
}

# output a table, accross several pages if neccessary
sub _PDFOutputTable {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !defined( $Param{Table} ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need Table!"
        );
        return;
    }

    # just for having shorter names
    my $Table = $Param{Table};
    my $Page  = $Self->{Page};
    PAGE:
    for ( $Page->{PageCount} .. $Page->{MaxPages} ) {

        # get PDF object
        my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

        # output table (or a fragment of it)
        %{$Table} = $PDFObject->Table( %{$Table} );

        # stop output or output next page
        if ( $Table->{State} ) {
            last PAGE;
        }
        else {
            $PDFObject->PageNew(
                %{$Page},
                FooterRight => join( ' ', $Page->{PageText}, $Page->{PageCount} ),
            );
            $Page->{PageCount}++;
        }
    }

    $Self->{Page}->{PageCount} = $Page->{PageCount};

    return 1;
}

1;
