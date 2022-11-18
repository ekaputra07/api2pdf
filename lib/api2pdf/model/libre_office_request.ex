defmodule Api2pdf.Model.LibreOfficeRequest do
  @moduledoc """
  Payload that can be used to:

  - [Convert Office Document or Image File to PDF format using LibreOffice](https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/LibreOffice/libreOfficeAnyToPdfFromPost)
  - [Generate an image thumbnail preview of an Office document or PDF file](https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/LibreOffice/libreOfficeThumbnailFromPost)
  - [Convert a PDF file to HTML using LibreOffice. Limitation is that images will be lost](https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/LibreOffice/libreOfficePdfToHtmlFromPost)
  - [Convert HTML to docx format using LibreOffice](https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/LibreOffice/libreOfficeHtmlToDocxFromPost)
  - [Convert HTML to .xlsx using LibreOffice](https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/LibreOffice/libreOfficeHtmlToXlsxFromPost)
  """
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
          storage: Api2pdf.Model.FileStorageOptions.t(),
          inline: boolean(),
          useCustomStorage: boolean()
        }
end
