defmodule TextToCoords do
  def parse_text(filename) do
    File.stream!(filename)
    |> Stream.with_index
    |> Stream.flat_map(&locate_points/1)
    |> Enum.to_list
  end

  defp locate_points({line, y_position}) do
    String.graphemes(line)
    |> Stream.with_index
    |> Stream.filter(fn {char, _index} -> String.upcase(char) == "X" end)
    |> Stream.map(fn {_char, x_position} -> {x_position, y_position} end)
    |> Enum.to_list
  end
end