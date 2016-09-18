defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    result =
      number
      |> factors
      |> to_str(number)
  end

  defp factors(n) do
    [3, 5, 7]
    |> Enum.filter(fn(i) -> rem(n,i) == 0 end)
  end

  defp to_str(list, number) do
    result =
      Enum.reduce(list, "",
      fn(f, acc) ->
        case f do
          3 -> acc <> "Pling"
          5 -> acc <> "Plang"
          7 -> acc <> "Plong"
          _ -> acc
        end
      end)
    if result == "", do: "#{number}", else: result
  end
end
