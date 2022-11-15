defmodule Api2pdf.Model.ChromeHtmlToImageRequestTest do
  use ExUnit.Case
  alias Api2pdf.Model.ChromeHtmlToImageRequest

  doctest ChromeHtmlToImageRequest

  test "new" do
    assert ChromeHtmlToImageRequest.new("html") == %ChromeHtmlToImageRequest{
             html: "html",
             inline: true,
             useCustomStorage: false
           }
  end
end
