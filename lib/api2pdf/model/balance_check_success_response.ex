defmodule Api2pdf.Model.BalanceCheckSuccessResponse do
  @moduledoc false

  defstruct [:UserBalance]

  @type t :: %__MODULE__{
          UserBalance: number()
        }
end
