library(ggplot2)
library(grid)

gomokuBoard <- function(board_size = 19) {

  # loading package dependencies (if necessary)
  require(ggplot2)

  # (Re)initializing the number of tiles each player has (60)
  white_tiles <- 60
  black_tiles <- 60
  moves <- rep(c("black", "white"), 120)


  tile_color <- c("white","black")
  i = 1
  board_size <- board_size

  # Initializing data.frame for board
  df <- data.frame(x = 1:board_size, y = 1:board_size)

  # Drawing board
  background <- ggplot(df) +
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
      breaks = seq(1, board_size, by = 1),
      minor_breaks = seq(1, board_size, 1)
    ) +
    scale_y_continuous(
      breaks = seq(1, board_size, by = 1),
      minor_breaks = seq(1, board_size, 1)
    )

  message("Both players have 60 tiles. Now you may begin playing Gomoku. Black is the first to move.")

  # Calling the board object
  background

}

gomokuBoard(19)
