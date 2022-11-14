defmodule Api2pdf do
  @moduledoc """
  Documentation for `Api2pdf`.
  """

  @adapter Tesla.Adapter.Hackney
  @middlewares [
    {Tesla.Middleware.BaseUrl, "https://v2.api2pdf.com"},
    Tesla.Middleware.JSON
  ]
  @user_agent "Api2pdf Elixir client/0.1.x (https://github.com/elixir-id/api2pdf)"

  def client(options) do
    api_key = Keyword.fetch!(options, :api_key)

    headers = [
      {"accept", "Application/json; Charset=utf-8"},
      {"authorization", api_key},
      {"user-agent", @user_agent}
    ]

    headers =
      case Keyword.fetch(options, :tag) do
        {:ok, tag} -> [{"tag", tag}] ++ headers
        _ -> headers
      end

    middlewares = [{Tesla.Middleware.Headers, headers}] ++ @middlewares
    Tesla.client(middlewares, @adapter)
  end

  def request(%Tesla.Client{} = client, endpoint, payload) do
    IO.puts("#{client}, #{endpoint}, #{payload}")
  end
end
