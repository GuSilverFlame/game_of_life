defmodule GameOfLife do
  alias GameOfLife.{LifeGrid, TextToCoords}

  def start_from_file(path) do
    TextToCoords.parse_file(path) |> start()
  end

  def start_from_text(ascii_grid) do
    TextToCoords.parse_text(ascii_grid) |> start()
  end

  def start(points) do
    {{85, 40}, points}
  end

  def tick({size, points}) do
    {size, LifeGrid.find_life(points, size)}
  end
end
