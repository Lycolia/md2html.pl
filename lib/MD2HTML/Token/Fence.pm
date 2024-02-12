package MD2HTML::Token::Fence;

use strict;
use warnings;
use utf8;
use parent 'MD2HTML::Token::Base';

sub new {
  my $class = shift;
  my $self = $class->SUPER::new('fence', '');
  
  $self->{lang} = '';
  $self->{indent_len} = 0;
  $self->{bquote_len} = 0;

  return $self;
}

1;
