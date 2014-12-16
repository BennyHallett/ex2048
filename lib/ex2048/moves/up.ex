defmodule Ex2048.Moves.Up do

  def go(board) do
    board
    |> Ex2048.Translations.cols_to_rows
    |> Enum.chunk(4)
    |> Enum.map(&Ex2048.Moves.Common.process_col/1)
    |> List.flatten
    |> Ex2048.Translations.rows_to_cols
  end

end
