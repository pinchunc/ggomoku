
gomokuMove <- function(new_tile_x, new_tile_y) {

    #
    tile_color <- "black"
    i = 1

    # background is loaded from the gomoku_board() function
    # each iteration
    background +
        geom_point(aes(new_tile_x, new_tile_y), size = 5, colour = tile_color) #alternate color

    tile_color + 1

    # Deducting a piece from the player who just conducted the move
    if (tile_color = "white") {
        white_tiles <- white_tiles - 1
        message("White has ", white_tiles, "remaining.")
    }
    else {
        black_tiles <- black_tiles - 1
        message("Black has ", black_tiles, "remaining.")
    }

    if (white_tiles == 0) {
        stop("White has no more tiles remaining.")

    }

    if (black_tiles == 0) {
        stop("Black has no more tiles remaining.")
    }

}





