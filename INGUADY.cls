% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%               ------------------                                          %
%                   INGUADY.cls                                             %
%               ------------------                                          %
% This is the Latex class file which aids in the formatt-                   %
% ing of .tex documents to be sent to UADY's Engineering                    %
% journal available here:                                                   %
% http://www.revista.ingenieria.uady.mx/                                    %
%                                                                           %
% Usage:                                                                    %
% To use this file please add (or replace) the document's                   %
% class like so:                                                            %
% \documentclass{INGUADY}                                                   %
%                                                                           %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%                                                                           %
%               Copyright 2018 Carlos Brito                                 %    
%                                                                           %
% Permission is hereby granted, free of charge, to any                      %
% person obtaining a copy of this software and associated                   %
% documentation files (the "Software"), to deal in the                      %
% Software without restriction, including without limitation                %
% the rights to use, copy, modify, merge, publish,                          %
% distribute, sublicense, and/or sell copies of the Software,               %
% and to permit persons to whom the Software is furnished                   %
% to do so, subject to the following conditions:                            %
%                                                                           %
% The above copyright notice and this permission notice                     %
% shall be included in all copies or substantial portions                   %
% of the Software.                                                          %
%                                                                           %
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,           %
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES           %
% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONIN-           %
% FRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS            %
% BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN           %
% AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF            %
% OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS           %
% IN THE SOFTWARE.                                                          %
%                                                                           %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% IDENTIFICATION
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{INGUADY}[2018/05/10 Example LaTeX class]
% End of identification

% PRELIMINARY DECLARATIONS
\LoadClass[twocolumn]{article}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
% End of preliminary declarations

% OPTIONS
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
% End of options

% MORE DECLARATIONS

% Column separation
\setlength{\columnsep}{10mm}

% Setup counter
\setcounter{secnumdepth}{0}

% Choose normal font size
\renewcommand{\normalsize}{\fontsize{10}{12}\selectfont}

% Define the page sizes and geometry
\geometry{
    papersize={220mm, 280mm}, % letter paper dimensions
    total={195mm, 255mm}, % aids in defining the body
    margin=25mm % margin as per the specifications
}

% Remove header rule
\renewcommand{\headrulewidth}{0pt}

% Change bullet points to a "dash": -
\renewcommand\labelitemi{---}

% Modify abstract
\renewenvironment{abstract}[1][Abstract]
{   
    \begin{@twocolumnfalse}
    \section*{#1}
}
{\end{@twocolumnfalse}}

% Add keywords macro
\newcommand{\keywords}[2][Keywords]{\vspace{5mm}\noindent\ignorespaces\textbf{#1:} #2}

% Define some cool macros that help when formatting the front matter
\def\orcidID#1{\unskip$^{[#1]}$}
\def\correspauthor#1{#1$^*$}
\def\correspemail#1{\noindent\ignorespaces$^*$Autor de correspondencia. Correo electr\'onico: \texttt{#1}}
\def\inst#1{\noindent\ignorespaces#1}
\def\journalnote#1{\noindent\ignorespaces\textbf{Nota:} #1}

% Use fancyhdr to customize header and footer
\fancyhf{}
\cfoot{\thepage}
\pagestyle{fancy}

% Add command to specify the running head
\newcommand{\runhead}[1]{\chead{\textbf{#1}}}

% Add command for the review dates
\newcommand{\reviewdates}[2]{
    \begin{center}
    \textit{%
    Fecha de recepci\'on: #1 --- %
    Fecha de aceptaci\'on: #2
    }
    \end{center}
}

% Environment for the bottom paragraph
\newenvironment{bottompar} {\vspace*{\fill}\fontsize{9}{10}\selectfont\noindent\ignorespaces}{}

% Customize title page
\renewcommand{\maketitle} {
    \begin{center}
    \fontsize{20.74}{10}%
    \selectfont
    \textbf{\@title}
    \end{center}
    \begin{center}
    \textbf{\@author.}
    \end{center}
}

% Command to insert the english title
\newcommand{\englishtitle}[1]{
    \vspace{5mm}
    \begin{center}
    \fontsize{20.74}{10}%
    \selectfont
    \textbf{#1}
    \end{center}
}

% Add a frontmatter environment
\newenvironment{frontmatter} {
    \onecolumn
    \thispagestyle{empty}
    \maketitle
}{\twocolumn}

% End of declarations
