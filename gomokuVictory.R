
# test matrix
matrix <- matrix(nrow = 19, ncol = 19)

# Assigning a test vector to one row and one column of the matrix
test <- c("black", "white", "white", "white", "white", "white", "black")
matrix[1, 2:8] <- test # first row, second column
matrix[2:8, 1] <- test # first column, second row
diag(matrix)[1:7] <- test
revdiag(matrix)[1:7] <- test

gomokuVictory <- function(matrix) {
  require(lava)
  # Pull out a column or a row from the matrix as a vector
  winner <- NA
  # checking for winner on rows
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

  # checking for winner on columns
  cols <- apply(matrix, MARGIN = 2, FUN = rle)

  for (j in 1:ncol(matrix)) {
    if (5 %in% cols[[j]]$lengths) {
      winner <- cols[[j]]$values[which(cols[[j]]$lengths == 5)]
      break
    }
    else {
      next
    }
  }

  # checking for winner on diagonals
  # center diagonals
  diags <- rle(diag(matrix))
  if (5 %in% diags$lengths) {
    winner <- diags$values[which(diags$lengths == 5)]
  }
  # center reverse diagonals
  revs <- rle(revdiag(matrix))
  if (5 %in% revs$lengths) {
    winner <- revs$values[which(revs$lengths == 5)]
  }
  
  return(winner)
}

# Play the game

gomokuPlay(gomokuBoard())
