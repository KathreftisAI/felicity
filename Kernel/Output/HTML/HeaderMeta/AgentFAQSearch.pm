# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::HeaderMeta::AgentFAQSearch;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $Session = '';
    if ( !$LayoutObject->{SessionIDCookie} ) {
        $Session = ';' . $LayoutObject->{SessionName} . '=' . $LayoutObject->{SessionID};
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # build open search description for FAQ number
    my $Title = $ConfigObject->Get('ProductName') . ' (' . $ConfigObject->Get('FAQ::FAQHook') . ')';
    $LayoutObject->Block(
        Name => 'MetaLink',
        Data => {
            Rel   => 'search',
            Type  => 'application/opensearchdescription+xml',
            Title => $Title,
            Href  => $LayoutObject->{Baselink} . 'Action=' . $Param{Config}->{Action}
                . ';Subaction=OpenSearchDescriptionFAQNumber' . $Session,
        },
    );

    # build open search description for FAQ full-text
    $Title = $LayoutObject->{LanguageObject}->Translate( '%s (FAQFulltext)', $ConfigObject->Get('ProductName') );
    $LayoutObject->Block(
        Name => 'MetaLink',
        Data => {
            Rel   => 'search',
            Type  => 'application/opensearchdescription+xml',
            Title => $Title,
            Href  => $LayoutObject->{Baselink} . 'Action=' . $Param{Config}->{Action}
                . ';Subaction=OpenSearchDescriptionFulltext' . $Session,
        },
    );

    return 1;
}

1;
