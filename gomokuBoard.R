library(ggplot2)
library(grid)

# Function that creates a new game of Gomoku
gomokuBoard <- function(board_size = 19) {

  require(ggplot2)
  require(grid)

  # Assigning board size (if not 19)
  board_size <- board_size

  # Initializing data.frame for board
  df <- data.frame(x = 1:board_size, y = 1:board_size)

  # Plotting the initial board
  # Drawing board
  board <- ggplot(df) +
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
    )

  message("Both players have 60 tiles. Black is the first to move.")

  # Plotting the board
  return(board)

}
