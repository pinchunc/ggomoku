# Play the game
gomoku_winner <- function(rle_output) {
    if (5 %in% rle_output$lengths) {
        winner_list <- rle_output$values[which(rle_output$lengths == 5)]}
    else {winner_list <- NA}
    return(winner_list)
}
