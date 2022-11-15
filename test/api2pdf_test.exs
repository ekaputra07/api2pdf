defmodule Api2pdfTest do
  use ExUnit.Case
  doctest Api2pdf

  test "client" do
    client = Api2pdf.client(api_key: "secret", tag: "tag")
    {Tesla.Adapter.Hackney, _, _} = client.adapter

    [
      {Tesla.Middleware.Headers, _, [headers]},
      {Tesla.Middleware.BaseUrl, _, [base_url]},
      {Tesla.Middleware.JSON, _, _}
    ] = client.pre

    assert base_url == "https://v2.api2pdf.com"
    assert length(headers) == 4

    Enum.each(headers, fn h ->
      case h do
        {"accept", value} ->
          assert value == "application/json"

        {"authorization", value} ->
          assert value == "secret"

        {"tag", value} ->
          assert value == "tag"

        {"user-agent", value} ->
          assert value == "Api2pdf Elixir client/0.1.x (https://github.com/elixir-id/api2pdf)"
      end
    end)
  end
end
