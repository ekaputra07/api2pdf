defmodule Api2pdf.ApiSuccessResponse do
  defstruct [
    :FileUrl,
    :MbOut,
    :Cost,
    :Success,
    :ResponseId,
    :Seconds,
    :Error
  ]
end

defmodule Api2pdf.BalanceCheckSuccessResponse do
  defstruct [:UserBalance]
end
