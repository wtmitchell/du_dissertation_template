% This file provides a simple wrapper around the KOMA-Script Report class
% to satisfy the requirements for a dissertation at the University of Denver

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dudissertation}
[2017/03/16 v1.0 University of Denver Dissertation class]

% Defines the formal faculty names - these exact names come from the
% formatting guidelines
\newcommand*\dunsmfaculty{the Faculty of Natural Sciences and Mathematics}
\newcommand*\dursecsfaculty{the Faculty of the Daniel Felix Ritchie School of Engineering and Computer Science}

% These commands must be set in your main document prior to the \begin{document}
\newcommand*\advisor[1]{\renewcommand\@advisor{#1}}
\newcommand*\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}

\newcommand*\faculty[1]{\renewcommand\@faculty{#1}}
\newcommand*\@faculty{\@latex@error{No \noexpand\faculty given}\@ehc}

\newcommand*\dissertationtype[1]{\renewcommand\@dissertationtype{#1}}
\newcommand*\@dissertationtype{\@latex@error{No \noexpand\dissertationtype given}\@ehc}

\newcommand*\degreetype[1]{\renewcommand\@degreetype{#1}}
\newcommand*\@degreetype{\@latex@error{No \noexpand\degreetype given}\@ehc}

\newcommand*\graduationmonth[1]{\renewcommand\@graduationmonth{#1}}
\newcommand*\@graduationmonth{\@latex@error{No \noexpand\graduationmonth given}\@ehc}

\newcommand*\graduationyear[1]{\renewcommand\@graduationyear{#1}}
\newcommand*\@graduationyear{\@latex@error{No \noexpand\graduationyear given}\@ehc}

\newcommand*\abstractfilename[1]{\renewcommand\@abstractfilename{#1}}
\newcommand*\@abstractfilename{\@latex@error{No \noexpand\abstractfilename given}\@ehc}


% Set up toggles for the optional pages
\usepackage{etoolbox}
\newtoggle{copyrightpage}
\newtoggle{acknowledgmentspage}
\newtoggle{listofalgorithms}
\newtoggle{listoffigures}
\newtoggle{listoftables}

% Allow for an acknowledgments page
\newcommand*\@acknowledgmentsfilename{}
\newcommand*\acknowledgments[1]{
  \toggletrue{acknowledgmentspage}
  \renewcommand\@acknowledgmentsfilename{#1}
}

% Create a title page
\newcommand*\createtitlepage{
  \begin{titlepage}
    \hspace{0pt}
    \vspace{\stretch{1}}

    \begin{center}
      \@title
    \end{center}

    \vspace{\stretch{1}}
    \begin{center}
      \rule{0.85in}{0.4pt}
    \end{center}
    \vspace{\stretch{1}}

    \begin{center}
      A \@dissertationtype\\
      Presented to\\
      \@faculty\\
      University of Denver
    \end{center}

    \vspace{\stretch{1}}
    \begin{center}
      \rule{0.85in}{0.4pt}
    \end{center}
    \vspace{\stretch{1}}

    \begin{center}
      In Partial Fulfillment\\
      of the Requirements for the Degree\\
      Doctor of Philosophy
    \end{center}

    \vspace{\stretch{1}}
    \begin{center}
      \rule{0.85in}{0.4pt}
    \end{center}
    \vspace{\stretch{1}}

    \begin{center}
      by\\
      \@author\\
      \@graduationmonth~\@graduationyear\\
      Advisor: \@advisor
    \end{center}
    \vspace{\stretch{1}}
    \hspace{0pt}
  \end{titlepage}
}

% Create a copyright page
\newcommand*{\createcopyrightpage}{
  \thispagestyle{empty} % Removes page number at bottom of page
  \begin{center}
    \textcircled{c}~Copyright by \@author~\@graduationyear\\
    All Rights Reserved
  \end{center}
  \clearpage
}

% Create an abstract page
\newcommand*{\createabstractpage}{
  \begin{singlespace}
    \noindent Author: \@author\\
    Title: \@title\\
    Advisor: \@advisor\\
    Degree Date: \@graduationmonth~\@graduationyear\\
  \end{singlespace}

  \begin{center}
    \bfseries{Abstract}
  \end{center}

  \input{\@abstractfilename}
  \clearpage
}

% Create an acknowledgments page
\newcommand*{\createacknowledgmentspage}{
  \begin{center}
    \bfseries{Acknowledgments}
  \end{center}

  \input{\@acknowledgmentsfilename}
  \clearpage
}

% Pages needed at start of document
\newcommand*{\startofdocument}{
  % Set PDF Metadata
  \hypersetup{
    pdfauthor={\@author},
    pdftitle={\@title},
  }

  % Everything is double space
  \doublespacing

  % Title page
  \createtitlepage

  % Copyright page
  \pagenumbering{roman}
  \iftoggle{copyrightpage}{
    \createcopyrightpage
  }{}

  % Abstract page
  \createabstractpage

  % Acknowledgments page
  \iftoggle{acknowledgmentspage}{
    \createacknowledgmentspage
  }{}

  % Table of contents
  \tableofcontents

  % List of algorithms
  \iftoggle{listofalgorithms}{
    \clearpage
    \listofalgorithms
  }{}

  \iftoggle{listoffigures}{
    \listoffigures
  }{}

  \iftoggle{listoftables}{
    \listoftables
  }{}

  \iftoggle{printlistofsymbols}{
    \glsaddall
    \addcontentsline{toc}{chapter}{List of Symbols}
    \printglossary[title=List of Symbols,type=symbols]
  }{}

  % The remainder of the document uses arabic page numbers
  \clearpage
  \pagenumbering{arabic}
}

\LoadClass{scrreprt}

\KOMAoption{fontsize}{11pt}
\KOMAoption{toc}{chapterentrywithdots}
\KOMAoption{bibliography}{totoc}
\KOMAoption{listof}{totoc}

% Draft mode
\RequirePackage[left, pagewise]{lineno}
\newcommand*{\enabledraftmode}{
  \KOMAoption{draft}{true}
  \linenumbers
}

% Set the paragraph indent to 0.5in to match the Word templates
\setparsizes{0.5in}{0pt}{0pt plus 1fil}

% This combination along with the geometry settings below always put a
% 1in margin on the top and 2in top margin on new chapters
\renewcommand{\chapterheadstartvskip}{\vspace{0.75in}}
\setlength{\headheight}{-0.25in}


% Put chapter/section/subsection into the table of contents
\setcounter{tocdepth}{2}

% Needed to double space body text
\RequirePackage{setspace}

% AMS setup
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}

% Algorithm setup

% This the formatting of the ruled style from figure.sty,
% Would like to incorporate this into KOMA's \DeclareNewTOC,
% but as of yet this isn't working
% \newcommand\floatc@ruled[2]{{\@fs@cfont #1} #2\par}
% \newcommand\fs@ruled{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@ruled
%   \def\@fs@pre{\hrule height.8pt depth0pt \kern2pt}%
%   \def\@fs@post{\kern2pt\hrule\relax}%
%   \def\@fs@mid{\kern2pt\hrule\kern2pt}%
%   \let\@fs@iftopcapt\iftrue}
%   \RequirePackage{algorithm}
%\setkomafont{captionlabel}{\bfseries}
\DeclareNewTOC[
%atbegin={\kern2pt\hrule\kern2pt},
%atend={\kern2pt\hrule\kern2pt},
type=algorithm,
types=algorithms,
float,
floatpos=htbp,
floattype=4,
name=Algorithm,
listname={List of Algorithms},
counterwithin=chapter
]{listofalgorithms}

\RequirePackage[noend]{algpseudocode}
\newcommand*\Let[2]{\State #1 $\gets$ #2}
%\algrenewcommand\alglinenumber[1]{{\sf\footnotesize\addfontfeatures{Colour=888888,Numbers=Monospaced}#1}}
\algrenewcommand\algorithmicrequire{\textbf{Precondition:}}
\algrenewcommand\algorithmicensure{\textbf{Postcondition:}}

\RequirePackage{hyperref}

\RequirePackage[
nameinlink,
noabbrev
]{cleveref}

% Page layout
% Put an extra 0.125in of play on all dimensions to deal with margins
% when printing
\RequirePackage[paper=letterpaper,
tmargin=1.125in,
bmargin=1.125in,
lmargin=1.625in,
rmargin=1.125in,
includehead=true,
includefoot=true
]{geometry}

% Glossary Setup used for List of Symbols
\RequirePackage[xindy,nonumberlist,nogroupskip]{glossaries}
\newtoggle{printlistofsymbols}
\newcommand*{\setuplistofsymbols}[1]{
  \toggletrue{printlistofsymbols}
  \loadglsentries{#1}
  \makeglossaries
}
