#' Checking valid user input for gomoku_play
#'
#' @param board_size a numeric variable of either 19 (default) or 15, indicating whether to restrict X and Y coordinates inputs for a 19x19 (default) or 15x15 board for playing the board game
#'
#' @return a vector of two integers indicating the location of the tile to be placed
#' @export
#'
#' @examples gomoku_input(board_size = 19), gomoku_input(board_size = 15)
gomoku_input <- function(board_size) {


    input <- as.integer(readline(prompt = "Enter coordinate of tile: "))

    # Check that the user put in an actual number (as.integer would coerce it to NA otherwise)
    if (is.na(input)) {
        message("That is not a valid input. Please select whole numbers between 1 and ", board_size, ".")
        return(gomoku_input(board_size))
    }
    # Check that the move is within the confines of the board
    if (!(input %in% 1:board_size)) {
        message("That value is not on this board. Please select whole numbers between 1 and ", board_size, ".")
        return(gomoku_input(board_size))
    }

    else {
        return(input)
    }



}
