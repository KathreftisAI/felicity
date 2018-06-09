# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Maint::FAQ::ContentTypeSet;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::FAQ',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Sets the content type of FAQ items.');
    $Self->AddOption(
        Name => 'faq-item-id',
        Description =>
            "specify one or more ids of faq items to set its content type (if not set, all FAQ items will be affected).",
        Required   => 0,
        HasValue   => 1,
        ValueRegex => qr/.*/smx,
        Multiple   => 1,
    );
    $Self->AddOption(
        Name        => 'content-type',
        Description => "text/plain or text/html (if not set, the content type will be determined automatically).",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/(?: text\/plain | text\/html )/smx,
    );

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Setting content type of FAQ items...</yellow>\n");

    my @FAQItemIDs = @{ $Self->GetOption('faq-item-id') // [] };
    my $ContentType = $Self->GetOption('content-type') // '';

    my %FunctionParams;

    if (@FAQItemIDs) {
        $FunctionParams{FAQItemIDs} = \@FAQItemIDs;
    }

    if ($ContentType) {
        $FunctionParams{ContentType} = $ContentType;
    }

    my $Succes = $Kernel::OM->Get('Kernel::System::FAQ')->FAQContentTypeSet(%FunctionParams);

    if ( !$Succes ) {
        $Self->Print("<red>Fail.</red>\n");
        return $Self->ExitCodeError();

    }

    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

# sub PostRun {
#     my ( $Self, %Param ) = @_;
#
#     # This will be called after Run() (even in case of exceptions). Perform any cleanups here.
#
#     return;
# }

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
