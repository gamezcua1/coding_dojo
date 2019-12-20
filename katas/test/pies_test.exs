defmodule PiesTest do
  use ExUnit.Case
  
  test "solve correctly" do
    assert Katas.Pies.solve([10, 14, 10, 42, 24]) == [3, 0]
    assert Katas.Pies.solve([12, 4, 40, 30, 40]) == [5, 3]
    assert Katas.Pies.solve([12, 14, 20, 42, 24]) == [5, 1]
  end

end
