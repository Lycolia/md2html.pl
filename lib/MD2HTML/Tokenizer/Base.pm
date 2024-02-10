package MD2HTML::Tokenizer::Base;

use strict;

#
# type: codefence, code, heading, bullet_list, ordered_list, paragraph, html, comment, horizontal_line, table, blockquote, bold, italic, underscore, strike
# text: 表示する文字列
#
sub new {
  my ($class, $regex, $begin) = @_;
  my $self = bless({
    regex => $regex,
    begin => $begin
  }, $class);
}

1;
