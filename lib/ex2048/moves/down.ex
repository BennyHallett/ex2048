defmodule Ex2048.Moves.Down do

  def go(board) do
    board
    |> translate
    |> Enum.chunk(4)
    |> Enum.map(&process_col/1)
    |> List.flatten
    |> translate_back
  end

  def process_col(col) do
    col
    |> remove_nils
    |> pad_left
    |> merge
    |> remove_nils
    |> pad_left
  end

  def merge(list), do: Enum.reverse(list) |> _merge([])

  def _merge([], output), do: output
  def _merge([nil|tail], output), do: _merge(tail, [nil|output])
  def _merge([a, a|tail], output), do: _merge(tail, [a*2, nil|output])
  def _merge([a|tail], output), do: _merge(tail, [a|output])

  def pad_left(list), do: _pad_left(list, 4 - length(list))

  def _pad_left(list, 0), do: list
  def _pad_left(list, len) do
    1..len
    |> Enum.map(fn(_) -> nil end)
    |> combine(list)
  end

  defp combine(nils, tail), do: [nils|tail] |> List.flatten

  defp remove_nils(list), do: list |> Enum.filter(fn(i) -> i != nil end)

  defp translate([a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p]) do
    [a, e, i, m, b, f, j, n, c, g, k, o, d, h, l, p]
  end

  defp translate_back([a, e, i, m, b, f, j, n, c, g, k, o, d, h, l, p]) do
    [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p]
  end

end
