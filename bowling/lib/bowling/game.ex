defmodule Bowling.Game do
  defstruct rolls: nil, total_points: 0

  alias Bowling.Game

  def roll(%Game{} = game, balls) do
    %Game{game | rolls: [game.rolls |[balls]] }
  end

end
