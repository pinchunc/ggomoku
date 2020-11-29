#' @name gomoku_board
#' @title Create a new gomoku_board
#' @description gomoku_board() draws a 19x19 (default) or 15x15 board for playing the board game Gomoku.
#' @param board_size The dimensions of the board, to be n x n where n = board_size. Defaults to the standard Gomoku board size of 19x19, but also accepts 15 as an alternative.
#'
#' @return A ggplot2 object of a board corresponding to the size specified by the user.
#' @export
#' @import ggplot2
#' @author Pin-Chun Chen and J Steven Raquel
#' @examples # Both of these function generate a 19x19 Gomoku board
#' gomoku_board(19)
#' gomoku_board()
#'
#' # Generates a 15x15 Gomoku board
#' gomoku_board(15)
gomoku_board <- function(board_size = 19) {

  if (board_size == 15) {
    board_size <- 15
  }
  else if (board_size == 19) {
    board_size <- 19
  }
  else {
    stop("board_size argument must be set to 19 (default) or 15.")
  }


  # Initializing data.frame for board
  df <- data.frame(x = 1:board_size, y = 1:board_size)

  # Plotting the initial board
  # Drawing board
  board <- suppressMessages(
    print(
      ggplot(df) +
    geom_point(aes(x, y), size = 5, alpha = 0) +
    theme(
      aspect.ratio = 1,
      axis.ticks = element_line(colour = "black", size = 1),
      panel.grid.major = element_line(colour = "black"),
      panel.grid.minor = element_line(size = 1, colour = "black"),
      panel.background = element_rect(fill = "#D2B48C"),
      panel.ontop = FALSE
    ) +
    scale_x_continuous(
      breaks = seq(1, nrow(df), by = 1),
      minor_breaks = seq(1, nrow(df), 1)
    ) +
    scale_y_continuous(
      breaks = seq(1, nrow(df), by = 1),
      minor_breaks = seq(1, nrow(df), 1)
    ) +
    scale_x_continuous(
      breaks = seq(1, nrow(df), by = 1),
      minor_breaks = seq(1, nrow(df), 1),
      sec.axis = dup_axis()
    ) +
    scale_y_continuous(
      breaks = seq(1, nrow(df), by = 1),
      minor_breaks = seq(1, nrow(df), 1),
      sec.axis = dup_axis()
    ) +
    ggtitle("Black's Move", subtitle = "Move 1/60")
  )
)
  message("Both players have 60 tiles. Black is the first to move.")

  # Plotting the board
  return(board)
}

