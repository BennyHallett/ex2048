defmodule Ex2048.Padding do

  def pad_left(list), do: _pad_left(list, 4 - length(list))

  defp _pad_left(list, 0), do: list
  defp _pad_left(list, len) do
    1..len
    |> Enum.map(fn(_) -> nil end)
    |> combine_tail(list)
  end

  def pad_right(list), do: _pad_right(list, 4 - length(list))

  defp _pad_right(list, 0), do: list
  defp _pad_right(list, len) do
    1..len
    |> Enum.map(fn(_) -> nil end)
    |> combine_head(list)
  end

  defp combine_tail(nils, tail), do: [nils|tail] |> List.flatten

  defp combine_head(nils, head), do: [head|nils] |> List.flatten

end
