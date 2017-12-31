package MyBuilder;
use strict;
use warnings;
use base 'Module::Build';

sub new {
    my $class = shift;

    if (!-d "gzip-cpp/.git") {
        !system qw(git submodule update -i) or exit 1;
    }

    $class->SUPER::new(
        c_source => ['src'],
        extra_compiler_flags => ['-xc++'], # -xc++ for c++
        extra_linker_flags => ['-lstdc++', '-lz'], # -lstdc++ for c++
        @_,
    );
}

1;
