defmodule StreetFighterTest do
  use ExUnit.Case
  doctest Katas

  test "returns empty list if list empty passed" do
    assert Katas.StreetFighter.solve([]) == []
  end

  test "solves correctly" do
    assert Katas.StreetFighter.solve(["up", "left", "right", "left", "left"]) == ["Ryu", "Vega", "Ryu", "Vega", "Balrog"]
    assert Katas.StreetFighter.solve(["right", "down", "left", "left", "left", "left", "right"]) == ["E.Honda", "Chun Li", "Ken", "M.Bison", "Sagat", "Dhalsim", "Sagat"]
  end

  test "returns error if list was not passed" do
    assert Katas.StreetFighter.solve(%{}) == :error
  end
end
