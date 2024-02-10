package MD2HTML::Tokenizer::Codefence;

use strict;
# qwを書くとexportされたモジュール名を省略できる
use MD2HTML::Util qw(remove_indent);
use MD2HTML::Token::Codefence;

sub tokenize {
  # 第一引数はパッケージ名のフルパス
  my ($pkg, $line, $token) = @_;

  if (!defined $token) {
    $token = MD2HTML::Token::Codefence->new(0, '', 0, 0, '');
  }

  if ($line =~ /^(?<indent> *)(?<bquote>````*)(?<lang>[a-z]*)$/ && !$token->{begin}) {
    $token = MD2HTML::Token::Codefence->new(
      $+{lang},
      length $+{indent},
      length $+{bquote},
      ''
    );
  } elsif ($line =~ /^ *(?<bquote>````*)$/ && $token->{begin}) {
    my $bquote_len = length $+{bquote};
    if ($token->{bquote_len} == $bquote_len) {
      # codefence終端行
      $token->{begin} = 0;
      return $token;
    } else {
      # 終端行ではないがバッククォートが3つ以上ある行
      $token->{text} .= remove_indent($line, $token->{indent_len});
      return $token;
    }
  } elsif ($token->{begin}) {
    $token->{text} .= remove_indent($line, $token->{indent_len});
    return $token;
  } else {
    return $token;
  }
}

1;
