defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""

  def encode(<<first :: binary-size(1), rest :: binary>>) do
    do_encode({first, 1}, rest, "")
  end

  defp do_encode({char, count}, <<char :: binary-size(1), rest :: binary>>, result) do
    do_encode({char, count + 1}, rest, result)
  end

  defp do_encode({char, count}, <<diff :: binary-size(1), rest :: binary>>, result) do
    result = result <> "#{count}" <> char
    do_encode({diff, 1}, rest, result)
  end

  defp do_encode({char, count}, "", result) do
    result <> "#{count}" <> char
  end

  @spec decode(String.t) :: String.t
  def decode(<<first :: binary-size(1), rest :: binary>>) do
    do_decode(first, rest, "")
  end

  defp do_decode(count, <<char :: binary-size(1)>>, result) do
    result <> String.duplicate(char, String.to_integer(count))
  end

  defp do_decode(count, <<char :: binary-size(1), rest :: binary>>, result) do
    case String.match?(char, ~r/[0-9]/) do
      true ->
        do_decode(count <> char, rest, result)
      false ->
        count = String.to_integer(count)
        result = result <> String.duplicate(char, count)
        do_decode("", rest, result)
    end
  end
end
