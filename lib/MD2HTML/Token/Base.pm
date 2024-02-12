package MD2HTML::Token::Base;

use strict;
use warnings;
use utf8;

#
# type: fence, code, heading, bullet_list, ordered_list, paragraph, html, comment, horizontal_line, table, blockquote, bold, italic, underscore, strike
# text: 表示する文字列
#
sub new {
  my ($class, $type, $text) = @_;
  my $self = bless({
    type => $type,
    opened => 1,
    closed => 0,
    text => $text
  }, $class);
}

1;
