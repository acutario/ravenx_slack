defmodule RavenxSlack.MixProject do
  use Mix.Project

  def project do
    [
      app: :ravenx_slack,
      version: "0.0.1",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      docs: docs()
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

  defp docs do
    [
      source_url: "https://github.com/acutario/ravenx_slack",
      extras: ["README.md"]
    ]
  end

  defp description do
    """
    Ravenx strategy to send notifications to Slack.
    """
  end

  defp package do
    # These are the default files included in the package
    [
      name: :ravenx_slack,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Óscar de Arriba"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/acutario/ravenx_slack"}
    ]
  end
end
