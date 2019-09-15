defmodule Fixtures.Geography do
  @moduledoc ~S"""
  Geography generation like cities and countries.
  """
  use Fixtures.Helper

  @city_us [
    "New York",
    "Los Angeles",
    "Chicago",
    "Houston",
    "Philadelphia",
    "Phoenix",
    "San Antonio",
    "San Diego",
    "Dallas",
    "San Jose",
    "Austin",
    "Indianapolis",
    "Jacksonville",
    "San Francisco",
    "Columbus",
    "Charlotte",
    "Fort Worth",
    "Detroit",
    "El Paso",
    "Memphis",
    "Seattle",
    "Denver",
    "Washington",
    "Boston",
    "Nashville-Davidson",
    "Baltimore",
    "Oklahoma City",
    "Louisville/Jefferson County",
    "Portland",
    "Las Vegas",
    "Milwaukee",
    "Albuquerque",
    "Tucson",
    "Fresno",
    "Sacramento",
    "Long Beach",
    "Kansas City",
    "Mesa",
    "Virginia Beach",
    "Atlanta",
    "Colorado Springs",
    "Omaha",
    "Raleigh",
    "Miami",
    "Oakland",
    "Minneapolis",
    "Tulsa",
    "Cleveland",
    "Wichita",
    "Arlington"
  ]

  @doc ~S"""
  Random large city in the US.
  """
  @spec city(Keyword.t()) :: String.t()
  def city(_opts \\ []) do
    Enum.random(@city_us)
  end

  @doc ~S"""
  Random country with ISO and name.
  """
  @spec country(Keyword.t()) :: %{iso: String.t(), name: String.t()}
  def country(_opts \\ []) do
    Enum.random([
      %{iso: "us", name: "United State"},
      %{iso: "nl", name: "Netherlands"}
    ])
  end

  @doc ~S"""
  Random locale.
  """
  @spec locale(Keyword.t()) :: String.t()
  def locale(_opts \\ []) do
    Enum.random(~W(
      en_US
      en_GB
      nl_NL
    ))
  end
end
