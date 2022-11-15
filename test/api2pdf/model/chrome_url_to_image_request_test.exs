defmodule Api2pdf.Model.ChromeUrlToImageRequestTest do
  use ExUnit.Case
  alias Api2pdf.Model.ChromeUrlToImageRequest

  doctest ChromeUrlToImageRequest

  test "new" do
    %ChromeUrlToImageRequest{url: "url", inline: true, useCustomStorage: false} =
      ChromeUrlToImageRequest.new("url")
  end
end
