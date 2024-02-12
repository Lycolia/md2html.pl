package MD2HTML::Util;
use strict;
use warnings;
use utf8;

# モジュールをexportするおまじない
BEGIN{
    use Exporter;
    our @ISA = qw(Exporter);
    our @EXPORT_OK = qw(remove_indent);
}

sub remove_indent {
  my $line = shift;
  my $indent_len = shift;

  $line =~ s/^ {$indent_len}//;
  return "$line\n";
}

1;
