\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aq-cv}[2019/11/17 CV Template]

\LoadClassWithOptions{article}

\RequirePackage[T1]{fontenc}    % fixes special characters in output pdf
\RequirePackage[utf8]{inputenc} % allows inputting special characters in source
\RequirePackage{lmodern}        % prevents bitmapping with fontenc
\RequirePackage{geometry}
\RequirePackage{lastpage}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage[dvipsnames, hyperref]{xcolor}
% Currently unused packages; include/exclude as required.
% \RequirePackage{setspace}
% \RequirePackage{layout}
% \RequirePackage{bm}
% \RequirePackage{lipsum}
% \RequirePackage{graphicx}
% \RequirePackage{amsmath}
% \RequirePackage{amssymb}

% ----------------- user information

\newcommand\@firstname{}
\newcommand\firstname[1]{\renewcommand\@firstname{#1}}

\newcommand\@surname{}
\newcommand\surname[1]{\renewcommand\@surname{#1}}

\newcommand\fullname{\@firstname\ \@surname}

\newcommand\@email{}
\newcommand\email[1]{\renewcommand\@email{#1}}

\newcommand\@website{}
\newcommand\website[1]{\renewcommand\@website{#1}}

\newcommand\@displayurl{}
\newcommand\displayurl[1]{\renewcommand\@displayurl{#1}}

% \newcommand\@tel{}
% \newcommand\tel[1]{\renewcommand\@tel{#1}}

% \newcommand\@telurl{}
% \newcommand\telurl[1]{\renewcommand\@telurl{#1}}

% ----------------- set up page geometry

\renewcommand{\footrulewidth}{\headrulewidth} % footrule width = headrule width

\newlength{\margindistance}\setlength\margindistance{2in} % distance from left edge of page to right edge of section header, default 2in
\newlength{\sectiondistance}\setlength\sectiondistance{2em} % distance from right edge of section header to left edge of text body, default 2em
\newlength{\sectionwidth}\setlength\sectionwidth{1.15in} % width of section title box, default 1.15in
\newlength{\leftdistance}\setlength\leftdistance{\dimexpr\margindistance+\sectiondistance}
\newlength{\ruledistance}\setlength\ruledistance{0.5\baselineskip} % distance between top [bottom] of text area and bottom [top] of header [footer]

\geometry{%
	top=1in,
	bottom=1in,
	right=1in,
	left=\leftdistance,
	headsep=\dimexpr\ruledistance+\headrulewidth,  % vertical distance from bottom of header to top of text
	footskip=\dimexpr\ruledistance+\footrulewidth+\baselineskip, % vertical distance between the bottom of the text area and the bottom of the area reserved for footers
	headheight=\dimexpr1in-\headsep,
	heightrounded,
	showframe=false
}

% ----------------- set up page formatting

% title formatting
\titleformat{\section}[leftmargin]{\scshape\raggedright}{\Roman{section}.}{0.5em}{}
\titlespacing*{\section}{\sectionwidth}{2ex plus .1ex minus .1ex}{\dimexpr\sectiondistance-\sectionwidth+1in}

% fancyhdr settings
\fancypagestyle{firstpage}{
	\fancyhf{}
	\fancyhead[C]{%
		\hspace*{\FHleft}%
		{\LARGE{\textbf{\fullname}}} \\
		\hspace*{\FHleft}%
		\href{mailto:\@email}{\@email} $\cdot$ \href{\@website}{\@displayurl} % $\cdot$ \href{tel:\@telurl}{\@tel}
	}
	\fancyfoot[C]{%
		\hspace*{\FHleft}%
		\thepage{} of \pageref*{LastPage}
	}
	\fancyfoot[L]{%
		\hspace*{\FHleft}%
		{\scriptsize\textcolor{lightgray}{Last updated: \today}}
	}
}

\fancypagestyle{otherpages}{
	\fancyhf{}
	\fancyhead[L]{%
		\hspace*{\FHleft}%
		\href{mailto:\@email}{\@email}%
	}
	\fancyhead[C]{%
		\hspace*{\FHleft}%
		\textbf{\fullname}%
	}
	\fancyhead[R]{%
		\href{\@website}{\@displayurl}%
	}
	\fancyfoot[C]{%
		\hspace*{\FHleft}%
		\thepage{} of \pageref*{LastPage}%
	}
}

\pagestyle{otherpages}

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
\setlength\FHleft{\dimexpr1in-\margindistance-\sectiondistance}
\setlength\FHright{0in}

% The new definition of headrule that will take into account the trimming(s)
\newbox{\FHline}
\setbox\FHline=\hbox{\hsize=\paperwidth%
	\hspace*{\FHleft}%
	\rule{\dimexpr\headwidth-\FHleft-\FHright\relax}{\headrulewidth}\hspace*{\FHright}%
}

\renewcommand\headrule{\vskip-.7\baselineskip\copy\FHline}
\renewcommand\footrule{\vskip-.7\baselineskip\copy\FHline}

% ----------------- other stuff

\hypersetup{% settings that have to be processed before begin document hook
	pdfstartview={XYZ null null 1.00},
	colorlinks=true,
	urlcolor=MidnightBlue,  % external links
	linkcolor=black         % internal links
}

\AtBeginDocument{% settings that have to be processed after user has input personal information
	\hypersetup{% create PDF metadata
		pdftitle={\@surname, \@firstname\ - Resume},
		pdfauthor={\fullname},
		pdfsubject={Resume},
		pdfcreator={\LaTeX},
	}
	\thispagestyle{firstpage}
} 