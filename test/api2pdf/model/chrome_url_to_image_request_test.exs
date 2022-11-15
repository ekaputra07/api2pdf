defmodule Api2pdf.Model.ChromeUrlToImageRequestTest do
  use ExUnit.Case
  alias Api2pdf.Model.ChromeUrlToImageRequest

  doctest ChromeUrlToImageRequest

  test "new" do
    assert ChromeUrlToImageRequest.new("url") == %ChromeUrlToImageRequest{
             url: "url",
             inline: true,
             useCustomStorage: false
           }
  end
end
