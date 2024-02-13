use strict;
use warnings;
use utf8;
use lib './lib';

use Test::More;
use MD2HTML::Token::Fence;

subtest 'MD2HTML::Token::Fence, コンストラクタに正しい値がセットされること' => sub {

    my $actual = MD2HTML::Token::Fence->new;

    is $actual->{text}, undef;
    is $actual->{opened}, 1;
    is $actual->{closed}, 0;
    is $actual->{children}, undef;

    is $actual->{lang}, '';
    is $actual->{indent_len}, 0;
    is $actual->{bquote_len}, 0;
};

done_testing;
