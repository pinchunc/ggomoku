# ggomoku

# Overview
This package allows you to play the board game Gomoku within R. It does so by plotting the board using `ggplot2` and the players can continue to add to the "board" until one of them is declared a winner.

# Rules of Gomoku
_Gomoku_ (also known as _Five in a Row_) is a 2-player game where one player uses white tiles and the other uses black tiles. The game is played on a 15x15 or 19x19 squared board, similar to Go. 

Each player has 60 tiles that they take turns placing on the intersections of the grid. Each player's goal is to place an unbroken row of five tiles of their own color either horizontally, vertically, or diagonally. 

# Installation


# Usage
First an empty board must be drawn with the `gomoku.board(board_size)` function, which takes a value of at least 15 (as typical Gomoku board is either 15x15 or 19x19).

Then players alternately place their pieces with the `gomoku.move(tile_color, x, y)` where `tile_color` takes values of either black or white to correspond to the respective player, and the `x` and `y` coordinates corresponding to where on the board their piece will be placed. 

# Rules

* A tile of the same color cannot be added twice in a row.
* A tile can't replace an existing tile on the board. 
