package MD2HTML::Tokenizer::Fence;

use strict;
use warnings;
use utf8;
# qwを書くとexportされたモジュール名を省略できる
use MD2HTML::Util qw(remove_indent);
use MD2HTML::Token::Fence;

# 正規表現を変数化する場合、//は含められず、使うときに正規表現として展開するので、/$var/形式にする必要がある
my $head_regex = '^(?<indent> *)(?<bquote>````*)(?<lang>[a-z]*)$';

sub is {
  # 第一引数はパッケージ名のフルパスなので捨てる
  shift;
  my $text = shift;
  
  return $text =~ /$head_regex/;
}

sub tokenize {
  shift;
  my $line = shift;
  my $token = shift;

  if (!$token->{opened} && $line =~ /$head_regex/) {
    $token->{opened} = 1;
    $token->{lang} = $+{lang};
    $token->{indent_len} = length $+{indent};
    $token->{bquote_len} = length $+{bquote};
  } elsif ($line =~ /^ *(?<bquote>````*)$/ && $token->{opened}) {
    my $bquote_len = length $+{bquote};

    if ($token->{bquote_len} == $bquote_len) {
      # 終端行
      $token->{closed} = 1;
    } else {
      # 終端行ではないがバッククォートが3つ以上ある行
      $token->{text} .= remove_indent($line, $token->{indent_len});
    }
  } elsif ($token->{opened}) {
    $token->{text} .= remove_indent($line, $token->{indent_len});
  } else {
    # 何もしない
  }
}

1;
