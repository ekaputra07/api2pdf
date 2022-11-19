defmodule Api2pdf.LibreOffice do
  @moduledoc """
  Convert documents from and to various formats using Libre Office backend.
  """

  alias Api2pdf.Model.{
    LibreOfficeRequest,
    ApiSuccessResponse
  }

  @doc """
  Convert Office Document or Image to PDF format using LibreOffice.

  ## Examples

  ```
  Api2pdf.LibreOffice.any_to_pdf(%LibreOfficeRequest{url: "https://example.com/file.docx"})
  ```
  """
  @spec any_to_pdf(LibreOfficeRequest.t(), keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()}
  def any_to_pdf(%LibreOfficeRequest{} = payload, options \\ []),
    do: Api2pdf.make_post_request("/libreoffice/any-to-pdf", payload, options)

  @doc """
  Generate an image of the first page of a PDF or Office Document.

  The output will be a URL to a JPG file.

  ## Examples

  ```
  Api2pdf.LibreOffice.any_to_image(%LibreOfficeRequest{url: "https://example.com/file.docx"})
  ```
  """
  @spec any_to_image(LibreOfficeRequest.t(), keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()}
  def any_to_image(%LibreOfficeRequest{} = payload, options \\ []),
    do: Api2pdf.make_post_request("/libreoffice/thumbnail", payload, options)

  @doc """
  Convert a PDF file to HTML using LibreOffice. **Limitation is that images will be lost**.

  ## Examples

  ```
  Api2pdf.LibreOffice.pdf_to_html(%LibreOfficeRequest{url: "https://example.com/file.pdf"})
  ```
  """
  @spec pdf_to_html(LibreOfficeRequest.t(), keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()}
  def pdf_to_html(%LibreOfficeRequest{} = payload, options \\ []),
    do: Api2pdf.make_post_request("/libreoffice/pdf-to-html", payload, options)

  @doc """
  Convert HTML to `.docx` format using LibreOffice.

  ## Examples

  ```
  Api2pdf.LibreOffice.html_to_docx(%LibreOfficeRequest{url: "https://example.com/page.html"})
  ```
  """
  @spec html_to_docx(LibreOfficeRequest.t(), keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()}
  def html_to_docx(%LibreOfficeRequest{} = payload, options \\ []),
    do: Api2pdf.make_post_request("/libreoffice/html-to-docx", payload, options)

  @doc """
  Convert HTML to `.xlsx` using LibreOffice.

  ## Examples

  ```
  Api2pdf.LibreOffice.html_to_xlsx(%LibreOfficeRequest{url: "https://example.com/page.html"})
  ```
  """
  @spec html_to_xlsx(LibreOfficeRequest.t(), keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()}
  def html_to_xlsx(%LibreOfficeRequest{} = payload, options \\ []),
    do: Api2pdf.make_post_request("/libreoffice/html-to-xlsx", payload, options)
end
