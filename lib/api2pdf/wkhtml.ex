defmodule Api2pdf.Wkhtml do
  @moduledoc """
  Convert HTML document or web page to PDF using Wkhtml backend.
  """
  import Api2pdf, only: [http_client: 0, handle_response: 1]

  alias Api2pdf.Model.{
    ApiSuccessResponse,
    WkhtmlHtmlToPdfRequest,
    WkhtmlUrlToPdfRequest
  }

  @doc """
  Convert HTML document to PDF with default configuration.

  For a full control of request options please use `request/2`.

  ## Examples

  ```
  Api2pdf.Wkhtml.html_to_pdf("<p>", tag: "some-tag")
  ```
  """
  @spec html_to_pdf(String.t(), keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()}
  def html_to_pdf(html, options \\ []),
    do: %WkhtmlHtmlToPdfRequest{html: html} |> request(options)

  @doc """
  Convert URL to PDF with default configuration.

  For a full control of request options please use `request/2`.

  ## Examples

  ```
  Api2pdf.Wkhtml.url_to_pdf("https://example.com", tag: "some-tag")
  ```
  """
  @spec url_to_pdf(String.t(), keyword) ::
          {:error, any} | {:ok, ApiSuccessResponse.t()}
  def url_to_pdf(url, options \\ []),
    do: %WkhtmlUrlToPdfRequest{url: url} |> request(options)

  @doc """
  Send a convert request with an option to specify complete
  parameters that are supported by the API.

  Payloads are modeled in the form of struct and options is keyword.

  Available request payloads:

  * `Api2pdf.Model.WkhtmlHtmlToPdfRequest`
  * `Api2pdf.Model.WkhtmlUrlToPdfRequest`

  ## Examples

  ```
  payload = %Api2pdf.Model.WkhtmlUrlToPdfRequest{url: "https://example.com", inline: false}
  result = request(payload, tag: "some-tag")
  ```
  """
  @spec request(struct, keyword) :: {:error, any} | {:ok, ApiSuccessResponse.t()}
  def request(payload, options \\ [])

  def request(%WkhtmlHtmlToPdfRequest{} = payload, options) do
    http_client().post_request("/wkhtml/pdf/html", payload, options) |> handle_response()
  end

  def request(%WkhtmlUrlToPdfRequest{} = payload, options) do
    http_client().post_request("/wkhtml/pdf/url", payload, options) |> handle_response()
  end
end
