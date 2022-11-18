defmodule Api2pdf.Chrome do
  @moduledoc """
  Convert HTML document, web page to PDF or Image using Headless Chrome backend.
  """

  alias Api2pdf.Model.{
    ChromeHtmlToImageRequest,
    ChromeHtmlToPdfRequest,
    ChromeUrlToImageRequest,
    ChromeUrlToPdfRequest
  }

  @doc """
  Convert HTML document to Image with default configuration.

  For a full control of request options please use `request/2`.

  ## Examples

  ```
  Api2pdf.Chrome.html_to_image("<p>", tag: "some-tag")
  ```
  """
  @spec html_to_image(String.t(), keyword) :: {:error, any} | {:ok, ApiSuccessResponse.t()}
  def html_to_image(html, options \\ []),
    do: %ChromeHtmlToImageRequest{html: html} |> request(options)

  @doc """
  Convert HTML document to PDF with default configuration.

  For a full control of request options please use `request/2`.

  ## Examples

  ```
  Api2pdf.Chrome.html_to_pdf("<p>", tag: "some-tag")
  ```
  """
  @spec html_to_pdf(String.t(), keyword) :: {:error, any} | {:ok, ApiSuccessResponse.t()}
  def html_to_pdf(html, options \\ []),
    do: %ChromeHtmlToPdfRequest{html: html} |> request(options)

  @doc """
  Convert URL to image with default configuration.

  For a full control of request options please use `request/2`.

  ## Examples
  ```
  Api2pdf.Chrome.url_to_image("https://example.com", tag: "some-tag")
  ```
  """
  @spec url_to_image(String.t(), keyword) :: {:error, any} | {:ok, ApiSuccessResponse.t()}
  def url_to_image(url, options \\ []),
    do: %ChromeUrlToImageRequest{url: url} |> request(options)

  @doc """
  Convert URL to PDF with default configuration.

  For a full control of request options please use `request/2`.

  ## Examples

  ```
  Api2pdf.Chrome.url_to_pdf("https://example.com", tag: "some-tag")
  ```
  """
  @spec url_to_pdf(String.t(), keyword) :: {:error, any} | {:ok, ApiSuccessResponse.t()}
  def url_to_pdf(url, options \\ []),
    do: %ChromeUrlToPdfRequest{url: url} |> request(options)

  @doc """
  Send a convert request with an option to specify complete
  parameters that are supported by the API.

  Payloads are modeled in the form of struct and options is keyword.

  Available request payloads:

  * `Api2pdf.Model.ChromeHtmlToImageRequest`
  * `Api2pdf.Model.ChromeHtmlToPdfRequest`
  * `Api2pdf.Model.ChromeUrlToImageRequest`
  * `Api2pdf.Model.ChromeUrlToPdfRequest`

  ## Examples

  ```
  payload = %Api2pdf.Model.ChromeHtmlToPdfRequest{url: "https://example.com", inline: false}
  result = request(payload, tag: "some-tag")
  ```
  """
  @spec request(
          %{
            :__struct__ =>
              Api2pdf.Model.ChromeHtmlToImageRequest
              | Api2pdf.Model.ChromeHtmlToPdfRequest
              | Api2pdf.Model.ChromeUrlToImageRequest
              | Api2pdf.Model.ChromeUrlToPdfRequest,
            optional(any) => any
          },
          keyword
        ) :: {:error, any} | {:ok, ApiSuccessResponse.t()}
  def request(payload, options \\ [])

  def request(%ChromeHtmlToImageRequest{} = payload, options) do
    Api2pdf.make_request("/chrome/image/html", payload, options)
  end

  def request(%ChromeHtmlToPdfRequest{} = payload, options) do
    Api2pdf.make_request("/chrome/pdf/html", payload, options)
  end

  def request(%ChromeUrlToImageRequest{} = payload, options) do
    Api2pdf.make_request("/chrome/image/url", payload, options)
  end

  def request(%ChromeUrlToPdfRequest{} = payload, options) do
    Api2pdf.make_request("/chrome/pdf/url", payload, options)
  end
end
