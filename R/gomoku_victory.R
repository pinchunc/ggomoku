#' Checking for a winner of Gomoku across rows, columns and diagonals
#'
#' @param matrix
#'
#' @return
#' @export
#' @importFrom purrr map
#' @examples gomoku_victory(matrix)
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
