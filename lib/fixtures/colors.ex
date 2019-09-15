defmodule Fixtures.Colors do
  @moduledoc ~S"""
  Color generators.
  """
  use Fixtures.Helper

  @colors ~W(
    red orange yellow green blue purple brown magenta tan cyan olive maroon navy
    aquamarine turquoise silver lime teal indigo violet pink black white gray
  )

  @doc ~S"""
  A random single word color.
  """
  @spec color(Keyword.t()) :: String.t()
  def color(_opts \\ []), do: Enum.random(@colors)
end
