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

Most questions of style are not questions that apply to this template, but of the document regarding precise punctuation usage, word choice, etc.

Note that the library has an online license to the Chicago Manual of Style.

Other resources:
* [Mathematics into Type](http://www.ams.org/publications/authors/authors) (free PDF linked from this page)  Detailed AMS guide to formatting mathematics including things like spacing between symbols

LaTeX package dependencies of the template:
* KOMA-Script
* etoolbox
* lineno - used to put line numbers in the margin when in draft mode
* setspace - sets up double line spacing. Use the environment \begin{singlespace}...\end{singlespace} if single spacing is needed
* hyperref
* geometry
* [amsmath](http://www.ams.org/publications/authors/tex/amslatex) - Lots of helpful math stuff
* [amsthm](https://www.ctan.org/pkg/amsthm)
* [amssymb](https://www.ctan.org/pkg/amsfonts) - Part of amsfonts
* [cleveref](https://www.ctan.org/pkg/cleveref) - Simple, nice, inter-document cross references
* [algorithmicx](https://www.ctan.org/pkg/algorithmicx) - Provides a nice environment to typeset algorithms. Use the algpseudocode layout (with just \usepackage{algopseudocode}, no need for \usepackage{algorithmicx}). This should be your choice for pseudocode.

Recommended LaTeX packages and tools:
* [latexmk](http://personal.psu.edu/jcc8//software/latexmk-jcc/) - A Perl script which manages building the document. It will automatically call LaTeX the correct number of times as well as associated tools such as biber and xindy.
* [listings](https://www.ctan.org/pkg/listings) - Typesets source code well. Best for actual source code, otherwise use algpseudocode.
* [PGF/TikZ](https://www.ctan.org/pkg/pgf) - Creates nice figures. See [TeXample.net](http://www.texample.net/tikz/) for example figures to use as a basis.

Links:
* [Official DU Information](http://www.du.edu/currentstudents/graduates/graduationinformation.html)
