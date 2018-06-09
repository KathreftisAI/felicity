# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

# The algorithm to calculate the checksum is derived from the one
# Deutsche Bundesbahn (german railway company) uses for calculation
# of the check digit of their vehikel numbering.
# The checksum is calculated by alternately multiplying the digits
# with 1 and 2 and adding the resulsts from left to right of the
# vehikel number. The modulus to 10 of this sum is substracted from
# 10. See: http://www.pruefziffernberechnung.de/F/Fahrzeugnummer.shtml
# (german)
#
# Generates ticket numbers like yyyymmddssID#####C (e. g. 2002062310100011)

package Kernel::System::ITSMChange::Number::DateChecksum;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

sub ChangeNumberCreate {
    my ( $Self, %Param ) = @_;

    # get needed config options
    my $CounterLog = $Kernel::OM->Get('Kernel::Config')->Get('ITSMChange::CounterLog');
    my $SystemID   = $Kernel::OM->Get('Kernel::Config')->Get('SystemID');

    # define number of maximum loops if created change number exists
    my $MaxRetryNumber        = 16000;
    my $LoopProtectionCounter = 0;

    # try to create a unique change number for up to $MaxRetryNumber times
    while ( $LoopProtectionCounter <= $MaxRetryNumber ) {

        # get current time
        my ( $Sec, $Min, $Hour, $Day, $Month, $Year ) = $Kernel::OM->Get('Kernel::System::Time')->SystemTime2Date(
            SystemTime => $Kernel::OM->Get('Kernel::System::Time')->SystemTime(),
        );

        # read count
        my $Count      = 0;
        my $LastModify = '';

        # try to read existing counter from file
        if ( -f $CounterLog ) {

            my $ContentSCALARRef = $Kernel::OM->Get('Kernel::System::Main')->FileRead(
                Location => $CounterLog,
            );
            if ( $ContentSCALARRef && ${$ContentSCALARRef} ) {

                ( $Count, $LastModify ) = split( /;/, ${$ContentSCALARRef} );

                # just debug
                if ( $Self->{Debug} > 0 ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'debug',
                        Message  => "Read counter from $CounterLog: $Count",
                    );
                }
            }
        }

        # check if we need to reset the counter
        if ( !$LastModify || $LastModify ne "$Year-$Month-$Day" ) {
            $Count = 0;
        }

        # count auto increment
        $Count++;

        # increase the the counter faster if we are in loop pretection mode
        $Count += $LoopProtectionCounter;

        my $Content = $Count . ";$Year-$Month-$Day;";

        # write new count
        my $Write = $Kernel::OM->Get('Kernel::System::Main')->FileWrite(
            Location => $CounterLog,
            Content  => \$Content,
        );

        # log debug message
        if ( $Write && $Self->{Debug} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'debug',
                Message  => "Write counter: $Count",
            );
        }

        # pad change number with leading '0' to length 5
        $Count = sprintf "%05d", $Count;

        # create new change number
        my $ChangeNumber = $Year . $Month . $Day . $SystemID . $Count;

        # calculate a checksum
        my $ChkSum = 0;
        my $Mult   = 1;
        for ( my $i = 0; $i < length($ChangeNumber); ++$i ) {
            my $Digit = substr( $ChangeNumber, $i, 1 );
            $ChkSum = $ChkSum + ( $Mult * $Digit );
            $Mult += 1;
            if ( $Mult == 3 ) {
                $Mult = 1;
            }
        }
        $ChkSum %= 10;
        $ChkSum = 10 - $ChkSum;
        if ( $ChkSum == 10 ) {
            $ChkSum = 1;
        }

        # add checksum to change number
        $ChangeNumber .= $ChkSum;

        # lookup if change number exists already
        my $ChangeID = $Self->ChangeLookup(
            ChangeNumber => $ChangeNumber,
        );

        # now we have a new unused change number and return it
        return $ChangeNumber if !$ChangeID;

        # start loop protection mode
        $LoopProtectionCounter++;

        # create new change number again
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'notice',
            Message  => "ChangeNumber ($ChangeNumber) exists! Creating a new one.",
        );
    }

    # loop was running too long
    $Kernel::OM->Get('Kernel::System::Log')->Log(
        Priority => 'error',
        Message  => "LoopProtectionCounter is now $LoopProtectionCounter!"
            . " Stopped ChangeNumberCreate()!",
    );
    return;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
