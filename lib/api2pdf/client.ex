defmodule Api2pdf.ClientBehaviour do
  @moduledoc false

  alias Api2pdf.Model.ApiSuccessResponse

  @doc false
  @callback make_request(url :: String.t(), payload :: struct, options :: keyword) ::
              {:ok, ApiSuccessResponse.t()} | {:error, any}
end

defmodule Api2pdf.Client do
  @moduledoc """
  The default client that is based on `Tesla` and implements `Api2pdf.ClientBehaviour.make_request/3`.
  """

  alias Api2pdf.Util
  alias Api2pdf.Model.ApiSuccessResponse

  @behaviour Api2pdf.ClientBehaviour

  @user_agent "Api2pdf Elixir client/0.1.x (https://github.com/elixir-id/api2pdf)"

  @doc """
  Setup the HTTP client, in this case `Tesla`.
  """
  @spec make_client(keyword) :: Tesla.Client.t()
  def make_client(options) do
    base_url = Application.get_env(:api2pdf, :base_url, "https://v2.api2pdf.com")
    api_key = Application.get_env(:api2pdf, :api_key, "")

    adapter =
      Application.get_env(:api2pdf, :adapter, {Tesla.Adapter.Hackney, [recv_timeout: 30_000]})

    headers = [
      {"accept", "application/json"},
      {"authorization", api_key},
      {"user-agent", @user_agent}
    ]

    headers =
      case Keyword.fetch(options, :tag) do
        {:ok, tag} -> [{"tag", tag}] ++ headers
        _ -> headers
      end

    middlewares = [
      {Tesla.Middleware.BaseUrl, base_url},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Headers, headers}
    ]

    Tesla.client(middlewares, adapter)
  end

  @doc """
  Making the actual request to the API endpoint. A behaviour implementation of `Api2pdf.ClientBehaviour.make_request/3`.

  Most of the time you won't need to call this function directly but here's an example usage:

  ```
  Api2pdf.Client.make_request("/chrome/pdf/html", %ChromeHtmlToPdfRequest{html: "<p>"}, tag: "some-tag")
  ```
  """
  @impl true
  @spec make_request(String.t(), struct, keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()}
  def make_request(endpoint, payload, options) do
    client = make_client(options)
    compacted_payload = payload |> Util.prune_nils()

    case Tesla.post(client, endpoint, compacted_payload) do
      {:ok, resp} -> handle_body(resp.body)
      err -> err
    end
  end

  @doc false
  @spec handle_body(map) :: {:error, any} | {:ok, ApiSuccessResponse.t()}
  def handle_body(%{"Error" => nil} = body), do: {:ok, ApiSuccessResponse.from_body(body)}
  def handle_body(%{"Error" => error}), do: {:error, error}
end
