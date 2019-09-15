defmodule Fixtures do
  @moduledoc """
  Documentation for Fixtures.
  """
  import __MODULE__.Helper, only: [generate_fixture: 4]

  @doc ~S"""
  Create a fixture.
  """
  @callback create(Keyword.t()) :: {:ok, term} | {:error, atom}

  @doc ~S"""
  Create and then persist a fixture.
  """
  @callback persist(Keyword.t()) :: {:ok, term} | {:error, atom}

  @doc @moduledoc
  defmacro __using__(_opts \\ []) do
    quote do
      require Fixtures
      import Fixtures, only: [fixture: 2, fixture: 3]
      import Fixtures.Colors
      import Fixtures.Geography
      import Fixtures.Names
      import Fixtures.Network
      import Fixtures.Numbers
      import Fixtures.Text
      import Fixtures.Time
    end
  end

  @doc ~S"""
  Create a fixture.
  """
  defmacro fixture(model, block = [{:do, _}]), do: generate_fixture(__CALLER__, model, [], block)

  @doc ~S"""
  Create a fixture.
  """
  defmacro fixture(model, opts, block), do: generate_fixture(__CALLER__, model, opts, block)

  @doc ~S"""
  """
  @spec create(module, Keyword.t()) :: {:ok, struct()} | {:error, term}
  def create(module, opts \\ []) do
    with {:ok, f} <- fixture(module) do
      f.create(opts)
    end
  end

  @doc ~S"""
  """
  @spec persist(module, Keyword.t()) :: {:ok, struct()} | {:error, term}
  def persist(module, opts \\ []) do
    with {:ok, f} <- fixture(module) do
      f.persist(opts)
    end
  end

  @doc ~S"""
  """
  @spec create!(module, Keyword.t()) :: struct() | no_return
  def create!(module, opts \\ []) do
    case create(module, opts) do
      {:ok, m} -> m
      {:error, reason} -> raise "Fixture: Creation failed: #{inspect(reason)}"
    end
  end

  @doc ~S"""
  """
  @spec persist!(module, Keyword.t()) :: struct() | no_return
  def persist!(module, opts \\ []) do
    case persist(module, opts) do
      {:ok, m} -> m
      {:error, reason} -> raise "Fixture: Persist failed: #{inspect(reason)}"
    end
  end

  ### Helpers ###

  @spec fixture(module) :: {:ok, module} | {:error, :unknown_fixture}
  defp fixture(module) do
    {:ok, Module.safe_concat([Fixtures.Impl, module])}
  rescue
    ArgumentError -> {:error, :unknown_fixture}
  end
end
