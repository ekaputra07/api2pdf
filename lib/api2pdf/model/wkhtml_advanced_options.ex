defmodule Api2pdf.Model.WkhtmlAdvancedOptions do
  @moduledoc """
  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/WkhtmlAdvancedOptions
  """
  defstruct [
    :orientation,
    :pageSize
  ]

  @type t :: %__MODULE__{
          orientation: String.t(),
          pageSize: String.t()
        }
end
