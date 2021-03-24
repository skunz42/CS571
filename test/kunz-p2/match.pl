#!/usr/bin/perl

sub contains_or {
    my $or_str = "or";
    if (@_[0] =~ /$or_str/) {
        print "@_[0] contains $or_str\n"
    }
}

sub vowel_count {
    my $num_vowels = tr/aeiou//;
    if ($num_vowels > 1) {
        print "@_[0] contains at least two vowel letters\n";
    }
}

sub not_start_h {
    if (substr(@_[0], 0, 1) ne 'h') {
        print "@_[0] does not start with h\n";
    }
}

sub has_e_and_y {
    if (substr(@_[0], 1, 1) eq 'e' && substr(@_[0], -1, 1) eq 'y') {
        print "@_[0] has e as the second symbol and ends with y\n";
    }
}

sub lets_n_digs {
    if (@_[0] =~ /[a-z]+/ && @_[0] =~ /[0-9]+/) {
        print "@_[0] contains both letters and digits\n";
    }
}

my $filename = "input.txt";

open(FH, '<', $filename) or die $!;

while(<FH>) {
    #print $_;
    #Check for each filter
    chomp $_;
    my $line = $_;
    contains_or($line);
    vowel_count($line);
    not_start_h($line);
    has_e_and_y($line);
    lets_n_digs($line);
}

close(FH);
