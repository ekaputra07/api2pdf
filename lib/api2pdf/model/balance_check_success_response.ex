defmodule Api2pdf.Model.BalanceCheckSuccessResponse do
  @moduledoc """
  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/BalanceCheckSuccess
  """
  defstruct [:UserBalance]

  @type t :: %__MODULE__{
          UserBalance: number()
        }

  @doc """
  Convert body from map to `Api2pdf.Model.BalanceCheckSuccessResponse` struct.
  """
  @spec from_body(map) :: __MODULE__.t()
  def from_body(body) do
    %__MODULE__{UserBalance: Map.get(body, "UserBalance")}
  end
end
