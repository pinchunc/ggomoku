
# test matrix
matrix <- matrix(1:19^2, nrow = 19, ncol = 19)

# Assigning a test vector to one row and one column of the matrix
test <- c("black", "white", "white", "white", "white", "white", "black")
matrix[1, 2:8] <- test # first row, second column
matrix[2:8, 1] <- test # first column, second row
diag(matrix)[1:7] <- test
diag(matrix[2:8, ])[1:7] <- test
revdiag(matrix)[1:7] <- test
board_size <- nrow(board$data)

gomoku_victory <- function(matrix) {
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

# Play the game
gomoku_winner <- function(rle_output) {
  if (5 %in% rle_output$lengths) {
    winner_list <- rle_output$values[which(rle_output$lengths == 5)]}
  else {winner_list <- NA}
  return(winner_list)
}
