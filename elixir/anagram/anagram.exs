defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> Enum.filter(&(filter(&1, base)))
  end

  defp filter(a, b) when byte_size(a) !== byte_size(b), do: false
  defp filter(a, b) do
    a = String.downcase(a)
    b = String.downcase(b)
    case a == b do
      true -> false
      _ ->
        a |> String.graphemes |> Enum.sort == b |> String.graphemes |> Enum.sort
    end
  end
end
