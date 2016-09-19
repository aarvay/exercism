defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare([], _b), do: :sublist
  def compare(_a, []), do: :superlist
  def compare(a, b) when a === b, do: :equal
  def compare(a, b) when length(a) == length(b), do: :unequal

  def compare(a, [h | t]) when length(a) < length([h | t]) do
    case compare(a, Enum.take([h | t], length(a))) do
      :equal -> :sublist
      _ ->
        case compare(a, t) do
          :equal -> :sublist
          res -> res
        end
    end
  end

  def compare([h | t], b) when length([h | t]) > length(b) do
    case compare(Enum.take([h | t], length(b)), b) do
      :equal -> :superlist
      _ ->
        case compare(t, b) do
          :equal -> :superlist
          res -> res
        end
    end
  end
end
