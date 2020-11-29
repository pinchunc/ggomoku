\name{gomoku_victory}
\alias{gomoku_victory}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Checking for a winner of the Gomoku game
}
\description{
This function is designed not to be called directly but to be used within the gomoku_play() function where it maps the nested function gomoku_winner() to all rows, columns and diagonals of the game board in order to detect a winner.
}
\usage{
gomoku_victory(matrix)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{matrix}{
This input matrix is the matrix completed by the user input given by gomoku_input(), which is itself called by gomoku_play(). It mirrors exactly the board drawn by ggplot2.
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
Pin-Chun Chen & J Steven Raquel
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x)
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
