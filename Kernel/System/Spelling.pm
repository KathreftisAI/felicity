# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Spelling;

use strict;
use warnings;
use utf8;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Encode',
    'Kernel::System::FileTemp',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::Spelling - spelling lib

=head1 SYNOPSIS

This module is the spellchecker backend wrapper of OTRS.
Currently, C<ispell> and C<aspell> are supported as spellchecker backends.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $SpellingObject = $Kernel::OM->Get('Kernel::System::Spelling');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item Check()

spelling check for some text

    my %Result = $SpellingObject->Check(
        Text          => 'Some Text to check.',
        SpellLanguage => 'en',
        RichText      => 1, # default: 0
    );

    # a result could be
    $Result{'SomeWordWithError'} = {
        Replace => [
            'SomeWord A',
            'SomeWord B',
            'SomeWord C',
        ],
        Line => 123,
    };

=cut

sub Check {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !defined $Param{Text} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need Text!"
        );
        return;
    }

    # default ignored words
    my @Ignore = qw(com org de net Cc www Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec Sun Mon Tue Wed Thu Fri
        Sat Fwd Re DNS Date To Cc Bcc ca tm COM Co op netscape bcc jpg gif email Tel ie eg otrs suse redhat debian
        caldera php perl java html unsubscribe queue event day month year ticket
    );

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # spell checker config options
    my $SpellChecker = $ConfigObject->Get('SpellCheckerBin') || 'ispell';

    # add configured ignored words
    if ( ref $ConfigObject->Get('SpellCheckerIgnore') eq 'ARRAY' ) {
        for ( @{ $ConfigObject->Get('SpellCheckerIgnore') } ) {
            push @Ignore, $_;
        }
    }

    # don't correct emails
    $Param{Text} =~ s/<.+?\@.+?>//g;
    $Param{Text} =~ s/\s.+?\@.+?\s/ /g;

    # don't correct quoted text
    $Param{Text} =~ s/^>.*$//gm;

    # ispell encoding:
    if ( $SpellChecker =~ /ispell/ ) {
        $Param{Text} =~ s/ä/a"/g;
        $Param{Text} =~ s/ö/o"/g;
        $Param{Text} =~ s/ü/u"/g;
        $Param{Text} =~ s/Ä/A"/g;
        $Param{Text} =~ s/Ö/O"/g;
        $Param{Text} =~ s/Ü/U"/g;
        $Param{Text} =~ s/ß/sS/g;
    }

    # check if spell checker exists in file system
    if ( !-e $ConfigObject->Get('SpellCheckerBin') ) {
        $Self->{Error} = 1;
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't find spellchecker ("
                . $ConfigObject->Get('SpellCheckerBin') . "): $!",
        );
        return;
    }

    # add -a
    $SpellChecker .= ' -a ';

    # set dict
    if ( $Param{SpellLanguage} ) {
        $SpellChecker .= " -d $Param{SpellLanguage}";
    }

    # get spell output

    # write text to file and read it with (i|a)spell
    # - can't use IPC::Open* because it's not working with mod_perl* :-/
    my ( $FH, $TmpFile ) = $Kernel::OM->Get('Kernel::System::FileTemp')->TempFile();
    if ( !$FH ) {
        $Self->{Error} = 1;
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't write spell tmp text to $TmpFile: $!",
        );
        return;
    }

    # get encode object
    my $EncodeObject = $Kernel::OM->Get('Kernel::System::Encode');

    $EncodeObject->EncodeOutput( \$Param{Text} );
    print $FH $Param{Text};

    # aspell encoding
    if ( $SpellChecker =~ /aspell/ ) {
        $SpellChecker .= ' --encoding=utf-8';
    }

    # open spell checker
    my $Spell;
    if ( !open( $Spell, "-|", "$SpellChecker < $TmpFile" ) ) {    ## no critic
        $Self->{Error} = 1;
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't open spellchecker: $!",
        );
        return;
    }

    my $Output      = '';
    my $Lines       = 1;
    my $CurrentLine = 0;
    my %Data;
    while ( my $Line = <$Spell> ) {

        $CurrentLine++;

        # set utf8 stamp if running in utf8 mode
        $EncodeObject->EncodeInput( \$Line );

        # ispell encoding:
        if ( $SpellChecker =~ /ispell/ ) {
            $Line =~ s/a"/ä/g;
            $Line =~ s/o"/ö/g;
            $Line =~ s/u"/ü/g;
            $Line =~ s/A"/Ä/g;
            $Line =~ s/O"/Ö/g;
            $Line =~ s/U"/Ü/g;
            $Line =~ s/sS/ß/g;
        }

        # '#' words with no suggestions
        if ( $Line =~ /^# (.+?) .+?$/ ) {
            $Data{$CurrentLine} = {
                Word    => $1,
                Replace => '',
                Line    => $Lines,
            };
        }

        # '&' words with suggestions
        elsif ( $Line =~ /^& (.+?) .+?: (.*)$/ ) {
            my @Replace = split /, /, $2;
            $Data{$CurrentLine} = {
                Word    => $1,
                Replace => \@Replace,
                Line    => $Lines,
            };
        }

        # increase line count
        elsif ( $Line =~ /^\n$/ ) {
            $Lines++;
        }
    }

    # drop double words and add line of double word
    # bug#9914: only delete double words for non-wysiwyg spellchecker
    if ( !$Param{RichText} ) {
        my %DoubleWords;
        for ( sort { $a <=> $b } keys %Data ) {
            if ( $DoubleWords{ $Data{$_}->{Word} } ) {
                $DoubleWords{ $Data{$_}->{Word} }->{Line} .= "/" . $Data{$_}->{Line};
                delete $Data{$_};
            }
            else {
                $DoubleWords{ $Data{$_}->{Word} } = $Data{$_};
            }
        }
    }

    # remove ignored words
    for my $Word ( sort keys %Data ) {
        for my $IgnoreWord (@Ignore) {
            if (
                defined $Data{$Word}
                && $Data{$Word}->{Word}
                && $Data{$Word}->{Word} =~ /^$IgnoreWord$/i
                )
            {
                delete $Data{$Word};
            }
        }
    }

    close($Spell);

    return %Data;
}

=item Error()

check if spelling check returns a system error (read log backend for error message)

    my $TrueIfError = $SpellObject->Error();

=cut

sub Error {
    my ( $Self, %Param ) = @_;

    return $Self->{Error};
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
