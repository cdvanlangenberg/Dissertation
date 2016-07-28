%% 2014/12/07
%% Set abovedisplayskip to fixed length 24pt.  Hopefully this will
%% appease Valeria

%% Hacking away.
%% This is version 1.2-beta2 of uncgdissertation.cls.
%% It is based on the book.cls class.  It combines some tricks and 
%% techniques from NC State's class and Duke's class.
%% Last modified 2014/10/15

%% 2014/10/15 (v. 1.2-beta2)
%% - set clubpenalty,widowpenalty,raggedbottom to discourage widows/orphans
%% - NOTE: Widows and orpans may occur, especially with three line paragraphs.
%% - trimmed whitespace above (sub)section headers to match space below
%% - (Reverted some previous changes)

%% 2013/04/03 (v. 1.1)
%% - Removed roman numerals as much as possible.
%% - Adjusted toc section numbers to flush left.
%% - remove sections from appendix in toc
%% - After meeting with Valera to discuss required modifications.  
%%    Section numbering must be arabic numbers for the chapter part.
%%    e.g. 2.3.  Bibliography msut show up in table of contents.  Need to
%%    fix spacing in the table of contents when there is no subsections.

%% 2015/04/25
%% - Modified geometry package call to make better margins

%% 2012/11/26
%% - Dr on 1st page

%% 2012/12/06 
%% - spacing around figures.

%% 2013/06/05
%% - added functionality for co-chairs

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{uncgdissertation}[2014/09/16 v1.2-beta1]

\newcommand\@ptsize{}
\newif\if@MA  % Masters MA thesis format
\newif\if@MS  % Masters MS thesis format
\newif\if@PHD  % PhD dissertation format

\newcommand{\uncg@thesistype}{phd}
\DeclareOption{phd}{\renewcommand{\uncg@thesistype}{phd} \@MAfalse
  \@MSfalse \@PHDtrue}
\DeclareOption{ma}{\renewcommand{\uncg@thesistype}{ma} \@MAtrue
  \@MSfalse \@PHDfalse}
\DeclareOption{ms}{\renewcommand{\uncg@thesistype}{ms} \@MStrue
  \@MAfalse \@PHDfalse}
% must choose ma, ms, or phd.  default is phd.
%----------------------------------------------------------------------------
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\newcommand{\timestamp}{}
\newcommand{\draft}{final}
\DeclareOption{draft}{
  \setlength\overfullrule{5pt}
  \renewcommand{\timestamp}{\today\;\;\currenttime}
  \renewcommand{\draft}{draft}
}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{letterpaper,12pt,oneside,onecolumn,final,openany,phd} 
\ProcessOptions
\input{bk1\@ptsize.clo}
\setlength\lineskip{1\p@}
%----------------------------------------------------------------------------
% size from amsart
\newdimen\linespacing
  \normalsize \linespacing=\baselineskip
%----------------------------------------------------------------------------
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
%\renewcommand\floatpagefraction{.5}
\renewcommand\floatpagefraction{.8} %make a page only float if it takes up 80% of page
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
%\renewcommand\dblfloatpagefraction{.5}
\renewcommand\dblfloatpagefraction{.8}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
      \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
  \if@titlepage
  \newcommand\maketitle{
\titlepage%
    \begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@Roman\c@chapter} %% UNCG requirement
%\renewcommand \thesection {\@arabic\thechapter.\@arabic\c@section} %%
%looks bad to mix roman and arabic 
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section} %% 
% UNCG specs says looks bad to mix roman and arabic 
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\MakeUppercase{\chaptername}}
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%

\setlength{\abovedisplayskip}{24pt}  % Get triple space
                                % around equations
\setlength{\belowdisplayskip}{\abovedisplayskip}

\setlength{\abovedisplayshortskip}{\abovedisplayskip}
\setlength{\belowdisplayshortskip}{\abovedisplayshortskip}

  \fancypagestyle{plain}{% 
    \fancyhf{} % clear all header and footer fields 
    \fancyfoot[R]{\thepage} % except the center 
    \fancyfoot[L]{\timestamp} % except the center 
    \renewcommand{\headrulewidth}{0pt} 
    \renewcommand{\footrulewidth}{0pt}}
  \pagestyle{plain}
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}

\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
%---------------------------------------------------------------------------%
% define some lengths here so to mimic single space
\newlength{\uncg@capitalheight}
\settoheight{\uncg@capitalheight}{D}
\newlength{\onelinelength}  % my length.  Should replicate one line in
                            % singlespace mode.
\setlength{\onelinelength}{1.5\uncg@capitalheight}
\addtolength{\onelinelength}{\lineskip}
%---------------------------------------------------------------------------%
% Make a mychapter so that the table of contents can have the 1.5 inch margin
% as required.

