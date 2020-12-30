% !TeX encoding = UTF-8
% !TeX spellcheck = en_US
% !TeX root = ../Thesis.tex
%BEGIN_FOLD%BEGIN_FOLD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class:Thesis																   	%		
% Version: 1.3	                                          					   	%
% Author: Thomas Weigner														%
% Email: weigner.thomas@gmail.com		                           			   	%
% Date: 21.09.2018															   	%
% License: This document is open source under the Beer licene.					%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%* --------------------------------------------------------------------------------	*
%* "THE BEER-WARE LICENSE" (Revision 42):											*
%* <weigner.thomas@gmail.com> wrote this file. As long as you retain this notice	*
%* you can do whatever you want with this stuff. If we meet some day, and you think	*
%* this stuff is worth it, you can buy me a beer in return.   Thomas Weigner		*
%* --------------------------------------------------------------------------------	*
%END_FOLD%END_FOLD

% ****************************************************************************** 
% ************************** Class Identification ******************************
% ******************************************************************************
%BEGIN_FOLD%BEGIN_FOLD
\newcommand\fileversion{1.2}
\newcommand\filedate{\today}
\NeedsTeXFormat{LaTeX2e}
%\ProvidesClass{.//Thesis}[A Latex class based on "scrbook" optimized for scientific theses at TU Wien by Thomas Weigner version \fileversion]
%TODO causes error
% Based on a class by Krishna Kumar https://github.com/kks32/-thesis-template/ v2.3.1

%---base class
\newcommand{\baseClass}{scrbook}

%---KOMA-Script manual for for scrbook class
%http://mirror.kumi.systems/ctan/macros/latex/contrib/koma-script/doc/scrguien.pdf#[0,{%22name%22:%22Fit%22}

%---KOMA-Script reference sheet
%http://mirror.kumi.systems/ctan/info/latex-refsheet/LaTeX_RefSheet.pdf
%END_FOLD%END_FOLD

% ******************************************************************************
% ************************** Class Options Manual ******************************
% ****************************************************************************** 
%BEGIN_FOLD%BEGIN_FOLD
% ***************************** General settings *******************************
% `a4paper` or `a5paper`
%
% `11pt`, `12pt`(default) or `10pt` however Font Size 10pt is NOT recommended
%
% `print`: Use `print' for print version with appropriate margins and page
% layout. Leaving the options field blank will activate Online version.
%
% `signed`: Use `signed' to add section on titlepage to be signed by the superviser.
% Works only with the print option!
%
% `declaration`: adds a page with an declaration after the titlepage, to be signed by the author
% Works only with the print option!
%
% `final`: option some packages might need for the finalized document
%
% `place`: insert place and date on the title page
%
% `index`: For index at the end of the thesis
%
% `abstract`: To generate only the title page and abstract page with
% dissertation title and name for submission somewhere
%
% `chapter`: This option enables only the specified chapter and its references
%  Useful for review and corrections.
%
% `titlepage2`: This option loads the alternative titlepage titlepage_alternative instead of titlepage.
% This intended to have two designs available and quickly switch between them.
%
% **************************** Draftmode settings ******************************
% `draftclassic`: For draft mode without loading any images (same as draft in scrbook) and notes
%
% `draft`: Special draft mode with line numbers, images, and water mark
% with timestamp and custom text. Position of the text can also be modified.
%
% `nolinenumbers`: disable line numbers in draft mode
% !!!When toggled auxiliary files must be deleted.
%
% `todonotesoff`: manualy disable todonotes (has to be loaded after draft options)
% Add notes with follwing commands in the draft mode:
% \mynote{text}							% green	note on the side pointing to the location in the text
% \sidenote{text}						% blue 	note on the side
% \needref{text}						% blue 	note on the side pointing to the location in the text
% \urgentnote{text}						% red 	note on the side pointing to the location in the text
% \inlinenote{text}						% orange inline note
% \missingfigure[figwidth=length]{text}	% dummy picture
% In the index section a list of todonotes is printed.
% !!!You must not use underscore in the \missingfigure argument.
% !!!Line numbers and todo notes are not really compatible.
% TODO bugreport
%
% 'bibdebug`: debug mode for BibLaTeX
%
% ************************* Custom Page Margins ********************************
% `custommargin`: Use `custommargin` in options to activate custom page margins,
% which can be defined in the preamble.tex. Custom margin will override
% print/online margin setup.
%
% *********************** Choosing the Fonts in Class Options ******************
% `times`: Times font with math support
%
% `fourier`: Utopia Font with Fourier Math font (Font has to be installed)
%            It's a free font.
%
% `customfont`: Use `customfont' option in the document class and load the
% package in the preamble.tex
%
% default or leave empty: `Latin Modern' font will be loaded.
%
% *************************** Bibliography settings ****************************
% `biblatex`: use the package BibLaTex instead of natbib packages
%
% `bibsections`: list references by parts/chapters/sections (settings in header)
%
% `bibtex`: use BibTeX as backend for BibLaTeX to sort references from .bib file (by default Biber is used)
%
% `bibtex8`: use BibTeX8 (UTF-8 support) as backend for BibLaTeX to sort references from .bib file (by default Biber is used)
%
% ********************** Choosing the Bibliography style ***********************
% `authoryear`: For author-year citation eg., Krishna (2013)
%
% `numbered`: (Default Option) For numbered and sorted citation e.g., [1,5,2]
%
% `custombib`: Define your own bibliography style in the `preamble.tex' file.
%              `\RequirePackage[square, sort, numbers, authoryear]{natbib}'.
%              This can be also used to load biblatex instead of natbib
%END_FOLD%END_FOLD

% ******************************************************************************
% **************************** Class Definition ********************************
% ******************************************************************************
%BEGIN_FOLD
%TODO what for %\PassOptionsToClass{usegeometry}{\baseClass}	% use geometry package along KOMA script
% ********************** Define a Print/Online Version *************************
%BEGIN_FOLD
\newif\if@print\@printfalse
\DeclareOption{print}{\@printtrue}

\newif\if@oneside\@onesidefalse
\ProcessOptions\relax
\if@print
	\PassOptionsToClass{twoside}{\baseClass}	% twosided hardcopy
%	\PassOptionsToClass{right}{\baseClass}		% start chapters and such on a right side
%TODO why is option right not needed?
\else
	\PassOptionsToClass{openany}{\baseClass}	% start chapter on any page (no useless empty pages in online version)
	\PassOptionsToClass{oneside}{\baseClass}	% onesided online PDF
\fi
%END_FOLD

% ****************************** Define index **********************************
%BEGIN_FOLD
\newif\if@index\@indexfalse
\DeclareOption{index}{\@indextrue}
%END_FOLD

% ******************************* Font Option **********************************
%BEGIN_FOLD
\newif\ifsetFont\setFontfalse                 % Font is not set

\newif\if@times\@timesfalse             % Times with Math Support
\DeclareOption{times}{
	\ifsetFont
		\ClassWarning{Thesis}{Font selection conflict: A font package was
			already specified. Please check the document class options in case you 
			have defined two fonts.}
	\else
		\@timestrue
		\setFonttrue
	\fi
}

\newif\if@fourier\@fourierfalse         % Fourier with Math Support
\DeclareOption{fourier}{
	\ifsetFont
		\ClassWarning{Thesis}{Font selection conflict: A font package was
			already specified. Please check the document class options in case you 
			have defined two fonts.}
	\else
		\@fouriertrue
		\setFonttrue
	\fi
}

\newif\ifsetCustomFont\setCustomFontfalse     % Custom Font with Math Support
\DeclareOption{customfont}{
	\ifsetFont
		\ClassWarning{Thesis}{Font selection conflict: A font package was
			already specified. Please check the document class options in case you 
			have defined two fonts.}
	\else
		\setCustomFonttrue
		\setFonttrue
	\fi
}
%END_FOLD

% ****************************** Bibliography **********************************
%BEGIN_FOLD
%---bibliograhpy related flags
\newif\ifsetBib\setBibfalse             % Custom Bibliography = true/false
\newif\ifsetBibLaTeX\setBibLaTeXfalse   % true => BiBLaTeX is used
\newif\ifsetNatBib\setNatBibfalse		% true => natbib is used

%---BibLaTeX setup
\newif\if@biblatex\@biblatexfalse       % use BibLaTeX package
\DeclareOption{biblatex}{
	\@biblatextrue
}

\newif\if@BibTeX\@BibTeXfalse      		% BibTeX as backend program for BibLaTeX to sort references from .bib file
\DeclareOption{bibtex}{
	\@BibTeXtrue
}

\newif\if@BibTeXEight\@BibTeXEightfalse	% BibTeX8 (UTF-8 support) as backend program for BibLaTeX to sort references from .bib file
\DeclareOption{bibtex8}{
	\@BibTeXEighttrue
}

\newif\ifBibSections\BibSectionsfalse   % list references chapter wise
\DeclareOption{bibsections}{
	\if@biblatex
	\BibSectionstrue
	\else
	\ClassWarning{Thesis}{Option bibsections: Chapter wise Bibliography works only if BibLaTeX is used.}
	\fi
}

%---reference styles
\newif\if@authoryear\@authoryearfalse   % Author-Year citation
\DeclareOption{authoryear}{
	\ifsetBib
		\ClassWarning{Thesis}{Bibliography selection conflict: A
			bibliography style already specified. Please check the document class
			options in case you have defined two bibliography styles.}
	\else
		\@authoryeartrue
		\setBibtrue
	\fi
}

\newif\if@numbered\@numberedfalse       % Numbered citiation
\DeclareOption{numbered}{
	\ifsetBib
		\ClassWarning{Thesis}{Bibliography selection conflict: A
			bibliography style already specified. Please check the document class
			options in case you have defined two bibliography styles.}
	\else
		\@numberedtrue
		\setBibtrue
	\fi
}

\newif\ifuseCustomBib\useCustomBibfalse	% Custom Bibliography
\DeclareOption{custombib}{
	\ifsetBib
		\ClassWarning{Thesis}{Bibliography selection conflict: A
			bibliography style already specified. Please check the document class
			options in case you have defined two bibliography styles.}
	\else
		\useCustomBibtrue
		\setBibtrue
	\fi
}
%END_FOLD

% ***************************** Custom Margins  ********************************
%BEGIN_FOLD
\newif\ifsetCustomMargin\setCustomMarginfalse	% set custom margin
\DeclareOption{custommargin}{\setCustomMargintrue}
%END_FOLD

% ************************* Alterntive Titlepage  ******************************
%BEGIN_FOLD
\newif \ifalternativeTitlepage \alternativeTitlepagefalse	% load alternative titlepage design
\DeclareOption{titlepage2}{\alternativeTitlepagetrue}
%END_FOLD

% ******************* Abstract Mode - to print only abstract *******************
%BEGIN_FOLD
\newif\ifabstractMode \abstractModefalse % enable abstract mode
\DeclareOption{abstract}{
	\abstractModetrue
	\ClassWarning{Thesis}{Abstract consisting of title page and an abstract with title and author name!}
	\PassOptionsToClass{oneside}{\baseClass}
}
%END_FOLD

% ************** Chapter Mode - to print only selected chapters ****************
%BEGIN_FOLD
\newif \ifchapterMode \chapterModefalse % enable chapter mode
\DeclareOption{chapter}{
	\chapterModetrue
	\ClassWarning{Thesis}{Chapter mode: compile only the chapter set with includedonly.}
}
%END_FOLD

% ****************************** Draft Options *********************************
%BEGIN_FOLD
%---flags for header
\newif \ifdefineDraft \defineDraftfalse 
\newif \ifenabledTodonotes \enabledTodonotesfalse

%---classic draft mode
\newif\ifBOOL@setDraft \BOOL@setDraftfalse
\newif\ifBOOL@setDraftClassic \BOOL@setDraftClassicfalse
\newif\ifBOOL@missingfigures \BOOL@missingfiguresfalse

\DeclareOption{draftclassic}{\PassOptionsToClass{draft}{\baseClass}
	\BOOL@setDraftClassictrue
	\BOOL@missingfigurestrue
	\enabledTodonotestrue
	\ClassWarning{Thesis}{Draft mode is ON!}
}

%---enhanced draft mode
\DeclareOption{draft}{\PassOptionsToClass{draft}{\baseClass}
	\BOOL@setDrafttrue
	\BOOL@missingfigurestrue
	\enabledTodonotestrue
	\ClassWarning{Thesis}{Enhanced 'draft' mode is ON!. Adds watermark with timestamp,
		 line numbering, and version number; tweak options in header file.}
}

%---line numbers
\newif \ifBOOL@linenumbers \BOOL@linenumberstrue
\DeclareOption{nolinenumbers}{\BOOL@linenumbersfalse}

%---disable todonotes
\DeclareOption{todonotesoff}{
	\enabledTodonotesfalse
	\ifBOOL@setDraftClassic
		\ClassWarning{Thesis}{Todo notes are disabled.}
	\fi
	\ifBOOL@setDraft
		\ClassWarning{Thesis}{Todo notes are disabled.}
	\fi
}

%---debug bibliography and references
\newif \if@bibdebug \@bibdebugfalse
\DeclareOption{bibdebug}{
	\if@biblatex
		\@bibdebugtrue
	\else
		\ClassWarning{Thesis}{Option bibdebug: Bibliography debug mode works only if BibLaTeX is used.}
	\fi
}
%END_FOLD

% ****************************** Other Options *********************************
%BEGIN_FOLD
%---Font Size
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{\baseClass}}%
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{\baseClass}}%
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{\baseClass}}%

