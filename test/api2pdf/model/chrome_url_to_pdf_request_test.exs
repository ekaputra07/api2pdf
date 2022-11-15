defmodule Api2pdf.Model.ChromeUrlToPdfRequestTest do
  use ExUnit.Case
  alias Api2pdf.Model.ChromeUrlToPdfRequest

  doctest ChromeUrlToPdfRequest

  test "new" do
    %ChromeUrlToPdfRequest{url: "url", inline: true, useCustomStorage: false} =
      ChromeUrlToPdfRequest.new("url")
  end
end
