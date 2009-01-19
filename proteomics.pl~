#!/usr/bin/perl -w

use strict;


local $/ = "\n";
open(FILE, "<human") || die ("Fehler beim Öffnen der Datei \n");					
my(@linearr) = <FILE>;
close(FILE);

for (my $cnt = 0; $cnt < $#linearr; $cnt++ ) {
	
	if ($linearr[$cnt] =~ />/) {
		trypsincut($cnt);
	
	}	

}

sub trypsincut{

my $start;
my @tryp;
$start = $_[0];
 for (my $cnt = $start; $cnt < $#linearr; $cnt++ ) {
	if ($linearr[$start] =~ />/) {
		last;
	}
 }
}

