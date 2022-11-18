defmodule Api2pdf.Model.ChromeHtmlToImageRequest do
  @moduledoc """
  Request payload to convert HTML document into an Image using Headless Chrome w/ Puppeteer.

  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/Headless%20Chrome/chromeImageFromHtmlPost
  """

  alias Api2pdf.Model.FileStorageOptions

  @enforce_keys [:html]
  defstruct [
    :html,
    :fileName,
    :storage,
    inline: true,
    useCustomStorage: false
  ]

  @type t :: %__MODULE__{
          html: String.t(),
          fileName: String.t(),
          storage: FileStorageOptions.t(),
          inline: boolean(),
          useCustomStorage: boolean()
        }
end
