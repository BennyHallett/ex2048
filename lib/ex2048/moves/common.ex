defmodule Ex2048.Moves.Common do

  def process_row(row) do
    row
    |> remove_nils
    |> pad_left
    |> Enum.reverse
    |> merge
    |> remove_nils
    |> pad_left
  end

  def process_col(col) do
    col
    |> remove_nils
    |> pad_right
    |> merge
    |> Enum.reverse
    |> remove_nils
    |> pad_right
  end

  def merge(list), do: _merge(list, [])

  def _merge([], output), do: output
  def _merge([nil|tail], output), do: _merge(tail, [nil|output])
  def _merge([a, a|tail], output), do: _merge(tail, [a*2, nil|output])
  def _merge([a|tail], output), do: _merge(tail, [a|output])

  def pad_left(list), do: _pad_left(list, 4 - length(list))

  def _pad_left(list, 0), do: list
  def _pad_left(list, len) do
    1..len
    |> Enum.map(fn(_) -> nil end)
    |> combine_tail(list)
  end

  def pad_right(list), do: _pad_right(list, 4 - length(list))

  def _pad_right(list, 0), do: list
  def _pad_right(list, len) do
    1..len
    |> Enum.map(fn(_) -> nil end)
    |> combine_head(list)
  end

  defp combine_tail(nils, tail), do: [nils|tail] |> List.flatten

  defp combine_head(nils, head), do: [head|nils] |> List.flatten

  defp remove_nils(list), do: list |> Enum.filter(fn(i) -> i != nil end)

end
