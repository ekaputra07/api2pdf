defmodule Api2pdf.Model.ChromeHtmlToPdfRequest do
  @moduledoc """
  Request payload to convert HTML document into PDF using Headless Chrome w/ Puppeteer.

  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/Headless%20Chrome/chromePdfFromHtmlPost
  """

  alias Api2pdf.Model.{ChromeAdvancedPdfOptions, FileStorageOptions}

  @enforce_keys [:html]
  defstruct [
    :html,
    :fileName,
    :options,
    :storage,
    inline: true,
    useCustomStorage: false
  ]

  @type t :: %__MODULE__{
          html: String.t(),
          fileName: String.t(),
          options: ChromeAdvancedPdfOptions.t(),
          storage: FileStorageOptions.t(),
          inline: boolean(),
          useCustomStorage: boolean()
        }
end
