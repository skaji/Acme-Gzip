package Acme::Gzip;
use strict;
use warnings;

our $VERSION = '0.001';

use Exporter 'import';
our @EXPORT_OK = qw(is_gzip gzip gunzip);

use XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

1;
__END__

=encoding utf-8

=head1 NAME

Acme::Gzip - gzip

=head1 SYNOPSIS

  use Acme::Gzip qw(gzip gunzip);

  my $gzipped = gzip "this is a plain text";
  my $back    = gunzip $gzipped;

=head1 DESCRIPTION

Acme::Gzip is a wrapper for L<https://github.com/skaji/gzip-cpp>.

=head1 BENCHMARK

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

=head1 AUTHOR

Shoichi Kaji <skaji@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2017 Shoichi Kaji <skaji@cpan.org>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