\newcommand\mychapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindenttrue
                    \secdef\@chapter\@smychapter}

\def\@smychapter#1{\if@twocolumn
                   \@topnewpage[\@makesmychapterhead{#1}]%
                 \else
                 \phantomsection
                   \@makesmychapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makesmychapterhead#1{%
%  \vspace*{-22\p@}   %Changed to make toc/lof/lot have 1.5 inch
%  margin
% I think this can be omitted since margins are 1.5 in
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
     \centering\normalfont  \MakeUppercase{#1} \par\nobreak
    %\vskip 40\p@
    % \vskip \onelinelength
    % \vskip \baselineskip
  }}
%---------------------------------------------------------------------------%

\newcommand{\maketwoin}{ \vspace*{.5\baselineskip}}

\newcommand{\mycounter}{0}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindenttrue
                    \secdef\@chapter\@schapter}

\newcommand{\chapname}{}
\def\@chapter[#1]#2{
\ifnum \inapp < 1 
\renewcommand{\maketwoin}{}
%\renewcommand{\inapp}{2}
\fi
\ifnum \mycounter < 1  \addtocontents{toc}{~\par \noindent CHAPTER \par} \renewcommand{\mycounter}{2}\fi
\ifnum \c@secnumdepth >\m@ne
\if@mainmatter
\refstepcounter{chapter}%
\typeout{\@chapapp\space\thechapter.}%
\addcontentsline{toc}{chapter}%
                {\protect\numberline{\chapname\thechapter}\MakeUppercase{#1}}%
                \else
                \addcontentsline{toc}{chapter}{\MakeUppercase{#1}}%
                \fi
                \else
                \addcontentsline{toc}{chapter}{\MakeUppercase{#1}}%
                \fi
                \chaptermark{#1}%
                \if@twocolumn
                \@topnewpage[\@makechapterhead{#2}]%
                \else
                \@makechapterhead{#2}%
                \@afterheading
                \fi}



\def\@makechapterhead#1{%
  %\vspace*{14\p@}% %Changed from 50 pt to make 2 inch margin.
  \maketwoin
  {
   \parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \centering \normalfont \@chapapp\space \thechapter
        \par\nobreak
        \vskip 0\p@ % Should only be a double space.  Since we are in
                     % doublespace, I think it should be 0.
      \fi
    \fi
    \interlinepenalty\@M
    \normalfont \MakeUppercase{#1}\par\nobreak
    %\vskip 40\p@ % Should be a triple space.
    %\vskip \onelinelength % Should be a triple space.
    \vspace{.5\baselineskip}
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
%  \vspace*{14\p@}% 2 inch margin for bibliography
%  \vspace*{0.3in}% 2 inch margin for bibliography.  Since margin is
                 % 1.5 in , just need 0.5 in
\maketwoin
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
     \centering\normalfont  \MakeUppercase{#1}\par\nobreak
    %\vskip 40\p@
     \vskip \onelinelength
  }}


\newcommand\section{\@startsection{section}{1}
\z@{0.5\linespacing}{.5em}%\z@{\linespacing}{.5em}%
  {\normalfont\bfseries
\ifnum\value{section}>1 \else \addtocontents{toc}{\protect\addvspace{.5\baselineskip}}\fi}
}
%{indent}{before}{after}

\newcommand\subsection{\@startsection{subsection}{2}
\z@{0.5\linespacing}{.5em} %\z@{\linespacing}{.5em}%
  {\normalfont\itshape}}

\newcommand\subsubsection{\@startsection{subsubsection}{3}
\z@\z@{\fontdimen2\font}%
  \itshape}

%Changed above.
%--------------------------------------------------------------------------%

\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use enumeration format from amsbook
\def\labelenumi{(\theenumi)}
\def\theenumi{\@arabic\c@enumi}
\def\labelenumii{(\theenumii)}
\def\theenumii{\@alph\c@enumii}
\def\p@enumii{\theenumi}
\def\labelenumiii{(\theenumiii)}
\def\theenumiii{\@roman\c@enumiii}
\def\p@enumiii{\theenumi(\theenumii)}
\def\labelenumiv{(\theenumiv)}
\def\theenumiv{\@Alph\c@enumiv}
\def\p@enumiv{\p@enumiii\theenumiii}
\def\labelitemi{$\m@th\bullet$}
\def\labelitemii{\bfseries --}% \upshape already done by \itemize
\def\labelitemiii{$\m@th\ast$}
\def\labelitemiv{$\m@th\cdot$}

%\renewcommand\theenumi{\@arabic\c@enumi}
%\renewcommand\theenumii{\@alph\c@enumii}
%\renewcommand\theenumiii{\@roman\c@enumiii}
%\renewcommand\theenumiv{\@Alph\c@enumiv}
%\newcommand\labelenumi{\theenumi.}
%\newcommand\labelenumii{(\theenumii)}
%\newcommand\labelenumiii{\theenumiii.}
%\newcommand\labelenumiv{\theenumiv.}
%\renewcommand\p@enumii{\theenumi}
%\renewcommand\p@enumiii{\theenumi(\theenumii)}
%\renewcommand\p@enumiv{\p@enumiii\theenumiii}
%\newcommand\labelitemi{\textbullet}
%\newcommand\labelitemii{\normalfont\bfseries \textendash}
%\newcommand\labelitemiii{\textasteriskcentered}
%\newcommand\labelitemiv{\textperiodcentered}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand{\inapp}{2}
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\MakeUppercase\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}
  \renewcommand{\inapp}{0}
  \gdef\thesection{\@Alph\c@chapter.\@arabic\c@section} %% 
\settocdepth{chapter}
}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{4\p@} % \setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
%-----------------------------------------------------------------------------
% Manage Equations

\@addtoreset {equation}{chapter}

\renewcommand{\theequation}
  {\arabic{chapter}.\@arabic\c@equation}  % equation numbering style
%-----------------------------------------------------------------------------
% Manage Figures

\newcounter{figure} % Don't reset at chapter.
\renewcommand \thefigure
     {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
%----------------------------------------------------------------------------- 
% Manage Tables

\newcounter{table} % Don't reset at chapter.
\renewcommand \thetable
     {\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float} 

\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
%-----------------------------------------------------------------------------
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{.5\baselineskip}
\setlength\belowcaptionskip{0\p@}  %This was default.  Change to get triple?  I think triple shows from float sep.
%\setlength\belowcaptionskip{.5\baselineskip}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\bf#1.} #2}%
  \ifdim \wd\@tempboxa >\hsize
    {\bf#1.} #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em} % These commands don't seem to work
                              % because package tocloft overwrite
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}


%-----------------------------------------------------------------------------
% changed to match uncg specs.
\newcommand\tableofcontents{%
  \addtocontents{toc}{~ \hfill Page \par}
%  \addtocontents{toc}{\protect\addvspace{\baselineskip}} 
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \mychapter*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \singlespacing
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    \doublespacing
    \clearpage
}
%-----------------------------------------------------------------------------
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
%-----------------------------------------------------------------------------
\newcommand\listoffigures{%
\cleardoublepage
\addcontentsline{toc}{chapter}{\MakeUppercase{\listfigurename}}
\addtocontents{lof}{~ \hfill Page \par}  
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \mychapter*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \singlespacing
    %\doublespacing
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    \doublespacing
    \clearpage
    }
%changed above to match uncg specs.
%-----------------------------------------------------------------------------

\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

%-----------------------------------------------------------------------------
\newcommand\listoftables{%
\cleardoublepage
\addcontentsline{toc}{chapter}{\MakeUppercase{\listtablename}}
  \addtocontents{lot}{~ \hfill Page \par}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \mychapter*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    %\phantomsection{}    
    \singlespacing
    %\doublespacing
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    \doublespacing
    \clearpage
}
%changed above to match uncg specs.
%-----------------------------------------------------------------------------
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%  % make it worse widow penalty
      %\widowpenalty10000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}

\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

%%%%
% My code
\RequirePackage[\draft]{showkeys}
\RequirePackage[mmddyy,12hr]{datetime}
\RequirePackage[overload]{textcase} % So that math does not get capitalized in
                          % chapter titles.  Note that the overload
                          % option is used, so this redefines
                          % \MakeUppercase 
\RequirePackage[noadjust]{cite}
\RequirePackage[T1]{fontenc}
% \RequirePackage{topcapt}

\RequirePackage{setspace}
\RequirePackage[english]{babel}
\RequirePackage{hyphenat}
\RequirePackage{nolbreaks}
\RequirePackage{ifthen}
\RequirePackage{upref}
\RequirePackage{tocvsec2}
\RequirePackage[titles]{tocloft}
\RequirePackage{calc}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{lastpage}
\RequirePackage[labelsep=period]{caption}

%%---------------------------------------------------------------------------%%
%%---------------------------- Formatting Options ---------------------------%%
%% ------------------------------------------------------------------------- %%

%% Line height
\newlength{\uncg@lineheight}
\setlength{\uncg@lineheight}{2.1ex}

%% Line height
\newlength{\uncg@signatureheight}
\setlength{\uncg@signatureheight}{2em}

%% We must add two double spaces plus one capital-height (for the page number)
%%  to footskip.  Footskip is measured from the top of the bottom margin.
%%  (See geometry package documentation, note that includefoot option is used.)
\doublespacing

\usepackage[total={6in, 8.5in}, bottom=1in, right= 1in, includefoot ]{geometry}


%\newlength{\uncg@footskip}
%\setlength{\uncg@footskip}{2\uncg@capitalheight}
%\addtolength{\uncg@footskip}{2\baselineskip}
%\RequirePackage[includefoot,
%                rmargin=1in,
%                tmargin=1.5in,
%                bmargin=1in,
%                lmargin=1.5in,
               %footskip=\uncg@footskip
%]
%               {geometry}
%\setlength{\headheight}{0in}



%% -------------------------------------------------------------------------- %%
%% Headers/footers - page number
\pagestyle{plain}

%% -------------------------------------------------------------------------- %%
%% Vertical space around tables and figures, triple spacing
\setlength{\textfloatsep}{1.0\baselineskip \@plus 1pt \@minus 0pt} 
\setlength{\floatsep}{1.0\baselineskip \@plus 1pt \@minus 0pt} 
\setlength{\intextsep}{1.0\baselineskip \@plus 1pt \@minus 0pt}

%\textfloatsep â€” distance between floats on the top or the bottom and the text;
%\floatsep â€” distance between two floats;
%\intextsep â€” distance between floats inserted inside the page text (using h) and the text proper.

%%----------------------------------------------------------------------------%%
%%---------------------------  Content Options -------------------------------%%
%% -------------------------------------------------------------------------- %%
%% Author name
\newcommand{\uncg@authorfirstmiddle}{First Middle}
\newcommand{\uncg@authorlast}{Last}

\if@MA{\gdef\@thesis{thesis}
  \gdef\@capthesis{Thesis}
  \gdef\@degree{Master~of~Arts} 
  \gdef\@shortdegree{M.A.}} \else 
\if@MS{\gdef\@thesis{thesis} 
  \gdef\@capthesis{Thesis} 
  \gdef\@degree{Master~of~Science} 
  \gdef\@shortdegree{M.S.}} \else
\if@PHD{\gdef\@thesis{dissertation} 
  \gdef\@capthesis{Dissertation} 
  \gdef\@degree{Doctor~of~Philosophy}
  \gdef\@shortdegree{Ph.D.}} \fi\fi\fi


%% Command to test for period after middle name
\newboolean{@uncg@needsperiod}
\newcommand{\uncg@testlastchar}[2]{%
    \ifthenelse{\equal{#2}{\relax}}{
        \ifthenelse{\equal{#1}{.}}{%
            \setboolean{@uncg@needsperiod}{false}
        }{% #1 != .
            \setboolean{@uncg@needsperiod}{true}
        }
        \let\next=\relax
    }
    {% #2 != relax
        \let\next=\uncg@testlastchar
    }
    \next#2
}

\providecommand{\student}[2]{
    \renewcommand{\uncg@authorfirstmiddle}{#1}
    \renewcommand{\uncg@authorlast}{#2}
    \uncg@testlastchar#1\relax
    \author{\uncg@authorfirstmiddle{} \uncg@authorlast}
}


%% Degree year - in case the degree year doesn't match the current year.
\newcommand{\uncg@year}{\the\year}
\providecommand{\degreeyear}[1]{
    \renewcommand{\uncg@year}{#1}
}

%% -------------------------------------------------------------------------- %%
%% Thesis Title
\newcommand{\uncg@thesistitle}{\@title}%My Thesis Title}
%\providecommand{\thesistitle}[1]{\renewcommand{\uncg@thesistitle}{#1}}

%-----------------------------------------------------------------------------
% Count the number of co-chairs 
\newcounter{@chair}           % Number of chairs defined so far.
\setcounter{@chair}{0}        
\newcommand{\chair}[1]{
  \addtocounter{@chair}{1}    % Inc. num of classes to include this new one.
  \ifcase\value{@chair}
	 \or \newcommand{\uncg@chair}{#1}
	 \or \newcommand{\uncg@cochair}{#1}
  \else
     \ClassError{uncgdissertation.cls}
        {Committee error.  Too many chairs.}
  \fi
}
%-----------------------------------------------------------------------------



% -------------------------------------------------------------------------- %%
%% Abstract page commands
%%  - hyphnat package \nohyphens prevents title from being hyphenated.
%%  - \nolbreaks removes any line breaks in title (but you must use \linebreak
%%     instead of \\

\newenvironment{abstract}{%
  \singlespacing   
  \thispagestyle{empty}
  \setcounter{page}{0}
  \noindent
   \MakeUppercase{\uncg@authorlast{},~%
     \uncg@authorfirstmiddle{}},~\@shortdegree~%
%   \ifthenelse{\boolean{@uncg@needsperiod}}{\@~}{,~}\@shortdegree%
   \nohyphens{\nolbreaks{\uncg@thesistitle}. (\uncg@year)\\
      Directed by \ifthenelse{\value{@chair}=1}{Dr.~\uncg@chair}{Dr.~\uncg@chair\ and Dr.~\uncg@cochair}. \pageref{LastPage} pp.}\\

%line break above needed to make above singlespace and below doublespace
   \doublespacing
   \pagestyle{empty}
}%
{
\pagestyle{plain}}

%% -------------------------------------------------------------------------- %%
%% Abstract page commands
\newcommand{\makecopyrightpage}{
\addtocounter{page}{-1}
\thispagestyle{empty}
      \  \vfill
      \begin{center}
        \copyright{} \uncg@year{} by \@author 
      \end{center}
      \  \vfill
\clearpage
}

%% -------------------------------------------------------------------------- %%
%% Title page commands


%-----------------------------------------------------------------------------
% Count the number of members (not including chair)
\newcounter{@member}           % Number of members defined so far.
\setcounter{@member}{0}        
\newcommand{\member}[1]{
  \addtocounter{@member}{1}    % Inc. num of classes to include this new one.
  \ifcase\value{@member}
	 \or \newcommand{\uncg@memberI}{#1}
	 \or \newcommand{\uncg@memberII}{#1}
	 \or \newcommand{\uncg@memberIII}{#1}
	 \or \newcommand{\uncg@memberIV}{#1}
	 \or \newcommand{\uncg@memberV}{#1}
  \else
     \ClassError{uncgdissertation.cls}
        {Committee error.  Too many members.}
  \fi
}
%-----------------------------------------------------------------------------

\newcommand{\uncg@titlepageparagraph}{
  A \@capthesis\ Submitted to \\
  the Faculty of the Graduate School at\\
  The University of North Carolina at Greensboro\\
  in Partial Fulfillment\\
  of the Requirements for the Degree\\
  \@degree 
}

\newcommand{\uncg@approvalpageparagraph}{
This \@thesis\ written by \@author\ has been approved by the following committee of the
     Faculty of The Graduate School at The University of North
     Carolina at Greensboro.}


\newcommand{\uncg@program}{Degree Program}
\providecommand{\program}[1]{\renewcommand{\uncg@program}{#1}}

\newcommand{\uncg@citystate}{Greensboro}

% Length of signature lines
\newlength{\namewidth}
\setlength{\namewidth}{2.81in} % changed to align signature of chair with o in Greensboro

\newcommand{\uncg@signatureline}[1]{
    \begin{minipage}[t]{\namewidth}
      \underline{\hspace*{\namewidth}}
     \vspace{0.5ex}
     #1
    \end{minipage}
}


\newcommand{\uncg@dateline}[1]{
    \begin{minipage}[t]{\namewidth}
      \vspace{0.2\uncg@lineheight}
      \underline{{\phantom{#1} }}\\
     \vspace{0.5ex}
     #1
    \end{minipage}
}


% This should be switched if more than one chair.
\newcommand{\uncg@chairsignature}{
  \begin{minipage}[t]{\namewidth}
    \ifthenelse{\value{@chair}=1}{
      Approved by\\[\uncg@signatureheight]
      \uncg@signatureline{Committee Chair}
      }{
      Approved by\\[\uncg@signatureheight]
      \uncg@signatureline{Committee Co-chair}\\[\uncg@signatureheight]
      \uncg@signatureline{Committee Co-chair}}
  \end{minipage}
}


\newcommand{\uncg@datelines}{
  \begin{minipage}{\namewidth}
    \uncg@dateline{Date of Acceptance by Committee}\\[\uncg@signatureheight]
    \uncg@dateline{Date of Final Oral Examination}\\
  \end{minipage}
}

\newcommand{\uncg@chairtable}
{
\ifthenelse{\value{@chair}=1}{
Committee Chair &
\uncg@signatureline{\uncg@chair}\\[\uncg@signatureheight]}
{
Committee Co-chair &
\uncg@signatureline{\uncg@chair}\\[\uncg@signatureheight]
Committee Co-chair &
\uncg@signatureline{\uncg@cochair}\\[\uncg@signatureheight]
}
}

\newcommand{\uncg@committeesignatures}{
  \ifthenelse{\value{@member}=2}{
%Come back
    \begin{tabular}[t]{r@{\hspace{2.7pt}}l}%c@{\hspace{0.5in}}c}
      \uncg@chairtable
      Committee Members &\uncg@signatureline{\uncg@memberI}\\[\uncg@signatureheight]
       &\uncg@signatureline{\uncg@memberII}
    \end{tabular}
}{} % end ifthenelse = 3

  \ifthenelse{\value{@member}=3}{
    \begin{tabular}[t]{r@{\hspace{2.7pt}}l}%c@{\hspace{0.5in}}c}
\uncg@chairtable
      Committee Members &\uncg@signatureline{\uncg@memberI}\\[\uncg@signatureheight]
       &\uncg@signatureline{\uncg@memberII}\\[\uncg@signatureheight]
     &\uncg@signatureline{\uncg@memberIII}
    \end{tabular}
  }{} % end ifthenelse = 4
  
\ifthenelse{\value{@member}=4}{
\begin{tabular}[t]{r@{\hspace{2.7pt}}l}%c@{\hspace{0.5in}}c}
\uncg@chairtable
      Committee Members &\uncg@signatureline{\uncg@memberI}\\[\uncg@signatureheight]
       &\uncg@signatureline{\uncg@memberII}\\[\uncg@signatureheight]
     &\uncg@signatureline{\uncg@memberIII}\\[\uncg@signatureheight]
     &\uncg@signatureline{\uncg@memberIV}
    \end{tabular}
}{} % end ifthenelse = 5
  \ifthenelse{\value{@member}=5}{
\begin{tabular}[t]{r@{\hspace{2.7pt}}l}%c@{\hspace{0.5in}}c}
\uncg@chairtable
      Committee Members &\uncg@signatureline{\uncg@memberI}\\[\uncg@signatureheight]
       &\uncg@signatureline{\uncg@memberII}\\[\uncg@signatureheight]
     &\uncg@signatureline{\uncg@memberIII}\\[\uncg@signatureheight]
     &\uncg@signatureline{\uncg@memberIV}\\[\uncg@signatureheight]
      &\uncg@signatureline{\uncg@memberV}
    \end{tabular}
}{} % end ifthenelse = 6
}

\newcommand{\maketitlepage}{
  \chapter*{\uncg@thesistitle}
  \thispagestyle{empty}  % after chapter* command to ensure no page numbers.
  \singlespacing
      \begin{center}
        \vfill
            by \\~\\
        \@author
            \vfill
       \uncg@titlepageparagraph
           \vfill
           \uncg@citystate\\
       \uncg@year
       \end{center}
           \vfill

\begin{flushright}    \uncg@chairsignature \end{flushright}
\clearpage
\doublespacing
}

\newcommand{\makeapprovalpage}{
  \mychapter*{Approval Page}
  \vspace{.5\baselineskip}
  \uncg@approvalpageparagraph
  \vfill
  \singlespacing
  \begin{center}
    \uncg@committeesignatures
  \end{center}
  \vfill
  \begin{flushleft}
    \uncg@datelines
  \end{flushleft}
  \vfill
  \doublespacing
  \clearpage
}

%% -------------------------------------------------------------------------- %%
%% ------------ Dedication, biography, and acknowledgements ----------------- %%
%% -------------------------------------------------------------------------- %%

%%  Dedication
\newenvironment{dedication}
{\setcounter{page}{2} ~\vfill \vspace{-0.5in}\begin{center} \sl}
{\end{center} \vfill\clearpage}


%%  Acknowledgements
\newenvironment{acknowledgements}
{\mychapter*{Acknowledgments} \vspace{.5\baselineskip}}
{\clearpage}

%%  Preface
\newenvironment{preface}
{\mychapter*{Preface} \vspace{.5\baselineskip}}
{\clearpage}

%% -------------------------------------------------------------------------- %%
%% -------------------------  Table of Contents ----------------------------- %%
%% -------------------------------------------------------------------------- %%

\newlength{\tab}
\setlength{\tab}{4.6em}
\setcounter{tocdepth}{1}
%\setlength{\cftchapindent}{\tab}
\setlength{\cftchapnumwidth}{\tab}
\renewcommand{\cftchapaftersnumb}{\hspace{-1em}}

% align at the last dot of section number.
\renewcommand{\cftchapaftersnum}{.~\hspace{1em}} 

\renewcommand{\cftchappagefont}{\normalfont} %Makes it not bold
\renewcommand{\cftchapfont}{\normalfont}
\setlength{\cftsecnumwidth}{3.5em}
\setlength{\cftsecindent}{6.3em}
\renewcommand{\cftchappresnum}{\hfill}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsecaftersnumb}{\hspace{-1em}}


%\renewcommand{\cftdotsep}{3.4} % This seems to match the best with
                               % uncg when there is no title given
\renewcommand{\cftdotsep}{3} % This seems to match the best with
\renewcommand{\cftchapleader}{\cftdotfill{\cftsecdotsep}}

%\setlength\cftparskip{0pt}
\setlength\cftbeforechapskip{.5\baselineskip}
\setlength\cftbeforesecskip{0pt}
\setlength\cftaftertoctitleskip{0pt}

\setlength\cftbeforefigskip{.5\baselineskip}
\setlength\cftbeforetabskip{.5\baselineskip}
\setlength{\cftfignumwidth}{5.8em}
\renewcommand{\cftfigpresnum}{Figure~}
\renewcommand{\cftfigaftersnum}{.}
\renewcommand{\cftfigaftersnumb}{\hspace{-1em}}
\setlength{\cftfigindent}{0pt}


\setlength{\cfttabnumwidth}{5.4em}
\renewcommand{\cfttabpresnum}{Table~}
\renewcommand{\cfttabaftersnum}{.}
\renewcommand{\cfttabaftersnumb}{\hspace{-1em}}
\setlength{\cfttabindent}{0pt}

\cftsetpnumwidth{1.5em}
\cftsetrmarg{8em} % tells how close title can get to numbers in toc before line
%\setlength{\mylen}{0.5em}   % need some extra space at end of number
% break
%% -------------------------------------------------------------------------- %%
%% ------------------------- Landscape Pages  ------------------------------- %%
%% -------------------------------------------------------------------------- %%
%%  Loading pdflscape package for page rotation
\RequirePackage{pdflscape}
%%  Loading fancyhdr package to change page numbering
\RequirePackage{fancyhdr}
%%  Loading sideways for sideways environment
\RequirePackage{rotating}

\newlength{\portraittextheight}
\setlength{\portraittextheight}{\textheight}
\addtolength{\portraittextheight}{\footskip}
\newlength{\portraittextwidth}
\setlength{\portraittextwidth}{\textwidth}

\RequirePackage{afterpage}
\RequirePackage{changepage}

%% Rotate page and page number
\newenvironment{lscapenum}
{
%%   The standard landscape environment does not rotate the margins and
%%   page number.  However, we want the margins (mostly) rotated as well
%%   as the page number.  To change the margins, we use the \changepage
%%   command from the \changepage package.  Since the \textheight and
%%   \textwidth dimensions get switched, we need to reduce the rotated
%%   \textheight by \uncg@footskip and increase the \textwidth by the
%%   same measure.
%%
%%   The syntax of the \changepage command is
%% \changepage{textheight}{textwidth}{evensidemargin}{oddsidemargin}{columnsep}
%%            {topmargin}{headheight}{headsep}{footskip}
   \clearpage
   \changepage{\uncg@footskip}{-\uncg@footskip}{}{}{}{}{}{}{}
   \begin{landscape}
     \pagestyle{fancy}
     \fancyhead{} % clear all header fields
     \fancyfoot{} % clear all footer fields
     \renewcommand{\headrulewidth}{0pt}
     \rfoot{
       %% Since the header and footer are unrotated, we must manually
       %% place the page number.  The picture environment is included in
       %% standard LaTeX.
       \setlength{\unitlength}{\portraittextheight}
       \begin{picture}(0,0)
           \put(0.055,0.557){\begin{sideways}\thepage\end{sideways}} % page number
       \end{picture}
     }

}
{
   \end{landscape}
   %% The \textheight is too large leaving landscape environment
   %%  since we invoked the \changepage.  We manually reduce it.
   \addtolength{\textheight}{-\uncg@footskip}

   %% \textheight controls 3 other variables, which must be updated.
   %% See \endlandscape definition in lscape.sty
   \global\@colht=\textheight
   \global\vsize=\textheight
   \global\@colroom=\textheight

   \pagestyle{plain}
}

%% Rotate page but NOT page number
\newenvironment{lscapenotnum}
{
   \begin{landscape}
}
{
   \end{landscape}
}

%% Tries to deal with quotations longer than 3 lines.
\let\uncg@quotation\quotation
\let\enduncg@quotation\endquotation

\renewenvironment{quotation}{ \begin{uncg@quotation}\begin{singlespace}
    }{\end{singlespace}\end{uncg@quotation}}


%% -------------------------------------------------------------------------- %%
%% -------------------------  References ------------------------------------ %%
%% -------------------------------------------------------------------------- %%

    \let\uncg@thebibliography\thebibliography
    \let\enduncg@thebibliography\endthebibliography
    \renewenvironment{thebibliography}[1]
    {
        
        \begin{uncg@thebibliography}{#1}
          \addcontentsline{toc}{chapter}{\MakeUppercase\bibname}
          \singlespacing
    }
    {
      \doublespacing
        \end{uncg@thebibliography}
    }

%% -------------------------------------------------------------------------- %%
%% ------------------------- The Appendices  -------------------------------- %%
%% -------------------------------------------------------------------------- %%

\newlength{\appendixwidth}
\setlength{\appendixwidth}{7em}


%% Count the total number of appendices
\RequirePackage{totcount}
\regtotcounter{chapter} % chapter counter is used for appendices

\AtBeginDocument{%
\newcounter{uncg@appendixtocdepth}
\ifthenelse{\c@tocdepth > 2}
{\setcounter{uncg@appendixtocdepth}{2}}
{\setcounter{uncg@appendixtocdepth}{\c@tocdepth}}

\let\uncg@appendix\appendix
\renewcommand{\appendix}{
  %% Adding "Appendix" before letter in TOC
  %%  We must change the width of the box which the appendix letter is set in
  %%  and add the "Appendix " before the letter.  See tocloft documentation.
  \addtocontents{toc}{
    \protect\renewcommand{\protect\cftchappresnum}{\MakeUppercase\appendixname \nobreakspace}
    \protect\renewcommand{\protect\cftchapnumwidth}{\protect 8em}
  }
  \clearpage
  \uncg@appendix %% call internal \appendix macro
}
}

\setcounter{secnumdepth}{1} % 

\renewcommand{\labelenumi}{\textup{(\theenumi)}}
\renewcommand{\labelenumii}{\textup{(\theenumii)}}
\renewcommand{\labelenumiii}{\textup{(\theenumiii)}}

\doublespacing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% An algorithm environment for typesetting algorithms consistently.  
%% Takes 2 arguments--the input and output.
%% Current plan is to typeset input and output only and switch font to rm
\newlength{\@alginputwidth}
\setlength{\@alginputwidth}{\textwidth}
%\newlength{\@algtmp}
\newlength{\@alglspace}
\settowidth{\@alglspace}{\rm Output:}
%\addtolength{\@alginputwidth}{-\@alglspace}
\addtolength{\@alginputwidth}{-2\@alglspace}
%\settowidth{\@algtmp}{\mbox{\enspace} }
%\addtolength{\@alginputwidth}{-\@algtmp}
\newenvironment{uncgalgorithm}[2]{%
%Stuff before
\mbox{}
\rm
\begin{itemize}
\item[\rlap{Input:}] \hspace{\@alglspace} \parbox[t]{\@alginputwidth}{#1}
\item [\rlap{Output:}] \hspace{\@alglspace} \parbox[t]{\@alginputwidth}{#2}
\end{itemize}
}
{
%Stuff after
\relax
}


%% Theorem, Lemma, etc. environments.  You can rename if you wish.
% Theorem style and numbering convention
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[chapter]
\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{conjecture}[theorem]{Conjecture}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{algorithm}[theorem]{Algorithm}
% Definition type object style and numbering convention
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{example}[theorem]{Example}
% Remark type object style and numbering
\theoremstyle{remark}
\newtheorem*{remark}{Remark}  % the star makes them not numbered
\newtheorem*{notation}{Notation}

%% The hyperref and bookmark packages should be loaded last to give
%% them a fighting shot against the other packages.  You should leave these
%% here unless you have to remove them.  They make the resulting 
%% pdf much easier to navigate.

%\RequirePackage[pdftex, pdfusetitle, pdfpagelabels,plainpages=false,
%  bookmarks, bookmarksnumbered, colorlinks, linkcolor=black, citecolor=black,
%  filecolor=black, urlcolor=black]{hyperref} % links and references
\RequirePackage[pdftex, pdfusetitle, pdfpagelabels,plainpages=false,
  bookmarks, bookmarksnumbered, colorlinks, linkcolor=black, citecolor=black,
  filecolor=black, urlcolor=black]{hyperref} % links and references
\RequirePackage{bookmark}
%% the line below is needed to tell hyperref to relax about the
%% uppercase commands 
\pdfstringdefDisableCommands{\let\MakeUppercase\relax} 



%-----------------------------------------------------------------------------
% Move these down to end to correct babel if necessary
%\newcommand\listfigurename{List of Figures}
%\newcommand\listtablename{List of Tables}
%\newcommand\bibname{References}  % redfined in babel so change back at end.
%\newcommand\indexname{Index}
%\newcommand\figurename{Figure}
%\newcommand\tablename{Table}
%\newcommand\partname{Part}
%\newcommand\chaptername{Chapter}
%\newcommand\appendixname{Appendix}
% changed above to match uncg specs.
%-----------------------------------------------------------------------------

\addto\captionsenglish{
\renewcommand\bibname{References}
\renewcommand\contentsname{Table of Contents}
}

% Discourage widows and orphans from being produced
\clubpenalty = 10000
\widowpenalty = 10000
\raggedbottom

\endinput
%%
%% end of `uncgdissertation.cls'