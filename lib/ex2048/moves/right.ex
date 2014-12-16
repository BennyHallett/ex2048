defmodule Ex2048.Moves.Right do

  def go(board) do
    board
    |> Enum.chunk(4)
    |> Enum.map(&Ex2048.Moves.Common.process_row/1)
    |> List.flatten
  end

end
