\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aq-hw}[2019/11/17 Homework Template]

\LoadClassWithOptions{article}

% package imports

\RequirePackage[T1]{fontenc}         % fixes special characters in output pdf
\RequirePackage[utf8]{inputenc}      % allows inputting special characters in source
\RequirePackage{lmodern}             % prevents bitmapping with fontenc
\RequirePackage{alltt}
\RequirePackage{xcolor}              % colours in math mode
\RequirePackage{graphicx}            % embed graphics
%\RequirePackage[labelformat=empty]{caption} % remove `Figure #: ' from captions
\RequirePackage{enumitem}            % change item separation in list
\RequirePackage{amsmath}             % improve math functionality
\RequirePackage{mathtools}           % found in kdhw.cls
\RequirePackage{amssymb}             % increase symbol library
\RequirePackage{amsthm}              % create theorem environments
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{indentfirst}         % indent first paragraph of sections
\RequirePackage{centernot}           % \centernot before a symbol to negate it
\RequirePackage{titling}             % adjust title geometry
\RequirePackage{float}
\RequirePackage{bm}                  % bold math font
\RequirePackage{bbm}                 % bold digits
\RequirePackage{tikz}
\RequirePackage{tikz-cd}
\RequirePackage{lastpage}
\RequirePackage{hyperref}            % try to load this last!

\hypersetup{
	pdfstartview={XYZ null null 1.00},
	colorlinks=true,
	urlcolor=cyan,
	linkcolor=cyan
}
\geometry{
	margin=1in,
	headheight=\baselineskip,
	headsep=\baselineskip,
	heightrounded
}

% custom math commands
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\F}{\mathbb{F}}
\newcommand{\p}{\partial}
\newcommand{\f}{\frac} % fractions
\newcommand{\uvec}[1]{\boldsymbol{\hat{\mathbf{#1}}}} % unit vectors
\newcommand{\unit}{\,\mathrm} % units
\newcommand{\sgn}{\operatorname{sgn}}
\newcommand{\del}{\vec{\nabla}}
\newcommand{\avgint}{\mathrel{\int\!\!\!\!\!\!-}}

\renewcommand{\qedsymbol}{$\blacksquare$} % Change Q.E.D. tombstone

\newcommand\@course{}
\newcommand\course[1]{\renewcommand\@course{#1}}

\newcommand\@hwtype{}
\newcommand\hwtype[1]{\renewcommand\@hwtype{#1}}

\newcommand\@hwnumber{}
\newcommand\hwnumber[1]{\renewcommand\@hwnumber{#1}}

%%%%%%%%%%%%%%%% requires package xparse %%%%%%%%%%%%%%%%
% \usepackage{xparse} % define differential operator commands
% \DeclareDocumentCommand{\d}{m O{} O{}}{\frac{d^{#3} #2}{d #1^{#3}}} % differential operator
% \DeclareDocumentCommand{\p}{m O{} O{}}{\frac{\partial^{#3} #2}{\partial #1^{#3}}} % partial operator

%%% theorem environments %%%

\newtheoremstyle{plain}
{\topsep}   % ABOVESPACE
{\topsep}   % BELOWSPACE
{\slshape}  % BODYFONT
{0pt}       % INDENT (empty value is the same as 0pt)
{\scshape} % HEADFONT
{.}         % HEADPUNCT
{5pt plus 1pt minus 1pt} % HEADSPACE
{\thmname{#1}\thmnumber{ \scshape#2}\thmnote{ \scshape(#3)}} % CUSTOM-HEAD-SPEC
\newtheoremstyle{remark}
{0.5\topsep}   % ABOVESPACE
{0.5\topsep}   % BELOWSPACE
{\normalfont}  % BODYFONT
{0pt}       % INDENT (empty value is the same as 0pt)
{\itshape} % HEADFONT
{.}         % HEADPUNCT
{5pt plus 1pt minus 1pt} % HEADSPACE
{\thmname{#1}\thmnumber{ \itshape#2}\thmnote{ \itshape(#3)}} % CUSTOM-HEAD-SPEC
\newtheoremstyle{example} % NAME: name of the style to be used
{0.5\topsep}   % ABOVESPACE: measure of space to leave above theorem, e.g.: 3pt
{0.5\topsep}   % BELOWSPACE: measure of space to leave below theorem, e.g.: 3pt
{\normalfont}  % BODYFONT: name of font to use in theorem body
{0pt}       % INDENT: measure of space to indent
{\scshape} % HEADFONT: name of header font
{.}         % HEADPUNCT: punctuation between head and body
{5pt plus 1pt minus 1pt} % HEADSPACE: space after theorem head; " " = normal interword space
{\thmname{#1}\thmnumber{ \scshape#2}\thmnote{ \scshape(#3)}} % CUSTOM-HEAD-SPEC

\theoremstyle{plain}
	\newtheorem{theorem}{Theorem}[section]
	\newtheorem{definition}[theorem]{Definition}
	\newtheorem{proposition}[theorem]{Proposition}
	\newtheorem{lemma}[theorem]{Lemma}
	\newtheorem{corollary}[theorem]{Corollary}
    \newtheorem*{theorem*}{Theorem}
    \newtheorem*{definition*}{Definition}
    \newtheorem*{proposition*}{Proposition}
    \newtheorem*{lemma*}{Lemma}
    \newtheorem*{corollary*}{Corollary}
\theoremstyle{remark}
	\newtheorem{remark}[theorem]{Remark}
	\newtheorem*{remarks*}{Remarks}
\theoremstyle{example}
	\newtheorem{example}[theorem]{Example}
	\newtheorem*{example*}{Example}
	\newtheorem*{examples*}{Examples}
%%%%%%%%%%%%%%%% theorem styles defined after this point will have a \blacklozenge at the end %%%%%%%%%%%%%%%%
\makeatletter
   \def\@endtheorem{\hfill\pushQED{$\blacklozenge$}\popQED\endtrivlist\@endpefalse }
\makeatother

\numberwithin{figure}{section}
\numberwithin{equation}{section}
\setlist{noitemsep}

%%% fancyhdr settings

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\footrulewidth}{0.4pt}
\fancyhead[R]{\scshape \@author}
\fancyhead[C]{\scshape \@hwtype\ \@hwnumber}
\fancyhead[L]{\scshape \@course}
\fancyfoot[C]{\thepage\ of \pageref*{LastPage}}