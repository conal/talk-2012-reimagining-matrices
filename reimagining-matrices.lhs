% -*- latex -*-
\documentclass[serif]{beamer}

% \usetheme{Warsaw} 

\usepackage{beamerthemesplit}

\usepackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.png,.jpg}

\useinnertheme[shadow]{rounded}
% \useoutertheme{default}
\useoutertheme{shadow}
\useoutertheme{infolines}

\input{macros}

%include polycode.fmt
%include forall.fmt
%include greek.fmt
%include mine.fmt

\title{Reimagining matrices}
\author{Conal Elliott}
\institute{Tabula}
% Abbreviate date/venue to fit in infolines space
\date{Nov 15, 2012}

\nc\wfig[2]{
\begin{center}
\includegraphics[width=#1]{#2.jpg}
\end{center}
}
\nc\fig[1]{\wfig{3in}{#1}}

\begin{document}

\frame{\titlepage
% \vspace{-0.5in}
\wfig{2.5in}{rabbit-face}
}

\frame{\frametitle{Reimagining}
\vspace{0.6in}
\begin{center}
\begin{minipage}[t]{0.6\textwidth}
\begin{center}
{ \it
The function of the imagination is not\\
to make strange things settled, so much as\\
to make settled things strange.
}
\end{center}
\vspace{3ex}
\begin{flushright}
- G.K. Chesterton
\end{flushright}
\end{minipage}
\end{center}
}

\frame{\frametitle{Matrices}
\vspace{0.3in}
$$
\begin{pmatrix} A_{1 1} & \cdots & A_{1 m} \\
\vdots & \ddots & \vdots \\
A_{n 1} & \cdots & A_{n m} \end{pmatrix}
$$
}

\frame{\frametitle{Matrices}
% \pause
\vspace{0.25in}
\fig{old-hat}
}

\frame{\frametitle{Or maybe ...}
% \wfig{2in}{rabbit-hat-kid}
\wfig{2in}{rabbit-in-hat}
}

\frame{\frametitle{Matrices}
\vspace{0.3in}
$$
\begin{pmatrix} A_{1 1} & \cdots & A_{1 m} \\
\vdots & \ddots & \vdots \\
A_{n 1} & \cdots & A_{n m} \end{pmatrix}
$$
}

\frame{\frametitle{Matrix addition}

If\\[2ex]
$$
\mathbf{A}=\begin{pmatrix}
 A_{11} & \cdots & A_{1m} \\
\vdots & \ddots & \vdots \\
 A_{n1} & \cdots & A_{nm} \\
\end{pmatrix},\quad\mathbf{B}=\begin{pmatrix}
 B_{11} & \cdots & B_{1m} \\
\vdots & \ddots & \vdots \\
 B_{n1} & \cdots & B_{nm} \\
\end{pmatrix},
$$
\\[2ex]
then
$$
\mathbf{A \mplus B}=\begin{pmatrix}
 A_{11} + B_{11} & \cdots & A_{1m} + B_{1m} \\
\vdots & \ddots & \vdots \\
 A_{n1} + B_{n1} & \cdots & A_{nm} + B_{nm} \\
\end{pmatrix}.
$$
}

\frame{\frametitle{Matrix addition}

If\\[2ex]
$$
\mathbf{A}=\begin{pmatrix}
 A_{11} & \cdots & A_{1m} \\
\vdots & \ddots & \vdots \\
 A_{n1} & \cdots & A_{nm} \\
\end{pmatrix},\quad\mathbf{B}=\begin{pmatrix}
 B_{11} & \cdots & B_{1m} \\
\vdots & \ddots & \vdots \\
 B_{n1} & \cdots & B_{nm} \\
\end{pmatrix},
$$
\\[2ex]
then\\[3.7ex]
$$
(\mathbf{A \mplus B})_{ij} = A_{ij} + B_{ij}.
$$
}

\frame{\frametitle{Matrix multiplication}

If\\[2ex]
$$
\mathbf{A}=\begin{pmatrix}
 A_{11} & \cdots & A_{1m} \\
\vdots & \ddots & \vdots \\
 A_{n1} & \cdots & A_{nm} \\
\end{pmatrix},\quad\mathbf{B}=\begin{pmatrix}
 B_{11} & \cdots & B_{1p} \\
\vdots & \ddots & \vdots \\
 B_{m1} & \cdots & B_{mp} \\
\end{pmatrix},
$$
\\[2ex]
then
$$
(\mathbf{A \mmult B})_{ij} = \sum_{k=1}^m A_{ik} \cdot B_{kj}.
$$
\\[3ex]
Dot product of each $\mathbf{A}$ row and $\mathbf{B}$ column.
\\[3ex]
\pause

\emph{Why}?

}

\frame{\frametitle{Matrix/vector multiplication}

If\\[2ex]
$$
\mathbf{A}=\begin{pmatrix}
 A_{11} & \cdots & A_{1m} \\
\vdots & \ddots & \vdots \\
 A_{n1} & \cdots & A_{nm} \\
\end{pmatrix},\quad\mathbf{x}=\begin{pmatrix}
 x_1 \\
\vdots \\
 x_m \\
\end{pmatrix},
$$
\\[2ex]
then
$$
(\mathbf{Ax})_{i} = \sum_{k=1}^m A_{ik} \cdot x_k.
$$
}


\frame{\frametitle{Matrix/vector multiplication}

$$
\begin{array}{c}
\begin{pmatrix} A_{1 1} & \cdots & A_{1 m} \\
\vdots & \ddots & \vdots \\
A_{n 1} & \cdots & A_{n m} \end{pmatrix}
\begin{pmatrix}
  x_1\\
  x_2\\
  \vdots\\
  x_n
\end{pmatrix}\\[10ex]
= \\[4ex]
\begin{pmatrix}
 A_{11} \cdot x_1 & + & \cdots & + & A_{1 n} \cdot x_n\\
 \vdots && \ddots && \vdots\\
 A_{m1} \cdot x_1 & + & \cdots & + & A_{mn} \cdot x_n\\
\end{pmatrix}
\end{array}
$$
}

\frame{\frametitle{What's it all about?}
\begin{itemize}
\item 
Matrices transform vectors.\\[4ex]
% \pause
\item 
Matrix addition \emph{adds} transformations:
$$\mathbf{(A \mplus B)\, x} = \mathbf{A\, x + B\, x}$$
% \pause
\item 
Matrix ``multiplication'' \emph{composes} transformations:
$$\mathbf{(A \mmult B)\, x} = \mathbf{A\, (B\, x)}$$
% \pause
\item What kinds of transformations?
\end{itemize}

}

\frame{\frametitle{Linearity}

Linear functions/maps/transformations:

$$
\begin{array}{rcl}
f\,\, (x+y) &=& f\, x + f\, y\\
f\,\, (c \cdot x) &=& c \cdot f\, x
\end{array}
$$

\ 

Equivalently, $f$ preserves \emph{linear combinations}:

$$
f\, (c_1 \cdot x_1+\cdots+c_m \cdot x_m) = c_1 \cdot f\, x_1+\cdots+c_m \cdot f\, x_m
$$

\ 

We'll write ``|f :: a :-* b|''.

}

\frame{\frametitle{Representation}

> data a :-* b where
>   Dot    ::  InnerSpace b =>
>              b -> (b :-* Scalar b)
>   (:&&)  ::  VS3 a c d =>  -- vector spaces with same scalar field
>              (a :-* c) -> (a :-* d) -> (a :-* c :* d)

\vspace{1ex}

Generalized algebraic data type (GADT).

}

\frame{\frametitle{Semantics}

Representation:

> data a :-* b where
>   Dot    ::  InnerSpace b  => b -> (b :-* Scalar b)
>   (:&&)  ::  VS3 a c d     => (a :-* c) -> (a :-* d) -> (a :-* c :* d)

Semantics:

> apply :: (a :-* b) -> (a -> b)
> apply (Dot b)    = dot b
> apply (f :&& g)  = apply f &&& apply g

where

> (f &&& g) a = (f a, g a)

}

\frame{\frametitle{Adding linear maps}

Addition:

> (^+^) :: (a :-* b) -> (a :-* b) -> (a :-* b)

\vspace{1ex}

Specification: 

> apply (f ^+^ g) == apply f ^+^ apply g

\vspace{1.5ex}

where, on functions,

> p ^+^ q  == \ x -> p x ^+^ q x
>          == add . (p &&& q)

}

\frame{\frametitle{Deriving addition}

\begin{center}
\fbox{\begin{minipage}[t]{0.35\textwidth}

>     apply (Dot b ^+^ Dot c)
> ==  dot b ^+^ dot c
> ==  dot (b ^+^ c)
> ==  apply (Dot (b ^+^ c))

\end{minipage}}
\fbox{\begin{minipage}[t]{0.5\textwidth}

>     apply ((f :&& g) ^+^ (h :&& k))
> ==  (apply f &&& apply g) ^+^ (apply h &&& apply k)
> ==  (apply f ^+^ apply h) &&& (apply g ^+^ apply k)
> ==  apply ((f ^+^ h) :&& (g ^+^ k))

\end{minipage}}
\end{center}

Other two cases don't type-check.\\[2ex]

Uses (on functions):

> (f &&& g) ^+^ (h &&& k) == (f ^+^ h) &&& (g ^+^ k)

Proof:

> ((f &&& g) ^+^ (h &&& k)) x  == (f x, g x) ^+^ (h x, k x)
>                              == (f x ^+^ h x, g x ^+^ k x)
>                              == ((f ^+^ h) &&& (g ^+^ k)) x

}

\frame{\frametitle{Composing linear maps}

Composition:

> (.@) :: (b :-* c) -> (a :-* b) -> (a :-* c)

\vspace{2ex}

Specification:

> apply (g .@ f) == apply g . apply f

\vspace{2ex}

where, on functions,

> q . p == \ x -> q (p x)

% > (q . p) x == q (p x)


}

\frame{\frametitle{Deriving composition}

Two constructors, four cases.
First two:
\begin{center}
\fbox{\begin{minipage}[t]{0.4\textwidth}

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
\frame{\frametitle{Deriving composition}

Other two cases:
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
> (k *** h) . (p &&& q)  == k . p &&& h . q
>
> add . (p &&& q)        == p ^+^ q
>
> apply (f ^+^ g)        == apply f ^+^ apply g

\out{
Implementation:

>  Dot s      .@ Dot b      = Dot (s *^ b)
>  Dot (a,b)  .@ (f :&& g)  = Dot a .@ f ^+^ Dot b .@ g

}
}

\frame{\frametitle{Reflections}

\begin{minipage}[c]{0.6\textwidth}
\begin{itemize}

\item Specify via semantic function.\vspace{2ex}
\item Derive implementation.\vspace{2ex}
\item Look for an elegant \emph{what} behind a familiar \emph{how}.

\out{
\vspace{3ex}
More examples: \href{http://conal.net/papers/type-class-morphisms/}{\emph{Denotational design with type class morphisms}}.
}

\end{itemize}
\end{minipage}
\begin{minipage}[c]{0.35\textwidth}
\wfig{2in}{rabbit-reflection}
\end{minipage}
}

\end{document}


%% ------------------ Junk
