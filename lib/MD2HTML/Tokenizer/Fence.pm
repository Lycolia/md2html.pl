package MD2HTML::Tokenizer::Fence;

use strict;
use warnings;
use utf8;
# qwを書くとexportされたモジュール名を省略できる
use MD2HTML::Util qw(remove_indent);
use MD2HTML::Token::Fence;

# 正規表現を変数化する場合、//は含められず、使うときに正規表現として展開するので、/$var/形式にする必要がある
my $head_regex = "^(?<indent> *)(?<bquote>````*)(?<lang>[a-z]*)\$";

sub is {
  my $self = shift;
  my $text = shift;
  
  return $text =~ /$head_regex/;
}

sub tokenize {
  # 第一引数はパッケージ名のフルパス
  my ($pkg, $line, $token) = @_;

  if ($line =~ /$head_regex/ && !$token->{opened}) {
    $token->{lang} = $+{lang};
    $token->{indent_len} = length $+{indent};
    $token->{bquote_len} = length $+{bquote};
  } elsif ($line =~ /^ *(?<bquote>````*)$/ && $token->{opened}) {
    my $bquote_len = length $+{bquote};
    if ($token->{bquote_len} == $bquote_len) {
      # Fence終端行
      $token->{closed} = 1;
      return $token;
    } else {
      # 終端行ではないがバッククォートが3つ以上ある行
      $token->{text} .= remove_indent($line, $token->{indent_len});
      return $token;
    }
  } elsif ($token->{opened}) {
    $token->{text} .= remove_indent($line, $token->{indent_len});
    return $token;
  } else {
    return $token;
  }
}

1;
