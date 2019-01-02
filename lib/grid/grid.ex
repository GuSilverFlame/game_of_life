defmodule Grid do
  def start_link(limit, original_living_cells \\ [{1, 2}, {2, 2}, {3, 2}]) do
    Agent.start_link(fn -> %{living: original_living_cells, limit: limit} end, name: __MODULE__)
  end

  def update_grid(life_function \\ fn live, _ -> live end) do
    Agent.update(__MODULE__, fn grid ->
      %{living: life_function.(grid.living, grid.limit), limit: grid.limit}
    end)
  end

  def get_grid(_), do: get_grid()

  def get_grid() do
    Agent.get(__MODULE__, fn grid -> grid end)
  end
end
