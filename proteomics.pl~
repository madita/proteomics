#!/usr/bin/perl -w

use strict;

my $sequenz;
my @tryp;
my @masses;

local $/ = "\n";
open(FILE, "<human") || die ("Fehler beim Öffnen der Datei \n");					
my(@linearr) = <FILE>;
close(FILE);

for (my $cnt = 0; $cnt < $#linearr; $cnt++ ) {
	
	if ($linearr[$cnt] =~ />/) {
		$sequenz = merge_seq($cnt);
		@tryp = trypsincut($sequenz);
		@masses = getCalcMasses(@tryp);
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
$sequenz =~ s/R/R1/g;
my (@tryp) = split("1", $sequenz);
my (@tryp_copy) = @tryp;

  for (my $cnt = 0; $cnt < $#tryp_copy; $cnt++ ) {
	if ($tryp_copy[$cnt] =~ /2/) {
		my (@temp) = split("3", $tryp_copy[$cnt]);
		$tryp_copy[$cnt] =~ s/2/RP/g;
		push(@tryp,@temp);
	}
	
  }

return @tryp;
}

sub getCalcMasses{
	my @tryp=@_;
	my %asMasses=(	"A" => 71.07884,
					"C" => 103.14484,
					"D" => 115.08864,
					"E" => 129.11552,
					"F" => 147.1766,
					"G" => 57.05196,
					"H" => 137.1412,
					"I" => 113.15948,
					"K" => 128.17416,
					"L" => 113.15948,
					"M" => 131.1986,
					"N" => 114.10392,
					"P" => 97.11672,
					"Q" => 128.1308,
					"R" => 156.18764,
					"S" => 87.07824,
					"T" => 101.10512,
					"V" => 99.1326,
					"W" => 186.21328,
					"Y" => 163.176,
					"X" => 110,
					"Z" => 110,
					"B" => 110			);
	my @as;	my @calcMasses;
	
	for(my $i=0;$i<=$#tryp;$i++){
		@as=split("", $tryp[$i]);
		for(my $j=0;$j<=$#as;$j++){$calcMasses[$i]+=$asMasses{$as[$j]};}
	}
	return @calcMasses;
}


