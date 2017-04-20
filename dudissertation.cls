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

\newcommand*\acknowledgmentsfilename[1]{\renewcommand\@acknowledgmentsfilename{#1}}

\iftoggle{acknowledgmentspage}{
  \newcommand*\@acknowledgmentsfilename{\@latex@error{No \noexpand\acknowledgmentsfilename given}\@ehc}
}{
  \newcommand*\@acknowledgmentsfilename{}

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

\newcommand*{\startofdocument}{
  \doublespacing
  \createtitlepage
  \pagenumbering{roman}
  \iftoggle{copyrightpage}{
    \createcopyrightpage
  }{}
  \createabstractpage
  \iftoggle{acknowledgmentspage} {
    \createacknowledgmentspage
  }{}

  \tableofcontents
  \clearpage
  \pagenumbering{arabic}
}

\LoadClass{scrreprt}

\KOMAoption{fontsize}{11pt}
\KOMAoption{toc}{chapterentrywithdots}

% Set the paragraph indent to 0.5in to match the Word templates
\setparsizes{0.5in}{0pt}{0pt plus 1fil}

% This combination along with the geometry settings below always put a
% 1in margin on the top and 1.5in top margin on new chapters
\renewcommand{\chapterheadstartvskip}{\vspace{0.75in}}
\setlength{\headheight}{-0.25in}

\setcounter{tocdepth}{2}

% Needed to double space body text
\usepackage{setspace}

\usepackage{hyperref}
% Page layout
% If using hyperef, load it before this block
\usepackage[paper=letterpaper,
tmargin=1in,
bmargin=1in,
lmargin=1.5in,
rmargin=1in,
includehead=true,
includefoot=true
]{geometry}

