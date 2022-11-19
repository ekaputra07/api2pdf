defmodule Api2pdf do
  @moduledoc """
  By default `Api2pdf` is using `Tesla` as the default HTTP client with `Tesla.Adapter.Hackney` adapter.
  """

  alias Api2pdf.Model.{
    ApiSuccessResponse,
    BalanceCheckSuccessResponse
  }

  @spec make_post_request(String.t(), struct, keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()} | {:ok, BalanceCheckSuccessResponse.t()}
  def make_post_request(endpoint, payload, options \\ []) do
    client = Application.get_env(:api2pdf, :client, Api2pdf.Client)
    client.post_request(endpoint, payload, options) |> handle_response()
  end

  @spec make_get_request(String.t(), keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()} | {:ok, BalanceCheckSuccessResponse.t()}
  def make_get_request(endpoint, options \\ []) do
    client = Application.get_env(:api2pdf, :client, Api2pdf.Client)
    client.get_request(endpoint, options) |> handle_response()
  end

  @doc """
  Utility command to check your balance on https://portal.api2pdf.com.

  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/Utility%20Commands/balanceCheck
  """
  @spec check_balance(keyword) ::
          {:error, any} | {:ok, BalanceCheckSuccessResponse.t()}
  def check_balance(options \\ []), do: make_get_request("/balance", options)

  # Response handling
  defp handle_response(%{body: %{"UserBalance" => _} = body}),
    do: {:ok, BalanceCheckSuccessResponse.from_body(body)}

  defp handle_response(%{body: %{"Error" => nil} = body}),
    do: {:ok, ApiSuccessResponse.from_body(body)}

  defp handle_response(%{body: %{"Error" => error}}), do: {:error, error}
  defp handle_response(%{body: error}) when is_binary(error), do: {:error, error}
  defp handle_response({:error, _} = error), do: error

  defp handle_response(_) do
    {:error, "unknown response format"}
  end
end
