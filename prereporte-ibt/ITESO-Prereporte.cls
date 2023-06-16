\NeedsTeXFormat{LaTeX2e}[1995/12/01]
%% v1.4: Detect TL2018 to handle accented characters in class information
\@ifl@t@r\fmtversion{2018/04/01}{\UseRawInputEncoding}{}
\ProvidesClass{ITESO-Prereporte}[2022/11/10 Reporte de Laboratorio ITESO V1.0, facilitando el formato de pre-reportes de IBT.]

% Opciones de la clase (Vacío, por ahora)

% Cargar clase "article"
\ProcessOptions\relax
\LoadClass[11pt, letterpaper]{article}

\RequirePackage[margin=1in, includefoot]{geometry}
\setlength{\columnsep}{1cm}


\RequirePackage{authblk}
\RequirePackage[sfdefault]{carlito}
\RequirePackage{ifthen}

\usepackage{hyperref}
	\hypersetup{colorlinks=true,
				urlcolor=blue,
				citecolor=blue,
				linkcolor=black
	}
\usepackage{graphicx}
\usepackage{float}
\usepackage{xcolor}
\usepackage{adjustbox}
\usepackage{booktabs}
\usepackage{multicol}
\usepackage{multirow}
\usepackage[font=small,labelfont=bf]{caption}
\usepackage{subcaption}
\usepackage{chemformula}
\usepackage{siunitx}
\usepackage{tabularx}
    \newcolumntype{R}{>{\raggedright\arraybackslash}X}
    \newcolumntype{Y}{>{\centering\arraybackslash}X}
    \newcolumntype{Z}{>{\raggedleft\arraybackslash}X}

%% Añadido por conveniencia de compilación
\newif\ifxetexorluatex
\ifxetex
  \xetexorluatextrue
\else
  \ifluatex
    \xetexorluatextrue
  \else
    \xetexorluatexfalse
  \fi
\fi

% ----------------------
% DEFINIENDO COLORES
% ----------------------
\RequirePackage{xcolor}
	% Colores institucionales.
	\definecolor{azuliteso1}{HTML}{004270}
	\definecolor{azuliteso2}{HTML}{7D9ABF}
	\definecolor{rojoiteso1}{HTML}{D0202E}
	
	% Colores armónicos
	\definecolor{naranjaiteso1}{HTML}{FF5800}
	\definecolor{verdeiteso1}{HTML}{58A618}
% ------------------

% -------------------------------
% CONFIGURACION DE LA UNIDADES SI 
% -------------------------------
\sisetup{%
    text-family-to-math   = true,
    text-series-to-math   = true,
    range-phrase          = --,
    range-units           = single
}
% -------------------------------

% -----------------------------
% DEFINIENDO MACROS IMPORTANTES
% -----------------------------

%% Configuración de la sección de autores
\renewcommand*\Authands{, }
\renewcommand*\Authand{, y }
\renewcommand*\Authands{, y }
\renewcommand*\Affilfont{\footnotesize}
\renewcommand*\Authfont{\normalsize}

% Configuración de los párrafos
\setlength{\parindent}{0pt}
\setlength{\parskip}{8pt}

% Configuración de la tabla de contenidos
\usepackage{tocloft}
\setlength{\cftbeforesecskip}{0pt}

% Configuración de títulos de sección
\RequirePackage{titlesec}
%% Fuente
\titleformat{\section}{\color{azuliteso1}\large\bfseries}{\thesection}{1em}{}
\titleformat*{\subsection}{\color{darkgray}\normalsize\bfseries}
\titleformat*{\subsubsection}{\normalsize\itshape}

%% Espaciado \titlespacing*{<comando>}{<izquierda>}{<antes>}{<después>}
\titlespacing*{\section}{0pt}{0pt}{0pt}
\titlespacing*{\subsection}{0pt}{0pt}{0pt}

%\setlength\cftparskip{-2pt}

