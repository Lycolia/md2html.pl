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
    _open => 0,
    _close => 0,
    text => $text
  }, $class);
}

# 処理開始
sub open_proc {
  my $self = shift;
  $self->{_open} = 1;
}

# 処理終了
sub close_proc {
  my $self = shift;
  $self->{_close} = 1;
}

sub is_open {
  my $self = shift;
  return $self->{_open};
}

sub is_close {
  my $self = shift;
  return $self->{_close};
}

1;
