defmodule RavenxSlack.MixProject do
  use Mix.Project

  def project do
    [
      app: :ravenx_slack,
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ravenx, "~> 1.1.3"},
      {:poison, "~> 2.0 or ~> 3.0"},
      {:httpoison, "~> 0.12 or ~> 1.0"},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false}
    ]
  end
end
