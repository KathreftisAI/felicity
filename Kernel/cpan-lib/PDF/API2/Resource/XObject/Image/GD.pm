package PDF::API2::Resource::XObject::Image::GD;

our $VERSION = '2.025'; # VERSION

use base 'PDF::API2::Resource::XObject::Image';

use PDF::API2::Util;
use PDF::API2::Basic::PDF::Utils;

no warnings qw[ deprecated recursion uninitialized ];

sub new {
    my ($class,$pdf,$obj,$name,@opts) = @_;
    my $self;

    $class = ref $class if ref $class;

    $self=$class->SUPER::new($pdf,$name|| 'Jx'.pdfkey());
    $pdf->new_obj($self) unless($self->is_obj($pdf));

    $self->{' apipdf'}=$pdf;

    $self->read_gd($obj,@opts);

    return($self);
}

sub new_api {
    my ($class,$api,@opts)=@_;

    my $obj=$class->new($api->{pdf},@opts);
    $obj->{' api'}=$api;

    return($obj);
}

sub read_gd {
    my $self = shift @_;
    my $gd = shift @_;
    my %opts = @_;
    
    my ($w,$h) = $gd->getBounds();
    my $c = $gd->colorsTotal();

    $self->width($w);
    $self->height($h);

    $self->bpc(8);
    $self->colorspace('DeviceRGB');

    if($gd->can('jpeg') && ($c > 256) && !$opts{-lossless}) {

        $self->filters('DCTDecode');
        $self->{' nofilt'}=1;
        $self->{' stream'}=$gd->jpeg(75);

    } elsif($gd->can('raw')) {

        $self->filters('FlateDecode');
        $self->{' stream'}=$gd->raw;

    } else {

        $self->filters('FlateDecode');
        for(my $y=0;$y<$h;$y++) {
            for(my $x=0;$x<$w;$x++) {
                my $index=$gd->getPixel($x,$y);
                my @rgb=$gd->rgb($index);
                $self->{' stream'}.=pack('CCC',@rgb);
            }
        }

    }

    return($self);
}

1;
