defmodule Fixtures.Numbers do
  @moduledoc ~S"""
  Number generation.
  """
  use Fixtures.Helper

  @min -2_147_483_648
  @max 2_147_483_647

  @doc """
  Random integer between #{@min} and #{@max}. (inclusive)
  """
  @spec integer(Keyword.t()) :: integer
  def integer(opts \\ []) do
    Enum.random((opts[:min] || @min)..(opts[:max] || @max))
  end

  @doc """
  Random non negative integer between 1 and #{@max}. (inclusive)
  """
  @spec pos_integer(Keyword.t()) :: pos_integer
  def pos_integer(opts \\ []) do
    Enum.random(1..(opts[:max] || @max))
  end

  @doc """
  Random positive integer between 0 and #{@max}. (inclusive)
  """
  @spec non_neg_integer(Keyword.t()) :: non_neg_integer
  def non_neg_integer(opts \\ []) do
    Enum.random(0..(opts[:max] || @max))
  end
end
