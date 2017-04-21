# DU Dissertation Template
A LaTeX template designed to meet the requirements of the University of Denver for a PhD Dissertation. It uses modern LaTeX with KOMA-Script's scrreprt as a basis.

*Note*: This is an unofficial template and not supported by the university. It is up to you to ensure that your work meets the university guidelines.

By Graduate Studies rules, you need to specify a style guide to follow for your dissertation. They suggest APA, MLA, or Turabian, none of which are directly applicable to Computer Science or Mathematics. Some reasonable alternatives are:
* [IEEE](https://www.computer.org/portal/web/publications/styleguide) - Refers to the Chicago Manual of Style for issues not addressed in their guide
* [SIAM](http://www.siam.org/journals/auth-info.php) - Refers to the Chicago Manual of Style for issues not addressed in their guide
* [AMS](http://www.ams.org/publications/authors/tex/author-handbook) - Most of their guides concern using their LaTeX classes, but they do have information about formatting equations and so forth.

Where applicable this template attempts to conform to (in order):
1. Graduate Studies formatting rules
2. IEEE
3. SIAM
4. Chicago Manual of Style

Note that the library has an online license to the Chicago Manual of Style.

LaTeX Package Dependencies:
* KOMA-Script
* etoolbox
* lineno
* setspace
* indentfirst
* hyperref
* geometry

Recommended LaTeX packages and tools:
* [cleveref](https://www.ctan.org/pkg/cleveref) - Simple, nice, inter-document cross references
* [latexmk](http://personal.psu.edu/jcc8//software/latexmk-jcc/) - A Perl script which manages building the document. It will automatically call LaTeX the correct number of times as well as associated tools such as biber and xindy.
* [PGF/TikZ](https://www.ctan.org/pkg/pgf) - Creates nice figures. See [TeXample.net](http://www.texample.net/tikz/) for example figures to use as a basis.

Links:
* [Official DU Information](http://www.du.edu/currentstudents/graduates/graduationinformation.html)
