# Use luatex
$pdflatex = 'lualatex %O %S';

# Make only PDFs
$pdf_mode = 1;
$postscript_mode = $dvi_mode = 0;

# Process the main file by default
@default_files = ("main.tex");

# Additional generated files
push @generated_exts, "listofalgorithms";
push @generated_exts, "xdy";
push @generated_exts, "glg";
push @generated_exts, "glo";
push @generated_exts, "gls";
push @generated_exts, "slg";
push @generated_exts, "slo";
push @generated_exts, "sls";
push @generated_exts, "synctex.gz";
push @generated_exts, "synctex.gz(busy)";
push @generated_exts, "run.xml";

# Run biber as needed to regenerate bbl files
$bibtex_use = 2;

# Process xindy files
add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
add_cus_dep( 'slo', 'sls', 0, 'makeglossaries' );

sub makeglossaries {
 system( "makeglossaries \"$_[0]\"" );
}

