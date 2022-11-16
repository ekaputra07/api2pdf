defmodule Api2pdf do
  @moduledoc """
  Documentation for `Api2pdf`.
  """

  @spec make_request(String.t(), struct, keyword) :: {:error, any} | {:ok, ApiSuccessResponse.t()}
  @doc """
  A wrapper for the `Api2pdf.Client.make_request/3`.
  """
  def make_request(endpoint, request, options \\ []) do
    client = Application.get_env(:api2pdf, :client, Api2pdf.Client)
    client.make_request(endpoint, request, options)
  end
end