%---Page Size
\newcommand{\papersize}{a4paper} % Set Default as a4paper
\DeclareOption{a4paper}{\renewcommand{\papersize}{a4paper}}
\DeclareOption{a5paper}{
	\ClassWarning{Thesis}{Using A5, A4 paper is recommended}
	\renewcommand{\papersize}{a5paper}
}
\DeclareOption{letterpaper}{
	\ClassWarning{Thesis}{Using Letter, A4 paper is recommended}
	\renewcommand\papersize{letterpaper}
}
\PassOptionsToClass{\papersize}{\baseClass}%

%---signed document
\newif \ifsigned \signedfalse 
\DeclareOption{signed}{
	\if@print
		\ClassWarning{Thesis}{Version to be signed by the supervisor on title page!}
		\signedtrue
	\fi
}

%---add decleration
\newif \ifdeclaration \declarationfalse 
\DeclareOption{declaration}{
	\if@print
		\ClassWarning{Thesis}{With declaration to sign!}
		\declarationtrue
	\fi
}

%---add decleration
\newif \ifplace \placefalse 
\DeclareOption{place}{
	\ifsigned
		\ClassWarning{Thesis}{Signature with date already added; option `place` ignored!}
	\else
		\placetrue
	\fi
}

%---finalized document
\PassOptionsToClass{final}{\baseClass}

