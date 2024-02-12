package MD2HTML::Token::Base::Base;

use strict;

#
# type: codefence, code, heading, bullet_list, ordered_list, paragraph, html, comment, horizontal_line, table, blockquote, bold, italic, underscore, strike
# text: 表示する文字列
#
sub new {
  my ($class, $type, $text) = @_;
  my $self = bless({
    type => $type,
    _begin => 0,
    _end => 0,
    text => $text
  }, $class);
}

# 処理開始
sub begin_proc {
  my $self = shift;
  $self->{_begin} = 1;
}

# 処理終了
sub end_proc {
  my $self = shift;
  $self->{_end} = 1;
}

sub is_begin {
  my $self = shift;
  return $self->{_begin};
}

sub is_end {
  my $self = shift;
  return $self->{_end};
}

1;
