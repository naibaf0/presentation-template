$out_dir = "output";
@default_files = ("presentation.tex");

$pdf_mode = 1;
$dvi_mode = 0;
$ps_mode = 0;

$recorder = 1;

$bibtex_use = 2; # remove .bbl from output on clean
# remove all temporary files which are not removed automatically from output on clean
@generated_exts = qw(fls lof lot toc ist lol pyg run.xml synctex.gz);


$pdflatex = 'internal mypdflatex %D %O %S';

sub mypdflatex {
  use File::Copy qw(copy);

  my $file = shift;
  my ($base_name, $path) = fileparse( $file );
  my $synctexfile = $path . ($base_name =~ s/\.[^.]+$//r) . ".synctex.gz";
  my $new_dir = $path . "../";
  my @args = @_;
  unshift(@args, "-synctex=1");
  unshift(@args, "-shell-escape");

  $return = system 'pdflatex', @args;

  copy $file, $new_dir;
  copy $synctexfile, $new_dir;

  return $return;
}

