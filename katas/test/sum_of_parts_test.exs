defmodule SumOfPartsTest do
  use ExUnit.Case

  alias Katas.SumOfParts

  test "returns 0 if list empty" do
    assert SumOfParts.solve([]) == [0]
  end

  test "solves correctly" do
    assert SumOfParts.solve([1, 2, 3, 4, 5, 6]) == [21, 20, 18, 15, 11, 6, 0]
    assert SumOfParts.solve([744125, 935, 407, 454, 430, 90, 144, 6710213, 889, 810, 2579358]) == [10037855, 9293730, 9292795, 9292388, 9291934, 9291504, 9291414, 9291270, 2581057, 2580168, 2579358, 0]
  end

  test "returns error if list was not passed" do
    assert SumOfParts.solve(%{}) == :error
  end
end
