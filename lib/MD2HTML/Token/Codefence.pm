package MD2HTML::Token::Codefence;

use strict;
use parent 'MD2HTML::Token::Base';

sub new {
  my ($class, $type, $text, $lang) = @_;

  my $self = $class->SUPER::new($type, $text);
  $self->{lang} = $lang;
  return $self;
}

1;
