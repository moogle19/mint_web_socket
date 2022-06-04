defmodule MintWebSocket.MixProject do
  use Mix.Project

  @source_url "https://github.com/elixir-mint/mint_web_socket"

  def project do
    [
      app: :mint_web_socket,
      version: "1.0.0",
      elixir: "~> 1.8",
      elixirc_paths: elixirc_paths(Mix.env()),
      erlc_paths: erlc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.html": :test,
        "coveralls.github": :test,
        docs: :dev,
        bless: :test,
        credo: :test
      ],
      package: package(),
      description: description(),
      source_url: @source_url,
      name: "MintWebSocket",
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:mint, "~> 1.4 and >= 1.4.1"},
      {:web_socket, github: "moogle19/web_socket", branch: "master"},
      {:ex_doc, "~> 0.24", only: [:dev], runtime: false},
      {:castore, ">= 0.0.0", only: [:dev]},
      {:jason, ">= 0.0.0", only: [:dev, :test]},
      {:cowboy, "~> 2.9", only: [:test]},
      {:gun, "== 2.0.0-rc.2", only: [:test]},
      {:credo, "~> 1.0", only: [:test], runtime: false},
      {:excoveralls, "~> 0.14", only: [:test]},
      {:bless, "~> 1.0", only: [:test]}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/fixtures"]
  defp elixirc_paths(_), do: ["lib"]

  defp erlc_paths(:test), do: ["src", "test/compare"]
  defp erlc_paths(_), do: ["src"]

  defp package do
    [
      name: "mint_web_socket",
      files: ~w(lib .formatter.exs mix.exs README.md .version),
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => @source_url,
        "Changelog" => @source_url <> "/blob/main/CHANGELOG.md"
      }
    ]
  end

  defp description do
    "HTTP/1 and HTTP/2 WebSocket support for Mint"
  end

  defp docs do
    [
      deps: [],
      language: "en",
      formatters: ["html"],
      main: Mint.WebSocket,
      extras: [
        "CHANGELOG.md"
      ],
      skip_undefined_reference_warnings_on: [
        "CHANGELOG.md"
      ]
    ]
  end
end
