defmodule Api2pdf do
  @moduledoc """
  By default `Api2pdf` is using `Tesla` as the default HTTP client with `Tesla.Adapter.Hackney` adapter.
  """

  @doc false
  @spec make_request(String.t(), struct, keyword) :: {:error, any} | {:ok, ApiSuccessResponse.t()}
  def make_request(endpoint, payload, options \\ []) do
    client = Application.get_env(:api2pdf, :client, Api2pdf.Client)
    client.make_request(endpoint, payload, options)
  end
end
