defmodule Api2pdf.Model.FileStorageOptions do
  @moduledoc """
  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/FileStorageOptions
  """
  defstruct [
    :method,
    :url,
    :extraHTTPHeaders
  ]

  @type t :: %__MODULE__{
          method: String.t(),
          url: String.t(),
          extraHTTPHeaders: map
        }
end
