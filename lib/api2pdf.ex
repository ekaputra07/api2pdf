defmodule Api2pdf do
  @moduledoc """
  Documentation for `Api2pdf`.
  """
  alias Api2pdf.Model.ApiSuccessResponse
  alias Api2pdf.Util

  @adapter Tesla.Adapter.Hackney
  @middlewares [
    {Tesla.Middleware.BaseUrl, "https://v2.api2pdf.com"},
    Tesla.Middleware.JSON
  ]
  @user_agent "Api2pdf Elixir client/0.1.x (https://github.com/elixir-id/api2pdf)"

  @spec client(keyword) :: Tesla.Client.t()
  @doc """
  HTTP client for making request to the API endpoint.

  ## Options

    * `api_key` (required), API key for api2pdf.com.
    * `tag` (optional), tag that will be send with the request.

  ## Example

    client = Api2pdf.client(api_key: "secret", tag: "some-tag")

  """
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

  @spec make_request(Tesla.Client.t(), String.t(), struct) ::
          {:ok, ApiSuccessResponse.t()} | {:error, any}
  @doc """
  Making request to the API endpoint.

  Since most of the request fields are optional, we excludes all
  fields that has `nil` value using `Api2pdf.Util.prune_nils/1`
  """
  def make_request(%Tesla.Client{} = client, endpoint, request) do
    compacted_request = request |> Util.prune_nils()

    case Tesla.post(client, endpoint, compacted_request) do
      {:ok, resp} -> handle_body(resp.body)
      err -> err
    end
  end

  defp handle_body(%{"Error" => nil} = body), do: {:ok, ApiSuccessResponse.from_body(body)}
  defp handle_body(%{"Error" => error}), do: {:error, error}
end
