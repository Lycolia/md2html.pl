package MD2HTML::Token::Base;

use strict;

#
# type: codefence, code, heading, bullet_list, ordered_list, paragraph, html, comment, horizontal_line, table, blockquote, bold, italic, underscore, strike
# text: 表示する文字列
#
sub new {
  my ($class, $type, $text, $tokens) = @_;
  my $self = bless({
    type => $type,
    text => $text
  }, $class);
}

1;
