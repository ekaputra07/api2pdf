defmodule Api2pdf.ClientBehaviour do
  alias Api2pdf.Model.ApiSuccessResponse

  @callback make_request(url :: String.t(), payload :: struct, options :: keyword) ::
              {:ok, ApiSuccessResponse.t()} | {:error, any}
end

defmodule Api2pdf.Client do
  @moduledoc """
  The default HTTP client that is based on `Tesla`.
  """

  alias Api2pdf.Util
  alias Api2pdf.Model.ApiSuccessResponse

  @behaviour Api2pdf.ClientBehaviour

  @user_agent "Api2pdf Elixir client/0.1.x (https://github.com/ekaputra07/api2pdf)"

  @spec make_client(keyword) :: Tesla.Client.t()
  def make_client(options \\ []) do
    base_url = read_config(options, :base_url, "https://v2.api2pdf.com")
    api_key = read_config(options, :api_key, "")
    adapter = read_config(options, :adapter, {Tesla.Adapter.Hackney, [recv_timeout: 30_000]})
    tag = read_config(options, :tag)

    headers = [
      {"content-type", "application/json"},
      {"authorization", api_key},
      {"user-agent", @user_agent}
    ]

    headers =
      case tag do
        nil -> headers
        tag -> [{"tag", tag}] ++ headers
      end

    middlewares = [
      {Tesla.Middleware.BaseUrl, base_url},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Headers, headers}
    ]

    Tesla.client(middlewares, adapter)
  end

  @spec make_request(String.t(), struct, keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()}
  def make_request(endpoint, payload, options \\ []) do
    client = make_client(options)
    compacted_payload = payload |> Util.prune_nils()

    case Tesla.post(client, endpoint, compacted_payload) do
      {:ok, resp} -> handle_body(resp.body)
      err -> err
    end
  end

  @doc false
  @spec handle_body(map) :: {:error, any} | {:ok, ApiSuccessResponse.t()}
  defp handle_body(%{"Error" => nil} = body), do: {:ok, ApiSuccessResponse.from_body(body)}
  defp handle_body(%{"Error" => error}), do: {:error, error}

  defp read_config(options, key, default \\ nil) do
    # Attempt to read config from given options, if doesn't exist
    # try to read from environment variable.
    case Keyword.fetch(options, key) do
      {:ok, value} -> value
      :error -> Application.get_env(:api2pdf, key, default)
    end
  end
end
