defmodule Api2pdf.Model.ViewPortOptions do
  @moduledoc false

  @enforce_keys [:width, :height]
  defstruct [
    :width,
    :height
  ]

  @typedoc false
  @type t :: %__MODULE__{
          width: integer,
          height: integer
        }
end
