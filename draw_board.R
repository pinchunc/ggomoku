library(ggplot2)
library(grid)

new_tile_x <- 3
new_tile_y <- 6

board_size <- 19
tile_color <- c("white","black")
i = 1

df <- data.frame(x = 1:board_size, y = 1:board_size)

back <- ggplot(df) +
  geom_point(aes(x, y), size = 5, alpha = 0) + 
  theme(
    aspect.ratio = 1,
    axis.ticks = element_line(colour = "black", size = 1),
    panel.grid.major = element_line(colour = "black"),
    panel.grid.minor = element_line(size = 1, colour="black"),
    panel.background = element_rect(fill = "#D2B48C"),
    panel.ontop = FALSE) + 
  scale_x_continuous(breaks= seq(1,  board_size, by=1),
                     minor_breaks = seq(1, board_size, 1)) + 
  scale_y_continuous(breaks= seq(1,  board_size, by=1),
                     minor_breaks = seq(1, board_size, 1))


#each iteration
back +
  geom_point(aes(new_tile_x, new_tile_y), size = 5, colour = tile_color[i]) #alternate color

