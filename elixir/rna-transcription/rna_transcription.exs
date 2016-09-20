defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    to_rna(dna, [])
  end

  defp to_rna([], result), do: Enum.reverse(result)
  defp to_rna([h|t], result) do
    to_rna(t, [convert(h) | result])
  end

  defp convert(n) do
    case n do
      ?G -> ?C
      ?C -> ?G
      ?T -> ?A
      ?A -> ?U
    end
  end
end
