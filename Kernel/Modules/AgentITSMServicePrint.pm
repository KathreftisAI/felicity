# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMServicePrint;

use strict;
use warnings;

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

    # get params
    my $ServiceID = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'ServiceID' );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    if ( !$ServiceID ) {
        return $LayoutObject->ErrorScreen(
            Message => 'No ServiceID is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # get service
    my %Service = $Kernel::OM->Get('Kernel::System::Service')->ServiceGet(
        ServiceID     => $ServiceID,
        UserID        => $Self->{UserID},
        IncidentState => 1,
    );
    if ( !$Service{ServiceID} ) {
        return $LayoutObject->ErrorScreen(
            Message => "ServiceID $ServiceID not found in database!",
            Comment => 'Please contact the admin.',
        );
    }

    # get sla list
    my %SLAList = $Kernel::OM->Get('Kernel::System::SLA')->SLAList(
        ServiceID => $Service{ServiceID},
        UserID    => $Self->{UserID},
    );

    # get user object
    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # get user data (create by)
    $Service{CreateByName} = $UserObject->UserName(
        UserID => $Service{CreateBy},
    );

    # get user data (change by)
    $Service{ChangeByName} = $UserObject->UserName(
        UserID => $Service{ChangeBy},
    );

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    # generate pdf output
    my %Page;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get maximum number of pages
    $Page{MaxPages} = $ConfigObject->Get('PDF::MaxPages');
    if ( !$Page{MaxPages} || $Page{MaxPages} < 1 || $Page{MaxPages} > 1000 ) {
        $Page{MaxPages} = 100;
    }
    $Page{MarginTop}    = 30;
    $Page{MarginRight}  = 40;
    $Page{MarginBottom} = 40;
    $Page{MarginLeft}   = 40;
    $Page{HeaderRight}  = $LayoutObject->{LanguageObject}->Translate('Service');
    $Page{PageText}     = $LayoutObject->{LanguageObject}->Translate('Page');
    $Page{PageCount}    = 1;

    # create new pdf document
    $PDFObject->DocumentNew(
        Title  => $ConfigObject->Get('Product') . ': ' . $Service{NameShort},
        Encode => $LayoutObject->{UserCharset},
    );

    # create first pdf page
    $PDFObject->PageNew(
        %Page,
        FooterRight => $Page{PageText} . ' ' . $Page{PageCount},
    );
    $Page{PageCount}++;

    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -6,
    );

    # output title
    $PDFObject->Text(
        Text     => $Service{NameShort},
        FontSize => 13,
    );

    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -6,
    );

    # output "printed by"
    $PDFObject->Text(
        Text => $LayoutObject->{LanguageObject}->Translate('printed by') . ' '
            . $Self->{UserFullname} . ' '
            . $LayoutObject->{Time},
        FontSize => 9,
    );

    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -14,
    );

    # output general infos
    $Self->_PDFOutputGeneralInfos(
        Page    => \%Page,
        Service => \%Service,
    );

    # output associated slas
    if (%SLAList) {
        $Self->_PDFOutputAssociatedSLAs(
            Page    => \%Page,
            SLAList => \%SLAList,
        );
    }

    # output detailed infos
    $Self->_PDFOutputDetailedInfos(
        Page    => \%Page,
        Service => \%Service,
    );

    # create file name
    my $Filename = $Kernel::OM->Get('Kernel::System::Main')->FilenameCleanUp(
        Filename => $Service{NameShort},
        Type     => 'Attachment',
    );

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    my ( $s, $m, $h, $D, $M, $Y ) = $TimeObject->SystemTime2Date(
        SystemTime => $TimeObject->SystemTime(),
    );
    $M = sprintf( "%02d", $M );
    $D = sprintf( "%02d", $D );
    $h = sprintf( "%02d", $h );
    $m = sprintf( "%02d", $m );

    # return the pdf document
    return $LayoutObject->Attachment(
        Filename    => 'service_' . $Filename . "_$Y-$M-$D\_$h-$m.pdf",
        ContentType => 'application/pdf',
        Content     => $PDFObject->DocumentOutput(),
        Type        => 'inline',
    );
}

