package App::ListUtils;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

our %argspec0_input = (
    input => {
        schema => 'str*',
        #req => 1,
        pos => 0,
        cmdline_src => 'stdin_or_files',
    },
);

$SPEC{get_common_prefix} = {
    v => 1.1,
    summary => 'Get common prefix from lines of text',
    args => {
        %argspec0_input,
    },
    result_naked => 1,
};
sub get_common_prefix {
    my %args = @_;

    chomp(my @lines = split /^/m, $args{input});

    require String::CommonPrefix;
    String::CommonPrefix::common_prefix(@lines);
}

$SPEC{get_common_suffix} = {
    v => 1.1,
    summary => 'Get common suffix from lines of text',
    args => {
        %argspec0_input,
    },
    result_naked => 1,
};
sub get_common_suffix {
    my %args = @_;

    chomp(my @lines = split /^/m, $args{input});

    require String::CommonSuffix;
    String::CommonSuffix::common_suffix(@lines);
}

$SPEC{bullet2ordered} = {
    v => 1.1,
    summary => 'Convert a bulleted list into an ordered list',
    args => {
        %argspec0_input,
    },
    result_naked => 1,
};
sub bullet2ordered {
    my %args = @_;

    [501];
}

$SPEC{ordered2bullet} = {
    v => 1.1,
    summary => 'Convert an ordered list into a bulleted list',
    args => {
        %argspec0_input,
    },
    result_naked => 1,
};
sub oredered2bullet {
    my %args = @_;

    [501];
}

$SPEC{bullet2comma} = {
    v => 1.1,
    summary => 'Convert a bulleted list into comma-separated',
    args => {
        %argspec0_input,
    },
    result_naked => 1,
    links => [
        {url=>'prog:comma2bullet'},
    ],
};
sub bullet2comma {
    my %args = @_;

    chomp(my @lines = split /^/m, $args{input});

    require String::CommonPrefix;
    my $common_prefix = String::CommonPrefix::common_prefix(@lines);

    $common_prefix =~ s/\w.*\z//;

    s/\A\Q$common_prefix// for @lines;
    join(", ", @lines) . "\n";
}

1;
# ABSTRACT: Command-line utilities related to lists in files

=for Pod::Coverage .+

=head1 SYNOPSIS

This distribution provides the following command-line utilities:

#INSERT_EXECS_LIST


=head1 DESCRIPTION


=head1 SEE ALSO

=cut
