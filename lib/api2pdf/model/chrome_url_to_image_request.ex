defmodule Api2pdf.Model.ChromeUrlToImageRequest do
  @moduledoc """
  Request payload to convert a URL or Web Page into PDF using Headless Chrome.

  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/Headless%20Chrome/chromeImageFromUrlPost
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
end
