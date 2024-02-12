use strict;
use warnings;
use utf8;
use lib './lib';
use MD2HTML::Lexer;

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

MD2HTML::Lexer->parse($text);
