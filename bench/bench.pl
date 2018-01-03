#!/usr/bin/env perl
use strict;
use warnings;

use blib;
use Acme::Gzip ();
use IO::Compress::Gzip ();
use IO::Uncompress::Gunzip ();

use Benchmark 'cmpthese';

my @rand;
open my $fh, "<", "/dev/urandom" or die;
for my $i (1..10) {
    read $fh, my $buf, $i*2048 or die;
    push @rand, $buf;
}
close $fh;
my @gzip_rand = map { Acme::Gzip::gzip $_ } @rand;

my $type = (shift @ARGV) || "help";

if ($type eq "gzip") {
    cmpthese -1, {
        acme => sub {
            for my $r (@rand) {
                my $out = Acme::Gzip::gzip $r;
            }
        },
        core => sub {
            for my $r (@rand) {
                IO::Compress::Gzip::gzip \$r, \my $out or die;
            }
        },
    };
} elsif ($type eq "gunzip") {
    cmpthese -1, {
        acme => sub {
            for my $r (@gzip_rand) {
                my $out = Acme::Gzip::gunzip $r;
            }
        },
        core => sub {
            for my $r (@gzip_rand) {
                IO::Uncompress::Gunzip::gunzip \$r, \my $out or die;
            }
        },
    };
} else {
    die "Usage: bench.pl [gzip|gunzip]\n";
}
