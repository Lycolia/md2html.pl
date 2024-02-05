package MD2HTML::Lexer;

use strict;

sub parse {
  my $text = shift;
  my $option = shift;

  my $token_list = [];

  my $opend = 0;
  my $escaped = 0;
  my $type = '';

  my @lines = split(/\n/, $text);
  undef $text;
  
  foreach my $line (@lines) {
    if ($line =~ /```/) {
      $opend = 1;
      $type = 'codefence';
    }
  }
}

1;
