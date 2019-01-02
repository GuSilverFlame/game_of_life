defmodule Grid.CellStatesTest do
  use ExUnit.Case

  alias Grid.CellStates

  @test_limits {5, 5}

  describe "find_life" do
    test "nothing changes if all cells in `last_known_lives` have two or three neighbors" do
      original_state = [{1, 1}, {1, 2}, {2, 1}, {2, 3}, {3, 2}]
      assert CellStates.find_life(original_state, @test_limits) == original_state
    end

    test "cells with less than two neighbors stop living" do
      original_state = [{1, 1}, {2, 1}, {2, 4}]
      assert CellStates.find_life(original_state, @test_limits) == []
    end

    test "cells with more than 3 neighbors stop living and empty cells with 3 neighbors start living" do
      original_state = [{1, 2}, {2, 1}, {2, 2}, {2, 3}, {3, 2}]
      expected_state = [{1, 1}, {1, 2}, {1, 3}, {2, 1}, {2, 3}, {3, 1}, {3, 2}, {3, 3}]
      assert CellStates.find_life(original_state, @test_limits) == expected_state
    end
  end
end
