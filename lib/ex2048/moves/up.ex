defmodule Ex2048.Moves.Up do

  def go(board) do
    board
    |> Ex2048.Translations.cols_to_rows
    |> Enum.chunk(4)
    |> Enum.map(&process_col/1)
    |> List.flatten
    |> Ex2048.Translations.rows_to_cols
  end

  def process_col(col) do
    col
    |> remove_nils
    |> pad_right
    |> merge
    |> remove_nils
    |> pad_right
  end

  def merge(list), do: _merge(list, [])

  def _merge([], output), do: output |> Enum.reverse
  def _merge([nil|tail], output), do: _merge(tail, [nil|output])
  def _merge([a, a|tail], output), do: _merge(tail, [a*2, nil|output])
  def _merge([a|tail], output), do: _merge(tail, [a|output])

  def pad_right(list), do: _pad_right(list, 4 - length(list))

  def _pad_right(list, 0), do: list
  def _pad_right(list, len) do
    1..len
    |> Enum.map(fn(_) -> nil end)
    |> combine(list)
  end

  defp combine(nils, head), do: [head|nils] |> List.flatten

  defp remove_nils(list), do: list |> Enum.filter(fn(i) -> i != nil end)

end
