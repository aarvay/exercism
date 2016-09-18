defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.split([" ", "_"], trim: true)
    |> normalise
    |> do_count(%{})
  end

  defp normalise(words) do
    words
    |> Enum.map(fn w -> normalise_word(w) end)
    |> Enum.filter(fn w -> w !== "" end)
  end

  defp normalise_word(word) do
    filter =
      fn c ->
        cond do
          c == "-" -> true
          Enum.member?(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"], c) -> true
          true -> String.downcase(c) !== String.upcase(c)
        end
      end

    word
    |> String.graphemes
    |> Enum.filter(filter)
    |> Enum.reduce(<<>>, fn(c, acc) -> acc <> c end)
    |> String.downcase
  end

  defp do_count([], count) do
    count
  end

  defp do_count([h | t], count) do
    count =
      case count[h] do
        nil -> Map.put(count, h, 1)
        _ -> %{count | h => count[h] + 1}
      end
    do_count(t, count)
  end
end
