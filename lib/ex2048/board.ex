defmodule Ex2048.Board do

  def new do
    make_empty_board
    |> randomly_place_tile
    |> randomly_place_tile
  end

  def up(board) do
    board
    |> Ex2048.Moves.Up.go
    |> randomly_place_tile
  end

  def down(board) do
    board
    |> Ex2048.Moves.Down.go
    |> randomly_place_tile
  end

  def right(board) do
    board
    |> Ex2048.Moves.Right.go
    |> randomly_place_tile
  end

  def left(board) do
    board
    |> Ex2048.Moves.Left.go
    |> randomly_place_tile
  end

  def print(board) do
    board
    |> Ex2048.Renderer.render
  end

  defp make_empty_board, do: 1..16 |> Enum.map(fn _ -> nil end)

  defp randomly_place_tile(board) do
    select_free_tile(board)
    |> select_2_or_4
    |> place_on_board(board)
  end

  defp place_on_board({pos, num}, board), do: List.update_at(board, pos, fn _ -> num end)

  defp select_2_or_4(pos), do: {pos, :random.uniform(2) * 2}

  defp select_free_tile(board) do
    :random.uniform(16) - 1
    |> is_free?(board)
    |> set_or_choose_again(board)
  end

  defp is_free?(pos, board), do: {pos, Enum.at(board, pos) == nil}

  defp set_or_choose_again({pos, true}, _), do: pos
  defp set_or_choose_again({_, false}, board), do: select_free_tile(board)

end
