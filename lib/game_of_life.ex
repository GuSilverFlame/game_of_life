defmodule GameOfLife do
  def main(points) do
    Grid.start_link({85, 40}, points)

    loop(0)
  end

  defp loop(acc, function \\ &loop_behavior/1) do
    loop(function.(acc))
  end

  defp loop_behavior(acc) do
    %{living: lives, limit: {lim_x, lim_y}} = Grid.get_grid()

    output =
      for grid_y <- 0..lim_y, grid_x <- 0..lim_x do
        cell_char = if Enum.member?(lives, {grid_x, grid_y}), do: "▤", else: "█"
        cell_char <> if grid_x == lim_x, do: "\n", else: ""
      end
      |> Enum.join("")
    
    IO.puts(IO.ANSI.clear())
    IO.puts(acc)
    IO.puts(output)
    Grid.update_grid(&Grid.CellStates.find_life/2)
    :timer.sleep(50)
    acc + 1
  end
end
#a = TextToCoords.parse_text("./test.txt") ++ TextToCoords.parse_text("./test2.txt") ++ TextToCoords.parse_text("./test3.txt") |> Enum.uniq
#GameOfLife.main(a)
#GameOfLife.main(TextToCoords.parse_text("./test6.txt"))