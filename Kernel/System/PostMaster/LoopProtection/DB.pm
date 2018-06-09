# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::PostMaster::LoopProtection::DB;
## nofilter(TidyAll::Plugin::OTRS::Perl::Time)

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DB',
    'Kernel::System::Log',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get config options
    $Self->{PostmasterMaxEmails} = $Kernel::OM->Get('Kernel::Config')->Get('PostmasterMaxEmails') || 40;

    # create logfile name
    my ( $Sec, $Min, $Hour, $Day, $Month, $Year ) = localtime(time);    ## no critic
    $Year = $Year + 1900;
    $Month++;
    $Self->{LoopProtectionDate} .= $Year . '-' . $Month . '-' . $Day;

    return $Self;
}

sub SendEmail {
    my ( $Self, %Param ) = @_;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $To = $Param{To} || return;

    # insert log
    return if !$DBObject->Do(
        SQL => "INSERT INTO ticket_loop_protection (sent_to, sent_date)"
            . " VALUES ('"
            . $DBObject->Quote($To)
            . "', '$Self->{LoopProtectionDate}')",
    );

    # delete old enrties
    return if !$DBObject->Do(
        SQL => "DELETE FROM ticket_loop_protection WHERE "
            . " sent_date != '$Self->{LoopProtectionDate}'",
    );

    return 1;
}

sub Check {
    my ( $Self, %Param ) = @_;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $To = $Param{To} || return;
    my $Count = 0;

    # check existing logfile
    my $SQL = "SELECT count(*) FROM ticket_loop_protection "
        . " WHERE sent_to = '" . $DBObject->Quote($To) . "' AND "
        . " sent_date = '$Self->{LoopProtectionDate}'";

    $DBObject->Prepare( SQL => $SQL );

    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Count = $Row[0];
    }

    # check possible loop
    if ( $Count >= $Self->{PostmasterMaxEmails} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'notice',
            Message =>
                "LoopProtection: send no more emails to '$To'! Max. count of $Self->{PostmasterMaxEmails} has been reached!",
        );
        return;
    }

    return 1;
}

1;
