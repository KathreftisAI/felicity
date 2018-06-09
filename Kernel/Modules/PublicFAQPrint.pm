# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::PublicFAQPrint;

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

    # set UserID to root because in public interface there is no user
    $Self->{UserID} = 1;

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Output;

    # get params
    my %GetParam;
    $GetParam{ItemID} = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'ItemID' );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    if ( !$GetParam{ItemID} ) {
        return $LayoutObject->CustomerFatalError(
            Message => Translatable('No ItemID is given!'),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get FAQ object
    my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

    # get FAQ item data
    my %FAQData = $FAQObject->FAQGet(
        ItemID     => $GetParam{ItemID},
        ItemFields => 1,
        UserID     => $Self->{UserID},
    );
    if ( !%FAQData ) {
        return $LayoutObject->CustomerFatalError();
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get interface state list
    my $InterfaceStates = $FAQObject->StateTypeList(
        Types  => $ConfigObject->Get('FAQ::Public::StateTypes'),
        UserID => $Self->{UserID},
    );

    # show no permission error
    if (
        !$FAQData{Approved}
        || !$InterfaceStates->{ $FAQData{StateTypeID} }
        )
    {
        return $LayoutObject->CustomerNoPermission(
            WithHeader => 'yes',
        );
    }

    # set default interface settings
    my $Interface = $FAQObject->StateTypeGet(
        Name   => 'public',
        UserID => $Self->{UserID},
    );

    # prepare fields data
    FIELD:
    for my $Field (qw(Field1 Field2 Field3 Field4 Field5 Field6)) {
        next FIELD if !$FAQData{$Field};

        # rewrite links to embedded images for customer and public interface
        if ( $Interface->{Name} eq 'public' ) {
            $FAQData{$Field}
                =~ s{ index[.]pl [?] Action=AgentFAQZoom }{public.pl?Action=PublicFAQZoom}gxms;
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

    # generate PDF output
    my $Time = $LayoutObject->{Time};
    my %Page;

    # get maximum number of pages
    $Page{MaxPages} = $ConfigObject->Get('PDF::MaxPages');
    if ( !$Page{MaxPages} || $Page{MaxPages} < 1 || $Page{MaxPages} > 1000 ) {
        $Page{MaxPages} = 100;
    }
    my $HeaderRight  = $ConfigObject->Get('FAQ::FAQHook') . $FAQData{Number};
    my $HeadlineLeft = $HeaderRight;
    my $Title        = $HeaderRight;
    if ( $FAQData{Title} ) {
        $HeadlineLeft = $FAQData{Title};
        $Title .= ' / ' . $FAQData{Title};
    }

    $Page{MarginTop}    = 30;
    $Page{MarginRight}  = 40;
    $Page{MarginBottom} = 40;
    $Page{MarginLeft}   = 40;
    $Page{HeaderRight}  = $HeaderRight;
    $Page{PageText}     = $LayoutObject->{LanguageObject}->Translate('Page');
    $Page{PageCount}    = 1;

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    # create new PDF document
    $PDFObject->DocumentNew(
        Title  => $ConfigObject->Get('Product') . ': ' . $Title,
        Encode => $LayoutObject->{UserCharset},
    );

    # create first PDF page
    $PDFObject->PageNew(
        %Page,
        FooterRight => $Page{PageText} . ' ' . $Page{PageCount},
    );
    $Page{PageCount}++;

    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -6,
    );

    # output headline
    $PDFObject->Text(
        Text     => $FAQData{Title},
        FontSize => 13,

    );

    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -6,
    );

    # output "printed by"
    $PDFObject->Text(
        Text     => $Time,
        FontSize => 9,
    );

    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -14,
    );

    # type of print tag
    my $PrintTag = $LayoutObject->{LanguageObject}->Translate('FAQ Article Print');

    # output headline
    $PDFObject->Text(
        Text     => $PrintTag,
        Height   => 9,
        Type     => 'Cut',
        Font     => 'ProportionalBold',
        Align    => 'right',
        FontSize => 9,
        Color    => '#666666',
    );

    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -6,
    );

    # output FAQ information
    $Self->_PDFOutputFAQHeaderInfo(
        PageData => \%Page,
        FAQData  => \%FAQData,
    );

    if ( $FAQData{Keywords} ) {
        $Self->_PDFOutputKeywords(
            PageData => \%Page,
            FAQData  => \%FAQData,
        );
    }

    # output FAQ dynamic fields
    $Self->_PDFOutputFAQDynamicFields(
        PageData => \%Page,
        FAQData  => \%FAQData,
    );

    $Self->_PDFOuputFAQContent(
        PageData        => \%Page,
        FAQData         => \%FAQData,
        InterfaceStates => $InterfaceStates,
    );

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    # return the PDF document
    my $Filename = 'FAQ_' . $FAQData{Number};
    my ( $s, $m, $h, $D, $M, $Y ) = $TimeObject->SystemTime2Date(
        SystemTime => $TimeObject->SystemTime(),
    );
    $M = sprintf( "%02d", $M );
    $D = sprintf( "%02d", $D );
    $h = sprintf( "%02d", $h );
    $m = sprintf( "%02d", $m );
    my $PDFString = $PDFObject->DocumentOutput();
    return $LayoutObject->Attachment(
        Filename    => $Filename . "_" . "$Y-$M-$D" . "_" . "$h-$m.pdf",
        ContentType => "application/pdf",
        Content     => $PDFString,
        Type        => 'inline',
    );
}

