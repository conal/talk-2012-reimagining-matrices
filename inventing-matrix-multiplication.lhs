% -*- latex -*-
\documentclass[serif]{beamer}

% \usetheme{Warsaw} 

\usepackage{beamerthemesplit}

\usepackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.png,.jpg}

% \useoutertheme{infolines}

\input{macros}

%include polycode.fmt
%include forall.fmt
%include greek.fmt
%include mine.fmt

\title{Inventing matrix multiplication}
\author{Conal Elliott}
\institute{Tabula}
% Abbreviate date/venue to fit in infolines space
\date{Nov 15, 2012}

\begin{document}

\frame{\titlepage}

\nc\ssection[1]{
\section{#1}
\frame{\begin{center}\vspace{3ex}
\LARGE #1\end{center}}
}
\nc\ssubsection\subsection

% \frame{\frametitle{Outline}\tableofcontents}


\frame{\frametitle{Matrices}

$$
\begin{pmatrix} a_{1 1} & \cdots & a_{1 m} \\
\vdots & \ddots & \vdots \\
a_{n 1} & \cdots & a_{n m} \end{pmatrix}
$$

}

\frame{\frametitle{Matrix/vector multiplication}

$$
\begin{array}{c}
\begin{pmatrix} a_{1 1} & \cdots & a_{1 m} \\
\vdots & \ddots & \vdots \\
a_{n 1} & \cdots & a_{n m} \end{pmatrix}
\begin{pmatrix}
  x_1\\
  x_2\\
  \vdots\\
  x_n
\end{pmatrix}\\[10ex]
= \\[4ex]
\begin{pmatrix}
 a_{11} \cdot x_1 & + & \cdots & + & a_{1 n} \cdot x_n\\
 \vdots && \ddots && \vdots\\
 a_{m1} \cdot x_1 & + & \cdots & + & a_{mn} \cdot x_n\\
\end{pmatrix}
\end{array}
$$
\\[3ex]
\pause

Why?
\pause
What does it mean?

}


\frame{\frametitle{Linearity}

Linear functions/maps/transformations:

$$
\begin{array}{rcl}
f\,\, (x+y) &=& f\, x + f\, y\\
f\,\, (\alpha \cdot x) &=& \alpha \cdot f\, x
\end{array}
$$

\ 

Equivalently, $f$ preserves \emph{linear combinations}:

$$
f\, (a_1 \cdot x_1+\cdots+a_m \cdot x_m) = a_1 \cdot f\, x_1+\cdots+a_m \cdot f\, x_m
$$

\ 

\emph{Linear map} from $a$ to $b$: ``|a :-* b|''.

}

\frame{\frametitle{Multiplying matrices}

If
$$
\mathbf{A}=\begin{pmatrix}
 A_{11} & \cdots & A_{1m} \\
\vdots & \ddots & \vdots \\
 A_{n1} & \cdots & A_{nm} \\
\end{pmatrix},\quad\mathbf{B}=\begin{pmatrix}
 B_{11} & \cdots & B_{1p} \\
\vdots & \ddots & \vdots \\
 B_{m1} & \cdots & B_{mp} \\
\end{pmatrix}
$$
\\[2ex]

then\\[2ex]

$$
(\mathbf{AB})_{ij} = \sum_{k=1}^m A_{ik}B_{kj}
$$

}

\frame{\frametitle{Represent as GADT}

> data a :-* b where
>   Dot    ::  InnerSpace b =>
>              b -> (b :-* Scalar b)
>   (:&&)  ::  VS3 a c d =>  -- vector spaces with same scalar field
>              (a :-* c) -> (a :-* d) -> (a :-* c :* d)

}

\frame{\frametitle{Semantics}

> apply :: (a :-* b) -> (a -> b)
> apply (Dot b)    = dot b
> apply (f :&& g)  = apply f &&& apply g

where, on functions,

> (f &&& g) a = (f a, g a)

Recall:

> data a :-* b where
>   Dot    ::  InnerSpace b  => b -> (b :-* Scalar b)
>   (:&&)  ::  VS3 a c d     => (a :-* c) -> (a :-* d) -> (a :-* c :* d)

}
\frame{\frametitle{Composing linear maps}

The specification:

\begin{center}

> apply (g .@ f) == apply g . apply f

\end{center}

}
\frame{\frametitle{Deriving a |Category| instance}

One case:
\begin{center}
\fbox{\begin{minipage}[t]{0.45\textwidth}

>     apply ((f :&& g) .@ h)
> ==  (apply f &&& apply g) . apply h
> ==  apply f . apply h &&& apply g . apply h
> ==  apply (f .@ h :&& g .@ h)

\end{minipage}}
\end{center}

(where |f . h &&& g . h == (f . h) &&& (g . h)|).
Uses:

> (f &&& g) . h == f . h &&& g . h

Implementation:

>   (f :&& g) .@ h = f .@ h :&& g .@ h

}
\frame{\frametitle{Deriving a |Category| instance}

\begin{center}
\fbox{\begin{minipage}[t]{0.35\textwidth}

>     apply (Dot s .@ Dot b)
> ==  dot s . dot b
> ==  dot (s *^ b)
> ==  apply (Dot (s *^ b))

\end{minipage}}
\fbox{\begin{minipage}[t]{0.55\textwidth}
\vspace{-1ex}

>     apply (Dot (a,b) .@ (f :&& g))
> ==  dot (a,b) . (apply f &&& apply g)
> ==  add . (dot a . apply f &&& dot b . apply g)
> ==  dot a . apply f ^+^ dot b . apply g
> ==  apply (Dot a .@ f ^+^ Dot b .@ g)

\end{minipage}}
\end{center}

\vspace{-1ex}
Uses:

> dot (a,b)              == add . (dot a *** dot b)
>
> (k *** h) . (f &&& g)  == k . f &&& h . g
>
> apply (f ^+^ g)        == apply f ^+^ apply g

\out{
Implementation:

>  Dot s      .@ Dot b      = Dot (s *^ b)
>  Dot (a,b)  .@ (f :&& g)  = Dot a .@ f ^+^ Dot b .@ g

}
}

\frame{\frametitle{Reflections}

\begin{itemize}

\item Find the elegant \emph{what} behind a familiar \emph{how}.
\item Specify via semantic function.
\item Derive implementation.

\end{itemize}
\ \\[3ex]

More examples: \href{http://conal.net/papers/type-class-morphisms/}{\emph{Denotational design with type class morphisms}}

}

\end{document}


%% ------------------ Junk
