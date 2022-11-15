defmodule Api2pdf.Model.ChromeUrlToImageRequest do
  @moduledoc """
  A request to convert a URL or Web Page to PDF using Headless Chrome.
  """
  alias Api2pdf.Model.FileStorageOptions

  @enforce_keys [:url]
  defstruct [
    :url,
    :fileName,
    :extraHTTPHeaders,
    :storage,
    inline: true,
    useCustomStorage: false
  ]

  @type t :: %__MODULE__{
          url: String.t(),
          fileName: String.t(),
          extraHTTPHeaders: map(),
          storage: FileStorageOptions.t(),
          inline: boolean(),
          useCustomStorage: boolean()
        }

  @spec new(String.t()) :: __MODULE__.t()
  def new(url), do: %__MODULE__{url: url}
end
