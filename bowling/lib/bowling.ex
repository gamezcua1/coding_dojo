defmodule Bowling do
  alias Bowling.Game

  def run do
    game = %Game{} |> Game.roll([1, 2])

    IO.inspect game
  end
end
