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
		print "$sequenz \n";
		@tryp = trypsincut($sequenz);
		for (my $i=0; $i<$#tryp; $i++) {print "$i $tryp[$i]\n";}
	}	

}

sub merge_seq {
my ($start) = $_[0];
my $sequenz = "";

 for (my $cnt = ($start+1); $cnt < $#linearr; $cnt++ ) {
	$sequenz.= $linearr[$cnt];
	if ($linearr[$start] =~ />/) {
		return $sequenz;
	}
 }

}

sub trypsincut{

my ($sequenz) = $_[0];
$sequenz =~ s/K/K1/g;
$sequenz =~ s/RP/2/g;
$sequenz =~ s/R/R3/g;
my (@tryp) = split("1", $sequenz);

  for (my $cnt = 0; $cnt < $#tryp; $cnt++ ) {
	$tryp[$cnt] =~ s/2/RP/g;
	if ($tryp[$cnt] =~ /3/) {
		my (@temp) = split("3", $tryp[$cnt]);
	}
	
  }

return @tryp;
}


