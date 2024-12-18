defmodule Api2pdf.LibreOffice do
  @moduledoc """
  Convert documents from and to various formats using Libre Office backend.
  """
  import Api2pdf, only: [http_client: 0, handle_response: 1]

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
  def any_to_pdf(%LibreOfficeRequest{} = payload, options \\ []) do
    http_client().post_request("/libreoffice/any-to-pdf", payload, options) |> handle_response()
  end

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
  def any_to_image(%LibreOfficeRequest{} = payload, options \\ []) do
    http_client().post_request("/libreoffice/thumbnail", payload, options) |> handle_response()
  end

  @doc """
  Convert a PDF file to HTML using LibreOffice. **Limitation is that images will be lost**.

  ## Examples

  ```
  Api2pdf.LibreOffice.pdf_to_html(%LibreOfficeRequest{url: "https://example.com/file.pdf"})
  ```
  """
  @spec pdf_to_html(LibreOfficeRequest.t(), keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()}
  def pdf_to_html(%LibreOfficeRequest{} = payload, options \\ []) do
    http_client().post_request("/libreoffice/pdf-to-html", payload, options) |> handle_response()
  end

  @doc """
  Convert HTML to `.docx` format using LibreOffice.

  ## Examples

  ```
  Api2pdf.LibreOffice.html_to_docx(%LibreOfficeRequest{url: "https://example.com/page.html"})
  ```
  """
  @spec html_to_docx(LibreOfficeRequest.t(), keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()}
  def html_to_docx(%LibreOfficeRequest{} = payload, options \\ []) do
    http_client().post_request("/libreoffice/html-to-docx", payload, options) |> handle_response()
  end

  @doc """
  Convert HTML to `.xlsx` using LibreOffice.

  ## Examples

  ```
  Api2pdf.LibreOffice.html_to_xlsx(%LibreOfficeRequest{url: "https://example.com/page.html"})
  ```
  """
  @spec html_to_xlsx(LibreOfficeRequest.t(), keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()}
  def html_to_xlsx(%LibreOfficeRequest{} = payload, options \\ []) do
    http_client().post_request("/libreoffice/html-to-xlsx", payload, options) |> handle_response()
  end
end
