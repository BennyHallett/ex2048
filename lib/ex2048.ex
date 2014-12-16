defmodule Ex2048 do

  def play do
    :os.timestamp
    |> :random.seed

    """
    Welcome to Ex2048.

    To play, use the vi keys (h, j, k, l).
    """
    |> IO.puts

    Ex2048.Board.new
    |> game_loop
  end

  defp game_loop(board) do
    board
    |> Ex2048.Board.print

    board = "\nMake your move: "
    |> IO.gets
    |> String.strip
    |> make_move(board)

    game_loop(board)
  end

  def make_move("h", board), do: Ex2048.Board.left(board)
  def make_move("l", board), do: Ex2048.Board.right(board)
  def make_move("j", board), do: Ex2048.Board.down(board)
  def make_move("k", board), do: Ex2048.Board.up(board)
  def make_move(_, board) do
    "\nInvalid move. Use vi keys.\n" |> IO.puts
    board
  end

end
