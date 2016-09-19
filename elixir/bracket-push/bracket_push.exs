defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(string), do: check(string, [])

  defp check("", []), do: true
  defp check("", _), do: false
  defp check(<<head :: binary-size(1), rest :: binary>>, acc) do
    cond do
      String.contains?("{[(", head) ->
        check(rest, [head | acc])
      String.contains?(")]}", head) ->
        case acc do
          [] -> false
          _ ->
            case matching?(hd(acc), head) do
              true -> check(rest, tl(acc))
              false -> false
            end
        end
      true -> check(rest, acc)
    end
  end

  defp matching?(open, close) do
    case open do
      "{" -> close == "}"
      "[" -> close == "]"
      "(" -> close == ")"
    end
  end
end
