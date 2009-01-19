#!/usr/bin/perl -w

use strict;

my $sequenz;
my @tryp;

local $/ = "\n";
open(FILE, "<human") || die ("Fehler beim Öffnen der Datei \n");					
my(@linearr) = <FILE>;
close(FILE);

for (my $cnt = 0; $cnt < $#linearr; $cnt++ ) {
	
	if ($linearr[$cnt] =~ />/) {
		$sequenz = merge_seq($cnt);
		@tryp = trypsincut($sequenz);
	}	

}

sub merge_seq {
my ($start) = $_[0];
my $sequenz = "";

 for (my $cnt = ($start+1); $cnt < $#linearr; $cnt++ ) {
	$sequenz = $sequenz.$linearr[$cnt];
	if ($linearr[$start] =~ />/) {
		last;
	}
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

return @tryp;
}

