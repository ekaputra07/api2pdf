defmodule Api2pdf.Model.ChromeUrlToPdfRequestTest do
  use ExUnit.Case
  alias Api2pdf.Model.ChromeUrlToPdfRequest

  doctest ChromeUrlToPdfRequest

  test "new" do
    assert ChromeUrlToPdfRequest.new("url") == %ChromeUrlToPdfRequest{
             url: "url",
             inline: true,
             useCustomStorage: false
           }
  end
end
