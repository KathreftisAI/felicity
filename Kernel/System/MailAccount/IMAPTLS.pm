# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::MailAccount::IMAPTLS;

use strict;
use warnings;

use Mail::IMAPClient;

use Kernel::System::PostMaster;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Log',
    'Kernel::System::Main',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Connect {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Login Password Host Timeout Debug)) {
        if ( !defined $Param{$_} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $_!"
            );
            return;
        }
    }

    # connect to host
    my $IMAPObject = Mail::IMAPClient->new(
        Server   => $Param{Host},
        User     => $Param{Login},
        Password => $Param{Password},
        Starttls => [ SSL_verify_mode => 0 ],
        Debug    => $Param{Debug},
        Uid      => 1,

        # see bug#8791: needed for some Microsoft Exchange backends
        Ignoresizeerrors => 1,
    );

    if ( !$IMAPObject ) {
        return (
            Successful => 0,
            Message    => "IMAPTLS: Can't connect to $Param{Host}: $@\n"
        );
    }

    return (
        Successful => 1,
        IMAPObject => $IMAPObject,
    );
}

sub Fetch {
    my ( $Self, %Param ) = @_;

    # fetch again if still messages on the account
    COUNT:
    for ( 1 .. 200 ) {
        return if !$Self->_Fetch(%Param);
        last COUNT if !$Self->{Reconnect};
    }
    return 1;
}

sub _Fetch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Login Password Host Trusted QueueID)) {
        if ( !defined $Param{$_} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$_ not defined!"
            );
            return;
        }
    }
    for (qw(Login Password Host)) {
        if ( !$Param{$_} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $_!"
            );
            return;
        }
    }

    my $Debug = $Param{Debug} || 0;
    my $Limit = $Param{Limit} || 5000;
    my $CMD   = $Param{CMD}   || 0;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # MaxEmailSize is in kB in SysConfig
    my $MaxEmailSize = $ConfigObject->Get('PostMasterMaxEmailSize') || 1024 * 6;

    # MaxPopEmailSession
    my $MaxPopEmailSession = $ConfigObject->Get('PostMasterReconnectMessage') || 20;

    my $Timeout      = 60;
    my $FetchCounter = 0;
    my $AuthType     = 'IMAPTLS';

    $Self->{Reconnect} = 0;

    my %Connect = $Self->Connect(
        Host     => $Param{Host},
        Login    => $Param{Login},
        Password => $Param{Password},
        Timeout  => $Timeout,
        Debug    => $Debug
    );

    if ( !$Connect{Successful} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "$Connect{Message}",
        );
        return;
    }

    # read folder from MailAccount configuration
    my $IMAPFolder = $Param{IMAPFolder} || 'INBOX';

    my $IMAPObject = $Connect{IMAPObject};
    $IMAPObject->select($IMAPFolder) || die "Could not select: $@\n";

    my $Messages = $IMAPObject->messages()
        || die "Could not retrieve messages : $@\n";
    my $NumberOfMessages = scalar @{$Messages};

    if ($CMD) {
        print "$AuthType: I found $NumberOfMessages messages on $Param{Login}/$Param{Host}. "
    }

    # fetch messages
    if ( !$NumberOfMessages ) {
        if ($CMD) {
            print "$AuthType: No messages on $Param{Login}/$Param{Host}\n";
        }
    }
    else {
        MESSAGE_NO:
        for my $Messageno ( @{$Messages} ) {

            # check if reconnect is needed
            $FetchCounter++;
            if ( ($FetchCounter) > $MaxPopEmailSession ) {
                $Self->{Reconnect} = 1;
                if ($CMD) {
                    print "$AuthType: Reconnect Session after $MaxPopEmailSession messages...\n";
                }
                last MESSAGE_NO;
            }
            if ($CMD) {
                print
                    "$AuthType: Message $FetchCounter/$NumberOfMessages ($Param{Login}/$Param{Host})\n";
            }

            # check message size
            my $MessageSize = int( $IMAPObject->size($Messageno) / 1024 );
            if ( $MessageSize > $MaxEmailSize ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message =>
                        "$AuthType: Can't fetch email $Messageno from $Param{Login}/$Param{Host}. "
                        . "Email too big ($MessageSize KB - max $MaxEmailSize KB)!",
                );
            }
            else {

                # safety protection
                my $FetchDelay = ( $FetchCounter % 20 == 0 ? 1 : 0 );
                if ( $FetchDelay && $CMD ) {
                    print "$AuthType: Safety protection: waiting 1 second before processing next mail...\n";
                    sleep 1;
                }

                # get message (header and body)
                my $Message = $IMAPObject->message_string($Messageno);

                if ( !$Message ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message  => "$AuthType: Can't process mail, email no $Messageno is empty!",
                    );
                }
                else {
                    my $PostMasterObject = Kernel::System::PostMaster->new(
                        %{$Self},
                        Email   => \$Message,
                        Trusted => $Param{Trusted} || 0,
                        Debug   => $Debug,
                    );
                    my @Return = $PostMasterObject->Run( QueueID => $Param{QueueID} || 0 );
                    if ( !$Return[0] ) {
                        my $Lines = $IMAPObject->get($Messageno);
                        my $File = $Self->_ProcessFailed( Email => $Message );
                        $Kernel::OM->Get('Kernel::System::Log')->Log(
                            Priority => 'error',
                            Message  => "$AuthType: Can't process mail, see log sub system ("
                                . "$File, report it on http://bugs.otrs.org/)!",
                        );
                    }

                    # mark email to delete once it was processed
                    $IMAPObject->delete_message($Messageno);
                    undef $PostMasterObject;
                }

                # check limit
                $Self->{Limit}++;
                if ( $Self->{Limit} >= $Limit ) {
                    $Self->{Reconnect} = 0;
                    last MESSAGE_NO;
                }
            }
            if ($CMD) {
                print "\n";
            }
        }
    }

    # log status
    if ( $Debug > 0 || $FetchCounter ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'notice',
            Message  => "$AuthType: Fetched $FetchCounter email(s) from $Param{Login}/$Param{Host}.",
        );
    }
    $IMAPObject->close();
    if ($CMD) {
        print "$AuthType: Connection to $Param{Host} closed.\n\n";
    }

    # return if everything is done
    return 1;
}

sub _ProcessFailed {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(Email)) {
        if ( !defined $Param{$_} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$_ not defined!"
            );
            return;
        }
    }

    # get main object
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my $Home = $Kernel::OM->Get('Kernel::Config')->Get('Home') . '/var/spool/';
    my $MD5  = $MainObject->MD5sum(
        String => \$Param{Email},
    );
    my $Location = $Home . 'problem-email-' . $MD5;

    return $MainObject->FileWrite(
        Location   => $Location,
        Content    => \$Param{Email},
        Mode       => 'binmode',
        Type       => 'Local',
        Permission => '640',
    );
}

1;
