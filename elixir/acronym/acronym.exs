defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split([" ", "-"], trim: true)
    |> Enum.reduce("", fn(w, acc) -> acc <> first_of(w) end)
  end

  def first_of(word) do
    [h | t] = String.graphemes(word)

    Enum.reduce(t, h,
    fn(c, acc) ->
      if c == String.upcase(c) && c !== String.downcase(c) do
        acc <> c
      else
        acc
      end
    end)
    |> String.upcase
  end
end
