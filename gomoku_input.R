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

    return(as.integer(input))

}
