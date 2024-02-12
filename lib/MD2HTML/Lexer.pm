package MD2HTML::Lexer;

use strict;
use warnings;
use utf8;

use MD2HTML::Token::Fence;
use MD2HTML::Tokenizer::Fence;

sub parse {
  shift;
  my $text = shift;
  my @lines = split(/\n/, $text);

  my @tokens = [];
  my $token = undef;

  my $is_open = 0;
  my $mode = '';

  foreach my $line (@lines){
    
    # 構文判定
    if (!$is_open && MD2HTML::Tokenizer::Fence->is($line)) {
      $is_open = 1;
      $mode = 'fence';
      $token = MD2HTML::Token::Fence->new;
    }

    # 構文処理
    if ($mode eq 'fence') {
      MD2HTML::Tokenizer::Fence->tokenize($line, $token);
    }
  #  push(@tokens, $token);
  }

  print $token->{text};
}

1;
