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
    if ($skip == 2) {
	$skip = 1;
	next;
    }
    if (/^<BR>&nbsp;&nbsp;&nbsp;<A HREF="\/cgi-bin\/comment\.cgi\?message=list.*/) {
         $skip = 2;
         next;
    }

    next if /^<BR><A HREF="http:\/\/www\.eb\.com:180\/cgi-bin\/g\?DocF=.*\.html/;
    next if /^onMouseOver="window\.status='More info from Encyclopaedia Brittanica'; return true;" TARGET="browse">more info<\/A>/;
    print FILE2 $_;
}
print FILE2 "\n";
close(FILE2);
close(FILE);
unlink(FILE);
rename("$fname.tmp",$fname);

exit;

