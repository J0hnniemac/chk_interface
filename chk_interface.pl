#!/usr/bin/perl -w

#use strict;
use IO::Socket::PortState qw(check_ports);

$num_args = $#ARGV + 1; 
if ($num_args != 2) {     
	print "\nUsage: chk_interface.pl interfacefilename outputfilename\n";
	     exit; } 

my $interfaces = $ARGV[0]; 
my $outfile = $ARGV[1]; 
my $timeout = 2;

print $outfile;


open (OUTF, ">$outfile") or die  "can't create logfile; $!";





open (INTERFACES_FILE, $interfaces) or die "Can't open '$interfaces' : $!";
print "Checking $interfaces ....\n";
print "=================================================";
print OUTF "Checking $interfaces ....\n";
print OUTF "=================================================";


while (<INTERFACES_FILE>) {
	chomp;
 	($ip, $port,$text) = split(":");
 	my %port_hash = (
        	tcp => {
            		$port     => {}
            		}
        );
	my $host_hr = check_ports($ip,$timeout,\%port_hash);
	for my $port (sort {$a <=> $b} keys %{$host_hr->{tcp}}) {
        my $yesno = $host_hr->{tcp}{$port}{open} ? ":Connected" : ":Notconnected";
	$line = sprintf "\n%-20s %-12s %-14s %-s", "ip: $ip", "port: $port", "$yesno", "$text";
	print $line;
	print OUTF $line;

    }
}

close INTERFACES_FILE;
print "\n===================Completed=====================\n";
print OUTF "\n===================Completed=====================\n";
close OUTF;
