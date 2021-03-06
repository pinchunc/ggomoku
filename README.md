# ggomoku

# Overview
The `ggomoku` package allows you to play the board game Gomoku within R. It does so by plotting the board using the `ggplot2` package upon which it depends. To play the game, run `gomoku_play(gomoku_board())`.

# Background
_Gomoku_ (also known as _Five in a Row_) is a 2-player game where one player uses white tiles and the other uses black tiles. The game is played on a 15x15 or 19x19 squared board, similar to Go. 

Each player has 60 tiles that they take turns placing on the intersections of the grid. Each player's goal is to place an unbroken row of five tiles of their own color either horizontally, vertically, or diagonally. 

# Usage
First an empty board must be drawn with the `gomoku_board(board_size)` function. The `board_size` argument creates a Gomoku board of _n x n_ dimensions where _n_ = `board_size`. This argument defaults to 19x19, the standard Gomoku board. It also accepts `board_size = 15` as an alternative value.

`gomoku_play()` takes the empty `ggplot` object from `gomoku_board()` and initiates the game by starting with Black, prompting them for a move, then alternating between Black and White until either player wins, or if both players run out of turns, resulting in a stalemate. It also takes the argument `show_moves` which defaults to `FALSE`; setting this to `TRUE` adds numbers to each tile corresponding to the turn in which it was placed.

Within `gomoku_play()` there is a nested function `gomoku_victory()` which takes as an input the matrix that corresponds to the players' moves. It evaluates the entire board looking for a win condition every time a new piece is placed, it does this using a function that is itself nested called `gomoku_winner()` which is mapped across the entire matrix. When a player wins, a victory message will be printed by the console, along with an accompanying victory sound effect.

# Rules

* Black goes first.
* A tile of the same color cannot be added twice in a row.
* A tile cannot replace an existing tile on the board. 
* A tile must be placed withing the range of the board (a whole number between 1 and the board size).
* The game breaks when consecutive two invalid inputs occur (i.e. NAs, decimals, or numbers greater than the board size).
* In keeping with "standard" Gomoku, one must have _exactly_ 5 tiles in a row to win, greater than 5 does not count. 

# Optional ("house") Rules
Players can opt to follow the following rules to make the game more fair, as Black has a significant advantage by virtue of being able to move first.

* The rule of **three and three** bans a move that simultaneously forms two open rows of three tiles i.e. two rows that are not blocked at either end.
* The rule of **four and four** bans a move that simultaneously forms two rows of four open tiles (open or otherwise).

