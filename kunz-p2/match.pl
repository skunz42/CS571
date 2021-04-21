#! /usr/bin/perl

# load input.txt to test
unless (open (data, "input.txt")) {
    die ("Cannot open input file !\n");
}
chomp;
#@arr = qw(today lord tomorrow helloy helloa abc34);
@arr = <data>;
#print "Raw data: \n@arr \n";
#print "Result:\n";

foreach $str (@arr){
$str=~s/[\n\r]+$//; # remove \n\r
if ($str =~ m/or/) { print "$str contains or\n";};
if ($str =~m/[a,e,i,o,u]+.*[a,e,i,o,u]+/)
	{print "$str contains at least two vowel letters\n";};

if ($str =~m/^[^h]/) {print "$str does not start with h\n";};
if ($str =~m/^.e.*y$/) 
	{print "$str has e as the second symbol and ends with y\n";};

if ($str =~m/[a-z]*[0-9]/)
	{print "$str contains both letters and digits\n";};
}
