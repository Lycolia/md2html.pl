package MD2HTML::Token::Base::SingleToken;

use strict;
use parent 'MD2HTML::Token::Base::Base';

#
# ネストしないやつ
sub new {
  my ($class, $type, $text) = @_;
  my $self = $class->SUPER::new($type, $text);
  
  return $self;
}

1;