%---text justification
\newif \if@textJustify \@textJustifytrue 	% Set Justification true
\DeclareOption{flushleft}{\@textJustifyfalse}
%END_FOLD

% ***************************** Load Base Class ********************************
%BEGIN_FOLD
%---generates Warning for unknown options
\DeclareOption*{ 
%	\ClassWarning{Thesis}{'\CurrentOption' non Thesis option}
	\PassOptionsToClass{\CurrentOption}{\baseClass}
}%
%---process options and load base class
\ProcessOptions\relax%
\LoadClass{\baseClass}%
%END_FOLD
%END_FOLD

% ******************************************************************************
% ********************** Packages and process options **************************
% ******************************************************************************
%BEGIN_FOLD
% ******************************* Input codec **********************************
%BEGIN_FOLD
%TODO here or in header currently in header
%\usepackage[utf8]{inputenc}
%\usepackage[T1]{fontenc}
%END_FOLD

% ************************** Layout and Formatting *****************************
%BEGIN_FOLD
\RequirePackage[pass]{geometry}		% margins for titlepage and custom margins
\RequirePackage{setspace}			% Define line spacing in paragraph
%\RequirePackage{lscape}			% Supports Landscape Layout
%\RequirePackage{calc}				% calculate vertical spacing 
%END_FOLD

% ************************* Conditional Statements *****************************
%BEGIN_FOLD
\RequirePackage{ifthen}   % Conditional statements
\RequirePackage{ifpdf}    % Check for pdfLaTeX
\RequirePackage{ifxetex}  % XeLaTeX
%END_FOLD

% *********************** Table of Contents & Appendices ***********************
%BEGIN_FOLD
% add Bibliography, List of figures and tables to contents
%\RequirePackage{tocbibind} % incompatible with Koma script

% Add appendices
\RequirePackage[title,titletoc]{appendix}

% Hides Contents appearing from TOC, but adds it to bookmarks
\RequirePackage[hyperfootnotes=false]{hyperref}
\RequirePackage{bookmark}
% TODO switch to bookmark package?
\let\temptableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
	\temptableofcontents
	\pdfbookmark[-1]{\contentsname}{toc}
	\thispagestyle{plain}
}
%END_FOLD

% *************************** Graphics and Figures *****************************
%BEGIN_FOLD
%\RequirePackage[usenames, dvipsnames]{color}
%\RequirePackage{graphicx}
%\DeclareGraphicsExtensions{.pdf}
%TODO is it actually necessary?
%END_FOLD

% ******************************* Draft Mode ***********************************
%TODO add syntonly package?
%BEGIN_FOLD
% Initializing Draft Text
\newcommand\SetDraftText[1]{}
% Initializing Draft Version
\newcommand\SetDraftVersion[1]{}
% Initializing Draft Content
\newcommand\SetDraftWMPosition[1]{}
% Initializing Draft Gray Scale
\newcommand\SetDraftGrayScale[1]{}

% If classic draft mode
\ifBOOL@setDraftClassic

\fi

