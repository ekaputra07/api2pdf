defmodule Api2pdf.ClientTest do
  use ExUnit.Case
  import Mox
  setup :verify_on_exit!

  describe "make_client" do
    test "it load config from Application.env" do
      Application.put_all_env([
        {:api2pdf,
         [
           base_url: "https://test_base_url.env",
           api_key: "test_api_key.env",
           adapter: Tesla.Adapter.Httpc
         ]}
      ])

      client = Api2pdf.Client.make_client()
      assert %Tesla.Client{adapter: {Tesla.Adapter.Httpc, _, _}} = client

      [
        {Tesla.Middleware.BaseUrl, _, [base_url]},
        {Tesla.Middleware.JSON, _, _},
        {Tesla.Middleware.Headers, _, [headers]}
      ] = client.pre

      assert base_url == "https://test_base_url.env"
      assert length(headers) == 3

      Enum.each(headers, fn h ->
        case h do
          {"content-type", value} ->
            assert value == "application/json"

          {"authorization", value} ->
            assert value == "test_api_key.env"

          {"user-agent", value} ->
            assert value == "Api2pdf Elixir client/0.1.x (https://github.com/ekaputra07/api2pdf)"
        end
      end)
    end

    test "it lod config from options and takes precedence over Application.env" do
      client =
        Api2pdf.Client.make_client(
          base_url: "https://test_base_url.options",
          api_key: "test_api_key.options",
          adapter: Tesla.Adapter.Shared,
          tag: "test-tag.options"
        )

      assert %Tesla.Client{adapter: {Tesla.Adapter.Shared, _, _}} = client

      [
        {Tesla.Middleware.BaseUrl, _, [base_url]},
        {Tesla.Middleware.JSON, _, _},
        {Tesla.Middleware.Headers, _, [headers]}
      ] = client.pre

      assert base_url == "https://test_base_url.options"
      assert length(headers) == 4

      Enum.each(headers, fn h ->
        case h do
          {"content-type", value} ->
            assert value == "application/json"

          {"authorization", value} ->
            assert value == "test_api_key.options"

          {"tag", value} ->
            assert value == "test-tag.options"

          {"user-agent", value} ->
            assert value == "Api2pdf Elixir client/0.1.x (https://github.com/ekaputra07/api2pdf)"
        end
      end)
    end
  end
end
