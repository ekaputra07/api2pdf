defmodule Api2pdf.MixProject do
  use Mix.Project

  @source_url "https://github.com/ekaputra07/api2pdf"

  def project do
    [
      app: :api2pdf,
      version: "0.3.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      name: "Api2pdf",
      source_url: @source_url,
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
      {:tesla, "~> 1.7"},
      {:hackney, "~> 1.18"},
      {:jason, "~> 1.4"},
      # dev and tests
      {:mox, "~> 1.0", only: :test},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      description: "Api2pdf.com API client for Elixir",
      files: [
        "lib",
        "mix.exs",
        "README.md",
        "LICENSE",
        ".formatter.exs"
      ],
      maintainers: [
        "Eka Putra"
      ],
      licenses: ["MIT"],
      links: %{
        GitHub: @source_url
      }
    ]
  end

  defp docs do
    [
      main: "Api2pdf",
      extras: ["README.md", "LICENSE"]
    ]
  end
end
