defmodule RightMoveTest do
  use ExUnit.Case

  test "full line different doesnt move" do
    board = [2, 4, 8, 16]
    assert board == Ex2048.Moves.Right.go(board)
  end

  test "line with 2 at end doesnt move" do
    board = [nil, nil, nil, 2]
    assert board == Ex2048.Moves.Right.go(board)
  end

  test "line with 2 not at end moves" do
    board =  [nil, nil, 2, nil]
    expect = [nil, nil, nil, 2]
    assert expect == Ex2048.Moves.Right.go(board)
  end

  test "line with gaps closes" do
    board =  [4, nil, 2, nil]
    expect = [nil, nil, 4, 2]
    assert expect == Ex2048.Moves.Right.go(board)
  end

  test "simple 2x merging" do
    board =  [nil, nil, 2, 2]
    expect = [nil, nil, nil, 4]
    assert expect == Ex2048.Moves.Right.go(board)
  end

  test "merge 3 2s" do
    board =  [nil, 2, 2, 2]
    expect = [nil, nil, 2, 4]
    assert expect == Ex2048.Moves.Right.go(board)
  end

  test "merge with gaps" do
    board =  [nil, 8, nil, 8]
    expect = [nil, nil, nil, 16]
    assert expect == Ex2048.Moves.Right.go(board)
  end

  test "double merge all the way" do
    board =  [4, 4, 2, 2]
    expect = [nil, nil, 8, 4]
    assert expect == Ex2048.Moves.Right.go(board)
  end

end
