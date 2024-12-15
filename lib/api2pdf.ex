defmodule Api2pdf do
  @moduledoc File.read!("README.md")

  alias Api2pdf.Model.{ApiSuccessResponse, ZipFilesRequest}

  @doc """
  Returns HTTP client.
  """
  @spec http_client() :: any()
  def http_client() do
    Application.get_env(:api2pdf, :client, Api2pdf.Client)
  end

  @doc """
  Utility command to check your balance on https://portal.api2pdf.com.

  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/Utility%20Commands/balanceCheck

  ## Examples
  ```elixir
  # api_key in config.exs
  {:ok, 5.0} = Api2pdf.balance()

  # OR, api_key as option
  {:ok, 5.0} = Api2pdf.balance(api_key: "YOUR-API-KEY")
  ```
  """
  @spec balance(keyword) :: {:error, any} | {:ok, number()}
  def balance(options \\ []) do
    http_client().get_request("/balance", options) |> handle_response()
  end

  @doc """
  Api2pdf API health check.

  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/Utility%20Commands/statusCheck

  ## Examples
  ```elixir
  # api_key in config.exs
  :ok = Api2pdf.status()

  # OR, api_key as option
  :ok = Api2pdf.status(api_key: "YOUR-API-KEY")
  ```
  """
  @spec status(keyword) :: :ok | :error
  def status(options \\ []) do
    http_client().get_request("/status", options)
    |> handle_response()
    |> case do
      {:ok, _} -> :ok
      _ -> :error
    end
  end

  @doc """
  Delete a file on command instead of waiting 24 hours for self-delete.

  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/Utility%20Commands/fileDELETE

  ## Examples
  ```elixir
  response_id = "857af41a-b382-4c61-ace4-95be78dcd605"

  # api_key in config.exs
  {:ok, _} = Api2pdf.delete_file(response_id)

  # OR, api_key as option
  {:ok, _} = Api2pdf.delete_file(response_id, api_key: "YOUR-API-KEY")
  ```
  """
  @spec delete_file(String.t(), keyword) :: {:ok, ApiSuccessResponse.t()} | {:error, any()}
  def delete_file(response_id, options \\ []) do
    http_client().delete_request("/file/#{response_id}", options) |> handle_response()
  end

  @doc """
  Create a ZIP file from a list of files.

  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/Utility%20Commands/filesZip

  ## Examples
  ```elixir
  alias Api2pdf.Model.ZipFilesRequest

  files = ZipFilesRequest.new()
    |> ZipFilesRequest.add("https://example.com/halo.png")
    |> ZipFilesRequest.add("https://example.com/hola.png", "new-name.png")

  # api_key in config.exs
  {:ok, _} = Api2pdf.zip_files(files)

  # OR, api_key as option
  {:ok, _} = Api2pdf.zip_files(files, api_key: "YOUR-API-KEY")
  ```
  """
  @spec zip_files(ZipFilesRequest.t(), keyword) :: {:error, any} | {:ok, ApiSuccessResponse.t()}
  def zip_files(files, options \\ []) do
    http_client().post_request("/zip?outputBinary=false", files, options) |> handle_response()
  end

  @doc """
  HTTP response handling.
  """
  def handle_response(%{body: "OK"}), do: {:ok, "OK"}

  def handle_response(%{body: %{"UserBalance" => balance}}) when is_number(balance),
    do: {:ok, balance}

  def handle_response(%{body: %{"FileUrl" => file_url} = body}) when is_binary(file_url),
    do: {:ok, ApiSuccessResponse.from_body(body)}

  def handle_response(%{body: %{"Success" => true} = body}),
    do: {:ok, ApiSuccessResponse.from_body(body)}

  def handle_response(%{body: %{"Error" => nil} = body}),
    do: {:ok, ApiSuccessResponse.from_body(body)}

  def handle_response(%{body: %{"Error" => error}}), do: {:error, error}
  def handle_response(%{body: error}) when is_binary(error), do: {:error, error}
  def handle_response({:error, _} = error), do: error

  def handle_response(_) do
    {:error, "unknown response format"}
  end
end