sub _PDFOutputFAQHeaderInfo {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(PageData FAQData)) {
        if ( !defined( $Param{$Needed} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }
    my %FAQData = %{ $Param{FAQData} };
    my %Page    = %{ $Param{PageData} };

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # create left table
    my $TableLeft = [
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Category') . ':',
            Value => $LayoutObject->{LanguageObject}->Translate( $FAQData{CategoryName} ),
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('State') . ':',
            Value => $LayoutObject->{LanguageObject}->Translate( $FAQData{State} ),
        },
    ];

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get default multi language option
    my $MultiLanguage = $ConfigObject->Get('FAQ::MultiLanguage');

    # language row, feature is enabled
    if ($MultiLanguage) {
        my $Row = {
            Key   => $LayoutObject->{LanguageObject}->Translate('Language') . ':',
            Value => $LayoutObject->{LanguageObject}->Translate( $FAQData{Language} ),
        };
        push @{$TableLeft}, $Row;
    }

    # create right table
    my $TableRight;

    # get default voting option
    my $Voting = $ConfigObject->Get('FAQ::Voting');

    # voting rows, feature is enabled
    if ($Voting) {
        $TableRight = [
            {
                Key   => $LayoutObject->{LanguageObject}->Translate('Votes') . ':',
                Value => $FAQData{Votes},
            },
            {
                Key   => $LayoutObject->{LanguageObject}->Translate('Result') . ':',
                Value => $FAQData{VoteResult} . " %",
            },
        ];
    }

    # last update row
    push @{$TableRight}, {
        Key   => $LayoutObject->{LanguageObject}->Translate('Last update') . ':',
        Value => $LayoutObject->{LanguageObject}->FormatTimeString(
            $FAQData{Changed},
            'DateFormatLong',
        ),
    };

    my $Rows = @{$TableLeft};
    if ( @{$TableRight} > $Rows ) {
        $Rows = @{$TableRight};
    }

    my %TableParam;
    for my $Row ( 1 .. $Rows ) {
        $Row--;
        $TableParam{CellData}[$Row][0]{Content}         = $TableLeft->[$Row]->{Key};
        $TableParam{CellData}[$Row][0]{Font}            = 'ProportionalBold';
        $TableParam{CellData}[$Row][1]{Content}         = $TableLeft->[$Row]->{Value};
        $TableParam{CellData}[$Row][2]{Content}         = ' ';
        $TableParam{CellData}[$Row][2]{BackgroundColor} = '#FFFFFF';
        $TableParam{CellData}[$Row][3]{Content}         = $TableRight->[$Row]->{Key};
        $TableParam{CellData}[$Row][3]{Font}            = 'ProportionalBold';
        $TableParam{CellData}[$Row][4]{Content}         = $TableRight->[$Row]->{Value};
    }

    $TableParam{ColumnData}[0]{Width} = 80;
    $TableParam{ColumnData}[1]{Width} = 170.5;
    $TableParam{ColumnData}[2]{Width} = 4;
    $TableParam{ColumnData}[3]{Width} = 80;
    $TableParam{ColumnData}[4]{Width} = 170.5;

    $TableParam{Type}                = 'Cut';
    $TableParam{Border}              = 0;
    $TableParam{FontSize}            = 6;
    $TableParam{BackgroundColorEven} = '#DDDDDD';
    $TableParam{Padding}             = 1;
    $TableParam{PaddingTop}          = 3;
    $TableParam{PaddingBottom}       = 3;

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    # output table
    PAGE:
    for ( $Page{PageCount} .. $Page{MaxPages} ) {

        # output table (or a fragment of it)
        %TableParam = $PDFObject->Table( %TableParam, );

        # stop output or output next page
        if ( $TableParam{State} ) {
            last PAGE;
        }
        else {
            $PDFObject->PageNew(
                %Page,
                FooterRight => $Page{PageText} . ' ' . $Page{PageCount},
            );
            $Page{PageCount}++;
        }
    }
    return 1;
}

