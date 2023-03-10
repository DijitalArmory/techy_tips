#!/usr/bin/perl

use strict;
use warnings;

# Get the filename from the command line arguments
my $filename = shift;

# Open the file for reading
open(my $fh, '<', $filename) or die "Couldn't open file $filename: $!";

# Read the file line by line and print each line to the terminal
while (my $line = <$fh>) {
    print $line;
}

# Close the file
close($fh);
