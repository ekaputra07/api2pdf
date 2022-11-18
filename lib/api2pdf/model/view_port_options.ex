defmodule Api2pdf.Model.ViewPortOptions do
  @moduledoc """
  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/ViewPortOptions
  """

  @enforce_keys [:width, :height]
  defstruct [
    :width,
    :height
  ]

  @type t :: %__MODULE__{
          width: integer,
          height: integer
        }
end
