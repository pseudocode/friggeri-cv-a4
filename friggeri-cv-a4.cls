\ProvidesClass{friggeri-cv-a4}[2015/10/22 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{nocolors}{\def\@cv@nocolors{}}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

% set A4 paper format
\setlength\paperheight {297mm}
\setlength\paperwidth  {210mm}

\ProcessOptions

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{32525F}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{yellow}{HTML}{FEF9E3}

\definecolor{nova1}{RGB}{26,8,14}
\definecolor{nova2}{RGB}{61,32,59}
\definecolor{nova3}{RGB}{84,50,70}
\definecolor{nova4}{RGB}{119,58,77}
\definecolor{nova5}{RGB}{167,82,82}
\definecolor{nova6}{RGB}{207,120,98}
\definecolor{nova7}{RGB}{255,206,156}

\definecolor{fantastic1}{RGB}{219,219,221}
\definecolor{fantastic2}{RGB}{156,142,142}
\definecolor{fantastic3}{RGB}{82,75,163}
\definecolor{fantastic4}{RGB}{31,30,35}
\definecolor{fantastic5}{RGB}{106,146,84}
\definecolor{fantastic6}{RGB}{220,172,108}
\definecolor{fantastic7}{RGB}{229,86,86}
\definecolor{fantastic8}{RGB}{115,73,60}


\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{fantastic7}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

\ifdefined\@cv@nocolors
  \colorlet{green}{gray}
  \colorlet{rdfgreen}{gray}
  \colorlet{orange}{gray}
  \colorlet{rdforange}{gray}
  \colorlet{purple}{gray}
  \colorlet{rdfpurple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
\fi

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}

\newfontfamily\bodyfont
[BoldFont=YanoneKaffeesatz-Bold.ttf,
ItalicFont=YanoneKaffeesatz-Light.ttf,
BoldItalicFont=YanoneKaffeesatz-SemiBold.ttf]
{YanoneKaffeesatz-Regular.ttf}

\newfontfamily\thinfont[]{Dosis-ExtraLight.ttf}
\newfontfamily\headingfont[]{Dosis-ExtraBold.ttf}
\newfontfamily\headingfontalt[]{Dosis-SemiBold.ttf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
BoldFont=YanoneKaffeesatz-Bold.ttf,
ItalicFont=YanoneKaffeesatz-Light.ttf,
BoldItalicFont=YanoneKaffeesatz-SemiBold.ttf
]
{YanoneKaffeesatz-Regular.ttf}

\setmathfont{YanoneKaffeesatz-Regular.ttf}
%%%

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\headingfontalt  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

% \newcounter{colorCounter}
% \def\@sectioncolor#1#2#3{%
%   {%
%     \color{%
%       \ifcase\value{colorCounter}%
%         blue\or%
%         red\or%
%         orange\or%
%         green\or%
%         purple\or%
%         brown\else%
%         headercolor\fi%
%     } #1#2#3%
%   }%
%   \stepcounter{colorCounter}%
% }
\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        fantastic7\or%
        fantastic6\or%
        fantastic5\or%
        fantastic3\or%
        fantastic2\or%
        fantastic1\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}
\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #1}
  \par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[2]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #2}
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  \parbox[t]{2cm}{#1}&\parbox[t]{11.3cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=fantastic3} #3}\\%
    #4\vspace{\parsep}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[backend=biber, style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[book]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{book}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}


\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \nameparts{#1}\ifblank{\namepartgiven}{}{\namepartgiven\space}\namepartfamily%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

\defbibheading{bibheading}[\bibname]{%
   \subsubsection*{#1}
   \markboth{#1}{#1}
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \newrefcontext[sorting=chronological]%
    \nocite{*}
    \printbibliography[type={#1}, title={#2}, heading=bibheading]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=2.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=false,       
    linkcolor=red,          
    citecolor=red,        
    filecolor=red,      
    urlcolor = red}
    
% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother
