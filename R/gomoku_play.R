
# This function does several things
# It asks the user for new values
# It plots those values onto the ggplot
# It also adds these values onto a matrix which is used to evaluate victory

#' Title
#'
#' @param board the output of the function "gomoku_board", which is a data frame of the ggplot gomoku board
#' @param show_moves a logical variable indicating whether to show the current number of moves on the tiles
#'
#' @return nothing but iterate the game until the 120th move
#' @export
#' @import ggplot2
#' @importFrom beepr beep
#' @importFrom R.utils capitalize
#' @examples gomoku_play(board, show_moves = TRUE)
gomoku_play <- function(board, show_moves = FALSE) {

  # Initializing matrix for checking victory
  board_size <- nrow(board$data)
  matrix <- matrix(nrow = board_size, ncol = board_size)

  # Black goes first
  color <- "black"
  i <- 1

  print(board)

  # The turns will alternate between each player so they each have 60 moves
  while (i <= 120) {

    # Message to print the move number for diagnostics
    message("This is move number ", i, "/120 on the board.")

    if (color == "black") {
      message("It is black's move number ", (i + 1) / 2, "/60.")
    }
    else if (color == "white") {
      message("It is white's move number ", i / 2, "/60.")
    }

    # Prompting user for coordinates to plot on the graph and also to add to the matrix
    # They should only enter whole numbers between 1 and the maximum board size
    message("Enter x coordinate, followed by the y coordinate.")
    tile_x <- gomoku_input(board_size)
    tile_y <- gomoku_input(board_size)

    # Then that the move has not already taken place on the board
    while (!is.na(matrix[(board_size + 1) - tile_y, tile_x])) {
      message("There is already a piece on this tile. Please select different coordinates.")
      tile_x <- gomoku_input(board_size)
      tile_y <- gomoku_input(board_size)
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

    # Check for victory based on the matrix (nobody can win before the 9th move)
    winner <- gomoku_victory(matrix)
    if (!is.na(winner)) {
      # Sound effect for winner
      beepr::beep(sound = 3, expr = NULL)
      message("The winner is ", winner, "!")
      board <- board + ggtitle(paste0("Winner: ", capitalize(winner)))
      break
    }

    # Incrementing the while loop
    i <- i + 1

    if (color == "black") {
      color <- "white"
      board <- board + ggtitle("White's Move",
                               subtitle = paste0("Move ", i / 2, "/60"))
    }
    else {
      color <- "black"
      board <- board + ggtitle("Black's Move",
                              subtitle = paste0("Move ", (i + 1) /2, "/60"))
    }

    # plot the new board
    print(board)

    # When players run out of moves
    if (i == 120) {
      message("Both players are out of moves.")
      break
    }

  }
}

### Need to add a key to stop the game by the users
### Need to resolve the situation when X or Y inputs are missing
### Need to resolve the situation when X or Y inputs are out of the required range
