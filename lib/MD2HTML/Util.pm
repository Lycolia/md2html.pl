package MD2HTML::Util;

use strict;
use warnings;
use utf8;

# モジュールをexportするおまじない
BEGIN{
    use Exporter;
    our @ISA = qw(Exporter);
    our @EXPORT_OK = qw(trim_indent);
}

sub trim_indent {
  shift;
  my $line = shift;
  my $indent_len = shift;

  $line =~ s/^ {$indent_len}//;
  return "$line";
}

sub compare {
  return 1;
}

1;
