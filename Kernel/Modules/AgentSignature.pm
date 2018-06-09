# --
# Author: Milan Shah
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentSignature;

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

    my $ParamObject     = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject    = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $SignatureObject = $Kernel::OM->Get('Kernel::System::Signature');
    my $UserObject      = $Kernel::OM->Get('Kernel::System::User');

    my $Text    = $ParamObject->GetParam( Param => 'Text' )    || '';
    my $SignatureValidID = $ParamObject->GetParam( Param => 'SignatureValidID' ) || '';

    my $SuccessText;
    my $SuccessValidID;

    if ($Text) {
        $SuccessText = $UserObject->SetPreferences(
            Key    => 'Signature',
            Value  => $Text,
            UserID => $Self->{UserID},
        );
    }
    if ($SignatureValidID) {
        $SuccessValidID = $UserObject->SetPreferences(
            Key    => 'SignatureValidID',
            Value  => $SignatureValidID,
            UserID => $Self->{UserID},
        );
    }
    my %Data;
    my %Preferences = $UserObject->GetPreferences( UserID => $Self->{UserID}, );
    $Data{Text} = %Preferences->{Signature};
    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    if ( $SuccessText && $SuccessValidID ) {
        $Output .= $LayoutObject->Notify(
            Info => Translatable('Updated Successfully!') );
    }
    elsif((!$SuccessText && !$SuccessValidID) && ($Text && $SignatureValidID)){
            $Output .= $LayoutObject->Notify(
        Priority => 'Error',
        Info => 'Unable to Update', );
    }

    $Self->_Edit(
        Action => 'Change',
        %Data,
    );

    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentSignature',
        Data         => \%Param,
    );
    $Output .= $LayoutObject->Footer();
    return $Output;

}

sub _Edit {
    my ( $Self, %Param ) = @_;

    my $LayoutObject    = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');
    my $UserObject      = $Kernel::OM->Get('Kernel::System::User');

    # add rich text editor
    if ( $LayoutObject->{BrowserRichText} ) {
        $LayoutObject->Block(
            Name => 'RichText',
            Data => \%Param,
        );

        # reformat from plain to html
        if ( $Param{ContentType} && $Param{ContentType} =~ /text\/plain/i ) {
            $Param{Text} = $HTMLUtilsObject->ToHTML( String => $Param{Text}, );
        }
    }
    else {

        # reformat from html to plain
        if ( $Param{ContentType} && $Param{ContentType} =~ /text\/html/i ) {
            $Param{Text} = $HTMLUtilsObject->ToAscii( String => $Param{Text}, );
        }
    }

    $LayoutObject->Block(
        Name => 'Overview',
        Data => \%Param,
    );

    $LayoutObject->Block( Name => 'ActionList', );

    $LayoutObject->Block( Name => 'ActionOverview', );

    # get valid list
    my %Preferences = $UserObject->GetPreferences( UserID => $Self->{UserID}, );
    $Param{SignatureValidID} = %Preferences->{SignatureValidID};
    my %ValidList = ( 1 => 'Invalid', 2 => 'Valid' );
    my %ValidListReverse = reverse %ValidList;

    $Param{ValidOption} = $LayoutObject->BuildSelection(
        Data       => \%ValidList,
        Name       => 'SignatureValidID',
        SelectedID => $Param{SignatureValidID} || $ValidListReverse{valid},
        Class      => 'Modernize Validate_Required '
          . ( $Param{Errors}->{'ValidIDInvalid'} || '' ),
    );
    $LayoutObject->Block(
        Name => 'OverviewUpdate',
        Data => { %Param, %{ $Param{Errors} }, },
    );

    # shows header
    if ( $Param{Action} eq 'Change' ) {
        $LayoutObject->Block( Name => 'HeaderEdit' );
    }
    else {
        $LayoutObject->Block( Name => 'HeaderAdd' );
    }

    return 1;
}

1;
