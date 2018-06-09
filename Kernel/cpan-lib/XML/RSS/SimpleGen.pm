
require 5;
package XML::RSS::SimpleGen;
use strict;
use Carp ();
require Exporter;
use vars qw(
  @EXPORT %EXPORT_TAGS @ISA $VERSION
  %Entities %WinLameEntities %CommonEnts $MIME_Type 
  $DTD_url $DTD_pubid $Nativize_newlines $DWIM @Hidies $RSS_obj
  $Sleepy %IsBlockMarkup $MaybeIndent $MaybeNL %PeriodAsSeconds
  $NAMESPACE_SY $CHUNK_MINUTES %BadPorts
  @Retry_delays $UserAgentString
);

$VERSION = '11.11';
BEGIN { *DEBUG = sub () {0} unless defined &DEBUG; }   # set DEBUG level

@ISA = qw(Exporter);

#$DTD_url   ||= 'http://my.netscape.com/publish/formats/rss-0.91.dtd';
#$DTD_pubid ||= '-//Netscape Communications//DTD RSS 0.91//EN';
$NAMESPACE_SY ||= 'http://purl.org/rss/1.0/modules/syndication/';
$CHUNK_MINUTES = 10;

$Nativize_newlines = 1 unless defined $Nativize_newlines;
$DWIM = 1 unless defined $DWIM;
$Sleepy =
 $ENV{'MAILTO'} ? 4  # under crontab
 : ($ENV{'TERM'} || $ENV{'REQUEST_METHOD'} || $ENV{'COMSPEC'} ) ? 0
    # almost definitely not under crontab
 : 4   unless defined $Sleepy;
@Retry_delays = (4, 10, 20, 40);
$MaybeIndent = '  ';
$MaybeNL = "\n";
#$MaybeNL = $MaybeIndent = '';  # terser, more grep-worthy

foreach my $p (  # ports we'll refuse to do HTTP on
qw<0 1 7 9 11 13 15 17 19 20 21 22 23 25 37 42 43 53 70 79 95 101 102 103
  104 107 109 110 111 113 115 117 119 123 135 137 138 139 143 389 443 512
  513 514 515 517 518 526 530 531 532 540 556 6667
>) { $BadPorts{$p} = 1 unless defined $BadPorts{$p}; }

$UserAgentString ||= "XmlRssSimpleGen/$VERSION";

#..........................................................................
sub _hide {push @Hidies, @_ };
_hide qw(init import);

#..........................................................................


=head1 NAME

XML::RSS::SimpleGen - for writing RSS files

