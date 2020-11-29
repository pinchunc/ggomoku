#' @name gomoku_victory
#' @title Checking for a winner of the Gomoku game
#' @description This function is designed not to be called directly but to be used within the gomoku_play() function where it maps the nested function gomoku_winner() to all rows, columns and diagonals of the game board in order to detect a winner.
#' @param matrix This input matrix is the matrix completed by the user input given by gomoku_input(), which is itself called by gomoku_play(). It mirrors exactly the board drawn by ggplot2.
#' @usage gomoku_victory(matrix)
#' @return A string containing either "black" or "white", depending on who won, once a winner is found.
#' @author Pin-Chun Chen and J Steven Raquel
#' @export
#' @importFrom purrr map
gomoku_victory <- function(matrix) {

  # Pull out a column or a row from the matrix as a vector
  winner <- NA

  # checking for winner on rows
  if (is.na(winner)) {
    rows_num <- split(matrix, row(matrix))
    rows_rle <- lapply(rows_num, FUN = rle)
    winner_list <- purrr::map(rows_rle, gomoku_winner)
    if (any(!is.na(winner_list))) {
      winner <- winner_list[!is.na(winner_list)]
    }
  }

  # checking for winner on columns
  if (is.na(winner)) {
    cols_num <- split(matrix, col(matrix))
    cols_rle <- lapply(cols_num, FUN = rle)
    winner_list <- purrr::map(cols_rle, gomoku_winner)
    if (any(!is.na(winner_list))) {
      winner <- winner_list[!is.na(winner_list)]
    }
  }

  # checking for winner on diagonals
  # split the matrix to get diagonals
  if (is.na(winner)) {
    d <- row(matrix) - col(matrix)
    diags_num <- split(matrix, d)
    diags_rle <- lapply(diags_num, FUN = rle)
    winner_list <- purrr::map(diags_rle, gomoku_winner)
    if (any(!is.na(winner_list))) {
      winner <- winner_list[!is.na(winner_list)]
    }
  }

  # split the matrix to get reverse diagonals
  if (is.na(winner)) {
    r <- row(matrix) + col(matrix)
    rev_diags_num <- split(matrix, r)
    rev_diags_rle <- lapply(rev_diags_num, FUN = rle)
    winner_list <- purrr::map(rev_diags_rle, gomoku_winner)
    if (any(!is.na(winner_list))) {
      winner <- winner_list[!is.na(winner_list)]
    }
  }
  return(winner)
}
