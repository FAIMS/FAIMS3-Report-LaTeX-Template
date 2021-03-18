%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FAIMS3 Report
% LaTeX Class
% Version 1.0 (March 12, 2021)
%
% This template was created by:
% Brian Ballsun-Stanton and
% Vel (enquiries@latextypesetting.com)
%
% This program can be redistributed and/or modified under the terms
% of the LaTeX Project Public License Distributed from CTAN archives
% in directory macros/latex/base/lppl.txt.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{faims3_report}[2021/03/12 FAIMS Report Class v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass[11pt]{report} % Load the base class

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\RequirePackage{listings} % Required for including code fragments

\usepackage{graphicx} % Required for including images
\graphicspath{{Images/}{./}} % Specifies where to look for included images (trailing slash required)

\setlength{\parindent}{0em} % Stop paragraph indentation
\setlength{\parskip}{1em} % Vertical whitespace between paragraphs

\RequirePackage{setspace} % Required for changing line spacing
\linespread{1.25} % Increase line spacing slightly

\RequirePackage[some]{background} % Required for including a background image
\backgroundsetup{ % First page background image setup
	firstpage = true,
	scale = 1,
	angle = 0,
	opacity = 1,
	contents = {\includegraphics[width=\paperwidth, height=\paperheight, keepaspectratio]{page1-template.pdf}} % Background image file
}

\RequirePackage{datetime} % Required for changing how dates are output
\newdateformat{ddmonyyyy}{\THEDAY{}  \monthname{} \THEYEAR{}} % Define style for dates
\ddmonyyyy % Use the date style defined above as the default

\usepackage{etoolbox} % Required for conditional logic and easy manipulation of existing commands
\patchcmd{\chapter}{plain}{fancy}{}{} % Make pages created using the \chapter command use the custom headers and footers

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\usepackage[
	a4paper, % Paper size
	top=3.75cm, % Top margin
	bottom=2.75cm, % Bottom margin
	left=2cm, % Left margin
	right=2cm, % Right margin
	footskip=1cm, % Space from the bottom margin to the baseline of the footer
	headsep=0.75cm, % Space from the top margin to the baseline of the header
	headheight=2.5cm, % Height of the header
	%showframe % Uncomment to show the frames around the margins for debugging purposes
]{geometry}

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

\RequirePackage{fancyhdr} % Required for customising headers and footers

\fancyhead{} % Clear default headers
\fancyfoot{} % Clear default footers

\renewcommand{\headrulewidth}{0pt} % Remove default top horizontal rule

\fancyhead[R]{\includegraphics[width=4cm, keepaspectratio]{Faims-large.png}\hspace{-1.25cm}} % Right header

\fancyfoot[R]{\color{faimsblue}\footnotesize\thepage} % Right footer
\fancyfoot[L]{\color{faimsblue}\footnotesize Macquarie University \textbf{CC-BY}} % Left footer

\pagestyle{fancy} % Enable the custom headers and footers

%----------------------------------------------------------------------------------------
%	SECTIONS
%----------------------------------------------------------------------------------------

\usepackage{titlesec} % Required for modifying sections

\titleformat
	{\chapter} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\huge\color{faimsblue}} % Format of the whole section
	{\thechapter} % Format of the section label
	{8pt} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

\titlespacing*{\chapter}{0pt}{-3\baselineskip}{0pt} % Spacing around section titles, the order is: left, before and after

%------------------------------------------------

\titleformat
	{\section} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\Large\color{faimsblue}} % Format of the whole section
	{\thesection} % Format of the section label
	{5pt} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

\titlespacing*{\section}{0pt}{0.5\baselineskip}{0pt} % Spacing around section titles, the order is: left, before and after

%------------------------------------------------

\titleformat
	{\subsection} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\large\color{faimsblue}} % Format of the whole section
	{\thesubsection} % Format of the section label
	{5pt} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0pt} % Spacing around section titles, the order is: left, before and after

%------------------------------------------------

\titleformat
	{\subsubsection} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\color{faimsblue}} % Format of the whole section
	{\thesubsubsection} % Format of the section label
	{5pt} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

