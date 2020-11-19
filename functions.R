library(tidyverse)

# Draws the board
gomoku.board <- function(size, color) {

    require(ggplot2)

    if (missing(size))
        stop("Size must be specified ")

    df <- data.frame(x = 1:size, y = 1:size)
    # Choose whether the board is 15x15 or 19x19

}






# Places a piece
gomoku.move <- function(x, y, color) {

    # checking missing arguments
    if (missing(x))
        stop("Need to specify x-coordinate of the move.")

    if (missing(y))
        stop("Need to specify y-coordinate of the move.")

    if (missing(color))
        stop("Need to specify whether you are placing a black or white piece.")

    # if color = black
    #

    }

# Checks for victory
gomuku.victory <- function() {

    #if (missing())

    paste0(color, "has won.", sep = "")

    }


# Binary values in a matrix (1 = white, 0 = black)
# Cannot place a piece where there already is a piece (is.na())
# Cannot place two of the same color in a row.

