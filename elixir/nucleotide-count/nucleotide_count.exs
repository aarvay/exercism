defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  def count(strand, nucleotide) do
    validate_nucleotide(nucleotide)
    validate_strand(strand)

    Enum.count(strand, fn n -> n == nucleotide end)
  end

  def histogram(strand) do
    validate_strand(strand)

    @nucleotides
    |> Enum.map(fn x -> {x, count(strand, x)} end)
    |> Enum.into(%{})
  end

  defp validate_nucleotide(n) when n in @nucleotides do end
  defp validate_nucleotide(n) do
    raise ArgumentError
  end

  defp validate_strand(strand) do
    Enum.map(strand, fn x -> validate_nucleotide(x) end)
  end
end
