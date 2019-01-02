defmodule TextToCoordsTest do
  use ExUnit.Case

  describe "parse_text/1" do
    test "returns a list of coordinates for each X char" do
      assert TextToCoords.parse_text(Path.expand("test/fixtures/valid.txt")) == [
               {0, 0},
               {1, 0},
               {2, 1},
               {3, 1}
             ]
    end

    test "returns an empty list when there are no x characters" do
      assert TextToCoords.parse_text(Path.expand("test/fixtures/invalid.txt")) == []
    end
  end
end
