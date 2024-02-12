package MD2HTML::Token::Codefence;

use strict;
use parent 'MD2HTML::Token::Base::SingleToken';

sub new {
  my ($class, $lang, $indent_len, $bquote_len) = @_;
  my $self = $class->SUPER::new('codefence', '');
  
  $self->{lang} = $lang;
  $self->{indent_len} = $indent_len;
  $self->{bquote_len} = $bquote_len;

  return $self;
}

1;
