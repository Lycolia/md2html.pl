package MD2HTML::Token::Base::NestedToken;

use strict;
use parent 'MD2HTML::Token::Base::Base';

#
# ネストするやつ
sub new {
  my ($class, $type, $text, $tokens) = @_;
  my $self = $class->SUPER::new($type, $text);
  $self->{tokens} = $tokens;
  
  return $self;
}

1;