sub _PDFOutputGeneralInfos {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Page Service)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # create left table
    my $TableLeft = [
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Service') . ':',
            Value => $Param{Service}->{NameShort},
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Current Incident State') . ':',
            Value => $Param{Service}->{CurInciState},
        },
    ];

    # create right table
    my $TableRight = [
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Created') . ':',
            Value => $LayoutObject->Output(
                Template => '[% Data.CreateTime | Localize("TimeLong") %]',
                Data     => \%{ $Param{Service} },
            ),
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Created by') . ':',
            Value => $Param{Service}->{CreateByName},
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Last changed') . ':',
            Value => $LayoutObject->Output(
                Template => '[% Data.ChangeTime | Localize("TimeLong") %]',
                Data     => \%{ $Param{Service} },
            ),
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Last changed by') . ':',
            Value => $Param{Service}->{CreateByName},
        },
    ];

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
    $TableParam{Type}                 = 'Cut';
    $TableParam{Border}               = 0;
    $TableParam{FontSize}             = 6;
    $TableParam{BackgroundColorEven}  = '#DDDDDD';
    $TableParam{Padding}              = 1;
    $TableParam{PaddingTop}           = 3;
    $TableParam{PaddingBottom}        = 3;

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    # output table
    PAGE:
    for ( $Param{Page}->{PageCount} .. $Param{Page}->{MaxPages} ) {

        # output table (or a fragment of it)
        %TableParam = $PDFObject->Table(%TableParam);

        # stop output or output next page
        last PAGE if $TableParam{State};

        $PDFObject->PageNew(
            %{ $Param{Page} },
            FooterRight => $Param{Page}->{PageText} . ' ' . $Param{Page}->{PageCount}
        );
        $Param{Page}->{PageCount}++;
    }

    return 1;
}

sub _PDFOutputDetailedInfos {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Page Service)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    # set new position
    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -15,
    );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # output headline
    $PDFObject->Text(
        Text     => $LayoutObject->{LanguageObject}->Translate('Service'),
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

    # create table
    my $Table = [
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Service') . ':',
            Value => $Param{Service}->{Name},
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Type') . ':',
            Value => $LayoutObject->{LanguageObject}->Translate( $Param{Service}->{Type} ),
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Criticality') . ':',
            Value => $LayoutObject->{LanguageObject}->Translate( $Param{Service}->{Criticality} ),
        },
    ];
    my %TableParam;
    my $Rows = @{$Table};
    for my $Row ( 1 .. $Rows ) {
        $Row--;
        $TableParam{CellData}[$Row][0]{Content} = $Table->[$Row]->{Key};
        $TableParam{CellData}[$Row][0]{Font}    = 'ProportionalBold';
        $TableParam{CellData}[$Row][1]{Content} = $Table->[$Row]->{Value};
    }
    $TableParam{ColumnData}[0]{Width} = 80;
    $TableParam{ColumnData}[1]{Width} = 431;
    $TableParam{Type}                 = 'Cut';
    $TableParam{Border}               = 0;
    $TableParam{FontSize}             = 6;
    $TableParam{BackgroundColor}      = '#DDDDDD';
    $TableParam{Padding}              = 1;
    $TableParam{PaddingTop}           = 3;
    $TableParam{PaddingBottom}        = 3;

    # output table
    PAGE:
    for ( $Param{Page}->{PageCount} .. $Param{Page}->{MaxPages} ) {

        # output table (or a fragment of it)
        %TableParam = $PDFObject->Table(%TableParam);

        # stop output or output next page
        last PAGE if $TableParam{State};

        $PDFObject->PageNew(
            %{ $Param{Page} },
            FooterRight => $Param{Page}->{PageText} . ' ' . $Param{Page}->{PageCount}
        );
        $Param{Page}->{PageCount}++;
    }

    return 1;
}

sub _PDFOutputAssociatedSLAs {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Page SLAList)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    my %TableParam;
    my $Row = 0;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # generate table data
    for my $SLAID ( sort keys %{ $Param{SLAList} } ) {
        $TableParam{CellData}[$Row][0]{Content} = $LayoutObject->{LanguageObject}->Translate('SLA') . ':';
        $TableParam{CellData}[$Row][0]{Font}    = 'ProportionalBold';
        $TableParam{CellData}[$Row][1]{Content} = $Param{SLAList}->{$SLAID};
        $Row++;
    }
    $TableParam{ColumnData}[0]{Width} = 80;
    $TableParam{ColumnData}[1]{Width} = 431;

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    # set new position
    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -15,
    );

    # output headline
    $PDFObject->Text(
        Text     => $LayoutObject->{LanguageObject}->Translate('Associated SLAs'),
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
    for ( $Param{Page}->{PageCount} .. $Param{Page}->{MaxPages} ) {

        # output table (or a fragment of it)
        %TableParam = $PDFObject->Table(%TableParam);

        # stop output or output next page
        last PAGE if $TableParam{State};

        $PDFObject->PageNew(
            %{ $Param{Page} },
            FooterRight => $Param{Page}->{PageText} . ' ' . $Param{Page}->{PageCount}
        );
        $Param{Page}->{PageCount}++;
    }

    return 1;
}

1;
