defmodule BowlingTest do
  use ExUnit.Case
  doctest Bowling

  alias Bowling.Game

  test "1" do
    game = 
      %Game{rolls: [4, 3, 5, 2, 4, 6, 1, 2, 10, 2, 4, 0, 1, 3, 5, 6, 3, 10, 7, 1]}
      |> Game.score

    assert game.total_points == 86
  end

  test "2" do
    game = 
      %Game{rolls: [6,2,7,1,10,9,0,8,2,10,10,3,5,7,2,5,5,8]}
      |> Game.score

    assert game.total_points == 140
  end

  test "3" do
    game = 
      %Game{rolls: [9,1,0,10,10,10,6,2,7,3,8,2,10,9,0,9,1,10]}
      |> Game.score

    assert game.total_points == 168
  end

  test "4" do
    game = 
      %Game{rolls: [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6]}
      |> Game.score
    
    assert game.total_points == 133
  end

  test "5" do
    game = 
      %Game{rolls: [10,10,10,10,10,10,10,10,10,10,10,10]}
      |> Game.score

    assert game.total_points == 300
  end

  test "6" do
    game = 
      %Game{rolls: [10,0,10,10,5,0,8,2,9,0,10,8,1,1,0,4,6,10]}
      |> Game.score

    assert game.total_points == 137
  end
end