sub _PDFOutputKeywords {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(PageData FAQData)) {
        if ( !defined( $Param{$Needed} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }
    my %FAQData = %{ $Param{FAQData} };
    my %Page    = %{ $Param{PageData} };
    my %TableParam;

    $TableParam{CellData}[0][0]{Content} = $FAQData{Keywords} || '';
    $TableParam{ColumnData}[0]{Width} = 511;

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    # set new position
    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -15,
    );

    # output headline
    $PDFObject->Text(
        Text     => $Kernel::OM->Get('Kernel::Output::HTML::Layout')->{LanguageObject}->Translate('Keywords'),
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
    $TableParam{Type}            = 'Cut';
    $TableParam{Border}          = 0;
    $TableParam{FontSize}        = 6;
    $TableParam{BackgroundColor} = '#DDDDDD';
    $TableParam{Padding}         = 1;
    $TableParam{PaddingTop}      = 3;
    $TableParam{PaddingBottom}   = 3;

    # output table
    PAGE:
    for ( $Page{PageCount} .. $Page{MaxPages} ) {

        # output table (or a fragment of it)
        %TableParam = $PDFObject->Table( %TableParam, );

        # stop output or output next page
        if ( $TableParam{State} ) {
            last PAGE;
        }
        else {
            $PDFObject->PageNew(
                %Page,
                FooterRight => $Page{PageText} . ' ' . $Page{PageCount},
            );
            $Page{PageCount}++;
        }
    }
    return 1;
}

sub _PDFOutputFAQDynamicFields {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(PageData FAQData)) {
        if ( !defined( $Param{$Needed} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }
    my $Output = 0;
    my %FAQ    = %{ $Param{FAQData} };
    my %Page   = %{ $Param{PageData} };

    my %TableParam;
    my $Row = 0;

    # get dynamic field config for frontend module
    my $DynamicFieldFilter = $Kernel::OM->Get('Kernel::Config')->Get("FAQ::Frontend::PublicFAQPrint")->{DynamicField};

    # get the dynamic fields for FAQ object
    my $DynamicField = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => ['FAQ'],
        FieldFilter => $DynamicFieldFilter || {},
    );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # generate table
    # cycle trough the activated Dynamic Fields for FAQ object
    DYNAMICFIELDCONFIG:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {
        next DYNAMICFIELDCONFIG if !IsHashRefWithData($DynamicFieldConfig);

        # get dynamic field backend object
        my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

        # skip dynamic field if is not designed for customer interface
        my $IsCustomerInterfaceCapable = $DynamicFieldBackendObject->HasBehavior(
            DynamicFieldConfig => $DynamicFieldConfig,
            Behavior           => 'IsCustomerInterfaceCapable',
        );
        next DYNAMICFIELDCONFIG if !$IsCustomerInterfaceCapable;

        my $Value = $DynamicFieldBackendObject->ValueGet(
            DynamicFieldConfig => $DynamicFieldConfig,
            ObjectID           => $FAQ{FAQID},
        );

        next DYNAMICFIELDCONFIG if !$Value;
        next DYNAMICFIELDCONFIG if $Value eq "";

        # get print string for this dynamic field
        my $ValueStrg = $DynamicFieldBackendObject->DisplayValueRender(
            DynamicFieldConfig => $DynamicFieldConfig,
            Value              => $Value,
            HTMLOutput         => 0,
            LayoutObject       => $LayoutObject,
        );
        $TableParam{CellData}[$Row][0]{Content}
            = $LayoutObject->{LanguageObject}->Translate( $DynamicFieldConfig->{Label} )
            . ':';
        $TableParam{CellData}[$Row][0]{Font}    = 'ProportionalBold';
        $TableParam{CellData}[$Row][1]{Content} = $ValueStrg->{Value};

        $Row++;
        $Output = 1;
    }

    $TableParam{ColumnData}[0]{Width} = 80;
    $TableParam{ColumnData}[1]{Width} = 431;

    # output FAQ dynamic fields
    if ($Output) {

        # get PDF object
        my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

        # set new position
        $PDFObject->PositionSet(
            Move => 'relativ',
            Y    => -15,
        );

        # output headline
        $PDFObject->Text(
            Text     => $LayoutObject->{LanguageObject}->Translate('FAQ Dynamic Fields'),
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
        $TableParam{Type}            = 'Cut';
        $TableParam{Border}          = 0;
        $TableParam{FontSize}        = 6;
        $TableParam{BackgroundColor} = '#DDDDDD';
        $TableParam{Padding}         = 1;
        $TableParam{PaddingTop}      = 3;
        $TableParam{PaddingBottom}   = 3;

        # output table
        PAGE:
        for ( $Page{PageCount} .. $Page{MaxPages} ) {

            # output table (or a fragment of it)
            %TableParam = $PDFObject->Table( %TableParam, );

            # stop output or output next page
            if ( $TableParam{State} ) {
                last PAGE;
            }
            else {
                $PDFObject->PageNew(
                    %Page,
                    FooterRight => $Page{PageText} . ' ' . $Page{PageCount},
                );
                $Page{PageCount}++;
            }
        }
    }
    return 1;
}

sub _PDFOuputFAQContent {
    my ( $Self, %Param ) = @_;

    # check parameters
    for my $ParamName (qw(PageData FAQData)) {
        if ( !$Param{$ParamName} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $ParamName!",
            );
            return;
        }
    }

    my %FAQData = %{ $Param{FAQData} };
    my %Page    = %{ $Param{PageData} };

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get the config of FAQ fields that should be shown
    my %Fields;
    NUMBER:
    for my $Number ( 1 .. 6 ) {

        # get config of FAQ field
        my $Config = $ConfigObject->Get( 'FAQ::Item::Field' . $Number );

        # skip over not shown fields
        next NUMBER if !$Config->{Show};

        # store only the config of fields that should be shown
        $Fields{ "Field" . $Number } = $Config;
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # sort shown fields by priority
    FIELD:
    for my $Field ( sort { $Fields{$a}->{Prio} <=> $Fields{$b}->{Prio} } keys %Fields ) {

        # get the state type data of this field
        my $StateTypeData = $Kernel::OM->Get('Kernel::System::FAQ')->StateTypeGet(
            Name   => $Fields{$Field}->{Show},
            UserID => $Self->{UserID},
        );

        # do not show fields that are not allowed in the given interface
        next FIELD if !$Param{InterfaceStates}->{ $StateTypeData->{StateID} };

        my %TableParam;

        # convert HTML to ASCII
        my $AsciiField = $Kernel::OM->Get('Kernel::System::HTMLUtils')->ToAscii(
            String => $FAQData{$Field},
        );

        $TableParam{CellData}[0][0]{Content} = $AsciiField || '';
        $TableParam{ColumnData}[0]{Width} = 511;

        # get PDF object
        my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

        # set new position
        $PDFObject->PositionSet(
            Move => 'relativ',
            Y    => -15,
        );

        # translate the field name and state
        my $FieldName = $LayoutObject->{LanguageObject}->Translate( $Fields{$Field}->{'Caption'} )
            . ' ('
            . $LayoutObject->{LanguageObject}->Translate( $StateTypeData->{Name} )
            . ')';

        # output headline
        $PDFObject->Text(
            Text     => $FieldName,
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
        $TableParam{Type}            = 'Cut';
        $TableParam{Border}          = 0;
        $TableParam{FontSize}        = 6;
        $TableParam{BackgroundColor} = '#DDDDDD';
        $TableParam{Padding}         = 1;
        $TableParam{PaddingTop}      = 3;
        $TableParam{PaddingBottom}   = 3;

        # output table
        PAGE:
        for ( $Page{PageCount} .. $Page{MaxPages} ) {

            # output table (or a fragment of it)
            %TableParam = $PDFObject->Table( %TableParam, );

            # stop output or output next page
            if ( $TableParam{State} ) {
                last PAGE;
            }
            else {
                $PDFObject->PageNew(
                    %Page,
                    FooterRight => $Page{PageText} . ' ' . $Page{PageCount},
                );
                $Page{PageCount}++;
            }
        }
    }
    return 1;
}

1;
