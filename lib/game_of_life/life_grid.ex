defmodule GameOfLife.LifeGrid do
  def find_life(last_known_lives, {lim_x, lim_y}) do
    for grid_x <- 0..lim_x, grid_y <- 0..lim_y do
      {grid_x, grid_y}
    end
    |> Enum.map(fn cell -> count_neighbors(cell, last_known_lives) end)
    |> Enum.filter(fn {{x, y}, _} -> x in 0..lim_x && y in 0..lim_y end)
    |> Enum.filter(&alive?(&1, last_known_lives))
    |> Enum.map(fn {life, _} -> life end)
  end

  defp count_neighbors(cell = {x, y}, last_known_lives) do
    living_neighbors =
      for neigh_x <- (x - 1)..(x + 1), neigh_y <- (y - 1)..(y + 1) do
        {neigh_x, neigh_y}
      end
      |> Enum.filter(fn possible_neighbor ->
        Enum.member?(last_known_lives, possible_neighbor) && possible_neighbor != cell
      end)
      |> Enum.count()

    {cell, living_neighbors}
  end

  defp alive?({cell, living_neighbors}, last_known_lives) do
    (Enum.member?(last_known_lives, cell) && living_neighbors < 4 && living_neighbors > 1) ||
      living_neighbors == 3
  end
end
