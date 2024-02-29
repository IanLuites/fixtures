defmodule Fixtures.MixProject do
  use Mix.Project

  def project do
    [
      app: :fixtures,
      description: "Elixir fixtures for randomly generating data.",
      version: "0.0.11",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),

      # Testing
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      dialyzer: [ignore_warnings: ".dialyzer", plt_add_deps: true],

      # Docs
      name: "Fixtures",
      source_url: "https://github.com/IanLuites/fixtures",
      homepage_url: "https://github.com/IanLuites/fixtures",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  def package do
    [
      name: :fixtures,
      maintainers: ["Ian Luites"],
      licenses: ["MIT"],
      files: [
        # Elixir
        "lib/fixtures",
        "lib/fixtures.ex",
        ".formatter.exs",
        "mix.exs",
        "README*",
        "LICENSE*"
      ],
      links: %{
        "GitHub" => "https://github.com/IanLuites/fixtures"
      }
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:utc_datetime, ">= 0.0.0"},

      # Tests
      {:heimdallr, ">= 0.0.0", only: [:dev, :test]}
    ]
  end
end
