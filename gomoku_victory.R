gomoku_victory <- function(matrix) {
  require(purrr)
  # Pull out a column or a row from the matrix as a vector
  winner <- NA

  # checking for winner on rows
  if (is.na(winner)) {
    rows <- apply(matrix, MARGIN = 1, FUN = rle)
    for (i in 1:nrow(matrix)) {
      if (5 %in% rows[[i]]$lengths) {
        winner <- rows[[i]]$values[which(rows[[i]]$lengths == 5)]
        break
      }
      else {
        next
      }
    }
  }
  else {
    return(winner)
    }

  # checking for winner on columns
  if (is.na(winner)) {
    cols <- apply(matrix, MARGIN = 2, FUN = rle)
    for (i in 1:nrow(matrix)) {
      if (5 %in% rows[[i]]$lengths) {
        winner <- rows[[i]]$values[which(rows[[i]]$lengths == 5)]
        break
      }
      else {
        next
      }
    }
  }
  else {
    return(winner)
  }

  # checking for winner on diagonals
  # split the matrix to get diagonals
  if (is.na(winner)) {
    d <- row(matrix) - col(matrix)
    diags_num <- split(matrix, d)
    diags_rle <- lapply(diags_num, FUN = rle)
    winner_list <- map(diags_rle, gomoku_winner)
    if ('white' %in% winner_list){
      winner <- "white"
    }
    else if ('black' %in% winner_list){
      winner <- "black"
    }
    else {
      winner <- NA
    }
  }
  else {
    return(winner)
  }

  # split the matrix to get reverse diagonals
  if (is.na(winner)) {
    r <- row(matrix) + col(matrix)
    rev_diags_num <- split(matrix, r)
    rev_diags_rle <- lapply(rev_diags_num, FUN = rle)
    winner_list <- map(rev_diags_rle, gomoku_winner)
    if ('white' %in% winner_list){
      winner <- "white"
    }
    else if ('black' %in% winner_list){
      winner <- "black"
    }
    else {
      winner <- NA
    }
  }
  else {
    return(winner)
  }
}
