# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::FAQ::LanguageList;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(IsArrayRefWithData IsHashRefWithData IsStringWithData);

use base qw(
    Kernel::GenericInterface::Operation::Common
);

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::GenericInterface::Operation::FAQ::LanguageList - GenericInterface FAQ LanguageList Operation backend

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
                ErrorMessage => "Got no $Needed!"
            };
        }

        $Self->{$Needed} = $Param{$Needed};
    }

    return $Self;
}

=item Run()

perform LanguageList Operation. This will return the current FAQ Languages.

    my $Result = $OperationObject->Run(
        Data => {},
    );

    $Result = {
        Success      => 1,                                # 0 or 1
        ErrorMessage => '',                               # In case of an error
        Data         => {                                 # result data payload after Operation
            Language => [
                {
                    ID => 1,
                    Name> 'en',
                },
                {
                    ID => 2,
                    Name> 'OneMoreLanguage',
                },
                # ...
            ],
        },
    };

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    # get languages list
    # set UserID to root because in public interface there is no user
    my %Languages = $Kernel::OM->Get('Kernel::System::FAQ')->LanguageList(
        UserID => 1,
    );

    if ( !IsHashRefWithData( \%Languages ) ) {

        my $ErrorMessage = 'Could not get language data'
            . ' in Kernel::GenericInterface::Operation::FAQ::LanguageList::Run()';

        return $Self->ReturnError(
            ErrorCode    => 'TicketList.NotLanguageData',
            ErrorMessage => "TicketList: $ErrorMessage",
        );
    }

    my @LanguageList;
    for my $Key ( sort keys %Languages ) {
        my %Language = (
            ID   => $Key,
            Name => $Languages{$Key},
        );
        push @LanguageList, {%Language};
    }

    # return result
    return {
        Success => 1,
        Data    => {
            Language => \@LanguageList,
        },
    };
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
