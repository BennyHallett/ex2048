defmodule Ex2048.Translations do

  @doc """
    Translates a 4x4 grid such that it's columns are now rows

    For example, the grid:

        1 _ _ _
        1 _ _ _
        1 _ _ _
        1 _ _ _

    would be translated to:

        1 1 1 1
        _ _ _ _
        _ _ _ _
        _ _ _ _
  """
  def cols_to_rows([a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p]) do
    [a, e, i, m, b, f, j, n, c, g, k, o, d, h, l, p]
  end

  @doc """
    Translates a 4x4 grid such that it's rows are now columns

    For example, the grid:

        1 1 1 1
        _ _ _ _
        _ _ _ _
        _ _ _ _

    would be translated to:

        1 _ _ _
        1 _ _ _
        1 _ _ _
        1 _ _ _
  """
  def rows_to_cols([a, e, i, m, b, f, j, n, c, g, k, o, d, h, l, p]) do
    [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p]
  end

end
