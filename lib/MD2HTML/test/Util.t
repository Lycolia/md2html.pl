use strict;
use warnings;
use utf8;
use lib './lib';

use Test::More;
use MD2HTML::Util;

subtest 'MD2HTML::Util->trim_indent' => sub {
    my $only_space = MD2HTML::Util->trim_indent('  ', 2);
    is $only_space, '';

    my $space_and_character = MD2HTML::Util->trim_indent('  aa', 2);
    is $space_and_character, 'aa';

    my $no_indent = MD2HTML::Util->trim_indent('aa', 2);
    is $no_indent, 'aa';
};

done_testing;
