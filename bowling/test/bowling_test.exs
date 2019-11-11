defmodule BowlingTest do
  use ExUnit.Case
  doctest Bowling

  alias Bowling.Game

  test "normal game" do
    game = 
      %Game{}
      |> Game.roll([1, 4])
      |> Game.roll([4, 5])
      |> Game.roll([6])
      |> Game.roll([5])
      |> Game.roll([])
      |> Game.roll([0, 1])
      |> Game.roll([7])
      |> Game.roll([6])
      |> Game.roll([])
      |> Game.roll([2, nil])

    assert Bowling.hello() == :world
  end
end
