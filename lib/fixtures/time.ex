defmodule Fixtures.Time do
  @moduledoc ~S"""
  Time and date related generators.
  """
  use Fixtures.Helper

  @doc ~S"""
  Generate a random date of birth up to a 100 years old.

  ## Options

  - `:age` the following value formats are accepted:
    - `from..to` a date of birth for someone with an age between from and to. (inclusive)
    - `integer` a date of birth for someone with the given age.
  - `:from`
  - `:to`

  """
  @spec date_of_birth(Keyword.t()) :: Date.t()
  def date_of_birth(opts \\ []) do
    {from, to} =
      cond do
        range?(opts[:age]) ->
          t = Date.utc_today()
          f..a = opts[:age]
          {Date.add(safe_years_sub(t, f + 1), 1), safe_years_sub(t, a)}

        age = opts[:age] ->
          t = Date.utc_today()
          {Date.add(safe_years_sub(t, age + 1), 1), safe_years_sub(t, age)}

        opts[:from] && opts[:to] ->
          {opts[:from], opts[:to]}

        f = opts[:from] ->
          {f, Date.utc_today()}

        t = opts[:to] ->
          {safe_years_sub(t, 1), t}

        :last_hundred_year ->
          t = Date.utc_today()
          {safe_years_sub(t, 100), t}
      end

    diff = Date.diff(to, from)
    Date.add(from, Enum.random(0..diff))
  end

  defp safe_years_sub(date, years) do
    new = %{date | year: date.year - years}
    days = Date.days_in_month(new)

    if days < new.day, do: %{new | day: days}, else: new
  end

  @spec range?(any) :: boolean
  defp range?(_.._), do: true
  defp range?(_), do: false

  @doc ~S"""
  Generate a random timestamp.
  """
  @spec timestamp(Keyword.t()) :: UTCDateTime.t() | DateTime.t() | NaiveDateTime.t()
  def timestamp(opts \\ []) do
    format = opts[:format] || UTCDateTime
    precision = opts[:precision] || :second

    min =
      Keyword.get_lazy(opts, :after, fn ->
        "1970-01-01T00:00:00.000000Z"
        |> format.from_iso8601()
        |> elem(1)
      end)

    addition =
      cond do
        before = opts[:before] -> format.diff(before, min, precision)
        duration = opts[:duration] -> duration
        :now -> format.diff(format.utc_now, min, precision)
      end

    min_addition = opts[:min_duration] || 0

    min
    |> format.add(Enum.random(min_addition..addition), precision)
    |> format.truncate(precision)
  end
end
