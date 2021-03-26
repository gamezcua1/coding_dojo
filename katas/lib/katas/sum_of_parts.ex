defmodule Katas.SumOfParts do
  def solve(list) when is_list(list) and length(list) == 0, do: [0]
  def solve(list) when is_list(list), do: run([], list)
  def solve(_), do: :error

  defp run(result, []), do: result ++ [0]

  defp run(result, [_ | next_list] = list) do
    run(result ++ [Enum.sum(list)], next_list)
  end
end

