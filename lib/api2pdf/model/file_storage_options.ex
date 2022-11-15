defmodule Api2pdf.Model.FileStorageOptions do
  @moduledoc false

  defstruct [
    :method,
    :url,
    :extraHTTPHeaders
  ]

  @type t :: %__MODULE__{
          method: String.t(),
          url: String.t(),
          extraHTTPHeaders: map()
        }
end
