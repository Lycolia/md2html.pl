use strict;
use warnings;
use utf8;
use lib './lib';

use Test::More;
use MD2HTML::Token::Base;

subtest 'MD2HTML::Token::Base, コンストラクタに正しい値がセットされること' => sub {

    my $actual = MD2HTML::Token::Base->new('hoge', 'piyo');

    is $actual->{type}, 'hoge';
    is $actual->{opened}, 1;
    is $actual->{closed}, 0;
    is $actual->{text}, 'piyo';
};

done_testing;
