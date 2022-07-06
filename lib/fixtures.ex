defmodule Fixtures do
  @moduledoc """
  Documentation for Fixtures.
  """
  import __MODULE__.Helper, only: [generate_fixture: 4]

  @doc ~S"""
  Create a fixture.
  """
  @callback create(term) :: {:ok, term} | {:error, atom}

  @doc ~S"""
  Create and then persist a fixture.
  """
  @callback persist(term) :: {:ok, term} | {:error, atom}

  @doc @moduledoc
  defmacro __using__(_opts \\ []) do
    quote do
      require Fixtures
      import Fixtures, only: [fixture: 1, fixture: 2, fixture: 3]
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
  defmacro fixture(block = [{:do, _}]),
    do: generate_fixture(__CALLER__, __CALLER__.module, [], block)

  @doc ~S"""
  Create a fixture.
  """
  defmacro fixture(model_or_opts, block)

  defmacro fixture(opts, block = [{:do, _}]) when is_list(opts),
    do: generate_fixture(__CALLER__, __CALLER__.module, opts, block)

  defmacro fixture(model, block = [{:do, _}]), do: generate_fixture(__CALLER__, model, [], block)

  @doc ~S"""
  Create a fixture.
  """
  defmacro fixture(model, opts, block), do: generate_fixture(__CALLER__, model, opts, block)

  @doc ~S"""
  """
  @spec create(module, term) :: {:ok, term} | {:error, term}
  def create(module, opts \\ []) do
    with {:ok, f} <- impl(module), do: f.create(opts)
  end

  @doc ~S"""
  """
  @spec persist(module, term) :: {:ok, term} | {:error, term}
  def persist(module, opts \\ []) do
    with {:ok, f} <- impl(module), do: f.persist(opts)
  end

  @doc ~S"""
  """
  @spec create!(module, term) :: term | no_return
  def create!(module, opts \\ []) do
    case create(module, opts) do
      {:ok, m} -> m
      {:error, reason} -> raise "Fixture: Creation failed: #{inspect(reason)}"
    end
  end

  @doc ~S"""
  """
  @spec persist!(module, term) :: term | no_return
  def persist!(module, opts \\ []) do
    case persist(module, opts) do
      {:ok, m} -> m
      {:error, reason} -> raise "Fixture: Persist failed: #{inspect(reason)}"
    end
  end

  ### Helpers ###

  @spec impl(module) :: {:ok, module} | {:error, :unknown_fixture}
  defp impl(module) do
    {:ok, Module.safe_concat([Fixtures.Impl, module])}
  rescue
    ArgumentError -> {:error, :unknown_fixture}
  end
end
