[![Build Status](https://travis-ci.org/skaji/Acme-Gzip.svg?branch=master)](https://travis-ci.org/skaji/Acme-Gzip)

# NAME

Acme::Gzip - gzip

# SYNOPSIS

    use Acme::Gzip qw(gzip gunzip);

    my $gzipped = gzip "this is a plain text";
    my $back    = gunzip $gzipped;

# DESCRIPTION

Acme::Gzip is a wrapper for [https://github.com/skaji/gzip-cpp](https://github.com/skaji/gzip-cpp).

# BENCHMARK

IO::Compress::Gzip VS Acme::Gzip:

    ❯ perl bench/bench.pl gzip
          Rate core acme
    core 181/s   -- -48%
    acme 346/s  92%   --

IO::Uncompress::Gunzip VS Acme::Gzip:

    ❯ perl bench/bench.pl gunzip
           Rate  core  acme
    core  293/s    --  -95%
    acme 5689/s 1840%    --

# AUTHOR

Shoichi Kaji <skaji@cpan.org>

# COPYRIGHT AND LICENSE

Copyright 2017 Shoichi Kaji <skaji@cpan.org>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
