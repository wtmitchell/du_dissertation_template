% This file provides a simple wrapper around the KOMA-Script Report class
% to satisfy the requirements for a dissertation at the University of Denver

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dudissertation}
[2017/03/16 v1.0 University of Denver Dissertation class]

% Defines the formal faculty names
\newcommand*\dunsmfaculty{the Faculty of Natural Sciences and Mathematics}
\newcommand*\dursecsfaculty{the Faculty of the Daniel Felix Ritchie School of Engineering and Computer Science}


\newcommand*\advisor[1]{\renewcommand\@advisor{#1}}
\newcommand*\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}

\newcommand*\faculty[1]{\renewcommand\@faculty{#1}}
\newcommand*\@faculty{\@latex@error{No \noexpand\faculty given}\@ehc}

\newcommand*{\startofdocument}{
  \begin{titlepage}
    \vspace{\stretch{1}}
    \begin{center}
      \LARGE \@title
    \end{center}
    \vspace{\stretch{1}}
    \begin{center}
      A Dissertation
      Presented to\\
      \@faculty\\
      University of Denver
    \end{center}
    \vspace{\stretch{1}}
    \begin{center}
      In Partial Fulfillment\\
      of the Requirements for the Degree\\
      Doctor of Philosophy
    \end{center}
    \vspace{\stretch{1}}
    \begin{center}
      by\\
      \@author\\
      date\\
      Advisor: \@advisor
    \end{center}
    \vspace{\stretch{1}}
  \end{titlepage}
}

\AtBeginDocument{\startofdocument}

\LoadClass{scrreprt}

\KOMAoption{fontsize}{11pt}

\usepackage{hyperref}
% Page layout
% If using hyperef, load it before this block
\usepackage[paper=letterpaper,
tmargin=1in,
bmargin=1in,
lmargin=1.5in,
rmargin=1in
]{geometry}
\usepackage{ifpdf}
\ifpdf
\geometry{driver=pdftex}
\else
\geometry{driver=dvips}
\fi