% If draft mode is active
\ifBOOL@setDraft
	\defineDrafttrue
	% Line numbering (can be switched off) with nolinenumbers
	\ifBOOL@linenumbers
		\RequirePackage[switch,pagewise,mathlines]{lineno}
		\renewcommand{\frontmatter}{%
			\cleardoublepage
			\@mainmatterfalse
			\pagenumbering{roman}
			\nolinenumbers
		}
		\renewcommand{\mainmatter}{%
			\cleardoublepage
			\@mainmattertrue
			\pagenumbering{arabic}
			\linenumbers
		}
		\renewcommand{\backmatter}{%
			\if@openright
				\cleardoublepage
			\else
				\clearpage
			\fi
			\@mainmatterfalse
			\linenumbers
		}
		
		% Fix display lineno issue in mathmode
		\newcommand*\patchAmsMathEnvironmentForLineno[1]{%
			\expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
			\expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
			\renewenvironment{#1}%
			{\linenomath\csname old#1\endcsname}%
			{\csname oldend#1\endcsname\endlinenomath}%
		}% 
		
		\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
			\patchAmsMathEnvironmentForLineno{#1}%
			\patchAmsMathEnvironmentForLineno{#1*}%
		}%
		
		\AtBeginDocument{%
			\patchBothAmsMathEnvironmentsForLineno{equation}%
			\patchBothAmsMathEnvironmentsForLineno{align}%
			\patchBothAmsMathEnvironmentsForLineno{flalign}%
			\patchBothAmsMathEnvironmentsForLineno{alignat}%
			\patchBothAmsMathEnvironmentsForLineno{gather}%
			\patchBothAmsMathEnvironmentsForLineno{multline}%
		}
	\fi % End \ifBOOL@linenumbers
	
	% Creates a Watermark Draft at the specified location.
	% The settings can be tweaked in the preamble
	% Draft text
	\newcommand\drafttext{Draft}
	\renewcommand\SetDraftText[1]{%
		\renewcommand\drafttext{#1}
	}
	
	% Draft Version
	\newcommand\draftVersion{v1.0}
	\renewcommand\SetDraftVersion[1]{%
		\renewcommand\draftVersion{#1}
	}
	
	% Draft Gray Scale
	\newcommand\draftGrayScale{0.75}
	\renewcommand\SetDraftGrayScale[1]{%
		\renewcommand\draftGrayScale{#1}
	}
	
	% Draft Content
	\newcommand{\DraftContent}{%
		\hspace*{\fill}
		\Large
		\textcolor[gray]{\draftGrayScale}{%
			{\drafttext}\space-\space{\draftVersion}\hspace{\stretch{1}}{\BOOL@daytime}
			\hspace*{\fill}
		}
	}
	
	% Adding watermark in draft mode with time stamp
	\RequirePackage{everypage}
	\RequirePackage[absolute]{textpos}
	% Default values for draft watermark
	\newcommand\draftposition{top}
	\newcommand\draftnodeanchor{1in+\voffset-\topmargin}
	\AddEverypageHook{%
		\begin{textblock*}{\paperwidth}[0.,2.5](0\paperwidth,\draftnodeanchor)
			\DraftContent
		\end{textblock*}
	}
	
	% Conditional evaluation to position the draft water mark  (top / bottom)
	\renewcommand\SetDraftWMPosition[1]{%
		\renewcommand{\draftposition}{#1}
			\ifthenelse{\equal{\draftposition}{bottom}}
				{\renewcommand\draftnodeanchor{\paperheight-\voffset}
				} % bottom
				{\ifthenelse{\equal{\draftposition}{top}}
					{\renewcommand\draftnodeanchor{1in+\voffset-\topmargin}
					} % top
					{\ClassWarning{Thesis}{Unrecognised draft position using default value of top}
					 \renewcommand\draftnodeanchor{1in+\voffset-\topmargin}
				 	} % top
			 	}
		\AddEverypageHook{%
			\begin{textblock*}{\paperwidth}[0.,2.5](0\paperwidth,\draftnodeanchor)
				\DraftContent
			\end{textblock*}
		}
	}
\else	% if NOT Draft
	\defineDraftfalse
	\renewcommand\SetDraftText[1]{\ClassWarning{Thesis}{Draft is
			inactive, to use SetDraftText include `draft' in the document 
			class options.}}
	% Draft Version
	\renewcommand\SetDraftVersion[1]{\ClassWarning{Thesis}{Draft is
			inactive, to use SetDraftVersion include `draft' in the document
			class options.}}
	% Draft Content
	\renewcommand\SetDraftWMPosition[1]{\ClassWarning{Thesis}{Draft
			is inactive, to use SetDraftWMPosition include `draft' in the document
			class options.}}
	
	\renewcommand\SetDraftGrayScale[1]{\ClassWarning{Thesis}{Draft is
			inactive, to use SetDraftWMPosition include `draft' in the document
			class options.}}
\fi	 %end if Draft
%END_FOLD

% ******************************** Todo Notes **********************************
%BEGIN_FOLD
\ifenabledTodonotes
	\RequirePackage[colorinlistoftodos, textwidth=30mm, figcolor=white, figwidth=0.8\textwidth, textsize=scriptsize]{todonotes}
	\setlength{\marginparwidth}{3cm} 	%TODO does it do something?
\else
	\ifBOOL@missingfigures
		\RequirePackage[figcolor=white]{todonotes}
		\renewcommand{\listoftodos}[1][]{}
		\renewcommand{\todo}[2][]{}
	\else
		\RequirePackage[disable]{todonotes}
	\fi
\fi
\newcommand{\mynote}[1]{\todo[line,color=green!40]{#1}}
\newcommand{\needref}[1]{\todo[size=\footnotesize,line,color=blue!30]{#1}}
%\newcommand{\needref}[1]{\todo[size=\footnotesize,line,color=blue!30]{ref #1}}
\newcommand{\urgentnote}[1]{\todo[size=\normal,line,color=red!70]{#1}}
\newcommand{\sidenote}[1]{\todo[noline,color=blue!50]{#1}}
\newcommand{\inlinenote}[1]{\todo[inline,color=orange!30]{#1}}
\newcommand{\optional}[1]{\todo[noline,color=purple!40]{#1}}
\newcommand{\correction}[1]{\todo[size=\footnotesize,color=red!40]{#1}}
\newcommand{\suggestion}[1]{\todo[size=\footnotesize,color=yellow!40]{#1}}
%END_FOLD

% ******************************* Bibliography *********************************
%BEGIN_FOLD
%---set backend program for BibLaTeX
\if@BibTeX
	\newcommand{\BibBackend}{bibtex}
\else	
	\if@BibTeXEight
		\newcommand{\BibBackend}{bibtex8}
	\else	% use Biber as default
		\newcommand{\BibBackend}{biber}
	\fi
\fi

%---check which citation style is set
\if@bibdebug
	\RequirePackage[backend=\BibBackend, style=debug, sorting=nyvt, natbib=true]{biblatex}
	\setBibLaTeXtrue
\else
	\if@authoryear
		\if@biblatex
			\RequirePackage[backend=\BibBackend, bibstyle=authoryear, citestyle=alphabetic, sorting=nyvt, natbib=true]{biblatex}
			\setBibLaTeXtrue
		\else
			\RequirePackage[round, sort, numbers, authoryear]{natbib}
			\setNatBibtrue
		\fi
	\else
		\if@numbered
			\if@biblatex
				\RequirePackage[backend=\BibBackend, bibstyle=numeric, citestyle=numeric-comp, sorting=none, natbib=true]{biblatex}
				\setBibLaTeXtrue
			\else
				\RequirePackage[numbers,compress]{natbib}
				\setNatBibtrue
			\fi
		\else
			\ifuseCustomBib
				\AtBeginDocument{
					\@ifpackageloaded{biblatex}{
						\setBibLaTeXtrue
					}{
						\@ifpackageloaded{natbib}{
							\setNatBibtrue
						}{
							\ClassWarning{Thesis}{%
								You chose custom bibliography package, but did not load biblatex or natbib. Load an appropriate bibliography package (biblatex, natbib,...) in "header.tex". Ignore this warning when you have already loaded appropriate bibliography package.}
						}
					}
				}
			\else % set default to numbered
				\if@biblatex
					\RequirePackage[backend=\BibBackend, style=numeric-comp, citestyle=numeric, sorting=none, natbib=true]{biblatex}
					\setBibLaTeXtrue
				\else
					\RequirePackage[numbers,compress]{natbib}
					\setNatBibtrue
				\fi % default
				\setBibfalse
			\fi % custombib
		\fi % numbered
	\fi % author year
\fi % draft

\ifsetNatBib
	\makeatletter\let\chapter\@undefined\makeatother	% natbib fix for todonotes list
\fi

%---warn when no style was set and default is loaded
\ifsetBib
\else		% no bibliography style was set and default is loaded
	\ClassWarning{Thesis}{No bibliography style was specified.
	Default numbered style is used. If you would like to use a 
	different style, use `authoryear' or `numbered' in the options in
	documentclass or use `custombib` and define the bibliography package 
	with required style in the custombib section of the "header.tex" file}
\fi
%END_FOLD

% ********************************** Fonts **********************************
%BEGIN_FOLD
\RequirePackage{textcomp}
\RequirePackage{iftex}
%---Font Selection
\if@times
	\setFonttrue
	\message{Thesis: Using Times Roman font}
\else
	\if@fourier
		\RequirePackage{fourier} % Fourier
		\setFonttrue
		\message{Thesis: Using Fourier font}
	\else
		\ifsetCustomFont
			\setFonttrue
			\message{Thesis: Using custom font}
		\else
			\setFontfalse
			\message{Thesis: No font is set}
		\fi % custom font
	\fi % Fourier font
\fi % Times font

%---if Font is not set throw a warning.
\ifsetFont
\else
	\ClassWarning{Thesis}{Using default font Latin Modern. If you
		would like to use other pre-defined fonts use `times' or `fourier'
		or load a custom font in the preamble.tex file by specifying `customfont' 
		in the class options}
	\RequirePackage{lmodern}
\fi

%---complier selcetion
\ifxetex% XeLaTeX
	\RequirePackage{fontspec}
	\RequirePackage[]{unicode-math}
	\setmainfont[
		Extension = .otf,
		UprightFont = *-regular,
		BoldFont = *-bold,
		ItalicFont = *-italic,
		BoldItalicFont = *-bolditalic
	]{xits}
	
	\setmathfont[ 
		Extension = .otf,
		BoldFont = *bold
	]{xits-math}
\else
	\ifluatex
		\RequirePackage{luatextra}
	\else % default PDFTeX
		% base PDFTex packages
		\RequirePackage[T1]{fontenc}
		\RequirePackage[utf8]{inputenc}
		
		% If building with PDFLaTeX, use microtype spacing adjustments
		\RequirePackage[final]{microtype}
%TODO what for?		
%		\input{glyphtounicode}
%		\pdfglyphtounicode{f_f}{FB00}
%		\pdfglyphtounicode{f_i}{FB01}
%		\pdfglyphtounicode{f_l}{FB02}
%		\pdfglyphtounicode{f_f_i}{FB03}
%		\pdfglyphtounicode{f_f_l}{FB04}
%		\pdfgentounicode=1	
	\fi
\fi	% end if XeTeX

% Don't break enumeration (etc.) across pages in an ugly manner
\clubpenalty=10000
\widowpenalty=10000
%END_FOLD

%******************************* Print / Online ********************************
%BEGIN_FOLD
% Defines a print / online version to define page-layout and hyperrefering
\if@print		% For Print version
%TODO proper setup and fix link for footnotes
	\hypersetup{
		unicode=true,
		linktoc=all,
		verbose=true,
		final=true,
		plainpages=false,
		pdfstartview=FitV,
		pdftoolbar=true,
		pdfmenubar=true,
		bookmarksopen=true,
		bookmarksnumbered=true,
		breaklinks=true,
		linktocpage=true,
		colorlinks=true,
		linkcolor=black,
		urlcolor=black,
		citecolor=black,
		anchorcolor=black
		pdfborder = {0 0 0.5},			% use a thinner (0.5pt) border around all PDF links
		allbordercolors = {0 0 0.8}		% dark blue border for all types of links
	}

	\if@twoside
		\hypersetup{pdfpagelayout=TwoPageRight}
	\else
		\hypersetup{pdfpagelayout=OneColumn}
	\fi
\else	% For PDF Online version
	\hypersetup{
		unicode=true,
		linktoc=all,
		verbose=true,
		final=true,
		plainpages=false,
		pdfstartview=FitV,
		pdftoolbar=true,
		pdfmenubar=true,
		pdfpagelayout=OneColumn,		%for online documnet only onesided
		bookmarksopen=true,
		bookmarksnumbered=true,
		breaklinks=true,
		linktocpage=true,
		colorlinks=true,
		linkcolor=blue,
		urlcolor=blue,
		citecolor=blue,
		anchorcolor=green
	}
\fi
%END_FOLD

% ******************************** URL Package *********************************
%BEGIN_FOLD
\RequirePackage{url}	% Redefining urlstyle to use smaller fontsize in References with URLs
\newcommand{\url@leostyle}{%
	\@ifundefined{selectfont}{\renewcommand{\UrlFont}{\sffamily}}
	{\renewcommand{\UrlFont}{\normalsize}}}
\urlstyle{leo}

% option to split urls over multiple lines for latex >> DVIPS >> PDF option
\ifpdf	% PDFLaTeX does it automatically.
\else	% dvips
	\RequirePackage{./Class_Packages_and_Styles/breakurl} % to split the url over multiple lines
\fi
%END_FOLD
%END_FOLD

% ******************************************************************************
% **************************** Pre-defined Settings ****************************
% ******************************************************************************
%BEGIN_FOLD
% ************************** Setting PDF Meta-Data *****************************
%BEGIN_FOLD
\ifpdf
	\AtBeginDocument{
		\hypersetup{
			pdftitle = {\title},
			pdfauthor = {\author},
			pdfsubject={\subject},
			pdfkeywords={\keywords}
		}
	}
\fi
%END_FOLD

% ****************************** Justification *********************************
%BEGIN_FOLD
\if@textJustify 	% left aligned
	\message{Thesis: Text justified! to align to the left use flushleft}
\else
	\AtBeginDocument{
		\raggedright
	}
\fi
%END_FOLD

% ************************** TOC and Hide Sections *****************************
%BEGIN_FOLD
\newcommand{\nocontentsline}[3]{}
\newcommand{\tochide}[2]{
	\bgroup\let
	\addcontentsline=\nocontentsline#1{#2}
	\egroup
}	% Removes pagenumber appearing from TOC
\addtocontents{toc}{\protect\thispagestyle{empty}}
%END_FOLD

% ******************************* Title Page ***********************************
%BEGIN_FOLD
\pagenumbering{Alph}							% change invisible page numbering to avoid warning
\ifalternativeTitlepage
	\input{./Preamble/titlepage_alternative}	% edit this file for customization of the alternative design
\else
	\input{./Preamble/titlepage_official}		% edit this file for customization of the official TU design
\fi
%END_FOLD

% *************************** Header Formatting ********************************
%BEGIN_FOLD
% define header and footer
\RequirePackage[draft=false]{scrlayer-scrpage}	% lopad scrlayer-scrpage without draft to avoid ruler
\input{./Preamble/header_and_footer_style}		% edit this file for customization
%END_FOLD

% ************** Clear Header Style on the Last Empty Odd pages ****************
%BEGIN_FOLD
%\renewcommand{\cleardoublepage}{ 
%TODO is this even necesarry? and causes error
%	\clearpage
%	\if@twoside
%		\ifodd
%			\clearpage
%		\else
%			\hbox{}
%			\thispagestyle{empty}  % Empty header styles
%			\newpage
%			\if@twocolumn
%				\hbox{}
%				\newpage
%			\fi
%		\fi
%	\fi
%}
%END_FOLD
%END_FOLD

% ******************************************************************************
% *************************** Command Definitions ******************************
% ******************************************************************************
%BEGIN_FOLD
% ********************************** Paths *************************************
%BEGIN_FOLD
% Path to the .bib file
\newcommand{\bibliographyPath}{}
\newcommand{\setBibliographyPath}[1]{\renewcommand{\bibliographyPath}{#1}}
%END_FOLD

% ******************************** Meta Data ***********************************
%BEGIN_FOLD
% Title
\renewcommand{\title}{}			% exists already in scrbook
\newcommand{\setTitle}[1]{\renewcommand{\title}{#1}}

% Subtitle (optional)
\newif\ifBOOL@subtitle \BOOL@subtitlefalse
\renewcommand{\subtitle}{}		% exists already in scrbook
\newcommand{\setSubtitle}[1]{\renewcommand{\subtitle}{#1}\BOOL@subtitletrue}

% Author
\renewcommand{\author}{}		% exists already in scrbook
\newcommand{\setAuthor}[1]{\renewcommand{\author}{#1}}

% Author matriculation number
\newcommand{\authorMatriculationNumber}{}
\newcommand{\setAuthorMatriculationNumber}[1]{\renewcommand{\authorMatriculationNumber}{#1}}

% Author adress
\newcommand{\authorAdress}{}
\newcommand{\setAuthorAdress}[1]{\renewcommand{\authorAdress}{#1}}

% The name of the institute or department
\newcommand{\institute}{}
\newcommand{\setInstitute}[1]{\renewcommand{\institute}{#1}}

% The name of the University
\newcommand{\university}{}
\newcommand{\setUniversity}[1]{\renewcommand{\university}{#1}}

% Defining the Universitylogo path
\newcommand{\universityLogo}{}
\newcommand{\setUniversityLogo}[1]{\renewcommand{\universityLogo}{#1}}

% Defining the Institutelogo path
\newif\ifBOOL@instituteLogo \BOOL@instituteLogofalse
\newcommand{\instituteLogo}{}
\newcommand{\setInstituteLogo}[1]{\renewcommand{\instituteLogo}{#1}\BOOL@instituteLogotrue}

% Supervisor
\newcommand{\supervisor}{}
\newcommand{\setSupervisor}[1]{\renewcommand{\supervisor}{#1}}

% Supervisor A who has to sign
\newcommand{\signingSupervisorA}{Supervisor}
\newcommand{\setSigningSupervisorA}[1]{\renewcommand{\signingSupervisorA}{#1}}

% Supervisor B who has to sign
\newif \ifBOOL@SupervisorBSign \BOOL@SupervisorBSignfalse
\newcommand{\signingSupervisorB}{Supervisor}
\newcommand{\setSigningSupervisorB}[1]{\renewcommand{\signingSupervisorB}{#1}\BOOL@SupervisorBSigntrue}

% Advisor
\newif\ifBOOL@advisors \BOOL@advisorsfalse
\newcommand{\advisors}{}
\newcommand{\setAdvisors}[1]{\renewcommand{\advisors}{#1}\BOOL@advisorstrue}

% Degree date
\newcommand{\degreeDate}{}
\newcommand{\setDegreeDate}[1]{\renewcommand{\degreeDate}{#1}}

% Degree place
\newcommand{\degreePlace}{}
\newcommand{\setDegreePlace}[1]{\renewcommand{\degreePlace}{#1}}

% Keywords (These keywords will appear in the PDF meta-information; called `pdfkeywords`.)
\newcommand{\keywords}{}
\newcommand{\setKeywords}[1]{\renewcommand{\keywords}{#1}}

% Binding correction and type area setup
\newcommand{\bindingOffset}{5mm}	% default 5 mm
\newcommand{\setBindingOffset}[1]{\renewcommand{\bindingOffset}{#1}}

% Subjectline (This subject will appear in the PDF meta-information; called `pdfsubject`.)
%\newcommand{\subject}{}			% exists already in scrbook
\newcommand{\setSubject}[1]{\renewcommand{\subject}{#1}}
%END_FOLD

% ********************************** Macros ************************************
%BEGIN_FOLD
%---environment for front matter that is always single column even in a double-column document.
%BEGIN_FOLD
\newenvironment{alwayssingle}{
	\@restonecolfalse
	\if@twocolumn
		\@restonecoltrue
		\onecolumn
	\else
		\newpage
	\fi
}{	\if@restonecol
		\twocolumn
	\else
		\newpage
	\fi
}
%END_FOLD

%---set single column even under two column layout
\newcommand{\setsinglecolumn}{
	\if@twocolumn
		\onecolumn
	\else
	\fi
}

%---place signature
\newcommand{\placeSign}{
	\centering
	\degreePlace, am \degreeDate
}

%---author signature
\newcommand{\authorSign}{
	\begin{tabular}{>{\centering}p{0.3\textwidth} >{\centering}p{0.3\textwidth} >{\centering}p{0.3\textwidth }}
		\centering
		\degreePlace, am \degreeDate & \dotfill \\ \footnotesize \author
	\end{tabular}
}

%---supervisor signature
\newcommand{\supervisorSign}{
	\ifBOOL@SupervisorBSign
		\begin{tabular}{>{\centering}p{0.2\textwidth} >{\centering}p{0.3\textwidth} >{\centering}p{0.3\textwidth }}
			\centering
			Begutachtet von: & \dotfill \\ \footnotesize \signingSupervisorA & \dotfill \\ \small \signingSupervisorB
		\end{tabular}
	\else
		\begin{tabular}{>{\centering}p{0.3\textwidth} >{\centering}p{0.3\textwidth} >{\centering}p{0.3\textwidth}}
			\centering
			Begutachtet von: & \dotfill \\ \footnotesize \signingSupervisorA
		\end{tabular}
	\fi
}

%---time Stamp
%BEGIN_FOLD
% Compute the timestamp based on an idea of
% Tim Piessens <Tim.Piessens@esat.kuleuven.ac.be>.
\RequirePackage{datetime2}
\newcount\BOOL@hour \newcount\BOOL@minute
\BOOL@hour=\time
\divide \BOOL@hour by 60
\BOOL@minute=\time
\count@=\BOOL@hour
\multiply \count@ by -60
\advance \BOOL@minute by \count@
\newcommand{\BOOL@daytime}{%
	\today\space--\space%
	\ifnum\BOOL@hour=0 00\else\ifnum\BOOL@hour<10 0\fi%
	\number\BOOL@hour\fi:\ifnum\BOOL@minute<10 0\fi\number\BOOL@minute
}
%END_FOLD

%---define golbal \newcommand{cmd}{def} and \renewcommand{cmd}{def}
%BEGIN_FOLD
\RequirePackage{etoolbox}
\makeatletter
\def\gnewcommand{\g@star@or@long\gnew@command}
\def\grenewcommand{\g@star@or@long\grenew@command}
\def\g@star@or@long#1{% 
	\@ifstar{\let\l@ngrel@x\global#1}{\def\l@ngrel@x{\long\global}#1}}
\def\gnew@command#1{\@testopt{\@gnewcommand#1}0}
\def\@gnewcommand#1[#2]{%
	\kernel@ifnextchar [{\@gxargdef#1[#2]}%
	{\@argdef#1[#2]}}
\let\@gxargdef\@xargdef
\patchcmd{\@gxargdef}{\def}{\gdef}{}{}
\let\grenew@command\renew@command
\patchcmd{\grenew@command}{\new@command}{\gnew@command}{}{}
\makeatother
%END_FOLD
%END_FOLD
%END_FOLD

% ******************************************************************************
% ******************************* Enviornmanets ********************************
% ******************************************************************************
%BEGIN_FOLD
% ******************************** Declaration *********************************
%BEGIN_FOLD
% The declaration environment puts a large, bold, centered
% "Declaration" label at the top of the page.
\newenvironment{declaration}{
%	\cleardoublepage		% uncomment to leave blank page
	\setsinglecolumn
	\vspace*{0.02\textheight}
	\centering \Large \textbf{Declaration}\\
	\vspace*{0.01\textheight}
	\thispagestyle{empty}
	\normalsize
	\flushleft
}{
	\flushleft
	\authorSign	
	\vfill
}
%END_FOLD

% ******************************** Dedication **********************************
%BEGIN_FOLD
% The dedication environment makes sure the dedication gets its
% own page, centered
\renewenvironment{dedication}{	% already exists in scrbook
	\if@print
		\cleardoublepage
	\fi
	\setsinglecolumn
	\vspace*{0.2\textheight}
	\thispagestyle{empty}
	\centering
}
%END_FOLD

% ***************************** Acknowledgements *******************************
%BEGIN_FOLD
% The acknowledgements environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page.
\newenvironment{acknowledgements}{
	\pdfbookmark[0]{Acknowledgements}{ackn}
	\setsinglecolumn
	\chapter*{\centering \Large Acknowledgements}
	\thispagestyle{empty}
}
%END_FOLD

% ********************************* Abstract ***********************************
%BEGIN_FOLD
% The abstract environment puts a large, bold, centered "Abstract" label at
% the top of the page. Defines both abstract and separate abstract environment
\newenvironment{abstract}{
	\pdfbookmark[0]{Abstract}{abst}
	\if@abstract	% separate abstract as per Student Registry guidelines
		\thispagestyle{empty}
		\setsinglecolumn
		\begin{center}
			{ \Large {\bfseries {\title}} \par}
			{{\large \vspace*{1em} \@author} \par}
		\end{center}
	\else			% Normal abstract in the thesis
		\setsinglecolumn
		\chapter*{\centering \Large Abstract}
	\fi
}
%END_FOLD

% ***************************** Zussmmenfassung ********************************
%BEGIN_FOLD
% For a german abstract in the thesis.
% The zusammenfassung environment puts a large, bold, centered "Zusammenfassung" label at
% the top of the page.
\newenvironment{Zusammenfassung}{
	\pdfbookmark[0]{Zusammenfassung}{zusam}
	\begin{otherlanguage}{ngerman}
		\setsinglecolumn
		\chapter*{\centering \Large Zusammenfassung}
	\end{otherlanguage}
}
%END_FOLD

% ******************************* Nomenclature *********************************
%BEGIN_FOLD
\RequirePackage[intoc]{nomencl}
\makenomenclature
\renewcommand{\nomgroup}[1]{%
	\ifthenelse{\equal{#1}{C}}{\item[\textbf{Constants}]}{%
		\ifthenelse{\equal{#1}{P}}{\item[\textbf{Physical Symbols}]}{%
			\ifthenelse{\equal{#1}{A}}{\item[\textbf{Acronyms / Abbreviations}]}{%
				\ifthenelse{\equal{#1}{R}}{\item[\textbf{Superscripts}]}{%
					\ifthenelse{\equal{#1}{S}}{\item[\textbf{Subscripts}]}{%
						\ifthenelse{\equal{#1}{X}}{\item[\textbf{Other Symbols}]}
						{}
					}
				}
			}
		}
	}
}

% To add nomenclature in the header
\renewcommand{\nompreamble}{\markboth{\nomname}{\nomname}}

% Add nomenclature to contents and print out nomenclature
\newcommand{\printnomencl}[1]{
	\ifthenelse{\equal{#1}{}}{\printnomenclature}{\printnomenclature[#1]}
%	\addcontentsline{toc}{chapter}{\nomname}		% is already done by [intoc]
}
%TODO does it work?
%% Introducing links for the page numbers
%\renewcommand*{\pagedeclaration}[1]{\unskip, \hyperpage{#1}}
%
%% For equations
%\renewcommand*{\eqdeclaration}[1]{%
%	\hyperlink{equation.#1}{(Equation~#1)}%
%}
%END_FOLD

% **************************** Create the index ********************************
%BEGIN_FOLD
\if@index
	\RequirePackage{makeidx}
	\makeindex
	\newcommand{\printthesisindex}{
		\if@print
			\cleardoublepage
		\fi
		\phantomsection
		\printindex
		\ifdefineDraft		% print list of todos in index section
			\todototoc
			\listoftodos
		\fi
	}
\else
	\newcommand{\printthesisindex}{
		\ifdefineDraft		% print list of todos in index section
			\todototoc
			\listoftodos
		\fi
	}
\fi
%END_FOLD
%END_FOLD

% ******************************************************************************
% ********************************** Modes *************************************
% ******************************************************************************
%BEGIN_FOLD
% ****************************** Chapter Mode **********************************
%BEGIN_FOLD
% The chapter mode allows user to only print particular chapters with references
% All other options are disabled by default
% To include only specific chapters without TOC, LOF, Title and Front Matter
% To send it to supervisior for changes
\ifchapterMode
	% Disable the table of contents, figures, tables, index and nomenclature
	\renewcommand{\maketitle}{}
	\renewcommand{\tableofcontents}{}
	\renewcommand{\listoffigures}{}
	\renewcommand{\listoftables}{}
	\renewcommand{\printnomencl}{}
	\renewcommand{\printnomencl}[1]{}
	\renewcommand{\printthesisindex}{}
\fi
%END_FOLD

% ****************************** Abstract Mode *********************************
%BEGIN_FOLD
% The abstract mode allows user to only print the abstract
% All other options are disabled by default
% To include only the Title and the abstract pages for submission to BoGS
\ifabstractMode
	% Disable the table of contents, figures, tables, index and nomenclature
	\renewcommand{\tableofcontents}{}
	\renewcommand{\listoffigures}{}
	\renewcommand{\listoftables}{}
	\renewcommand{\printnomencl}{}
	\renewcommand{\printnomencl}[1]{}
	\renewcommand{\printthesisindex}{}
	\renewcommand{\backmatter}{}
	\renewcommand{\appendix}{}
	
	\ifsetBibLaTeX
		\renewcommand{\printbibliography}[1][10]{}
		\renewcommand{\bibbysegment}[1][10]{}
		\renewcommand{\printbibheading}[1][10]{}
%TODO add bibliography support for abstract without a new page 
%		\ExecuteBibliographyOptions{refsegment=chapter, citereset=none}
%		\renewcommand{\printbibliography}[1][10]{
%				\printbibliography[segment=1, heading=subbibliography] 		% segment=1 for catch refsegment with abstract
%		}
%		\renewcommand{\bibbysegment}[1][10]{
%				\printbibliography[segment=1, heading=subbibliography] 		% segment=1 for catch refsegment with abstract
%		}
	\else
		\renewcommand{\bibname}{}
		\renewcommand{\bibliography}[1]{}
	\fi
\fi
%END_FOLD
%END_FOLD