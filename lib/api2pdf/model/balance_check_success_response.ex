defmodule Api2pdf.Model.BalanceCheckSuccessResponse do
  @moduledoc false

  defstruct [:UserBalance]

  @typedoc false
  @type t :: %__MODULE__{
          UserBalance: number()
        }
end
