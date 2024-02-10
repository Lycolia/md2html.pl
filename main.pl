use strict;
use lib './lib';
use MD2HTML::Token::Codefence;
use MD2HTML::Tokenizer::Codefence;

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

my $token = {};

foreach my $line (@lines){
  # begin=1ならtypeのブロックへ入る
  # begin=0ならブロックのtokinize関数全部に出入りする（どこかで1になる
  # tokinize関数は第二引数の参照を操作する
  # token変数の中身はbegin, type, textのみ共通で後はtypeによって変わる
  ## これTokenクラスでよいのでは
  ## token変数は各tokinizeの中で新規生成され、結果配列に設定される
  ## 参照はHTMLになった時に消え、それまでメモリ上に保持する（undefしないこと）
  MD2HTML::Tokenizer::Codefence->tokenize($line, $token);
  push(@tokens, $token);
}


#$result_text =~ s/\n$//;

print "TYPE: $token->{type}\n<===============>\nTEXT: $token->{text}\n<===============>\nLANG: $token->{lang}\n<===============>\n";
