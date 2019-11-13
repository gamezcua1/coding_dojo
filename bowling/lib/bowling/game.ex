defmodule Bowling.Game do
  defstruct rolls: [], total_points: 0, frame: 0
  
  alias Bowling.Game

  def roll(%Game{rolls: rolls} = game, pins) do
    %Game{game | rolls:  rolls ++ [pins]}
  end

  def score(%Game{frame: frame} = game) when frame == 10, do: game

  def score(%Game{rolls: []} = game), do: game

  # is strike 
  def score(%Game{rolls: [ball, ball1, ball2 |rolls]} = game) when ball == 10 do
    %Game{rolls: [ball1, ball2 |rolls], 
          total_points: game.total_points + 10 + ball1 + ball2, 
          frame: game.frame + 1}
    |> score
  end
  
  # is spare
  def score(%Game{rolls: [ball, ball1, ball2 |rolls]} = game) when ball + ball1 == 10 do
    %Game{rolls: [ball2 |rolls], 
          total_points: game.total_points + 10 + ball2, 
          frame: game.frame + 1}
    |> score
  end

  # is normal 
  def score(%Game{rolls: [ball, ball1 | rolls]} = game) do
    %Game{rolls: rolls, 
          total_points: game.total_points + ball + ball1, 
          frame: game.frame + 1}
    |> score
  end

end