\titlespacing*{\subsubsection}{0pt}{0.5\baselineskip}{0pt} % Spacing around section titles, the order is: left, before and after

%----------------------------------------------------------------------------------------
%	TABLE OF CONTENTS
%----------------------------------------------------------------------------------------

\usepackage{titletoc} % Required for manipulating the table of contents

\titlecontents{chapter} % Section type being modified
	[0pt] % Left indentation
	{\vspace{8pt}} % Before code
	{\thecontentslabel\quad} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{\hfill\contentspage} % Formatting of the filler to the right of the heading
	[] % After code

%------------------------------------------------

\titlecontents{section} % Section type being modified
	[0.65cm] % Left indentation
	{} % Before code
	{\thecontentslabel\quad} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{\titlerule*[8pt]{.}\contentspage} % Formatting of the filler to the right of the heading
	[] % After code

%------------------------------------------------

\titlecontents{subsection} % Section type being modified
	[1.6cm] % Left indentation
	{} % Before code
	{\thecontentslabel\quad} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{\titlerule*[8pt]{.}\contentspage} % Formatting of the filler to the right of the heading
	[] % After code

%------------------------------------------------

\newcommand{\outputtoc}{ % Command to output the table of contents with correct styling
	\begingroup
		\setlength{\parskip}{2pt} % Reduce space between entries in the ToC
		\tableofcontents % Automatically populated from the various section commands
	\endgroup
}

%----------------------------------------------------------------------------------------
%	BIBLIOGRAPHY
%----------------------------------------------------------------------------------------

\RequirePackage[
	authordate,
	backend=biber, % Use biber to compile the bibliography
	hyperref=true
]{biblatex-chicago} % Bibliography style

%----------------------------------------------------------------------------------------
%	LINKS
%----------------------------------------------------------------------------------------

\RequirePackage{hyperref} % Required for links

\hypersetup{
	colorlinks=true, % Whether to colour links
	linkcolor=blue, % Colour for \nameref links
	filecolor=blue, % Colour of file links
	urlcolor=blue, % Colour for \url and \href links
	citecolor=black % Colour of reference citations
}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage{fontspec} % Required for specifying custom fonts

\defaultfontfeatures{Ligatures=TeX} % To support LaTeX ligatures (e.g. `` and --)
\defaultfontfeatures{Path=Fonts/} % Specify the location of font files

\setmainfont{OpenSans}[ % Default to Open Sans Light
	UprightFont=*-Light.ttf,
	BoldFont=*-Semibold.ttf,
	ItalicFont=*-LightItalic.ttf,
	BoldItalicFont=*-SemiboldItalic.ttf
]

\newfontfamily\OpenSans{OpenSans}[ % Optional Open Sans (Regular) to be used with \OpenSans
	UprightFont=*-Regular,
	BoldFont=*-Bold,
	ItalicFont=*-Italic,
	BoldItalicFont=*-BoldItalic
]

\newfontfamily\OpenSansCondensed{OpenSans}[ % Optional Open Sans Condensed to be used with \OpenSansCondensed
	UprightFont=*-CondensedLight,
	BoldFont=*-CondensedBold,
	ItalicFont=*-CondensedLightItalic
]

