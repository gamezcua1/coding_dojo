defmodule Katas.StreetFighter do
  @fighters [
    ["Ryu", "E.Honda", "Blanka", "Guile", "Balrog", "Vega"],
    ["Ken", "Chun Li", "Zangief", "Dhalsim", "Sagat", "M.Bison"]
  ]

  def solve(moves) when is_list(moves) and length(moves) == 0, do: []
  def solve(moves) when is_list(moves), do: run([], [0, 0], moves)
  def solve(_), do: :error

  defp run(state, _, []), do: state

  defp run(state, last_position, [movement | following_movements]) do
    current_position = next_position(movement, last_position)

    state = state ++ [fighter_on(current_position)]

    run(state, current_position, following_movements)
  end

  defp fighter_on([y, x]), do: @fighters |> Enum.at(y) |> Enum.at(x)

  defp next_position("up", [_, x]), do: [0, x]
  defp next_position("down", [_, x]), do: [1, x]
  defp next_position("right", [y, x]), do: [y, (if x == 5, do: 0, else: x + 1)]
  defp next_position("left", [y, x]), do: [y, (if x == 0, do: 5, else: x - 1)]
end
