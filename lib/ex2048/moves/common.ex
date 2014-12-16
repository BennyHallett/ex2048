defmodule Ex2048.Moves.Common do

  def process_row(row) do
    row
    |> remove_nils
    |> Ex2048.Padding.pad_left
    |> Enum.reverse
    |> merge
    |> remove_nils
    |> Ex2048.Padding.pad_left
  end

  def process_col(col) do
    col
    |> remove_nils
    |> Ex2048.Padding.pad_right
    |> merge
    |> Enum.reverse
    |> remove_nils
    |> Ex2048.Padding.pad_right
  end

  def merge(list), do: _merge(list, [])

  def _merge([], output), do: output
  def _merge([nil|tail], output), do: _merge(tail, [nil|output])
  def _merge([a, a|tail], output), do: _merge(tail, [a*2, nil|output])
  def _merge([a|tail], output), do: _merge(tail, [a|output])

  defp remove_nils(list), do: list |> Enum.filter(fn(i) -> i != nil end)

end
