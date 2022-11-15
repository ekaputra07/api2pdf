defmodule Api2pdf.Model.ChromeUrlToPdfRequest do
  @moduledoc """
  Request payload to convert a URL or Web Page to PDF using Headless Chrome.
  """

  alias Api2pdf.Model.{FileStorageOptions, ChromeAdvancedPdfOptions}

  @enforce_keys [:url]
  @derive Jason.Encoder
  defstruct [
    :url,
    :fileName,
    :extraHTTPHeaders,
    :options,
    :storage,
    inline: true,
    useCustomStorage: false
  ]

  @type t :: %__MODULE__{
          url: String.t(),
          fileName: String.t(),
          extraHTTPHeaders: map(),
          options: ChromeAdvancedPdfOptions.t(),
          storage: FileStorageOptions.t(),
          inline: boolean(),
          useCustomStorage: boolean()
        }

  @spec new(String.t()) :: __MODULE__.t()
  @doc """
  Create new instance of `Api2pdf.Model.ChromeUrlToPdfRequest` with `url`
  as a parameter.
  """
  def new(url), do: %__MODULE__{url: url}
end
