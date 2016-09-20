defmodule Phone do

  @spec number(String.t) :: String.t
  def number(raw) do
    case String.match?(raw, ~r/[a-zA-Z]/) do
      true -> "0000000000"
      _ ->
        raw
        |> String.replace(~r/[^\d]/, "", trim: true)
        |> verify
    end
  end

  defp verify(num) when byte_size(num) == 10, do: num

  defp verify(num = <<h :: binary-size(1), t :: binary>>)
    when byte_size(num) == 11 and h == "1", do: t

  defp verify(_), do: "0000000000"

  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw
    |> number
    |> get_code
  end

  defp get_code(<<code :: binary-size(3), _ :: binary>>), do: code

  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    raw
    |> number
    |> do_pretty
  end

  defp do_pretty(<<code :: binary-size(3), next :: binary-size(3), rest :: binary>>),
    do: "(#{code}) #{next}-#{rest}"
end
