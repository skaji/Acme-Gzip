[![Build Status](https://travis-ci.org/skaji/Acme-Gzip.svg?branch=master)](https://travis-ci.org/skaji/Acme-Gzip)

# NAME

Acme::Gzip - gzip

# SYNOPSIS

    use Acme::Gzip qw(gzip gunzip);

    my $gzipped = gzip "this is a plain text";
    my $back    = gunzip $gzipped;

# DESCRIPTION

Acme::Gzip is a wrapper for [https://github.com/skaji/gzip-cpp](https://github.com/skaji/gzip-cpp).

# AUTHOR

Shoichi Kaji <skaji@cpan.org>

# COPYRIGHT AND LICENSE

Copyright 2017 Shoichi Kaji <skaji@cpan.org>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