=head1 SYNOPSIS

  # A complete screen-scraper and RSS generator here:
  
  use strict;
  use XML::RSS::SimpleGen;
  my $url = q<http://www.exile.ru/>;
  
  rss_new( $url, "eXile", "Moscow-based Alternative Newspaper" );
  rss_language( 'en' );
  rss_webmaster( 'xxxxx@yourdomain.com' );
  rss_twice_daily();
  
  get_url( $url );
  
  while(
   m{<h4>\s*<a href='/(.*?)'.*?>(.*?)</a>\s*</h4>\s*<p.*?>(.*?)<a href='/}sg
  ) {
    rss_item("$url$1", $2, $3);
  }
  
  die "No items in this content?! {{\n$_\n}}\nAborting"
   unless rss_item_count();
  
  rss_save( 'exile.rss', 45 );
  exit;

=head1 DESCRIPTION

This module is for writing RSS files, simply. It transparently handles
all the unpleasant details of RSS, like proper XML escaping, and also has
a good number of Do-What-I-Mean features, like not changing the modtime
on a written-out RSS file if the file content hasn't changed, and like
automatically removing any HTML tags from content you might pass in.

This module isn't meant to have the full expressive power of RSS;
instead, it provides functions that are most commonly needed by
RSS-writing programs.

=head1 INTERFACE

This module provides a bunch of functions for starting an RSS feed in
memory, putting items into it, and saving it to disk (or printing it as
a string, as in a CGI). If you prefer an object-oriented interface
(obviously more useful if you're composing several feeds at once), then
you can use this module as a class whose methods are the same as the
function names minus "rss_". Except for this detail of the naming, the
functions and methods are the same, behave the same, and take the same
arguments.

That is, this functional code:

  use XML::RSS::SimpleGen;
  my $url = q<http://www.exile.ru/>;
  
  rss_new( $url, "eXile" );
  rss_language( 'en' );
  get_url( $url );
  ...

does the same work as this OO code:

  use XML::RSS::SimpleGen ();
  my $url = q<http://www.exile.ru/>;
  my $rss = XML::RSS::SimpleGen->new( $url, "eXile");
  $rss->language( 'en' );
  $rss->get_url( $url );
  ...

(Note that the function C<get_url> doesn't have a leading "rss_",
so its method name is the same as its function name.  It's the
one exception.)

If this talk of objects puzzles you, see 
L<HTML::Tree::AboutObjects> in the C<HTML-Tree> dist, and/or see
the chapter "User's View of Object-Oriented Modules"
in my book I<Perl & LWP> (L<http://www.amazon.com/exec/obidos/ASIN/0596001789>).
(The book is also useful as an extended discussion of screen-scraping.)

Note: in the code below, I use the word "accessor" a lot, to refer
to a function or method that you can call two possible ways:
1) like C<foo(I<val>)> to set the "foo" attribute to the value I<val>,
or 2) like C<foo()> to return the value of the "foo" attribute.


=head1 FUNCTIONS

=over

=item C<rss_new( I<url> );>

=item C<rss_new( I<url, title> );>

=item C<rss_new( I<url, title, description> );>

=item I<or:> C<< $rss = XML::RSS::SimpleGen->new(...); >>

This function creates a new RSS feed in memory.  This should be the first
C<rss_I<whatever>> function you call in your program.  If you call it
again, it erases the current object (if any) and sets up a new one according
to whatever parameters you pass.

The parameters are the full URL, the title, and the description of the
site (or page) that you're providing an RSS feed of. The description is
optional, but you should provide at least a URL and title.

Examples:

  rss_new( $url, "eXile", "Moscow-based Alternative Newspaper" );

  rss_new( 'http://www.mybazouki.com/news/', "Bazouki News!" );

(As a method, XML::RSS::SimpleGen->new simply returns a new
RSS object.)

=cut

sub new {
  my $class = shift;
  $class = ref($class) || $class;
  my $new = bless { 'items' => [] }, $class;
  $new->init();

  @_ and $new->url(shift);
  @_ and $new->title(shift);
  @_ and $new->description(shift);

  $new->item_limit( 0 );
  $new->retention( 32 * 24 * 60 * 60 ); # 32 days

#  (-e "rss.css") ? $new->css("./rss.css")
#    : $new->css("http://www.interglacial.com/rss/rss.css");

#  (-e "about_rss.html") ? $new->docs("./about_rss.html")
#    : $new->docs("http://www.interglacial.com/rss/about.html");

  return $new;
}

sub init { return; }   # override in subclass as necessary

#..........................................................................
__PACKAGE__->_accessorize(
 qw(
  title description url language css xsl webMaster docs
  item_limit ttl
 retention
  allow_duplicates
  image_title image_link image_url image_width image_height image_description 
 )
);

=item the accessor C<rss_language(I<language_tag>)>

This declares what language this RSS feed is in.  It must be
an RFC3066-style language tags like "en", or "en-US", or "zh-TW".
(See I<I18N::LangTags::List> for a list.)
If you don't set the feed's language, it defaults to "en", for generic English.

If you call this function without a parameter, it returns
the current value of the RSS feed's language.  For example:

  print "I'm making an RSS feed for ", rss_language(), "!\n";

The same is true for all the functions that I label as "accessors".


=item the accessor C<rss_item_limit(I<number>)>

This sets the maximum number of items that this feed will show.

The default value is 0, meaning that there is no maximum.

If you set it to a positive number I<N>, then the feed will show only
the first I<N> items that you declare with C<rss_item>. (Or, if you set
C<rss_history_file>, then the newest I<N> items that you declare
with C<rss_item>.)

If you set it to a negative number I<-N>, then the feed will show only
the last I<N> items that you declare with C<rss_item>. (Or, if you set
C<rss_history_file>, then the oldest I<N> items you declare with C<rss_item>,
which is unlikely to be useful!)


=item the accessor C<rss_webMaster(I<email-address>)>

This declares what email address you, the RSS generator manager, can be
reached at.  Example:

  rss_webMaster( 'sburke@bazouki-news.int' );

=cut

#..........................................................................

=item C<rss_history_file( I<filename> )>

This declares that you want this RSS feed to keep track of what items are
new, and to list them first when the RSS is emitted.  To do this, the RSS
generator has to store information in a file, where it tracks its "history",
i.e., when was the first time it saw given URLs, and the most recent time
it saw given URLs.

Typical usage is:

  rss_history_file( 'thisrssfeed.dat' );

You should call C<rss_history_file> I<before> you make any calls to
C<rss_item>.

The history-file feature is meant for cases where your RSS-generator
program calls C<rss_item> on I<every> link it sees, but only wants the
I<new> links to appear in the RSS output. (This can be a good approach
if you're making an RSS feed of a page like
C<http://www.guardian.co.uk/> where there's some new links (to the
recently added stories), but also links to some days-old stories, and
I<also> links to some always-there things like "Archive Search" and
"Contact Us" pages.

Once you call rss_history_file, the specified file is read in.  The
in-memory history (stored in the RSS object) is updated as you
call C<rss_item>.  But the file isn't updated until you call rss_save.

(A do-what-I-mean side effect of calling C<rss_history_file> is that it
sets rss_item_limit to 25 if it is currently 0.)

(Incidentally, if you're using rss_history_file as part of a CGI that
emits RSS data, instead of a program that just saves to an RSS file,
then things will get complicated. You'll need to call an internal method
to explicitly commit the history file to disk, and you'll need a
semaphore file to avoid race conditions. Email me for full info.)

=cut

sub history_file {
  my $self = shift;
  return $self->{'history_file'} unless @_;   # read accession
  my $file = $_[0];
  
  unless(defined $file  and  length $file  and  $file =~ m/\S/) {
    DEBUG and print "Killing $self 's memory-history.\n";
     # I don't know if this'd be actually useful for anything tho.
    delete $self->{'history_file'};
    delete $self->{'_first_seen' };
    delete $self->{'_last_seen'  };
    return undef;
  }
  
  DEBUG and print "Considering $file as $self 's history.\n";
  $self->{'history_file'} = $file;
  $self->_read_history_file;
  
  $self->item_limit( 25 ) if $DWIM and !$self->item_limit();

  return $file;
}

#..........................................................................


=item C<rss_item( I<url> );>

=item C<rss_item( I<url, title> );>

=item C<rss_item( I<url, title, description> );>

This adds a new item to the current feed. You will need to specify the
URL to add (and it should be a valid-looking URL, starting with
"I<something:>", and not containing any spaces). You may also specify
the title, but it's optional. And finally, you can optionally specify a
description. (You can remember this because it starts with the essential
item first, and progresses toward the most optional.)

Leading and tailing whitespace is removed from whichever of I<url,
title,> and I<description> are defined values, and HTML is parsed out.

A simple usage:

  rss_item(
    "http://www.harpers.org/MostRecentWR.html",
    "Harper's Magazine's Weekly Review"
  );

Although in practice, a typical call won't have string constants, but
will instead be like the example in the L<Synopsis sectios|/"SYNOPSIS">,
namely:

  rss_item("$url$1", $2, $3);

Incidentally, as a do-what-I-mean feature, if the first parameter
doesn't look like a URL but one of the others does, then this error is
silently forgiven.  This is so you can occasionally slip up and forget
the order of the parameters.

(In the unlikely event where you I<need> to avoid the HTML-removal
features, you can do this by passing scalar-references instead of
normal strings, like so: C<rss_item($url, $title, \$not_to_be_escaped)>.)

=cut

sub item { # Add an item:  (url, title, description)
  my($self, @params) = @_;
  if( grep defined($_) && length($_), @params ) {
    push @{$self->{'items'}},
      [
        $self->_process_item_params(@params)  # DWIM things happen here
      ]
    ;
    DEBUG and print "Adding item ",
     join("|", @{ $self->{'items'}[-1] }), "\n";

    # Update history...
    if( $self->{'_first_seen'} ) {
      my $url = $self->{'items'}[-1][0];
      my $now =
            $self->{'_virgin_item_timestamp'}
        ? --$self->{'_virgin_item_timestamp'}
        : time()
      ;
      $self->{'_first_seen'}{$url} ||= $now;
      $self->{'_last_seen' }{$url}   = $now;
    }

  } else {
    DEBUG and print "Not adding item -- empty params\n";
  }
  return $self;
}

#..........................................................................

=item C<rss_item_count()>

This returns the number of items you've declared.  I anticipate that its
main usage will be something like:

  die "What, no objects found at $url ?!"
   unless rss_item_count();

or, maybe...

  exit unless rss_item_count();

...depending on how/whether you'd want to react to cases where you don't
see anything to put into an RSS feed.

Note that the parens are optional, since this command takes no options
(just like Perl's C<time()> function).

=cut

sub item_count  { scalar @{ $_[0]->{'items'} }; }
sub items_count { shift->item_count } # harmless alias
#..........................................................................

sub _sort_items_newest_first {
  my $self = shift;
  my $seen = $self->{'_first_seen'};

  $seen or Carp::confess(
   "Can't sort items by age unless you define a history file!");

  my $items = $self->{'items'} || die "NO ITEMS!?";

  if( DEBUG ) {
    print "\nSorting ", scalar(@$items), " items, newest first.  Age dump:\n";
    foreach my $i (@$items) {
      if( $i->[0] ) {
        printf "  %s : %s (%s)\n",
         $i->[0], $seen->{$i->[0]} || 0, scalar localtime(
                  $seen->{$i->[0]} || 0)
        ;
      } else {
        print " NOURL\n";
      }
    }
    print " (no items)\n" unless @$items;
    print "(End history dump.)\n\n";
  }

  @$items =
    sort { ($seen->{$b->[0] ||''} ||0)
       <=> ($seen->{$a->[0] ||''} ||0)
       or $a->[0] cmp $b->[0]  # So it's at least predictable
    }
      @$items;
  return;
}

#..........................................................................

=item C<rss_image( I<url, h, w> );>

This declares that you want to declare a particular image as the logo for
this feed.  Most feeds don't have such a thing, and most readers just ignore
it anyway, but if you want to declare it, this function is how.  The
three parameters, which are all required, are: the image's URL, its
height in pixels, and its width in pixels.
According to various specs, the width should/must be between 1 and 144,
an the height should/must be between 1 and 400.

A typical usage:

  rss_image("http://interglacial.com/rss/weebl.gif", 106, 140);

Be careful not to mix up the height and width.

=cut


sub image {
  my($self, $url, $h, $w) = splice(@_,0,4);
  Carp::croak "Usage: \$rss->image(\$url, \$h, \$w)"
   unless $url and $h and $w
     and $h =~ m/^\d{1,3}$/s
     and $w =~ m/^\d{1,3}$/s
  ;
  $self->image_url($url);
  $self->image_height($h);
  $self->image_width( $w);

    #  width must (should?) be between 1 and 144
    # height must (should?) be between 1 and 400

  @_ and $self->image_link(        shift);
  @_ and $self->image_title(       shift);
  @_ and $self->image_description( shift);
  return;
}

#..........................................................................

=item C<rss_save( I<filename> );>

=item C<rss_save( I<filename, max_age_days> );>

This saves the RSS date to the file you specify.  If the RSS data hasn't
changed, the file (and its modtime) aren't altered.  The optional I<max_age_days>
parameter means that if ever the file exists, and its content hasn't changed
for that many days or longer, then the program should die with a warning
message.  For example, in the case of a screen-scraper for a site that we
know should (in theory) change its content at least weekly, we might save
the RSS file with:

  rss_save("whatever.rss", 17);
   # Scream if the feed is unchanged for 17 days.

The seventeen there is gotten by assuming that just maybe the site
might skip two weeks for a vacation now and then, and might even put
out the pre-vacation issue a few days early -- but that if ever the program
notices that the data hasn't changed for 17 days, then it should emit
error messages.  If you want to disable this feature on a one-time basis,
just change the modtime (like via C<touch>) on the F<whatever.rss> file.

If you don't specify a C<max_age_days> value, then this whole
complain-if-it's-old feature is disabled.

=cut

sub save {
  my($self, $filename, $maxage) = @_;
  Carp::croak("I need a filename to save to")
   unless defined $filename and length $filename;

  $self->history_file and $self->_sort_items_newest_first;
  $self->_write_history_file;

  my $new_content = $self->as_string;

  local *RSS;
  # See if we can skip writing to disk
  if(-e $filename and -f _ and -r _ and -s _) {
    DEBUG and print "Comparing to $filename...\n";
    open RSS, $filename
     or Carp::confess "Can't read-open $filename: $!"; # insanity
    local $/;
    my $content = <RSS>;
    close(RSS);
    
    if( $content eq $new_content ) {
      DEBUG and print " $filename\'s content is the same.\n";
      return $self->_check_age($filename, $maxage);
    }
    
    my $new_content_without_builddate = $new_content;
    foreach my $c ($new_content_without_builddate, $content) {
      $c =~ s{<last[Bb]uild[Dd]ate>.*?</last[Bb]uild[Dd]ate>}{};
      $c =~ s{<pub[Dd]ate>.*?</pub[Dd]ate>}{};
      $c =~ tr{\n\r}{}s;  # And smash newlines while we're at it...
    }
    if( $content eq $new_content_without_builddate ) {
      DEBUG and print " $filename\'s content is the same, basically.\n";
      return $self->_check_age($filename, $maxage);
    }
    DEBUG and print " $filename\'s content is stale.  Overwriting.\n";
  }
  DEBUG and print "Writing to $filename ...\n";
  
  # OK, we have to actually write it.  Let's do it fast.
  open(RSS, ">$filename")
   or Carp::confess "Can't write-open $filename: $!\nAborting";
  print RSS $new_content
   or Carp::confess "Can't print to $filename: $!\nAborting";
  close(RSS)
   or Carp::confess "Can't close $filename: $!\nAborting";
  eval { chmod 0644, $filename };
  DEBUG and print "Done writing to $filename\n";
  return 1;
}

#..........................................................................

=item C<rss_as_string();>

This returns the RSS-XML data as a string.  This function is called
internally by the rss_save function; but you might want to call it
explicitly, as in a CGI, where your CGI would probably end like this:

  print "Content-type: application/xml\n\n", rss_as_string();
  exit;

=cut


sub as_string {
  my $self = $_[0];
  
  my $namespaces = $self->_namespaces_as_string;
  
  return join '' =>
    qq{<?xml version="1.0"?>\n},
    ($DTD_pubid and $DTD_url)
     ? qq{<!DOCTYPE rss PUBLIC "$DTD_pubid"\n  "$DTD_url">\n} : (),

    $self->css ? ( # http://www.w3.org/TR/xml-stylesheet/
      qq{<?xml-stylesheet title="CSS_formatting" type="text/css" href="},
      $self->xmlesc($self->css),
      qq{"?>\n}
    ) : (),
    $self->xsl ? (
      qq{<?xml-stylesheet title="XSL_formatting" type="text/xml" href="}, # TODO: better mime type?
      $self->xmlesc($self->xsl),
      qq{"?>\n}
    ) : (),
    qq{<rss version="2.0"$namespaces><channel>},
    $self->_modversion_comment,
    $self->_various_comments,
    $self->_metadata_as_xml,
    $self->_items_as_xml,
    "\n</channel></rss>\n",
  ;
}

sub _namespaces_as_string {
  my $self = $_[0];
  my $ns = $self->{'_namespaces'};
  return '' unless $ns and keys %$ns;
  return
    join '', "\n",
    map qq{  xmlns:$_="$$ns{$_}"\n},
    sort keys %$ns
  ;
}

#..........................................................................

sub _metadata_as_xml {
  my $self = $_[0];
  my($url, $title, $description) = (
    map defined($_) ? $_ : '',
    $self->url, $self->title, $self->description,
  );
  
  if($DWIM) {
    # tolerate switching the description/title and the URL
    if($url !~ m{^[a-z]+[a-z0-9]*:\S+$}s) {
      DEBUG and print "URL \"$url\" looks fishy...\n";
      if( $title =~ m{^[a-z]+[a-z0-9]*:\S+$}s) {
        DEBUG and print "Swapping with title \"$title\"\n";
        ($url, $title) = ($title, $url);
        $self->url($url);
        $self->title($title);
      } elsif( $description =~ m{^[a-z]+[a-z0-9]*:\S+$}s) {
        DEBUG and print "Swapping with description \"$description\"\n";
        ($url, $description) = ($description, $url);
        $self->url($url);
        $self->description($description);
      } else {
        Carp::croak( "Invalid URL \"$url\" in metadata "
         . ($title||$description||"???") . "\nAborting"
        );
      }
    }
  }

  my $lang = $self->language;
  $lang and $lang =~ tr[_][\-]; # tolerate underscores
  $lang = 'en' unless defined $lang
   # From I18N::LangTags...
   and $lang !~ m/^[iIxI]$/s
   and $lang =~
    m/^(?:  # First subtag
         [xiIX] | [a-zA-Z]{2,3}
      )
      (?:  # Subtags thereafter
         -           # separator
         [A-Za-z0-9]{1,8}  # subtag  
      )*
    $/xs
  ;

  return join '', sprintf( qq{
<link>%s</link>
<title>%s</title>
<description>%s</description>
<language>%s</language>
<lastBuildDate>%s</lastBuildDate>
},
      map( $self->html2text($_),
        $url         || '!!!!DummyURL!!!!',
        $title       || $description || $url || '!!!!DummyTitle!!!!',
        $description || $title || $url || '!!!!DummyDescription!!!!',
      ),
      $lang,
      $self->_date_rfc822(),
    ),
    grep $_,
    
    $self->{"skipHours"},
    $self->{"skipDays"},
    $self->_sy_update_as_xml,
    (($self->{"ttl"} || '') =~ m/^(\d+)$/s) && "<ttl>$1</ttl>\n",
    $self->webMaster &&
     ("<webMaster>" . $self->html2text($self->webMaster) . "</webMaster>\n"),
    
    $self->docs &&
     ("<docs>" . $self->html2text($self->docs) . "</docs>\n"),

    $self->_image_as_xml,
    $self->{'more_metadata'}, # a hack for sneaking in more things
  ;

# ...with sanity-checkers

}
#..........................................................................

sub _process_item_params {
  my $self = shift;
  my($url, $title, $description) =
    map {; (defined($_) && m/\S/) ? $_ : '' } # contentfulness filter
    map $self->html2text($_),  # here's where we de-htmlify things
    @_;
  ;
  
  for($url, $title, $description) {
    if(ref $_       ) { }  # Okay
    elsif(defined $_) { s/^\s+//s; s/\s+$//s }
    else              { $_ = '' }
  }
  
  # Tolerate switching the description/title and the URL
  if($DWIM and $url !~ m{^[a-z]+[a-z0-9]*:\S+$}s) {
    DEBUG and print "URL \"$url\" looks fishy...\n";
    if( $title =~ m{^[a-z]+[a-z0-9]*:\S+$}s) {
      DEBUG and print "Swapping with title \"$title\"\n";
      ($url, $title) = ($title, $url);
    } elsif( $description =~ m{^[a-z]+[a-z0-9]*:\S+$}s) {
      DEBUG and print "Swapping with description \"$description\"\n";
      ($url, $description) = ($title, $description);
    } else {
      Carp::confess( "Invalid URL \"$url\" in item "
       . ($title||$description||"???") . "\nAborting"
      );
    }
  }
  return ($url, $title, $description);
}

#..........................................................................

sub _items_as_xml {
  my $self = $_[0];
  my @items;
  my @xml_out = ($MaybeNL);

  if( $self->allow_duplicates ) {
    @items = @{ $self->{'items'} || die "NO ITEMS!?!?" };
  } else {
    my %seen;
    foreach my $i (@{ $self->{'items'} || die "NO ITEMS!?!?" }) {
      if( $seen{ $i->[0] } ++ ) {
        DEBUG and print "Removing duplicate item @$i\n";
      } else {
        push @items, $i;
      }
    }
  }

  my $item_limit = int( $self->item_limit || 0 );
  if($item_limit) {
    if(@items > abs($item_limit)) {
      if($item_limit > 0) { # like 4 to mean just the first 4
        DEBUG and print " Killing all but the first $item_limit items.\n";
        splice @items, $item_limit;
      } else { # like -4 to mean just the last 4
        DEBUG and print " Killing all but the last ", 0-$item_limit, " items.\n";
        splice @items, 0, @items + $item_limit;
         # So if item_limit is -3 and @items has 10 elements,
         #  then that number will be 7, i.e., to chop the first 7
         #  elements, leaving the last 3.
      }
    }
  }
  DEBUG and print scalar(@items), " items at hand:\n";
  
  foreach my $i (@items) {
    my($url, $title, $description) = @$i;
    DEBUG > 1 and print "I: (u $url) (t $title) (d $description)\n";
    next unless $url or $title or $description;
    push @xml_out, 
     "<item>$MaybeNL",
     (map "$MaybeIndent$_$MaybeNL",
       length($title)       ? "<title>$title</title>" : (),
       length($url)         ? "<link>$url</link>" : (),
       length($description) ? "<description>$description</description>" : (),
     ),
     "</item>$MaybeNL\n",
  }
  DEBUG and print "_items_as_xml returning {\n", join('', @xml_out), "}\n\n";
  
  return join '', @xml_out;
}

#..........................................................................

sub _image_as_xml {
  my $self = shift;
  return '' unless
    $self->image_url and $self->image_height and $self->image_width;

  # <!ELEMENT image (title | url | link | width? | height? | description?)*>

  return join '',
    "<image>\n",
    map("  $_\n" =>
      $self->xmlelem( 'title'  => $self->image_title || $self->html2text($self->title)),
      $self->xmlelem( 'url'    => $self->image_url), # url of the image
      $self->xmlelem( 'link'   => $self->image_link  || $self->html2text($self->url  )),
      $self->xmlelem( 'width'  => $self->image_width),
      $self->xmlelem( 'height' => $self->image_height),
      $self->xmlelem( 'description'
                 => $self->image_description
                    || $self->html2text($self->description)),
    ),
    "</image>\n",
  ;
}

#==========================================================================


=item C<get_url( I<url> );>

=item C<$content = get_url( I<url> );>

=item I<or:> C<< $content = $rss->get_url(...); >>

=item I<or:> C<< $content->get_url(...); >>

This tries to get the content of the given url, and returns it.

This is quite like L<LWP::Simple>'s C<get> function, but with some
additional features:

=over

=item * If it can't
get the URL's content at first, it will sleep for a few seconds and try
again, up to about five times. (This is to avoid the case of the URL
being temporarily inaccessible simply because the DNS is a bit slow,
or because the server is too busy.)

=item * If it can't get the content, even after several retries,
it will abort the program (like a C<die>).  If you want to override this
behavior, then call it as C<eval { get_url($url) };>

=item * If you call the function in void context (i.e., not using its
return value), then the function assigns the URL's content to C<$_>.
That's so you can write nice concise code like this:

           get_url $thatsite;
           m/Top Stories Tonight/ or die "What, no top stories?";
           while( m{<a class="top" href="(.*?)">(.*?)</a>}g ) {
             rss_item("$thatsite/$1", $2);
           }

=item * This returns the content of the URL not exactly as-is, but after
changing its newlines to native format.  That is, if the contents of the
URL use CR-LF pairs to express newlines, then C<get_url> changes these
to C<\n>'s before returning the content.  (Similarly for old MacOS
newline format.)  Clearly this is wrong in you're dealing with binary
data; in that case, use LWP::Simple's C<get> directly.

=item * Finally, as a resource-conversation measure, this function
will also try to call C<sleep> a few times if it sees several quick
calls to itself coming from a program that seems to be running
under crontab.  As most of my RSS-generators are crontabbed, I
find it very useful that I can have however many C<get_url>'s in
my crontabbed programs without worrying that they'll take even a
noticeable part of the server's bandwidth.

=back

=cut

my $last_url_get_time;

sub get_url ($) {
  my $self = shift if @_ > 1; # work as a function or method

  #  Go whip up an object unless one was given:
  $self = ($RSS_obj ||= XML::RSS::SimpleGen::->new) unless defined $self;
  $self = $self->new unless ref $self;
  
  my $url = $_[0];
  Carp::croak "\"$url\" doesn't look like a URL!\nAborting"
   unless defined($url) and $url =~ m{^[a-z]+[a-z0-9]*:\S+$}s;
  
  if($Sleepy and $last_url_get_time) {
    my $delay = $Sleepy - (time() - $last_url_get_time);
    if( $delay > 0 ) {
      DEBUG and print "Last URLget was at $last_url_get_time, sleep $delay\n";
      sleep $delay;
    } else {
      DEBUG and print "Last URLget was at $last_url_get_time, so no sleep.\n";
    }
  }
  
  my $content;
  my $count = 0;
  foreach my $delay (@Retry_delays, 0) {
    delete $self->{'_loops'};
    delete $self->{'_http_abort'};

    DEBUG and print "Getting $url ...\n";
    ++$count;
    if( defined(
      $content  =  $self->_get($url)
    )) {
      DEBUG and print "OK, got it (", length($content), " bytes)\n";
      last;
    }
    
    if( $self->{'_http_abort'} ) {
      DEBUG and print "Couldn't get it and won't retry (", 
        $self->{'_http_abort'}, ")\n";
      last;
    } else {
      DEBUG and print "Odd, couldn't get it.\n";
    }
    if($delay) { DEBUG and print "Sleeping $delay sec...\n"; sleep $delay; }
  }
  $last_url_get_time = time();

  unless( defined $content ) {
    my $headers = $self->{'_http_headers'};
    if( $headers and $headers =~ s{^}{  }mg ) {
      $headers = "\nResponse headers:\n$headers";
    } else {
      $headers = '';
    }
    $count .= ($count == 1) ? " try" : " tries";
    Carp::croak("Couldn't get $url in $count$headers\nSo, aborting")
  }
  
  if($Nativize_newlines) {
    if("\n" eq "\cj") {       # CR => LF    CR LFLF... => LF   LF => LF
      $content =~ s/\cm\cj*/\n/g; # most efficient, I dare say
    } elsif("\n" eq "\cm") {  # CR => CR    CR LFLF... => CR   LF => CR
      $content =~ s/(?:(?:\cm\cj+)|\cj)/\n/g;
    } else {
      $content =~ s/(?:\n|\r|\n\r)/\n/g;
    }
  }
  
  $_ = $content unless defined wantarray;
  return $content;
}

#==========================================================================
#  Things below here are less and less interesting to the casual reader.
#==========================================================================

sub _get {
  my $self = shift;
  if(
    !$LWP::Simple::VERSION
    and $_[0] =~ m{^http://([^ \n\r\t/:\@]+)(?::(\d+))?(/\S*)?$}
  ) {
    my $host = $1;
    my $path = $3;
    my $port = 0 + ($2 || 80);
    if( $BadPorts{$port} ) {
      DEBUG and print "We don't like port $port from $_[0]\n";
      return undef;
    }
    
    $path = "/" unless defined($path);
    $self = $self->new unless ref($self); # need to be an object method
    return $self->_trivial_http_get($host, $port, $path);
  } else {
    return $self->_lwp_get(@_);
  }
}

sub _lwp_get {
  require LWP::Simple;
  DEBUG and print "Calling LWP::Simple on $_[1]\n";
  return LWP::Simple::get($_[1]);
}

sub _trivial_http_get {
   my($self, $host, $port, $path) = @_;
   DEBUG > 1 and print "Getting HOST=$host, PORT=$port, PATH=$path\n";

   $self = $self->new unless ref($self); # need to be an object method
   my $seen = ( $self->{'_loops'} ||= {} );

   require IO::Socket;
   local($^W) = 0;
   my $sock = IO::Socket::INET->new(PeerAddr => $host,
                                    PeerPort => $port,
                                    Proto    => 'tcp',
                                    Timeout  => 60) || return undef;
   $sock->autoflush;
   my $netloc = $host;
   $netloc .= ":$port" if $port != 80;
   print $sock join("\015\012" =>
                  "GET $path HTTP/1.0",
                  "Host: $netloc",
                  "User-Agent: $UserAgentString",
                  "", "");

   my $buf = "";
   my $n;
   while( $n = sysread($sock, $buf, 8*1024, length($buf)) ) {
     DEBUG > 10 and print "    Got $n bytes...\n";
     1;
   }
   return undef unless defined($n);

   if( $buf =~ m{^HTTP/\d+\.\d+\s+(\d+)[^\012]*\012} ) {
     my $code = $1;
     DEBUG and print " Got HTTP status: $code\n";
     if( $code =~ m/^30[1237]/s and $buf =~ m/\012Location:\s*(\S+)/ ) {
       # Redirection
       my $url = $1;
       if( $url =~ m/^(file|mailto):/  # protocols we hate
         or $seen->{$url}++
         or scalar(keys %$seen) > 20
       ) {
         DEBUG and print "I don't like the redirection response $url\n";
         $self->{'_http_abort'} = "Bad HTTP-redirection loop.";
         return undef;
       }
       return $self->_get($url);  # Recurse!
     }

     $buf =~ s/(.+?)\015?\012\015?\012//s;  # zap the header
     ( $self->{'_http_headers'} = $1 )   =~   tr/\015\012/\n/sd;
     
     DEBUG > 10 and print "Headers: $$self{'_http_headers'}\n";
     
     $self->{'_http_abort'} = "HTTP status $code"
      if $code eq '404' or $code eq '403';
     return undef unless $code =~ m/^2/;
     
     DEBUG and print "Returning ", length($buf), " bytes of content.\n";
   } else {
     DEBUG and print "Got a headerless response.  Returning.\n";
   }

   return $buf;
}

#==========================================================================

sub _read_history_file {
  my $self = $_[0];
  my $hf = $self->history_file;
  unless(defined $hf and length $hf) {
    DEBUG and print "No history_file defined for $self.\n";
    return;
  }
  
  my(%first, %last);  # "last" in the sense of "most recently"
  $self->{'_first_seen'} = \%first;
  $self->{'_last_seen' } = \%last ;

  unless( -e $hf and -s _ ) {
    $self->{'_virgin_item_timestamp'} = time() if $DWIM;
    return 0;
  }

  my $now = time();
  my $forget_before;
  
  my $in;
  {
    local *IN;
    open(IN, $hf) or Carp::confess "Can't read-open $hf: $!";  # insane
    $in = *IN{IO};
  }
  local $_;
  my @f;
  while(<$in>) {
    tr/\n\r//d;
    next unless @f = split "\t", $_, 3 and defined($f[0]) and length($f[0]);

    $last{$f[0]} = $f[2] if $f[2];

    if( $f[1] ) {
      $first{$f[0]} = $f[1];
      DEBUG > 3 and print " Learning $f[0] first seen at $f[1]\n";
    } else {
      $first{$f[0]} = $now;
      DEBUG > 3 and print " Prelearning $f[0] first seen at $f[1]\n";
       # TODO: is this useful?
    }
  }
  close($in);

  return 1;
}

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

sub _write_history_file {
  my $self = $_[0];
  my $hf = $self->history_file;
  unless(defined $hf and length $hf) {
    DEBUG and print "No history_file defined for $self.\n";
    return;
  }
  
  my $first = $self->{'_first_seen'};
  my $last  = $self->{'_last_seen' };
  my $now   = time();
  
  my $out;
  DEBUG and print "Saving to history file $hf\n";
  DEBUG > 2 and printf "Time now: %s = %s\n", time(), scalar(localtime);
  {
    local *HF;
    open(HF, ">$hf") or Carp::confess "Can't write-open $hf: $!";  # insane
    $out = *HF{IO};
  }
  {
    my(@f, @x);
    {
      my %x;
      @x{keys %$first, keys %$last} = ();
      @x = sort keys %x;
    }

    my $forget_before;
    {
      my $r = $self->retention;
      if( $r and $r > 0 ) { $forget_before = time() - $r }
    }
    foreach my $key (@x) {
      next if $key =~ m/[\t\n\r]/;
      if( $forget_before and $last->{$key} < $forget_before ) {
        DEBUG and printf(
          " Forgetting %s as being too old since last-seen (%s = %s)\n",
          $key,
          $last->{$key},
          scalar(localtime($last->{$key})),
        );
        next;
      }
      print $out      $key, "\t",
        $first->{$key}||'', "\t",
         $last->{$key}||'', "\n",
      ;
      
      if(DEBUG > 2) {
        printf "  Key %s\n    First seen: %s = %s\n    Last seen:  %s = %s\n",
          $key,
                            $first->{$key}||'-',
          scalar(localtime( $first->{$key}||0  )),
                             $last->{$key}||'-',
          scalar(localtime(  $last->{$key}||0  )),
      }

    }
    close($out);
  }
  DEBUG and print "Done saving to $hf\n";
  return 1;
}

#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


=item C<rss_hourly> I<or> C<rss_daily> I<or> C<rss_twice_daily>
 I<or> C<rss_thrice_daily> I<or> C<rss_weekly> I<or> C<rss_every_other_hour>

Calling one of these functions declares that this feed is usually
generated at the same time(s) every day (or every week, in the case of
C<rss_weekly>). And, where it's not just once a day/week, these multiple
times a day are evenly spaced.  These functions then set the feed's
C<updatePeriod>, C<updateBase>, C<updateFrequency>, C<skipHours>,
C<skipDays>, and C<ttl> elements appropriately, so that RSS readers can know at
at what times there could (or couldn't) be new content in this feed.

In other words: use C<rss_twice_daily> if this feed is updated at about the
same time every day and then again 12 hours later.  Use C<rss_thrice_daily>
if this feed is updated at the same time daily, and then 8 hours later, and
then 8 hours later.  And use C<rss_every_other_hour> if the feed updates
at about I<n> minutes past every even numbered hour, or every odd-numbered
hour.

Clearly I mean these functions to be used in programs that are crontabbed
to run at particular intervals, as with a crontab line like one of these:

       52 * * * *         ~/thingy   # => rss_hourly
       52 23 * * *        ~/thingy   # => rss_daily
       52 4,16 * * *      ~/thingy   # => rss_twice_daily
       52 5,13,21 * * *   ~/thingy   # => rss_thrice_daily
       52 23 * * 3        ~/thingy   # => rss_weekly
       52 */2 * * *       ~/thingy   # => rss_every_other_hour

Clearly there aren't C<rss_I<interval>> functions for all the scheduling
possibilities programs -- if you have a program that has to run at
6am, 8am, 1pm, and 4pm, there's no function for that.  However, the above
crontab lines (or with minor changes, like C<1,9,17> instead of C<5,13,21>)
are just fine for almost every RSS feed I've run.

An aside: I recommend running the programs at about 52 minutes past the hour,
generally in series, like so:

       52 5,13,21 * * *   ~/thingy ; ~/dodad ; ~/makething ; ~/gizmo

However, your mileage may vary.

Incidentally, these functions take no arguments, so the parentheses are
optional.  That is, these two lines do the same thing:

       rss_hourly;
       rss_hourly();

=cut

## Some handy if somewhat arbitrary shortcuts:
#
sub hourly {
  my $self = $_[0];
  $self->updatePeriod('hourly');
  $self->ttl('60');
  return;
}

sub daily {
  my $self = $_[0];
  $self->updateHours();
  $self->updatePeriod('daily');
  $self->ttl( 24 * 60 );
  return;
}

sub twice_daily  {
  my $self = $_[0];
  my $h = (gmtime( $self->_now_rounded_up ))[2];
  $self->updateHours( $h,  ($h+12) % 24 );
  $self->updatePeriod('daily',2);
  $self->ttl( 12 * 60 );
  return;
}

sub thrice_daily  {
  my $self = $_[0];
  my $h = (gmtime( $self->_now_rounded_up ))[2];
  $self->updateHours( $h,  ($h+ 8) % 24,  ($h+16) % 24 );
  $self->updatePeriod('daily',3);
  $self->ttl( 8 * 60 );
  return;
}

sub weekly {
  my $self = $_[0];
  $self->updateHours();
  $self->updateDays();
  $self->updatePeriod('weekly',1);
  $self->ttl( 7 * 24 * 60 );
  return;
}

{
my(@odds, @evens);
for(0 .. 23) { push @{  ($_ & 1) ? \@odds : \@evens  }, $_ }

sub every_other_hour {
  my $self = $_[0];
  my $h = (gmtime( $self->_now_rounded_up ))[2];
  $self->skipHours( ($h & 1) ? @evens : @odds); 
  $self->updatePeriod('daily',12);
  $self->ttl( '120' );
  return;
}
}
#..........................................................................

my @day_names = (
 "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", 
);
my %is_day_name;
@is_day_name{@day_names} = @day_names;

#..........................................................................

sub _now_rounded_up {
  my $self = $_[0];
  my $now = $_[0]{'_force_now'}   # to be used only for testing purposes
    || time();
  if( $CHUNK_MINUTES ) {
    my $tweak = ($CHUNK_MINUTES * 60) - ($now % ($CHUNK_MINUTES * 60));
    DEBUG and print "Tweaking $now (", scalar(gmtime($now)),
      " GMT) by $tweak seconds\n so it'll be an even $CHUNK_MINUTES minutes: ";
    $now += $tweak;
    DEBUG and print "$now (", scalar(gmtime($now)), " GMT)\n";
  } else {
    # probably not a good idea
    DEBUG and print "Archoring timebase to right this moment.\n";
  }
  return $now;
}

sub _now { return $_[0]{'_force_now'} || time() }

#..........................................................................

=back

=head2 MINOR FUNCTIONS

These are functions that you probably won't need often, or at all.  I include
these for the sake of completeness, and so that advanced users might find them
useful in some cases.

=over

=item C<rss_skipHours( I<gmt_hour_num, gmt_hour_num, ...> );>

This function directly sets the C<skipHours> element's values to the
specified GMT hour numbers.

=cut

sub skipHours {
  my($self, @in) = @_;
  my @skiphours;
  foreach my $hour (@in) {
    next unless defined $hour;
    Carp::croak "\"$hour\" isn't a valid hour number (must be 0-23)"
     unless $hour <= 24 and $hour >= 0;
    push @skiphours, ($hour == 24) ? 0 : (0 + $hour);
     # tolerate "24" to mean 0h.
  }
  DEBUG and print "Skipdays: @skiphours\n";
  $self->{'skipHours'} = join '',
    "<skipHours>", map( "<hour>$_</hour>", @skiphours), "</skipHours>\n"
  ;
  return;
}

#--------------------------------------------------------------------------

=item C<rss_updateHours();>

=item C<rss_updateHours( I<gmt_hour_num, gmt_hour_num, ...> );>

This function is a wrapper around C<rss_skipHours> -- you call
C<rss_updateHours> with a list of GMT hour numbers, and 
C<rss_updateHours> will call C<rss_skipHours(0 .. 23)> except I<without>
whatever hour numbers you specified.

If you call with an empty list (i.e., C<rss_updateHours();>), then
we uses C<gmtime> to find out the current hour (and rounds it up
if it's after 50 minutes past), basically just as if you'd called:

      rss_updateHours( (gmtime(600+time()))[2] );

=cut

sub updateHours { # Just the complement of skipHours.
  # Feeding it () means updates only at this hour of day
  # (This is fine since you'd never mean to actually declare
  # a feed whose updateHours is never, i.e. whose skipHours
  # is all of 0-23)
  my $self = shift;
  my %hours;
  @hours{  @_  ?  (map $_+0, @_)  :
    ( gmtime( $self->_now_rounded_up ) )[2]  } = ();
  # might as well count 10:57 as 11h, etc
  DEBUG and print "HOURS UPDATEY :", join(' ', sort keys %hours), "\n";
  $self->skipHours( grep !exists($hours{$_}), 0 .. 23 );
  return;
}

#..........................................................................

=item C<rss_skipDays();>

=item C<rss_skipDays( I<gmt_day_num, gmt_day_num, ...> );>

=item C<rss_skipDays( I<gmt_day_name, gmt_day_name, ...> );>

This function directly sets the C<skipDays> element's values to the
specified weekdays.  Note that this accepts either integers (like
6 for Saturday, Sunday being either 0 or 7), or their exact
English names.

If you use the C<skipDays> field, consider that it refers to days
figured by GMT, not local time.  For example, if I say to skip Saturdays,
that means Saturdays GMT, which in my timezone (Alaska) starts
in the middle of Friday afternoon.

=cut

sub skipDays {
  my($self,@in) = @_;
  my @skipdays;
  foreach my $day (@in) {
    next unless defined $day;
    if($day =~ m/^[0-7]$/s) { # tolerate numeric day specs
      $day = 0 if $day == 7;
      $day = $day_names[$day]
       || Carp::croak "Day number \"$day\" is out of range (0-6)";
    } else {
      Carp::croak "\"$day\" isn't a valid day name (use 0-6 or one of: @day_names)"
       unless $is_day_name{$day};
    }
    push @skipdays, $day;
  };
  
  DEBUG and print "Skipdays: @skipdays\n";
  $self->{'skipDays'} = join '',
    "<skipDays>", map( "<day>$_</day>", @skipdays), "</skipDays>\n"
  ;
  return;
}

#..........................................................................

=item C<rss_updateDays();>

=item C<rss_updateDays( I<gmt_day_num, gmt_day_num, ...> );>

=item C<rss_updateDays( I<gmt_day_name, gmt_day_name, ...> );>

This function is a wrapper around C<rss_skipDays> -- you call
C<rss_updateDays> with a list of GMT day names/numbers, and 
C<rss_updateDays> will call C<rss_skipDays(0 .. 6)> except I<without>
whatever days you specified.

If you call with an empty list (i.e., C<rss_updateDays();>), then
we uses C<gmtime> to find out the current day (GMT!), basically
just as if you'd called:

      rss_updateDays( (gmtime(600+time()))[6] );


=cut

sub updateDays { # just the complement of skipDays
  # Feeding it () means updates only at this day of the week
  # (This is fine since you'd never mean to actually declare
  # a feed whose updateDays is never, i.e., whose updateDays
  # is all of Monday thru Sunday)
  my $self = shift;
  my %days;
  @days{
    map {;
      m/^[0-7]$/ ? $day_names[ ($_ == 7) ? 0 : $_ ]
      : $is_day_name{$_} ? $_
      : Carp::croak "\"$_\" isn't a valid day name (use 0-6 or one of: @day_names)"
    }
    @_ ? @_ : ( gmtime( $self->_now_rounded_up ) )[6]
  } = ();
  DEBUG and print "DAYS UPDATEY :", join(' ', sort keys %days), "\n";
  $self->skipDays( grep !exists($days{$_}), @day_names );
  return;
}


#--------------------------------------------------------------------------

=item C<rss_updatePeriod( I<periodstring> );>

This function directly sets the C<sy:updatePeriod> element's value to the
period specified.  You must specify one of the strings:
"yearly", "monthly", "weekly", "daily", "hourly".
I advise using "weekly" only if you know what you're doing, and
"yearly", "monthly" only if you I<really> know what you're doing.

=item C<rss_updatePeriod( I<periodstring>, I<int>, I<base> );>

This is a shortcut for
C<<
rss_updatePeriod(I<periodstring>); rss_updateFrequency(I<int>)
>>

=item C<rss_updatePeriod( I<periodstring>, I<int>, I<base> );>

This is a shortcut for
C<<
rss_updatePeriod(I<periodstring>); rss_updateFrequency(I<int>);
rss_updateBase(I<base>)
>>

=cut

sub updatePeriod {
  return $_[0]->{'updatePeriod'} if @_ == 1;
  # Else we're a write accessor:
  
  my($self, $period) = @_;
  $period or Carp::confess(
   "What period? yearly/monthly/weekly/daily/hourly?");

  if($period =~ m/^(yearly|monthly|weekly|daily|hourly)$/s) {
    $self->{'updatePeriod'} = $period;
    $self->updateFrequency($_[2]) if @_ > 2;	
    $self->updateBase($_[3]) if @_ > 3;
    $self->{'_namespaces'}{'sy'} = $NAMESPACE_SY;
    return $period;
  } else {
    Carp::confess(
     "What kind of period is \"$period\"?  Use one of: yearly|monthly|weekly|daily|hourly");
  }
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

=item C<rss_updateBase( I<iso_date_string> );>

=item C<rss_updateBase( I<epoch_time> );>

This function directly sets the C<sy:updateBase> element's value to the
moment specified.  If you pass in an epoch time, it is converted to
an ISO date string.

=cut

sub updateBase {
  return $_[0]->{'updateBase'} if @_ == 1;
  # Else we're a write accessor:
  
  my($self, $then) = @_;
  if( $then =~ m/^-?\d+$/s ) {
    $self->{'updateBase'} = $self->_epoch2isodate($then);
  } elsif ( $then =~  # basically ISO8601
      m<^
        \d\d\d\d		# year
        (?:
          -\d\d			# month
          (?:
            -\d\d  # day
            (?:
              T\d\d:\d\d	# hh:mm
              (?:
                :\d\d		# seconds
                (?:
                  \.\d+		# fractions of a second
                )?
              )?
              (?:		# TZ offset
                Z		# Zulu
               |
                (?:		# or by offset:
                  [-+]
                  \d\d:\d\d     # hh:mm, with leading '+' or '-'
                )
              )?
            )?
          )?
          
        )?
         # The month was optional, but that
         #  makes "1994" ambiguous -- a year or an epoch time?
         # I doubt anyone wants to write <updateBase>2000</updateBase>,
         #  esp as the default is basically == <updateBase>1970</updateBase>.
        $
      >sx
  ) {
    $self->{'updateBase'} = $then;
  } else {
    Carp::confess("What kind of updateBase is \"$then\"?");
  }
  return $self->{'updateBase'};
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sub _epoch2isodate {
  my($self, $time) = @_;
  my(@timelist) = gmtime($time);
  ++$timelist[4];
  $timelist[5] += 1900;
  return sprintf("%04d-%02d-%02dT%02d:%02d+00:00",
       @timelist[ 5,   4,   3  , 2   ,1  ]);
       
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%PeriodAsSeconds = (
  'hourly' => 60 * 60,
  'daily'  => 60 * 60 * 24,
  'weekly' => 60 * 60 * 24 * 7,
);

sub _updateBase_init {
  # What to do?  Peg it on now plus Interval, rounded up to next M-minute interval?
  my $self = $_[0];
  my $now = $self->_now_rounded_up;
  
  my $period_type = $self->updatePeriod;
  if( $period_type eq 'monthly' or $period_type eq 'yearly') {
    $now = $self->_epoch2isodate( $now );
    if($period_type eq 'yearly') {
      $now =~       s/^....-/2000-/s || die "SPORK93931!"; # sanity
    } elsif($period_type eq 'monthly') {
      $now =~ s/^....-..-/2000-01-/s || die "SPORK35286!"; # sanity
    } else {
      die "SPORK!!!!!94829045"; #sanity
    }
    DEBUG > 1and print "Using $now as updateBase.\n";
  } else {
    # It's a plain ol' interval.
    DEBUG > 1 and print "Slapping $now (", gmtime($now). " into 1970.\n";
    my $freq = $self->updateFrequency();
    my $interval_as_seconds = int(
      ($PeriodAsSeconds{$period_type} ||die "SPORK84258 on '$period_type'!")
      / $freq)
    ;
    DEBUG > 1 and print
     "So, $freq times $period_type is $interval_as_seconds seconds...\n";
    $now %= $interval_as_seconds;
    DEBUG > 1 and print "Using $now (", gmtime($now). " as updateBase.\n";
  }
  $self->updateBase($now);
  return;
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

=item the accessor C<rss_updateFrequency( I<integer> );>

This function directly sets the C<sy:updateFrequency> element's value to the
value specified.  The value has to be a nonzero positive integer.

For example, this means that this feed updates at/by the start of every hour
and 30 minutes past:

  rss_updateBase('2000-01-01T00:00-00:00');
  rss_updateFrequency(2);
  rss_updatePeriod('hourly');  # 2*hourly means "twice an hour"

Recall that this can also be done with the
the C<rss_updatePeriod( I<per>, I<freq>, I<base> )> shortcut, like so:

  rss_updateBase('hourly', 2, '2000-01-01T00:00-00:00');

=cut

sub updateFrequency { # simple accessor, plus the int() thing
  if(@_ > 1) {
    $_[0]->{'updateFrequency'} = int($_[1]) || 1;
  } else {
    $_[0]->{'updateFrequency'}
  }
}

sub _updateFrequency_init { $_[0]->{'updateFrequency'} ||= 1 }

#--------------------------------------------------------------------------

sub _sy_update_as_xml {
  my $self = $_[0];
  return '' unless $self->{'updatePeriod'};
  $self->_updateFrequency_init();
  $self->_updateBase_init();
  return sprintf(

q{<sy:updateFrequency>%s</sy:updateFrequency>
<sy:updatePeriod>%s</sy:updatePeriod>
<sy:updateBase>%s</sy:updateBase>
},
    $self->updateFrequency,
    $self->updatePeriod,
    $self->updateBase,
  );
}

#--------------------------------------------------------------------------

# Aliases:
sub skip_hours       {shift->skipHours(       @_)}
sub skip_days        {shift->skipDays(        @_)}
sub update_days      {shift->updateDays(      @_)}
sub update_hours     {shift->updateHours(     @_)}
sub update_period    {shift->updatePeriod(    @_)}
sub update_base      {shift->updateBase(      @_)}
sub update_frequency {shift->updateFrequency( @_)}
sub webmaster        {shift->webMaster(       @_)}


#--------------------------------------------------------------------------

=item the accessor C<rss_retention(I<number>)>

If you are using an C<rss_history_file(I<file>)>, the history file will
accrete a list of all URLs it has seen.  But to keep this file from potentially
getting immense, items that haven't been seen for a while are thrown out.
The period of time a feed's items go unseen before each is forgotten is
called that feed's B<retention>, and is expressed in seconds.

The default retention value is 32 days (i.e., 32*24*60*60, the number
of seconds in 32 days).  If you wanted to change it to just a week,
you would do this with C<rss_retention(7*24*60*60)>.

As a special case, a zero or negative value for the retention means
to never clear anything from the history file, no matter how long
it has gone unseen.

=cut

#..........................................................................

=item C<rss_add_comment( I<strings> );>

Call this function if you want to add extra XML comments to this RSS file.
For example, if you call this:

        rss_add_comment(
          "Our terms of use: http://wherever.int/rsstou.html",
          "Any questions? Ask jimmy@wherever.int",
        );

...then this RSS feed will contain this XML fairly early on in the file:

        <!-- Our terms of use: http://wherever.int/rsstou.html -->
        <!-- Any questions? Ask jimmy@wherever.int -->

=cut

sub add_comment {
  my $self = shift;
  foreach my $c (@_) {
    push @{ $self->{'_comments'} }, $c
     if defined $c and length $c and $c =~ m/\S/;
      # no point in having contentless comments
  }
  return;
}

#--------------------------------------------------------------------------

=item the accessor C<rss_css( I<url> )>

This defines the given URL as being the XML-CSS stylesheet for this RSS
feed.  The default value is "./rss.css" if C<-e "rss.css"> is true, otherwise
is the value http://www.interglacial.com/rss/rss.css

=item the accessor C<rss_xsl( I<url> )>

This defines the given URL as being the XML-XSL stylesheet for this RSS
feed.  The default value is none.

=item The accessors
C<<
rss_url( I<string> ), rss_title( I<string> ), rss_description( I<string> )
>>

These define this feed's URL, title, and description.  These functions
are just for completeness, since it's simpler to just specify any/all of
these parameters in the call to C<rss_new>.

=item the accessor C<rss_ttl( I<number> )>

This sets the parameter of this RSS feed's C<ttl> element, which
suggests how long (in minutes, not seconds!) an RSS reader should wait after it polls
a feed until it polls it again.  For example, C<rss_ttl(90)> would suggest
that a reader should not poll this feed more often than every 90 minutes.

(This element is somewhat obsolescent next to the newer and more
informative C<sy:update*> elements, but is included for backward
compatability.)

=item the accessor C<rss_allow_duplicates( I<boolean> )>

This controls whether or not duplicate items are filtered out out the
feed.  By default this is I<on>.  Note that duplicates are detected only
by their URL, so if you call this:

        rss_item('http://foo.int/donate', "Give!");
        rss_item('http://foo.int/donate', "We need money!");
        rss_save('begging.rss');

...then only the first will appear in the feed, since the second item
has a URL that is already being saved in this feed.  (However,
C<rss_item_count> is still 2, because filtering out duplicates is
something that only happens as the feed is saved.)

=item the accessor C<rss_docs( I<url> )>

This sets the value of the not-generally-useful C<doc> RSS element.
The default value is "./about_rss.html" if C<-e "about_rss.html"> is
true, otherwise "http://www.interglacial.com/rss/about.html".

=item the accessors
C<<
rss_image_url(I<url>), rss_image_width(I<number>),
rss_image_height(I<number>),
rss_image_title(I<text>), rss_image_link(I<url>),
rss_image_description(I<text>)
>>

These are for manually setting the values of this feed's image element's
subelements:

  <image>
              <url> (rss_image_url)         </url>
            <width> (rss_image_width)       </width>
           <height> (rss_image_height)      </height>
            <title> (rss_image_title)       </title>
             <link> (rss_image_link)        </link>
      <description> (rss_image_description) </description>
  </image>

You rarely need to call any of these C<rss_image_I<whatever>> functions --
usually just calling C<rss_image( I<url, h, w> );> is enough.

=cut

#..........................................................................

my @DoW   = qw(Sun Mon Tue Wed Thu Fri Sat);
my @Month = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);

sub _date_rfc822 {
  my $self = shift;
  my @timelist = (@_ == 0) ? gmtime : (@_ == 1) ? gmtime($_[0]) : @_;
  $timelist[5] += 1900;

  return sprintf(
     "%s, %02d %s %04d %02d:%02d:%02d GMT",
      $DoW[$timelist[6]],
          $timelist[3],
               $Month[$timelist[4]],
                       @timelist[5, 2,1,0],
  );
}

sub _check_age {
  my($self, $filename, $maxage) = @_;
  my $age;
  if($filename and $maxage and $maxage < ($age = -M $filename)) {
    Carp::carp(
      sprintf "%s warning - %s is getting old -- it hasn't changed in %0.1f days!",
        ref($self) || $self,
        $filename,
        $age,
    );
  }
  return 0;
}

#..........................................................................
sub _various_comments {
  my $self = $_[0];
  my $x;
  return
    join '',
    map {; $x = $_; $x =~ s/--/__/g; "<!-- $x -->\n"; }
    @{ $self->{'_comments'} || [] }
  ;
}

#..........................................................................

sub _modversion_comment {
  my $self = $_[0];
  my $selfclass = ref($self);
  my $v = eval { $selfclass->VERSION } || $VERSION;
  return "\n<!-- Generated with Perl's $selfclass v$v -->\n";
}

#..........................................................................

sub _accessorize {  # A simple-minded method-maker
  no strict 'refs';
  foreach my $attrname (@_) {
    next if $attrname =~ m/::/; # a hack
    *{caller() . '::' . $attrname} = sub {
      use strict;
      unless((@_ == 1 or @_ == 2) and ref $_[0] ) {
        $Carp::CarpLevel = 1;
        Carp::croak(
         "Accessor usage: \$obj->$attrname() or \$obj->$attrname(\$new_value)"
        );
      }
      (@_ == 1) ?  $_[0]->{$attrname}
                : ($_[0]->{$attrname} = $_[1]);
    };
  }
  # Ya know, they say accessories make the ensemble!
  return;
}

#..........................................................................

sub xmlesc {
  my $self = shift;
  my $out = join '', @_;
  $out =~ s<([^\x20\x21\x23\x24\x25\x27-\x3b\x3d\x3f-\x7e])>
           <$CommonEnts{$1} || ('&#'.(ord($1)).';') >seg;
  return $out;
}

sub xmlelem {
  my $self = shift;
  my $gi   = shift;
  return "<$gi>" . $self->xmlesc(@_) . "</$gi>";
}

#..........................................................................

sub html2text {

  # A rudimentary HTML tokenizer, adapted and simplified
  # from Gisle Aas's HTML::Parser v2.25...

  local $_;
  my($self, @out);
  ($self, $_) = @_;

  return undef unless defined $_;
  return $$_   if ref($_) eq 'SCALAR';  # Pass a scalar ref to bypass!
  return ''    unless length  $_;

  if( m/^[\x00-\x7e]+$/s and ! m/[<>&]/s) {
    # Most common case: a simple string needing no HTML parsing.
    # So just compact and trim whitespace, and move on.
    tr/\n\r\f\t / /s;
    s/ $//s;
    s/^ //s;
    return $_;
  }
  
  while( length($_) ) {
    if ( s@^([^&<]+)@@s) {  # Any plaintext
      DEBUG > 5 and print ":: Plaintext {$1}\n";
      push @out, $1;
    } elsif ( s@^
      (
        &\#
        (?:
          (?: # dec
            ([0-9]{1,7})
          )|(?: # or hex
           [xX]([0-9a-fA-F]{1,7})
          )
        )
      )
      \b
      ;?
      @@sx
    ) {
      DEBUG > 5 and print ":: Numeric ent {$1}",
         defined($2) ? " (dec $2)" 
       : defined($3) ? " (hex $3)" 
       : " (weird!)",
       "\n";

      if(      defined $3 and exists $WinLameEntities{hex($3)} ) {
        # it's a winlame ent, in hex
        DEBUG > 6 and print " Correcting that to &#$WinLameEntities{hex($3)};\n";
        push @out, \"&#$WinLameEntities{hex($3)};" ;
      } elsif( defined $2 and exists $WinLameEntities{0 + $2} ) {
        # it's a winlame ent, in decimal
        DEBUG > 6 and print " Correcting that to &#$WinLameEntities{0 + $2};\n";
        push @out, \"&#$WinLameEntities{0 + $2};"  ;
      } else {
        # it's a normal entity
        DEBUG > 6 and print " Passing it thru as \"$1;\"\n";
        push @out, \"$1;";
      }
      

    } elsif ( s@^&([A-Za-z][A-Za-z0-9]{0,10})\b(;?)@@s) {

      DEBUG > 5 and print ":: Named entity {$1}\n";
      if(exists $Entities{$1}) {
        push @out, \ $Entities{$1};
      } elsif(exists $Entities{ ucfirst(lc($1)) }) {
        DEBUG > 6 and print "::: Treating as if it were &",
          ucfirst(lc($1)), ";\n";
        push @out, \ $Entities{ ucfirst(lc($1)) };
      } else {
        DEBUG > 6 and print "::: Unresolvable!  Treating as plaintext\n";
        push @out, "&$1" . ($2 || '');
      }


    # Things we just ignore:
    } elsif( s@^(<!\s*--.*?--\s*>)@@s ) {  # "Netscape" comments
      DEBUG > 5 and print ":: Simple comment {$1}\n";
    } elsif( s@^(<[!?][^>]*>)@@s ) { # doctype, PI, or a weird comment
      DEBUG > 5 and print ":: Directive/PI {$1}\n";
    } elsif( s@^</?([a-zA-Z][a-zA-Z0-9\.\:\_\-]{0,72})\s*/?>@@ ) {
      # End-tag, or a simple start-tag
      push @out, ' ' if $IsBlockMarkup{lc $1};
      DEBUG > 5 and print ":: Simple tag {$1}",
        $IsBlockMarkup{lc $1} ? " +breaky": (), "\n";

    } elsif (    # complex start-tag
      s@
       ^
       (
        <
        ([a-zA-Z][a-zA-Z0-9\.\:\_\-]{0,72})  # the G.I.
        (?:
          \s+
          [a-zA-Z][a-zA-Z0-9\.\:\_\-]{0,72}
          (?:  # Attributes can be valueless!
            \s*
            =
            \s*
            (?:             # Attribute value...
              (?:
                "[^"]*"       # "foo bar"
              )|(?:
                '[^']*'       # 'foo bar'
              )|(?:
                [^<>\n\r\t ]{0,90} # foobarbaz
                  # 90 is my sane length-limit on unquoted attrvalues
              )
            )
          )?
        )*   # any nubmer of attribs
        \s*  # optional ending whitespace
        /?   # optional emptiness flag
        >
       )
       @@x
    ) {
      push @out, ' ' if $IsBlockMarkup{lc $2};
      DEBUG > 5 and print ":: Complex start-tag {$2}",
          $IsBlockMarkup{lc $2} ? " +breaky": (), "\n";
      
    # Gets called only on aberrant input, I think:
    } elsif( s@^(.)@@s ) {
      DEBUG > 5 and print ":: Last-resort single character {$1}\n";
      push @out, $1;
    
    } else {
      die "IMPOSSIBLE {$_}\n !!! "; # sanity-check
    }
  }
  
  foreach my $x (@out) {
    if( ref $x ) {
      $x = $$x;
    } else {  # do necessary escaping
      $x =~ tr/\n\r\f\t / /s; # smash whitespace
      $x = $self->xmlesc($x) unless $x =~ m/^[a-zA-Z0-9_'",\. ]*$/s
       # Dodge calling on the most common case, i.e., text
       #  that really doesn't need any excuse at all.
    }
  }

  return join '', @out;
}

#..........................................................................

$MIME_Type = 'application/rss+xml';

%WinLameEntities = (
 do {;
   my $c = 0x80;
   map {; $c++ => (hex($_) || 0x007e) }
   qw(
20ac 0000 201a 0192 201e 2026 2020 2021 02c6 2030 0160 2039 0152 00 017d 0000
0000 2018 2019 201c 201d 2022 2013 2014 02dc 2122 0161 203a 0153 00 017e 0178
)#                 |                   #                   |
});

_init_common_ents();

sub _init_common_ents {
  %CommonEnts = (
    '&' => '&amp;',
    '<' => '&lt;',
    '>' => '&gt;',
    '"' => '&quot;',
    ( map {; chr($_) => " " } 0 .. 31 ),
    ( map {; chr($_) => "&#$WinLameEntities{$_};" } keys %WinLameEntities ),
  );
  return;
}

%Entities = (
 # HTML entities gotten from the HTML DTDs
 
 'Aacute' => '&#xc1;',    'aacute' => '&#xe1;',   'Acirc' => '&#xc2;',
 'acirc' => '&#xe2;',     'acute' => '&#xb4;',    'AElig' => '&#xc6;',
 'aelig' => '&#xe6;',     'Agrave' => '&#xc0;',   'agrave' => '&#xe0;',
 'alefsym' => '&#x2135;', 'Alpha' => '&#x391;',   'alpha' => '&#x3b1;',
 'amp' => '&#x26;',       'and' => '&#x2227;',    'ang' => '&#x2220;',
 'apos' => '&#x27;',      'Aring' => '&#xc5;',    'aring' => '&#xe5;',
 'asymp' => '&#x2248;',   'Atilde' => '&#xc3;',   'atilde' => '&#xe3;',
 'Auml' => '&#xc4;',      'auml' => '&#xe4;',     'bdquo' => '&#x201e;',
 'Beta' => '&#x392;',     'beta' => '&#x3b2;',    'brvbar' => '&#xa6;',
 'bull' => '&#x2022;',    'cap' => '&#x2229;',    'Ccedil' => '&#xc7;',
 'ccedil' => '&#xe7;',    'cedil' => '&#xb8;',    'cent' => '&#xa2;',
 'Chi' => '&#x3a7;',      'chi' => '&#x3c7;',     'circ' => '&#x2c6;',
 'clubs' => '&#x2663;',   'cong' => '&#x2245;',   'copy' => '&#xa9;',
 'crarr' => '&#x21b5;',   'cup' => '&#x222a;',    'curren' => '&#xa4;',
 'dagger' => '&#x2020;',  'Dagger' => '&#x2021;', 'darr' => '&#x2193;',
 'dArr' => '&#x21d3;',    'deg' => '&#xb0;',      'Delta' => '&#x394;',
 'delta' => '&#x3b4;',    'diams' => '&#x2666;',  'divide' => '&#xf7;',
 'Eacute' => '&#xc9;',    'eacute' => '&#xe9;',   'Ecirc' => '&#xca;',
 'ecirc' => '&#xea;',     'Egrave' => '&#xc8;',   'egrave' => '&#xe8;',
 'empty' => '&#x2205;',   'emsp' => '&#x2003;',   'ensp' => '&#x2002;',
 'Epsilon' => '&#x395;',  'epsilon' => '&#x3b5;', 'equiv' => '&#x2261;',
 'Eta' => '&#x397;',      'eta' => '&#x3b7;',     'ETH' => '&#xd0;',
 'eth' => '&#xf0;',       'Euml' => '&#xcb;',     'euml' => '&#xeb;',
 'euro' => '&#x20ac;',    'exist' => '&#x2203;',  'fnof' => '&#x192;',
 'forall' => '&#x2200;',  'frac12' => '&#xbd;',   'frac14' => '&#xbc;',
 'frac34' => '&#xbe;',    'frasl' => '&#x2044;',  'Gamma' => '&#x393;',
 'gamma' => '&#x3b3;',    'ge' => '&#x2265;',     'gt' => '&#x3e;',
 'harr' => '&#x2194;',    'hArr' => '&#x21d4;',   'hearts' => '&#x2665;',
 'hellip' => '&#x2026;',  'Iacute' => '&#xcd;',   'iacute' => '&#xed;',
 'Icirc' => '&#xce;',     'icirc' => '&#xee;',    'iexcl' => '&#xa1;',
 'Igrave' => '&#xcc;',    'igrave' => '&#xec;',   'image' => '&#x2111;',
 'infin' => '&#x221e;',   'int' => '&#x222b;',    'Iota' => '&#x399;',
 'iota' => '&#x3b9;',     'iquest' => '&#xbf;',   'isin' => '&#x2208;',
 'Iuml' => '&#xcf;',      'iuml' => '&#xef;',     'Kappa' => '&#x39a;',
 'kappa' => '&#x3ba;',    'Lambda' => '&#x39b;',  'lambda' => '&#x3bb;',
 'lang' => '&#x2329;',    'laquo' => '&#xab;',    'larr' => '&#x2190;',
 'lArr' => '&#x21d0;',    'lceil' => '&#x2308;',  'ldquo' => '&#x201c;',
 'le' => '&#x2264;',      'lfloor' => '&#x230a;', 'lowast' => '&#x2217;',
 'loz' => '&#x25ca;',     'lrm' => '&#x200e;',    'lsaquo' => '&#x2039;',
 'lsquo' => '&#x2018;',   'lt' => '&#x3c;',       'macr' => '&#xaf;',
 'mdash' => '&#x2014;',   'micro' => '&#xb5;',    'middot' => '&#xb7;',
 'minus' => '&#x2212;',   'Mu' => '&#x39c;',      'mu' => '&#x3bc;',
 'nabla' => '&#x2207;',   'nbsp' => '&#xa0;',     'ndash' => '&#x2013;',
 'ne' => '&#x2260;',      'ni' => '&#x220b;',     'not' => '&#xac;',
 'notin' => '&#x2209;',   'nsub' => '&#x2284;',   'Ntilde' => '&#xd1;',
 'ntilde' => '&#xf1;',    'Nu' => '&#x39d;',      'nu' => '&#x3bd;',
 'Oacute' => '&#xd3;',    'oacute' => '&#xf3;',   'Ocirc' => '&#xd4;',
 'ocirc' => '&#xf4;',     'OElig' => '&#x152;',   'oelig' => '&#x153;',
 'Ograve' => '&#xd2;',    'ograve' => '&#xf2;',   'oline' => '&#x203e;',
 'Omega' => '&#x3a9;',    'omega' => '&#x3c9;',   'Omicron' => '&#x39f;',
 'omicron' => '&#x3bf;',  'oplus' => '&#x2295;',  'or' => '&#x2228;',
 'ordf' => '&#xaa;',      'ordm' => '&#xba;',     'Oslash' => '&#xd8;',
 'oslash' => '&#xf8;',    'Otilde' => '&#xd5;',   'otilde' => '&#xf5;',
 'otimes' => '&#x2297;',  'Ouml' => '&#xd6;',     'ouml' => '&#xf6;',
 'para' => '&#xb6;',      'part' => '&#x2202;',   'permil' => '&#x2030;',
 'perp' => '&#x22a5;',    'Phi' => '&#x3a6;',     'phi' => '&#x3c6;',
 'Pi' => '&#x3a0;',       'pi' => '&#x3c0;',      'piv' => '&#x3d6;',
 'plusmn' => '&#xb1;',    'pound' => '&#xa3;',    'prime' => '&#x2032;',
 'Prime' => '&#x2033;',   'prod' => '&#x220f;',   'prop' => '&#x221d;',
 'Psi' => '&#x3a8;',      'psi' => '&#x3c8;',     'quot' => '&#x22;',
 'radic' => '&#x221a;',   'rang' => '&#x232a;',   'raquo' => '&#xbb;',
 'rarr' => '&#x2192;',    'rArr' => '&#x21d2;',   'rceil' => '&#x2309;',
 'rdquo' => '&#x201d;',   'real' => '&#x211c;',   'reg' => '&#xae;',
 'rfloor' => '&#x230b;',  'Rho' => '&#x3a1;',     'rho' => '&#x3c1;',
 'rlm' => '&#x200f;',     'rsaquo' => '&#x203a;', 'rsquo' => '&#x2019;',
 'sbquo' => '&#x201a;',   'Scaron' => '&#x160;',  'scaron' => '&#x161;',
 'sdot' => '&#x22c5;',    'sect' => '&#xa7;',     'shy' => '&#xad;',
 'Sigma' => '&#x3a3;',    'sigma' => '&#x3c3;',   'sigmaf' => '&#x3c2;',
 'sim' => '&#x223c;',     'spades' => '&#x2660;', 'sub' => '&#x2282;',
 'sube' => '&#x2286;',    'sum' => '&#x2211;',    'sup' => '&#x2283;',
 'sup1' => '&#xb9;',      'sup2' => '&#xb2;',     'sup3' => '&#xb3;',
 'supe' => '&#x2287;',    'szlig' => '&#xdf;',    'Tau' => '&#x3a4;',
 'tau' => '&#x3c4;',      'there4' => '&#x2234;', 'Theta' => '&#x398;',
 'theta' => '&#x3b8;',    'thetasym' => '&#x3d1;','thinsp' => '&#x2009;',
 'THORN' => '&#xde;',     'thorn' => '&#xfe;',    'tilde' => '&#x2dc;',
 'times' => '&#xd7;',     'trade' => '&#x2122;',  'Uacute' => '&#xda;',
 'uacute' => '&#xfa;',    'uarr' => '&#x2191;',   'uArr' => '&#x21d1;',
 'Ucirc' => '&#xdb;',     'ucirc' => '&#xfb;',    'Ugrave' => '&#xd9;',
 'ugrave' => '&#xf9;',    'uml' => '&#xa8;',      'upsih' => '&#x3d2;',
 'Upsilon' => '&#x3a5;',  'upsilon' => '&#x3c5;', 'Uuml' => '&#xdc;',
 'uuml' => '&#xfc;',      'weierp' => '&#x2118;', 'Xi' => '&#x39e;',
 'xi' => '&#x3be;',       'Yacute' => '&#xdd;',   'yacute' => '&#xfd;',
 'yen' => '&#xa5;',       'yuml' => '&#xff;',     'Yuml' => '&#x178;',
 'Zeta' => '&#x396;',     'zeta' => '&#x3b6;',    'zwj' => '&#x200d;',
 'zwnj' => '&#x200c;',
);

foreach my $tagname ( qw{
 br
 address applet area base bgsound blockquote body button caption center col
 colgroup dd del dir div dl dt fieldset form frame frameset h1 h2 h3 h4 h5
 h6 head hr html iframe ilayer input ins isindex label layer legend li link
 listing map menu meta multicol noframes nolayer noscript object ol
 optgroup option p param plaintext pre script select style table tbody td
 textarea tfoot th thead title tr ul xmp
}) { $IsBlockMarkup{$tagname} = 1 unless exists $IsBlockMarkup{$tagname} }

#..........................................................................
# Now the function generators:
@EXPORT = ( 'get_url' );

$EXPORT_TAGS{'functions'} = \@EXPORT;  # just for my own backward compat

foreach my $method (
  do {
    no strict 'refs';
    my %to_hide;
    @to_hide{@Hidies} = ();
    sort
      grep !exists $to_hide{$_} && !m/^rss_/s
        && m/^[a-z][_A-Za-z0-9]+$/s && defined &{"XML::RSS::SimpleGen::$_"},
        keys %XML::RSS::SimpleGen::
  }
) {
  my $function = "rss_$method";
  DEBUG > 20 and print "$method => $function\n";
  push @EXPORT, $function;
  no strict 'refs';
  unless( defined &{$function} ) {
    DEBUG > 20 and print " Defining $function => $function\n";
    *{$function} = sub {
      use strict 'refs';
      unshift @_, ($RSS_obj ||= XML::RSS::SimpleGen::->new);
      goto &{
        $_[0]->can($method)
        || die "Where's $method for $_[0]?!"
          # insane error, should never happen, unless somebody
          # goes undefining existing methods!
      };
    };
  }
}

sub rss_new { $RSS_obj = XML::RSS::SimpleGen->new(@_) }
DEBUG > 20 and print "Done compiling ", __PACKAGE__, ".\n";

#--------------------------------------------------------------------------
1;
__END__

=back

=head1 RSS VERSION

RSS feeds emitted by this module are basically according to v0.92 RSS,
with a very few extensions from v2.0 RSS.  They are not RDF files.

=head1 SEE ALSO

L<XML::RSS>

L<http://my.netscape.com/publish/formats/rss-0.91.dtd>

L<http://blogs.law.harvard.edu/tech/rss>

L<http://directory.google.com/Top/Reference/Libraries/Library_and_Information_Science/Technical_Services/Cataloguing/Metadata/RDF/Applications/RSS/Specifications/>

L<http://feedvalidator.org/>

You might also like my book I<Perl and LWP>, which discusses the many
screen-scraping techniques that you would use for extracting data from
HTML to make into RSS feeds:

=over

=item L<http://www.oreilly.com/catalog/perllwp/>

=item L<http://www.amazon.com/exec/obidos/ASIN/0596001789/>

=item L<http://www.amazon.co.uk/exec/obidos/ASIN/0596001789/t>

=item L<http://interglacial.com/d/scrapers> -- examples of Perl
programs that produce RSS's (which are visible at
L<http://interglacial.com/rss/> )

=back



=head1 COPYRIGHT AND DISCLAIMERS

Copyright (c) 2003,4 Sean M. Burke.  All rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

This program is distributed in the hope that it will be useful, but
without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.

Portions of the data tables in this module are derived from the
entity declarations in the W3C XHTML specification.

Currently (January 2004), that's these three:

       http://www.w3.org/TR/xhtml1/DTD/xhtml-lat1.ent
       http://www.w3.org/TR/xhtml1/DTD/xhtml-special.ent
       http://www.w3.org/TR/xhtml1/DTD/xhtml-symbol.ent

Portions of the code in this module were adapted from parts of
Gisle Aas's L<LWP::Simple> and the old (v2.x) version of his
L<HTML::Parser>.

=head1 AUTHOR

Sean M. Burke C<sburke@cpan.org>

=cut

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

On Babbage's Disease:

Charles Babbage, as (necessarily) the first person to work with machines
that can attack problems at arbitrary levels of abstraction, fell into a
trap familiar to toolsmiths since, as described here by the English
ethicist, Lord Moulton:

"One of the sad memories of my life is a visit to the celebrated
mathematician and inventor, Mr Babbage. He was far advanced in age, but
his mind was still as vigorous as ever. He took me through his
work-rooms. In the first room I saw parts of the original Calculating
Machine, which had been shown in an incomplete state many years before
and had even been put to some use. I asked him about its present form.
'I have not finished it because in working at it I came on the idea of
my Analytical Machine, which would do all that it was capable of doing
and much more. Indeed, the idea was so much simpler that it would have
taken more work to complete the Calculating Machine than to design and
construct the other in its entirety, so I turned my attention to the
Analytical Machine.'"

"After a few minutes' talk, we went into the next work-room, where he
showed and explained to me the working of the elements of the Analytical
Machine. I asked if I could see it. 'I have never completed it,' he
said, 'because I hit upon an idea of doing the same thing by a different
and far more effective method, and this rendered it useless to proceed
on the old lines.' Then we went into the third room. There lay scattered
bits of mechanism, but I saw no trace of any working machine. Very
cautiously I approached the subject, and received the dreaded answer,
'It is not constructed yet, but I am working on it, and it will take
less time to construct it altogether than it would have token to
complete the Analytical Machine from the stage in which I left it.' I
took leave of the old man with a heavy heart."

"When he died a few years later, not only had he constructed no machine,
but the verdict of a jury of kind and sympathetic scientific men who
were deputed to pronounce upon what he had left behind him, either in
papers or in mechanism, was that everything was too incomplete of be
capable of being put to any useful purpose."

[Lord Moulton, "The invention of algorithms, its genesis, and growth",
in G. C. Knott, ed., "Napier tercentenary memorial volume" (London,
1915), p. 1-24; quoted in Charles Babbage "Passage from the Life of a
Philosopher", Martin Campbell-Kelly, ed. (Rutgers U. Press and IEEE
Press, 1994), p. 34].

 -*-

