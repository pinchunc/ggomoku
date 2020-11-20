# ggomoku

# Overview
The `ggomoku` package allows you to play the board game Gomoku within R. It does so by plotting the board using the `ggplot2` package upon which it depends.

# Background
_Gomoku_ (also known as _Five in a Row_) is a 2-player game where one player uses white tiles and the other uses black tiles. The game is played on a 15x15 or 19x19 squared board, similar to Go. 

Each player has 60 tiles that they take turns placing on the intersections of the grid. Each player's goal is to place an unbroken row of five tiles of their own color either horizontally, vertically, or diagonally. 

# Usage
First an empty board must be drawn with the `gomokuBoard(board_size)` function. The `board_size` argument creates a Gomoku board of _n x n_ dimensions where _n_ = `board_size`. This argument defaults to 19x19, the standard Gomoku board.

`gomokuPlay()` takes the empty `ggplot` object from `gomokuBoard()` and initiates the game by starting with Black, prompting them for a move, then alternating between Black and White until either player wins, or if both players run out of turns, resulting in a stalemate.

# Rules

* Black goes first.
* A tile of the same color cannot be added twice in a row.
* A tile cannot replace an existing tile on the board. 

# Optional ("house") Rules
Players can opt to follow the following rules to make the game more fair, as Black has a significant advantage by virtue of being able to move first.

* **Free-style** requires a row of _at least_ five tiles to win.
* **Standard** requires a row of _exactly_ five tiles to win.

* The rule of **three and three* bans a move that simultaneously forms two open rows of three tiles i.e. two rows that are not blocked at either end.
* The rule of **four and four** bans a move that simultaneously forms two rows of open tiles (open or otherwise).

