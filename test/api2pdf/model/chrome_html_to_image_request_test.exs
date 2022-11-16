defmodule Api2pdf.Model.ChromeHtmlToImageRequestTest do
  use ExUnit.Case
  alias Api2pdf.Model.ChromeHtmlToImageRequest

  doctest ChromeHtmlToImageRequest

  test "new" do
    assert %ChromeHtmlToImageRequest{
             html: "html",
             inline: true,
             useCustomStorage: false
           } = ChromeHtmlToImageRequest.new("html")
  end
end
