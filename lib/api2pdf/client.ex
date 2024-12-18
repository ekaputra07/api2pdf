defmodule Api2pdf.ClientBehaviour do
  @callback post(url :: String.t(), payload :: struct, options :: keyword) ::
              {:error, any} | map
  @callback get(url :: String.t(), options :: keyword) :: {:error, any} | map
  @callback delete(url :: String.t(), options :: keyword) :: {:error, any} | map
end

defmodule Api2pdf.Client do
  @moduledoc """
  The default HTTP client that is based on `Tesla`.
  """
  alias Api2pdf.Util

  @behaviour Api2pdf.ClientBehaviour

  @user_agent "Api2pdf Elixir client/0.2.x (https://github.com/ekaputra07/api2pdf)"

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

  @spec post(String.t(), struct, keyword) :: {:error, any} | map
  def post(endpoint, payload, options \\ []) do
    client = make_client(options)
    compacted_payload = payload |> Util.prune_nils()

    case Tesla.post(client, endpoint, compacted_payload) do
      {:ok, resp} -> resp
      err -> err
    end
  end

  @spec get(String.t(), keyword) :: {:error, any} | map
  def get(endpoint, options \\ []) do
    client = make_client(options)

    case Tesla.get(client, endpoint) do
      {:ok, resp} -> resp
      err -> err
    end
  end

  @spec delete(String.t(), keyword) :: {:error, any} | map
  def delete(endpoint, options \\ []) do
    client = make_client(options)

    case Tesla.delete(client, endpoint) do
      {:ok, resp} -> resp
      err -> err
    end
  end

  defp read_config(options, key, default \\ nil) do
    # Attempt to read config from given options, if doesn't exist
    # try to read from environment variable.
    case Keyword.fetch(options, key) do
      {:ok, value} -> value
      :error -> Application.get_env(:api2pdf, key, default)
    end
  end
end
