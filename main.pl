use strict;
use warnings;
use utf8;
use lib './lib';
use MD2HTML::Token::Fence;
use MD2HTML::Tokenizer::Fence;

my $text = <<EOF;
qawsedrftgyhujikolp

  ````unya

  ```
  hoge
    piyo
  ```
      fuga
  hpf
  ````

おそうめんおいしい！！！
EOF

my @lines = split(/\n/, $text);

my @tokens = [];

my $token = undef;

my $is_open = 0;
my $mode = '';


foreach my $line (@lines){
  
  # 構文判定
  if (!$is_open && MD2HTML::Tokenizer::Fence->is($line)) {
    print $line."\n";
    $is_open = 1;
    $mode = 'fence';
    $token = MD2HTML::Token::Fence->new;
    $token->{opened} = 1;
  }

  # 構文処理
  if ($mode == 'fence') {

  }
#  push(@tokens, $token);
}


