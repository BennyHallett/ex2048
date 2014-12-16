defmodule Ex2048Test do
  use ExUnit.Case

  test "board initially is 16 tiles" do
    board = Ex2048.Board.new
    assert 16 == length(board)
  end

  test "board initially has 2 tiles filled" do
    board = Ex2048.Board.new
    assert 2 == Enum.reduce(board, 0, &tile_nil_check/2)
  end

  #  test "move right with no merges" do
  #    board =          [2,   nil, nil, nil]
  #    board = board ++ [2,   nil, nil, nil]
  #    board = board ++ [nil, nil, nil, nil]
  #    board = board ++ [nil, nil, nil, nil]
  #
  #    expect =           [nil, nil, nil, 2  ]
  #    expect = expect ++ [nil, nil, nil, 2  ]
  #    expect = expect ++ [nil, nil, nil, nil]
  #    expect = expect ++ [nil, nil, nil, nil]
  #
  #    assert expect == Ex2048.Board.right(board)
  #  end

  defp tile_nil_check(nil, acc), do: acc
  defp tile_nil_check(_, acc), do: acc + 1
end
