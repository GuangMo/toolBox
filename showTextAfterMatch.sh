#!/usr/bin/perl 

#### Description: This program identifies matches, then displays number of specific lines after the match. 
####              This is similar to grep -A in Linux, the reason of writing this tool is for AIX... 

use strict;

my $filename = @ARGV[0];
my $searchPattern = @ARGV[1]; 
my $numLine = @ARGV[2]; 

my $initCount = 0; 
my $startCounting = 0; 

if( @ARGV != 3 )
{ die "Usage: subName( <database name>, ".
						"<max wait time>, ".
						"<dump lock snapshot output on error?> )";
} 

open(my $fh, '<:encoding(UTF-8)', $filename)
or die "Could not open file '$filename' $!";

while (my $row = <$fh>) 
{
 chomp $row;
 if ($row == $searchPattern ) 
 {
    $startCounting = 1; 
 }

 if ( $startCounting ) 
 {
    $initCount = $initCount + 1; 
    print "$row\n";

    if ( $initCount == $numLine + 1 ) 
    {
       $startCounting = 0;
       $initCount = 0;
    }
 } 
} 
