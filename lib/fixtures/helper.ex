defmodule Fixtures.Helper do
  @moduledoc false

  @doc false
  defmacro __using__(_opts \\ []) do
    quote do
      @before_compile unquote(__MODULE__)
      @on_definition {unquote(__MODULE__), :on_def}
      require unquote(__MODULE__)
      Module.register_attribute(__MODULE__, :generators, accumulate: true)
    end
  end

  @doc false
  defmacro __before_compile__(env) do
    env.module
    |> Module.get_attribute(:generators)
    |> Enum.reduce(nil, &generator/2)
  end

  @doc false
  defp generator({fun, doc, spec}, acc) do
    spec =
      if spec do
        {:@, [context: Elixir, import: Kernel],
         [
           {:spec, [context: Elixir],
            [
              {:"::", [],
               [
                 {fun, [],
                  [
                    {{:., [], [{:__aliases__, [alias: false], [:Keyword]}, :t]}, [], []},
                    {:atom, [], Elixir},
                    {{:., [], [{:__aliases__, [alias: false], [:Keyword]}, :t]}, [], []}
                  ]},
                 spec
               ]}
            ]}
         ]}
      end

    quote do
      unquote(acc)

      @doc unquote(doc)
      unquote(spec)

      def unquote(fun)(settings, key, opts \\ []) do
        case Keyword.fetch(settings, key) do
          :error -> unquote(fun)(opts)
          {:ok, v} -> if(Keyword.keyword?(v), do: unquote(fun)(v), else: v)
        end
      end
    end
  end

  @doc false
  @spec on_def(Macro.Env.t(), atom, atom, term, term, term) :: term
  def on_def(env, kind, name, args, _guards, _body) do
    if kind == :def and Enum.count(args) == 1 do
      doc =
        case Module.get_attribute(env.module, :doc) do
          {_, d} -> d
          d -> d
        end

      spec =
        case Module.get_attribute(env.module, :spec) do
          [{:spec, {_, _, x}, _} | _] -> List.last(x)
          _ -> nil
        end

      Module.put_attribute(env.module, :generators, {name, doc, spec})
    end
  end

  @doc false
  @spec generate_fixture(Macro.Env.t(), module, Keyword.t(), term) :: term
  def generate_fixture(caller, model, opts, block) do
    model = Macro.expand(model, caller)

    persist =
      cond do
        r = opts[:ecto_repo] -> {Macro.expand(r, caller), :insert}
        r = opts[:persist] -> Macro.expand(r, caller)
        :test -> nil
      end

    block_content =
      case block[:do] do
        a = {:def, _, _} -> [a]
        {_, _, a} -> a
        a -> [a]
      end

    gen_create =
      unless has_create?(block_content) do
        fields = List.last(block_content)

        field_generation =
          Enum.reduce(
            fields,
            quote do
              %{}
            end,
            fn {field, {fun, _, _}}, acc ->
              quote do
                Map.put(unquote(acc), unquote(field), unquote(fun)(opts, unquote(field)))
              end
            end
          )

        quote do
          def create(opts) do
            {:ok, struct!(unquote(model), unquote(field_generation))}
          end
        end
      end

    user_create =
      if has_create?(block_content),
        do: block,
        else: [do: {:__block__, [], Enum.slice(block_content, 0..-2//1)}]

    quote do
      defmodule unquote(Module.concat([Fixtures.Impl, model])) do
        @moduledoc false
        alias unquote(model)

        @doc false
        @spec create(Keyword.t()) :: {:ok, term}
        def create(opts \\ [])
        unquote(gen_create)
        unquote(user_create)
        unquote(generate_persist(persist))
      end
    end
  end

  @spec has_create?(term) :: boolean
  defp has_create?(block) do
    Enum.any?(block, fn m ->
      case m do
        {:def, _, [{:create, _, _} | _]} -> true
        _ -> false
      end
    end)
  end

  @spec generate_persist({module, atom} | module | any) :: term
  defp generate_persist(nil), do: nil

  defp generate_persist({mod, fun}) do
    quote do
      @doc """
      See: `#{unquote(mod)}.#{unquote(fun)}`.

      ## Examples

      ```elixir
      iex> persist(field: :value)
      ```
      """
      @spec persist(Keyword.t()) :: {:ok, term}
      def persist(opts \\ []) do
        with {:ok, d} <- create(opts), do: unquote(mod).unquote(fun)(d, opts)
      end
    end
  end

  defp generate_persist(persist) when is_atom(persist) do
    quote do
      @doc """
      See: `#{unquote(persist)}`.

      ## Examples

      ```elixir
      iex> persist(field: :value)
      ```
      """
      @spec persist(Keyword.t()) :: {:ok, term}
      def persist(opts \\ []) do
        with {:ok, d} <- create(opts), do: unquote(persist).persist(d, opts)
      end
    end
  end

  defp generate_persist(_), do: nil
end
