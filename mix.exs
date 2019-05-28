defmodule Zuul.MixProject do
  use Mix.Project

  def project do
    [
      app: :zuul,
      version: "0.3.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/dottorblaster/zuul",
      homepage_url: "https://github.com/dottorblaster/zuul",
      deps: deps(),
      package: package(),
      description: description()
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
      {:plug_cowboy, "~> 2.0"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end

  defp description do
    "Dead simple API key authentication for Elixir"
  end

  defp package do
    [
      maintainers: ["Alessio Biancalana"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/dottorblaster/zuul"
      }
    ]
  end
end
