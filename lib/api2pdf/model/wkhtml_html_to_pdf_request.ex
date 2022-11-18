defmodule Api2pdf.Model.WkhtmlHtmlToPdfRequest do
  @moduledoc """
  Request payload to convert HTML to a PDF using Wkhtmltopdf.

  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/Wkhtmltopdf/wkhtmlPdfFromHtmlPost
  """

  alias Api2pdf.Model.{WkhtmlAdvancedOptions, WkhtmlTocOptions, FileStorageOptions}

  @enforce_keys [:html]
  defstruct [
    :html,
    :fileName,
    :options,
    :tocOptions,
    :storage,
    inline: true,
    enableToc: false,
    useCustomStorage: false
  ]

  @type t :: %__MODULE__{
          html: String.t(),
          fileName: String.t(),
          options: WkhtmlAdvancedOptions.t(),
          tocOptions: WkhtmlTocOptions.t(),
          storage: FileStorageOptions.t(),
          inline: boolean(),
          enableToc: boolean(),
          useCustomStorage: boolean()
        }
end