\NewDocumentCommand{\allcaps}{m}{\addfontfeatures{LetterSpace=1.5}\MakeUppercase{#1}} % Command to output upper case letters with increased letter spacing (kerning)

\RequirePackage{microtype} % Required for improving typography

%----------------------------------------------------------------------------------------
%	LISTS
%----------------------------------------------------------------------------------------

\RequirePackage{enumitem} % Required for list customisation

\setlist[itemize]{
	noitemsep, % No spacing between items
	topsep=0mm, % Spacing above the list
	labelindent=3mm, % Blank space before the label
	leftmargin=*, % No margin to the left of the list
	widest=3., % Overrides default values for the label width
	align=right % Label alignment
}

\setlist[enumerate]{
	noitemsep, % No spacing between items
	topsep=0mm, % Spacing above the list
	labelindent=3mm, % Blank space before the label
	leftmargin=*, % No margin to the left of the list
	widest=3., % Overrides default values for the label width
	align=right % Label alignment
}

%----------------------------------------------------------------------------------------
%	COLOURS
%----------------------------------------------------------------------------------------

\RequirePackage{xcolor} % Required for specifying custom colours

\definecolor{faimsblue}{RGB}{27,62,147}
\definecolor{faimsorange}{RGB}{246,142,30}

%----------------------------------------------------------------------------------------
%	TITLE PAGE
%----------------------------------------------------------------------------------------

\renewcommand{\maketitle}{
	\BgThispage % Only display the background image on the title page
	\thispagestyle{empty} % No headers or footers on title page
	
	\vspace*{1cm}
	
	\parbox{.6\textwidth}{ % Wrap the title so it does not overlap with the right side of the background image
		\begin{flushleft} % No justification
			\setstretch{1} % Line spacing
			\OpenSans % Open Sans font
			\fontsize{30pt}{36pt}\selectfont % Font size
			\bfseries % Bold
			\textcolor{faimsblue}{\allcaps{\reporttitle}} % Report title and styling
		\end{flushleft}
	}
	
	\vspace{-5mm}
	
	\parbox{.7\textwidth}{ % Wrap the report subtitle so it does not overlap with the logos on the right side of the background image
		\setstretch{1} % Line spacing
		\begin{flushleft} % No justification
			\fontsize{18pt}{21pt}\selectfont % Font size
			\textcolor{faimsblue}{\allcaps{\reportsubtitle}} % Report subtitle and styling
		\end{flushleft}
	}
	
	\vspace{2cm}
	
	\parbox{.7\textwidth}{ % Wrap the report information so it does not overlap with the logos on the right side of the background image
		\renewcommand{\arraystretch}{1.5} % Table row heights
		
		\begin{tabular}{@{}l p{.6\textwidth}}
			\textcolor{faimsblue}{For} & \reportfor \\
			\textcolor{faimsblue}{License} & \reportlicense \\
			\textcolor{faimsblue}{Contact} & \reportcontact \\
			\textcolor{faimsblue}{Version} & \reportversion \\
			\textcolor{faimsblue}{DOI} & \reportdoi \\
			\textcolor{faimsblue}{Authors} & \reportauthors \\
		\end{tabular}
	}
	
	\vfill
	
	\begingroup
		\fontsize{16pt}{19pt}\selectfont % Font size
		\textcolor{faimsblue}{\reportdate} % Report date
	\endgroup
}

%----------------------------------------------------------------------------------------
%	COPYRIGHT NOTICE
%----------------------------------------------------------------------------------------

\newcommand{\copyrightnotice}{
	\begingroup
		\footnotesize
		This document is licensed under Creative Commons 4.0 International - With Attribution \\
		Copyright 2021 Macquarie University.\\
		This document was typeset with \LaTeX{}.\\\\
		Macquarie University NSW 2109 \\ Australia \\
		E: info@faims.edu.au \\
		W: faims.edu.au \\ 
		ABN 90 952 801 237 \\
		CRICOS Provider 00002J
	\endgroup
}

%----------------------------------------------------------------------------------------
%	CUSTOM COMMANDS
%----------------------------------------------------------------------------------------

\newcommand{\reporttitle}[1]{\renewcommand{\reporttitle}{#1}}
\newcommand{\reportsubtitle}[1]{\renewcommand{\reportsubtitle}{#1}}
\newcommand{\reportdate}[1]{\renewcommand{\reportdate}{#1}}
\newcommand{\reportfor}[1]{\renewcommand{\reportfor}{#1}}
\newcommand{\reportlicense}[1]{\renewcommand{\reportlicense}{#1}}
\newcommand{\reportcontact}[1]{\renewcommand{\reportcontact}{#1}}
\newcommand{\reportversion}[1]{\renewcommand{\reportversion}{#1}}
\newcommand{\reportdoi}[1]{\renewcommand{\reportdoi}{#1}}
\newcommand{\reportauthors}[1]{\renewcommand{\reportauthors}{#1}}

%\newcommand{\command}[1]{\renewcommand{\command}{#1}}
