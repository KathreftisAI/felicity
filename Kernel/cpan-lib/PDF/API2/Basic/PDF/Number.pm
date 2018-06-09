#=======================================================================
#
#   THIS IS A REUSED PERL MODULE, FOR PROPER LICENCING TERMS SEE BELOW:
#
#   Copyright Martin Hosken <Martin_Hosken@sil.org>
#
#   No warranty or expression of effectiveness, least of all regarding
#   anyone's safety, is implied in this software or documentation.
#
#   This specific module is licensed under the Perl Artistic License.
#
#=======================================================================
package PDF::API2::Basic::PDF::Number;

our $VERSION = '2.025'; # VERSION

use base 'PDF::API2::Basic::PDF::String';

use strict;

=head1 NAME

PDF::API2::Basic::PDF::Number - Numbers in PDF. Inherits from L<PDF::API2::Basic::PDF::String>

=head1 METHODS

=head2 $n->convert($str)

Converts a string from PDF to internal, by doing nothing

=cut

sub convert {
    return $_[1];
}

=head2 $n->as_pdf

Converts a number to PDF format

=cut

sub as_pdf {
    return $_[0]->{'val'};
}

1;
