defmodule Api2pdf.Model.ChromeUrlToPdfRequest do
  @moduledoc """
  Request payload to convert a URL or Web Page to PDF using Headless Chrome.

  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/Headless%20Chrome/chromePdfFromUrlPost
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
end
