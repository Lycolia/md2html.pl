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

  foreach my $line (@lines){
    
    if (!$is_open) {
      # 構文判定
      if (MD2HTML::Tokenizer::Fence->is($line)) {
        $is_open = 1;
        $token = MD2HTML::Token::Fence->new;
      }
    } else {
      # 構文処理
      if (ref $token eq 'MD2HTML::Token::Fence') {
        MD2HTML::Tokenizer::Fence->tokenize($line, $token);
      }
    }

  #  push(@tokens, $token);
  }

  print $token->{text};
}

1;
