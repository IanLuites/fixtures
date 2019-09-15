defmodule Fixtures.Network do
  @moduledoc ~S"""
  Network related generators.
  """
  use Fixtures.Helper
  import Fixtures.{Names, Text, Time}

  @email_domain ~W(gmail.com hotmail.com outlook.com)
  @tld ~W(com org edu gov uk net ca de jp fr au us ru ch it nl se no es mil )

  @doc ~S"""
  Random top level domain.
  """
  @spec tld(Keyword.t()) :: String.t()
  def tld(_opts \\ []), do: Enum.random(@tld)

  @doc ~S"""
  A

  It is possible to pass `:depth` to set the number of subdomains.
  """
  @spec domain(Keyword.t()) :: String.t()
  def domain(opts \\ []), do: do_domain(opts[:depth] || 1, opts, tld(opts))

  @spec do_domain(integer, Keyword.t(), String.t()) :: String.t()
  defp do_domain(d, opts, acc) when d >= 0, do: do_domain(d - 1, opts, "#{noun(opts)}.#{acc}")
  defp do_domain(_, _opts, acc), do: acc

  @doc ~S"""
  A
  """
  @spec ip(Keyword.t()) :: String.t()
  def ip(_opts \\ []) do
    "#{Enum.random(1..255)}.#{Enum.random(0..255)}.#{Enum.random(0..255)}.#{Enum.random(1..255)}"
  end

  @doc ~S"""
  A
  """
  @spec cidr(Keyword.t()) :: String.t()
  def cidr(_opts \\ []) do
    "#{Enum.random(1..255)}.#{Enum.random(0..255)}.0.0/16"
  end

  @doc ~S"""
  A
  """
  @spec email(Keyword.t()) :: String.t()
  def email(opts \\ []) do
    %{year: y} = date_of_birth(opts)

    String.downcase(
      "#{first_name(opts)}.#{surname(opts)}#{y |> to_string() |> String.slice(2..4)}@#{
        Enum.random(@email_domain)
      }"
    )
  end

  @doc ~S"""
  A
  """
  @spec url(Keyword.t()) :: String.t()
  def url(opts \\ []) do
    %URI{
      host: domain(opts),
      scheme: if(opts[:secure], do: "https", else: Enum.random(~W(http https))),
      path: "/images/#{Enum.random(0..1_000)}/#{opts[:file]}"
    }
    |> to_string()
  end
end
