package MD2HTML::Token::Base;

use strict;
use warnings;
use utf8;

sub new {
  my ($class, $text) = @_;
  my $self = bless({
    text => $text,
    opened => 1,
    closed => 0,
    children => undef
  }, $class);
}

1;
