# Use luatex
$pdflatex = 'lualatex %O %S';

# Make only PDFs
$pdf_mode = 1;
$postscript_mode = $dvi_mode = 0;

# Process the main file by default
@default_files = ("main.tex");

# Additional generated files
push @generated_exts, "listofalgorithms";
