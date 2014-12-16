defmodule LeftMoveTest do
  use ExUnit.Case

  test "full line different doesnt move" do
    board = [2, 4, 8, 16]
    assert board == Ex2048.Moves.Left.go(board)
  end

  test "line with 2 at end doesnt move" do
    board = [2, nil, nil, nil]
    assert board == Ex2048.Moves.Left.go(board)
  end

  test "line with 2 not at end moves" do
    board =  [nil, nil, 2, nil]
    expect = [2, nil, nil, nil]
    assert expect == Ex2048.Moves.Left.go(board)
  end

  test "line with gaps closes" do
    board =  [4, nil, 2, nil]
    expect = [4, 2, nil, nil]
    assert expect == Ex2048.Moves.Left.go(board)
  end

  test "simple 2x merging" do
    board =  [2, 2, nil, nil]
    expect = [4, nil, nil, nil]
    assert expect == Ex2048.Moves.Left.go(board)
  end

  test "merge 3 2s" do
    board =  [2, 2, 2, nil]
    expect = [4, 2, nil, nil]
    assert expect == Ex2048.Moves.Left.go(board)
  end

  test "merge with gaps" do
    board =  [nil, 8, nil, 8]
    expect = [16, nil, nil, nil]
    assert expect == Ex2048.Moves.Left.go(board)
  end

  test "double merge all the way" do
    board =  [4, 4, 2, 2]
    expect = [8, 4, nil, nil]
    assert expect == Ex2048.Moves.Left.go(board)
  end

  test "double merge but not again" do
    board =  [2, 2, 2, 2]
    expect = [4, 4, nil, nil]
    assert expect == Ex2048.Moves.Left.go(board)
  end

end
