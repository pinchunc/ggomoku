\name{gomoku_board}
\alias{gomoku_board}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Create a new gomoku_board
}
\description{
`gomoku_board()` draws a 15x15 or 19x19 board for playing the board game _Gomoku_.
}
\usage{
`gomoku_board(board_size = 19)`
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{board_size}{
    The dimensions of the board, to be _n x n_ where n = board_size. Defaults to the standard Gomoku board size of 19x19, but also accepts 15 as an alternative.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
## The function is currently defined as

# Both of these function generate a 19x19 Gomoku board
gomoku_board()
gomoku_board(19)

# Generates a 15x15 Gomoku board
gomoku_board(15)

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
