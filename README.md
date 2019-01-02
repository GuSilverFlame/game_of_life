# The Game Of Life

this is a reproduction of [conway's game of life](https://en.wikipedia.org/wiki/Game_of_Life),
a really simple cellular automaton and a zero player game, in Elixir.
the rules of this game are simple, we have a grid of cells that can be either dead or alive, each cell operates on the following behavior:
  1. a living cell with less than two neighbors dies
  2. a living cell with two or three neighbors stays alive
  3. a living cell with 4 or more neighbors dies
  4. a dead cell with exactly 3 neighbors is replaced with a living one

in this scenario a neighbor is considered any living cell that's directly adjacent to the current cell in the grid, diagonally, vertically or horizontally

