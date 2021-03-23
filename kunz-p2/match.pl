#!/usr/bin/perl

my $filename = "input.txt";

open(FH, '<', $filename) or die $!;

while(<FH>) {
    #print $_;
    #Check for each filter
}

close(FH);
