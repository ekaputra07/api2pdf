defmodule Api2pdf.Model.BalanceCheckSuccessResponse do
  @moduledoc """
  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/BalanceCheckSuccess
  """
  defstruct [:UserBalance]

  @type t :: %__MODULE__{
          UserBalance: number()
        }
end
