use strict;
use lib './lib';

# qwを書くとexportされたモジュール名を省略できる
use MD2HTML::Util qw(remove_indent);
use MD2HTML::Token::Codefence;


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

my $begin_tag = 0;
my $indent_len = 0;
my $bquote_len = 0;

my $result_type = 'codefence';
my $result_text = '';
my $result_lang = '';

foreach my $line (@lines){
  if ($line =~ /^(?<indent> *)(?<bquote>````*)(?<lang>[a-z]*)$/ && !$begin_tag) {
    # codefence開始行の検出
    $indent_len = length $+{indent};
    $bquote_len = length $+{bquote};
    $result_lang = $+{lang};
    $begin_tag = 1;
  } elsif ($line =~ /^(?<indent> *)(?<bquote>````*)$/ && $begin_tag) {
    my $indent_len2 = length $+{indent};
    my $bquote_len2 = length $+{bquote};
    if ($bquote_len == $bquote_len2) {
      # codefence終端行
      last;
    } else {
      # 終端行ではないがバッククォートが3つ以上ある行
      $result_text .= remove_indent($line, $indent_len);
    }
  } elsif ($begin_tag) {
    $result_text .= remove_indent($line, $indent_len);
  } else {
    # 開始タグより前なので何もしない
  }
}

$result_text =~ s/\n$//;
my $token = MD2HTML::Token::Codefence->new($result_type, $result_text, $result_lang);

print "TYPE: $token->{type}\n<===============>\nTEXT: $token->{text}\n<===============>\nLANG: $token->{lang}\n<===============>\n";
