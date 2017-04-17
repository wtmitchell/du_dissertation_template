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

\newcommand*{\startofdocument}{
  \doublespacing
  \createtitlepage
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

\usepackage{setspace}
