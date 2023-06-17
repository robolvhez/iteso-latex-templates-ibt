\NeedsTeXFormat{LaTeX2e}[1995/12/01]
%% v1.4: Detect TL2018 to handle accented characters in class information
\@ifl@t@r\fmtversion{2018/04/01}{\UseRawInputEncoding}{}
\ProvidesClass{ITESO-Report}[2022/11/10 Reporte de Laboratorio ITESO V1.0, facilitando el formato de reportes de IBT.]

% Opciones de la clase (Vacío, por ahora)

% Cargar clase "article"
\ProcessOptions\relax
\LoadClass[11pt, letterpaper, onecolumn]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[margin=1.5in, includefoot]{geometry}
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
	\setchemformula{format=\rmfamily}
\usepackage{siunitx}
	\DeclareSIUnit\Molar{M}

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
	\definecolor{azuliteso2}{HTML}{42B4E3}
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
% \titleformat{<comando>}[<forma>]{<formato>}{<etiqueta>}{<sep>}{<antes del código>}[<después del código>]
\RequirePackage{titlesec}

\titleformat{\section}{\color{azuliteso1}\large\bfseries}{\color{azuliteso1!50}\rule[-7pt]{3pt}{21pt}}{0.5em}{}[]

\titleformat*{\subsection}{\color{darkgray}\normalsize\bfseries}
\titleformat*{\subsubsection}{\normalsize\itshape}

%% Espaciado \titlespacing*{<comando>}{<izquierda>}{<antes>}{<después>}
\titlespacing*{\section}{0pt}{0pt}{0pt}
\titlespacing*{\subsection}{0pt}{0pt}{0pt}

%\setlength\cftparskip{-2pt}

\makeatletter % Iniciar ambiente para arrobas.
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

%% Definir el laboratorio
	\def\mylab#1#2{\gdef\@mylab{#1 --- #2}}
	\def\@mylab{\@latex@warning@no@line{No se dió \noexpand\mylab}}

%% Información de ITESO y correo principal
	\def\mainemail#1{\gdef\@mainemail{\texttt{\href{mailto:#1}{#1}}}}
	\newcommand{\itesoinfo}{Instituto Tecnológico y de Estudios Superiores de Occidente - ITESO AC. Universidad Jesuita de Guadalajara. Periférico Sur, Manuel Gomez Morin \#8585, Col. ITESO. San Pedro Tlaquepaque Jalisco, México. Correo-e: \@mainemail}

\makeatother % Cierra el ambiente.

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

	\renewcommand{\footrule}{%
		\vspace{-8pt}\color{lightgray}\vhrulefill{.5pt}
	}
	

	\lhead{\color{lightgray} \textbf{Laboratorio de:} \@mylab}
	\rhead{\includegraphics[height=0.5in]{logo_iteso.pdf}}

	\lfoot{\color{lightgray}\small \today}
	\rfoot{\color{lightgray}\small Página \thepage\ \rule[-0.4ex]{0.2ex}{1.2em} \pageref{LastPage}}

	\fancypagestyle{firstpage}{%
		\setlength{\headheight}{0.25in}
		\setlength{\headsep}{0pt}

		%\renewcommand{\headrulewidth}{1cm}
		%\renewcommand{\headrule}{\color{azuliteso1}\hrulefill}

		\fancyhead{} % limpiar anteriores
		\fancyfoot{} % limpiar anteriores

		%\lhead{\includegraphics[height=1in]{logo_iteso_header.pdf}}

		\chead{
			{\color{azuliteso2}\vhrulefill{2pt}}
			\fcolorbox{azuliteso2}{azuliteso2}{
				\small{\makebox[10em]
				{\color{white}Proyecto}}}
		}
	}
\makeatother