
# This function does several things
# It asks the user for new values
# It plots those values onto the ggplot
# It also adds these values onto a matrix which is used to evaluate victory

gomokuPlay <- function(board) {

  require(ggplot2)

  # Initializing matrix for checking victory
  matrix <- matrix(nrow = nrow(board$data), ncol = nrow(board$data))

  # Black goes first
  color <- "black"

  # The turns will alternate between each player so they each have 60 moves
  for (i in 1:120) {

    # Printing the newest stage of the board.
    print(board)

    # Prompting user for coordinates to plot on the graph and also to add to the matrix
    tile_x <- as.numeric(readline(prompt = "Enter x coordinate of tile. "))
    tile_y <- as.numeric(readline(prompt = "Enter y coordinate of tile. "))

    # Check that the piece is not already on the matrix
    #try(is.na(matrix[tile_x, tile_y]), silent = FALSE)
    if (!is.na(matrix[tile_x, tile_y])) {
      message("There is already a piece on this tile. Please select different coordinates.")
      next
    }

    # Adds piece to the plotted grid
    board <- board + annotate("point", x = tile_x, y = tile_y, size = 5, colour = color)

    # plot the new board
    print(board)

    # Adds piece to the matrix
    matrix[tile_x, tile_y] <- color

    # Check for victory based on the matrix

    # Returns message stating whose turn it is to move.
    if (color == "white") {
      message("It is black's turn to move.")
      color <- "black"
    }

    else {
      message("It is white's turn to move.")
      color <- "white"
    }

    if (i == 120) {
      message("Both players are out of moves.")
    }

  }

}

### Need to add a key to stop the game by the users
