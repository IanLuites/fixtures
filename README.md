# Fixtures

[![Hex.pm](https://img.shields.io/hexpm/v/fixtures.svg "Hex")](https://hex.pm/packages/fixtures)
[![Hex.pm](https://img.shields.io/hexpm/l/fixtures.svg "License")](LICENSE)

Elixir fixtures for randomly generating data.

## Quick Start

### Struct


Using a simple schema:
```elixir
defmodule MyApp.User do
  @moduledoc false
  defstruct [
    :id,
    :first_name,
    :last_name,
    :email
  ]
end
```

Setting up the fixture:
```elixir
use Fixtures

fixture MyApp.User, persist: {MyApp.FileStorage, :save} do
  [
    id: non_neg_integer,
    first_name: first_name,
    last_name: surname,
    email: email
  ]
end
```

### Ecto

Using a simple schema:
```elixir
defmodule MyApp.User do
  @moduledoc false
  use Ecto.Schema

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string

    timestamps()
  end
end
```

Setting up the fixture:
```elixir
use Fixtures

fixture MyApp.User, ecto_repo: MyApp.Repo do
  [
    first_name: first_name,
    last_name: surname,
    email: email
  ]
end
```

## Installation

The package can be installed
by adding `fixtures` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fixtures, "~> 0.0.1"}
  ]
end
```

The docs can
be found at [https://hexdocs.pm/fixtures](https://hexdocs.pm/fixtures).

## Changelog

### 0.0.1 (2019-09-15)

First release. Adds basic fixtures.
