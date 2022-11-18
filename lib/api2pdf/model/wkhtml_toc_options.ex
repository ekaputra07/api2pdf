defmodule Api2pdf.Model.WkhtmlTocOptions do
  @moduledoc """
  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/WkhtmlTocOptions
  """

  defstruct [
    :tocHeaderText,
    :tocLevelIndentation
  ]

  @type t :: %__MODULE__{
          tocHeaderText: String.t(),
          tocLevelIndentation: String.t()
        }
end
