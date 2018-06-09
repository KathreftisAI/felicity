# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::Dashboard::CustomerCompanyInformation;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # get needed parameters
    for my $Needed (qw(Config Name UserID)) {
        die "Got no $Needed!" if ( !$Self->{$Needed} );
    }

    $Self->{PrefKey} = 'UserDashboardPref' . $Self->{Name} . '-Shown';

    $Self->{CacheKey} = $Self->{Name};

    return $Self;
}

sub Preferences {
    my ( $Self, %Param ) = @_;

    return;
}

sub Config {
    my ( $Self, %Param ) = @_;

    return (
        %{ $Self->{Config} },

        # caching not needed
        CacheKey => undef,
        CacheTTL => undef,
    );
}

sub Run {
    my ( $Self, %Param ) = @_;

    return if !$Param{CustomerID};

    my %CustomerCompany = $Kernel::OM->Get('Kernel::System::CustomerCompany')->CustomerCompanyGet(
        CustomerID => $Param{CustomerID},
    );

    my $CustomerCompanyConfig = $Kernel::OM->Get('Kernel::Config')->Get( $CustomerCompany{Source} || '' );
    return if ref $CustomerCompanyConfig ne 'HASH';
    return if ref $CustomerCompanyConfig->{Map} ne 'ARRAY';

    return if !%CustomerCompany;

    # get needed objects
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ValidObject  = $Kernel::OM->Get('Kernel::System::Valid');
    my $CompanyIsValid;

    # make ValidID readable
    if ( $CustomerCompany{ValidID} ) {
        my @ValidIDs = $ValidObject->ValidIDsGet();
        $CompanyIsValid = grep { $CustomerCompany{ValidID} == $_ } @ValidIDs;

        $CustomerCompany{ValidID} = $ValidObject->ValidLookup(
            ValidID => $CustomerCompany{ValidID},
        );

        $CustomerCompany{ValidID} = $LayoutObject->{LanguageObject}->Translate( $CustomerCompany{ValidID} );
    }

    ENTRY:
    for my $Entry ( @{ $CustomerCompanyConfig->{Map} } ) {
        my $Key = $Entry->[0];

        # do not show items if they're not marked as visible
        next ENTRY if !$Entry->[3];

        # do not show empty entries
        next ENTRY if !length( $CustomerCompany{$Key} );

        $LayoutObject->Block( Name => "ContentSmallCustomerCompanyInformationRow" );

        if ( $Key eq 'CustomerID' ) {
            $LayoutObject->Block(
                Name => "ContentSmallCustomerCompanyInformationRowLink",
                Data => {
                    %CustomerCompany,
                    Label => $Entry->[1],
                    Value => $CustomerCompany{$Key},
                    URL =>
                        '[% Env("Baselink") %]Action=AdminCustomerCompany;Subaction=Change;CustomerID=[% Data.CustomerID | uri %];Nav=Agent',
                    Target => '',
                },
            );

            next ENTRY;
        }

        # check if a link must be placed
        if ( $Entry->[6] ) {
            $LayoutObject->Block(
                Name => "ContentSmallCustomerCompanyInformationRowLink",
                Data => {
                    %CustomerCompany,
                    Label  => $Entry->[1],
                    Value  => $CustomerCompany{$Key},
                    URL    => $Entry->[6],
                    Target => '_blank',
                },
            );

            next ENTRY;

        }

        $LayoutObject->Block(
            Name => "ContentSmallCustomerCompanyInformationRowText",
            Data => {
                %CustomerCompany,
                Label => $Entry->[1],
                Value => $CustomerCompany{$Key},
            },
        );

        if ( $Key eq 'CustomerCompanyName' && defined $CompanyIsValid && !$CompanyIsValid ) {
            $LayoutObject->Block(
                Name => 'ContentSmallCustomerCompanyInvalid',
            );
        }
    }

    my $Content = $LayoutObject->Output(
        TemplateFile => 'AgentDashboardCustomerCompanyInformation',
        Data         => {
            %{ $Self->{Config} },
            Name => $Self->{Name},
            %CustomerCompany,
        },
        KeepScriptTags => $Param{AJAX},
    );

    return $Content;
}

1;
