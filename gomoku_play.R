
# This function does several things
# It asks the user for new values
# It plots those values onto the ggplot
# It also adds these values onto a matrix which is used to evaluate victory

gomoku_play <- function(board) {
  require(ggplot2)

  # Initializing matrix for checking victory
  board_size <- nrow(board$data)
  matrix <- matrix(nrow = board_size, ncol = board_size)

  # Black goes first
  color <- "black"

  # The turns will alternate between each player so they each have 60 moves
  for (i in 1:120) {

    # Printing the newest stage of the board.
    print(board)

    # Prompting user for coordinates to plot on the graph and also to add to the matrix
    tile_x <- as.numeric(readline(prompt = "Enter x coordinate of tile. "))
    tile_y <- as.numeric(readline(prompt = "Enter y coordinate of tile. "))

    # Checking if piece is already on the board, and prompts for retry if so
    if (!is.na(matrix[(board_size + 1) - tile_y, tile_x])) {
      beep(sound = 7, expr = NULL)
      message("There is already a piece on this tile. Please select different coordinates.")
      next
    }

    # Adds piece to the matrix, which is set up to match the grid
    matrix[(board_size + 1) - tile_y, tile_x] <- color

    # Adds piece to the plotted grid
    board <- board + annotate("point", x = tile_x, y = tile_y, size = 6.5, colour = color)

    # Adding move number to each tile depending on color
    # even numbered moves are white (2, 4, 6 ...)
    if ((i %% 2) == 0) {
      message("Adding text to the board for white tile.")
      board <- board +
        annotate("text", x = tile_x, y = tile_y,
                 label = as.character(i / 2), color = "white", parse = TRUE)
    }
    # odd numbered moves are black (1, 3, 5, ...)
    else {
      message("Adding text to the board for black tile.")
      board <- board +
        annotate("text", x = tile_x, y = tile_y,
                 label = as.character((i + 1) / 2), color = "black", parse = TRUE)
    }

    # plot the new board
    print(board)
    # Sound effect for placing tile
    beep(sound = 10, expr = NULL)

    # Check for victory based on the matrix (nobody can win before the 9th move)
    winner <- gomokuVictory(matrix)
    if (!is.na(winner)) {
      # Sound effect for winner
      beep(sound = 3, expr = NULL)
      message("The winner is ", winner, "!")
      break
    }

    # Returns message stating whose turn it is to move (assuming there is no winner)
    if (color == "white") {
      message("It is black's turn to move.")
      color <- "black"
    }

    else {
      message("It is white's turn to move.")
      color <- "white"
    }

    if (i == 120) {
      stop("Both players are out of moves.")
    }
  }
}

### Need to add a key to stop the game by the users
### Need to resolve the situation when X or Y inputs are missing
### Need to resolve the situation when X or Y inputs are out of the required range
