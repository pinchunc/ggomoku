gomoku_input <- function() {

    input <- readline(prompt = "Enter x coordinate of tile (integers only): ")

    # Check that the user put in an actual number (as.integer would coerce it to NA otherwise)
    if (is.na(input)) {
        message("That is not a valid input. Please select whole numbers between 1 and ", board_size, ".")
        return(gomoku_input())
    }
    # Check that the move is within the confines of the board
    if (input > board_size) {
        message("That value is not on this board. Please select whole numbers between 1 and ", board_size, ".")
        return(gomoku_input())
    }

    return(as.integer(input))

}
