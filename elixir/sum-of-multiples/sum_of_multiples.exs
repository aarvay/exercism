defmodule SumOfMultiples do

  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    1..limit
    |> Enum.drop(-1)
    |> Enum.filter(&(multiple?(&1, factors)))
    |> Enum.sum
  end

  @spec multiple?(non_neg_integer, [non_neg_integer]) :: boolean
  def multiple?(number, factors) do
    factors
    |> Enum.any?(fn x -> rem(number, x) === 0 end)
  end
end
