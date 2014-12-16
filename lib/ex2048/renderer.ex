defmodule Ex2048.Renderer do

  def render(board) do
    board
    |> Enum.chunk(4)
    |> print_lines
  end

  def print_lines([]), do: nil
  def print_lines([line|tail]) do
    line
    |> Enum.map(&printable/1)
    |> Enum.join(" ")
    |> IO.puts

    print_lines tail
  end

  defp printable(nil), do: "_" |> tile
  defp printable(a), do: a |> to_string |> tile

  def tile(value) do
    value
    |> to_string
    |> String.rjust(4)
  end

end
