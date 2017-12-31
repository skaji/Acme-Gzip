use strict;
use warnings;
use Test::More;
use Test::LeakTrace;
use Acme::Gzip qw(gzip gunzip is_gzip);

no_leaks_ok {
    my $x = gzip "foo";
    eval { my $y = gunzip "foo"; };
    my $ok = is_gzip "foo";
};

done_testing;
