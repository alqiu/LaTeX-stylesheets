\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aq-cv}[2019/10/01 CV Template]

\LoadClassWithOptions{article}

\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{geometry}
\usepackage{lastpage}
\usepackage{titlesec}
\usepackage{fancyhdr}
\usepackage[hidelinks]{hyperref}
\usepackage[dvipsnames, hyperref]{xcolor}
% Currently unused packages; include/exclude as required.
%\usepackage{enumitem}
%\usepackage{setspace}
%\usepackage{layout}
%\usepackage{bm} % bold math font
%\usepackage{lipsum}
%\usepackage{graphicx}
%\usepackage{amsmath}
%\usepackage{amssymb}

\newlength{\margindistance}
\newlength{\sectiondistance}
\newlength{\sectionwidth}
\newlength{\leftdistance}

\newcommand\firstname{Arthur Lei}
\newcommand\surname{Qiu}
\newcommand\fullname{\firstname\ \surname}
\newcommand\email{arthur.qiu@mail.utoronto.ca}
\newcommand\website{http://uoft.me/alq}
\newcommand\websitesuppresshttp{uoft.me/alq}
\newcommand\tel{+1 (778) 233-1021}
\newcommand\telurl{+1-778-233-1021} % no spaces or parantheses

\setlength\margindistance{2in} % distance from left side of page to end of section header
\setlength\sectiondistance{2em} % distance between section header and text body
\setlength\sectionwidth{1.15in} % width of section title box
\setlength\leftdistance{\dimexpr\margindistance+\sectiondistance}

\hypersetup{pdfstartview={XYZ null null 1.00},
	pdftitle={\surname, \firstname\ - Resume},
	pdfauthor={\fullname},
	pdfsubject={Resume},
	pdfcreator={\LaTeX},
	colorlinks=true,
	urlcolor=MidnightBlue,
	linkcolor=black
}
\geometry{top=\dimexpr1in+29.49452pt-15.89452pt,
	bottom=1in,
	right=1in,
	left=\leftdistance,
	headheight=29.49452pt,
	headsep=11pt,
	footskip=25pt,
	heightrounded
} %footskip=14pt, headsep=0pt
\pagestyle{fancy}
\titleformat{\section}[leftmargin]{\scshape}{}{0pt}{}
\titlespacing*{\section}{\sectionwidth}{2ex plus .1ex minus .1ex}{\dimexpr\sectiondistance-\sectionwidth+1in}

% Length to control the \fancyheadoffset and the calculation of \headline
% simultaneously
\newlength{\FHoffset}
\setlength\FHoffset{0cm}

\addtolength\headwidth{2\FHoffset}

\fancyheadoffset{\FHoffset}
\fancyfootoffset{\FHoffset}

% these lengths will control the headrule trimming to the left and right 
\newlength{\FHleft}
\newlength{\FHright}

% here the trimmings are controlled by the user
\setlength\FHleft{\dimexpr-\margindistance+1in-\sectiondistance}
\setlength\FHright{0in}

% The new definition of headrule that will take into account the trimming(s)
\newbox{\FHline}
\setbox\FHline=\hbox{\hsize=\paperwidth%
	\hspace*{\FHleft}%
	\rule{\dimexpr\headwidth-\FHleft-\FHright\relax}{\headrulewidth}\hspace*{\FHright}%
}

\renewcommand\headrule{\vskip-.7\baselineskip\copy\FHline}
\renewcommand\footrule{\vskip-.7\baselineskip\copy\FHline}

\fancypagestyle{firstpage}{
	\fancyhf{}
	\fancyhead[C]{\hspace*{\FHleft}{\LARGE{\textbf{\fullname}}} \\
		\hspace*{\FHleft}\href{mailto:\email}{\email}
		$\cdot$ \href{\website}{\websitesuppresshttp}
		% $\cdot$ \href{tel:\telurl}{\tel}
	}
	\fancyfoot[C]{\hspace*{\FHleft}\thepage~of \pageref{LastPage}}
}

\fancypagestyle{otherpages}{
	\fancyhf{}
	\fancyhead[L]{\hspace*{\FHleft}\href{mailto:\email}{\email}}
	\fancyhead[C]{\hspace*{\FHleft}\textbf{\fullname}}
	\fancyhead[R]{\href{\website}{\websitesuppresshttp}}
	\fancyfoot[C]{\hspace*{\FHleft}\thepage~of \pageref{LastPage}}
}

\pagestyle{firstpage}
\makeatletter
\let\ps@plain\ps@fancy % plain style = fancy style
\makeatother