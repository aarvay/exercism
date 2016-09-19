defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(""), do: 0

  def score(word) do
    word
    |> String.upcase
    |> String.graphemes
    |> Enum.map(fn c -> points(c) end)
    |> Enum.reduce(fn(x, acc) -> x + acc end)
  end

  defp points(letter) do
    cond do
      Enum.member?(~w(A E I O U L N R S T), letter) -> 1
      Enum.member?(~w(D G), letter) -> 2
      Enum.member?(~w(B C M P), letter) -> 3
      Enum.member?(~w(F H V W Y), letter) -> 4
      letter == "K" -> 5
      Enum.member?(~w(J X), letter) -> 8
      Enum.member?(~w(Q Z), letter) -> 10
      true -> 0
    end
  end
end
