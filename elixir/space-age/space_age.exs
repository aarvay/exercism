defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / years_on(planet)
  end

  defp years_on(planet) do
    earth = 31557600
    case planet do
      :mercury -> 0.2408467 * earth
      :venus -> 0.61519726 * earth
      :earth -> earth
      :mars -> 1.8808158 * earth
      :jupiter -> 11.862615 * earth
      :saturn -> 29.447498 * earth
      :neptune -> 164.79132 * earth
      :uranus -> 84.016846 * earth
    end
  end
end
