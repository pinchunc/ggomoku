
# This function does several things
# It asks the user for new values
# It plots those values onto the ggplot
# It also adds these values onto a matrix which is used to evaluate victory

gomoku_play <- function(board, show_moves = FALSE) {
  require(ggplot2)
  require(beepr) # for the beep() function
  require(dendextend) # for the function is.natural.number()

  # Initializing matrix for checking victory
  board_size <- nrow(board$data)
  matrix <- matrix(nrow = board_size, ncol = board_size)

  # Black goes first
  color <- "black"

  # The turns will alternate between each player so they each have 60 moves
  for (i in 1:120) {

    # Message to print the move number for diagnostics
    message("This is move number ", i, " on the board.")

    if ((i %% 2) == 0) {
      message("It is white's move number ", i - 1, ".")
    }
    else {
      message("It is black's move number ", (i + 1) / 2, ".")
    }

    # Printing the newest stage of the board.
    print(board)

    # Prompting user for coordinates to plot on the graph and also to add to the matrix
    # They should only enter whole numbers between 1 and the maximum board size
    tile_x <- as.numeric(readline(prompt = "Enter x coordinate of tile. "))
    tile_y <- as.numeric(readline(prompt = "Enter y coordinate of tile. "))


    # Check that the user put in a natural number for both
    if (is.natural.number(tile_x) | is.natural.number(tile_y)) {
      # Then check that the move is within the confines of the board
      if (tile_x > board_size | tile_y > board_size) {
        message("That is not a valid input for this board size. Please select whole numbers between 1 and ", board_size, ".")
        message("Trying to change value of i: ", i)
        i <- i - 2
        message("'New' value of i: ", i)
        next
      }
      # Then that the move has not already taken place on the board
      if (!is.na(matrix[(board_size + 1) - tile_y, tile_x])) {
        message("There is already a piece on this tile. Please select different coordinates.")
        message("Trying to change value of i: ", i)
        i <- i - 2
        message("'New' value of i: ", i)
        next
      }
    }
    # If the number is not a natural number, let them try again
    else {
      message("This is not a valid input. Please select whole numbers between 1 and ", board_size, ".")
      i <- i - 2
      next
    }

    # Adds piece to the matrix, which is set up to match the grid
    matrix[(board_size + 1) - tile_y, tile_x] <- color

    # Adds piece to the plotted grid
    board <- board + annotate("point", x = tile_x, y = tile_y, size = 6.5, colour = color)

    # Showing move numbers if user selects show_moves = TRUE
    if (show_moves == TRUE) {
      # Adding move number to each tile depending on color
      # even numbered moves are white (2, 4, 6 ...)
      if ((i %% 2) == 0) {
        board <- board +
          annotate("text",
            x = tile_x, y = tile_y,
            label = as.character(i / 2), color = "black", parse = TRUE
          )
      }
      # odd numbered moves are black (1, 3, 5, ...)
      else {
        board <- board +
          annotate("text",
            x = tile_x, y = tile_y,
            label = as.character((i + 1) / 2), color = "white", parse = TRUE
          )
      }
    }

    # plot the new board
    print(board)
    # Sound effect for placing tile
    # beep(sound = 10, expr = NULL)

    # Check for victory based on the matrix (nobody can win before the 9th move)
    winner <- gomoku_victory(matrix)
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
