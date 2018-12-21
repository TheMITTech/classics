#!/usr/bin/perl

# call with:
# find . -name '*.html' -print0 | xargs -0 -i% ./filter.pl %

$fname = $ARGV[0];
chomp($fname);

print "$fname\n";

open(FILE,$fname);
open(FILE2,">".$fname.".tmp");
$skip = 0;
while (<FILE>) {
    if ($skip == 1) {
	$skip = 0;
	next;
    }
    if (/^<B>Commentary:<\/B>/) {
	$skip = 1;
	next;
    }
    next if /^<A HREF="\/cgi-bin\/comment\.cgi\?message=/;
    next if /^onMouseOver="window\.status='Read comments/;
    next if /^onMouseOver="window\.status='Post new /;
    next if /^<BR><BR><B>Reader Recommendations:<\/B>/;
    next if /^<A HREF="\/cgi-bin\/rec\.cgi\?work=/;
    next if /^onMouseOver="window\.status='Recommend a Web/;
    next if /^you feel is appropriate to this work,/;
    next if /^onMouseOver="window\.status='List recommended/;
    next if /^or <A HREF="\/cgi-bin\/rec\.cgi\?message=/;
    next if /^onMouseOver=\"window\.status='Visit random/;
    next if /^TARGET="_parent">visit a random/;
    s/1994-2000/1994-2009/i;
    s/onClick="openPopup\(\); return true;"//i;
    print FILE2 $_;
}
print FILE2 "\n";
close(FILE2);
close(FILE);
unlink(FILE);
rename("$fname.tmp",$fname);

exit;

