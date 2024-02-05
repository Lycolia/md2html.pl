package MD2HTML::Util;

# モジュールをexportするおまじない
BEGIN{
    use Exporter;
    @ISA = qw(Exporter);
    @EXPORT_OK = qw(remove_indent);
}

sub remove_indent {
  my $line = shift;
  my $indent_len = shift;

  $line =~ s/^ {$indent_len}//;
  return "$line\n";
}

1;
