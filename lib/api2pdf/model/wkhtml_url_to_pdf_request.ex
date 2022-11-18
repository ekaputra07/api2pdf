defmodule Api2pdf.Model.WkhtmlUrlToPdfRequest do
  @moduledoc """
  Request payload to convert a URL or Web Page to PDF using Wkhtmltopdf.

  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/Wkhtmltopdf/wkhtmlPdfFromUrlPost
  """

  alias Api2pdf.Model.{WkhtmlAdvancedOptions, WkhtmlTocOptions, FileStorageOptions}

  @enforce_keys [:url]
  defstruct [
    :url,
    :fileName,
    :options,
    :tocOptions,
    :storage,
    inline: true,
    enableToc: false,
    useCustomStorage: false
  ]

  @type t :: %__MODULE__{
          url: String.t(),
          fileName: String.t(),
          options: WkhtmlAdvancedOptions.t(),
          tocOptions: WkhtmlTocOptions.t(),
          storage: FileStorageOptions.t(),
          inline: boolean(),
          enableToc: boolean(),
          useCustomStorage: boolean()
        }
end