\makeatletter
%% Configuración del formato del título
\RequirePackage{xpatch}
    \xpatchcmd{\@maketitle}
      {\@title}
      {\bfseries\Large\@title}
      {}{}

%% Configuración del párrafo de afiliaciones
    \renewcommand\AB@affilsepx{, \protect\Affilfont}

%% Un comando que nos sirve para controlar un "\hrulefill"
	\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

%% Definir información de la práctica
\def\authexp#1{\gdef\@authexp{#1}}
\def\dpto#1#2{\gdef\@dpto{#1 (#2)}}
\def\mylab#1#2{\gdef\@mylab{#1 --- #2}}
\def\numlab#1{\gdef\@numlab{Practica --- #1}}
\def\periodo#1#2{\gdef\@periodo{#1 #2}}
\def\profesor#1{\gdef\@profesor{#1}}

%% Número de cuestionario
\RequirePackage{enumitem}
\newcommand{\question}[1]{
  \begin{enumerate}[wide, labelwidth=!, labelindent=0pt, resume]\bfseries
    \item #1
  \end{enumerate}

  \vspace{-1em}
}

\makeatother

% -----------------------------

% -----------------------
% CONFIGURACIÓN DE PÁGINA
% -----------------------
% Encabezado de páginas
\RequirePackage{fancyhdr, lastpage}
\RequirePackage{tikz}
\usepackage{tikzpagenodes}

\makeatletter
\pagestyle{fancy}
	\fancyhead{} % limpiar anteriores
	\fancyfoot{} % limpiar anteriores

	\setlength{\headheight}{42pt}
	\renewcommand{\headrulewidth}{0pt}

	\lhead{\color{lightgray} \textbf{Laboratorio de:} \@mylab}
	\rhead{\includegraphics[height=0.5in]{logo_iteso.pdf}}

	\lfoot{\color{lightgray}\small \today}
	\rfoot{\color{lightgray}\small Página \thepage\ \rule[-0.4ex]{0.2ex}{1.2em} \pageref{LastPage}}

	\fancypagestyle{firstpage}{%
		\setlength{\headheight}{15pt}
		\setlength{\headsep}{0.25in}

		%\renewcommand{\headrulewidth}{1cm}
		%\renewcommand{\headrule}{\color{azuliteso1}\hrulefill}

		\fancyhead{} % limpiar anteriores
		\fancyfoot{} % limpiar anteriores

		\chead{
			{\color{naranjaiteso1}\vhrulefill{2pt}}
			\fcolorbox{naranjaiteso1}{naranjaiteso1}{
				\small{\makebox[12em]
				{\color{white}Pre-reporte de laboratorio}}}
		}
	}

\makeatother

%% Página de título
\makeatletter
\newcommand{\maketitlepage}{
%\begin{titlepage}
\thispagestyle{firstpage}
{\centering
	{\huge\bfseries Instituto Tecnológico y de Estudios Superiores de Occidente}\\ \vspace{1em}
	{\large \@dpto}\\ \vspace{0.5in}
	\includegraphics[height=8cm]{iteso_portada.png} \vspace{0.25in}

	{\color{azuliteso1}\bfseries
		\vhrulefill{2pt}\\ \vspace{0.25em}
		{\normalsize \@numlab}\\ \vspace{1em}
		{\huge \@title}\\ \vspace{0.25em}
		\vhrulefill{2pt}
	}

	\@mylab\\
	\@periodo\\
	\@date\\ \vspace{2em}
	{\large\bfseries Autor:}\\ \vspace{1em}

	\begin{tabularx}{\textwidth}{XY}
		\@author & \texttt{\@authexp}\\ % Autor 01
		\textbf{Profesor:}        & \@profesor % Profesor
	\end{tabularx}

	\vfill

	{\raggedleft
		\small\color{gray} Periferico Sur Manuel Gomez Morin 8585, Col. ITESO. San Pedro Tlaquepaque Jalisco, Mexico.
	}
}
\newpage
%\end{titlepage}
}
\makeatother