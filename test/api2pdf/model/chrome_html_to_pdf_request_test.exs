defmodule Api2pdf.Model.ChromeHtmlToPdfRequestTest do
  use ExUnit.Case
  alias Api2pdf.Model.ChromeHtmlToPdfRequest

  doctest ChromeHtmlToPdfRequest

  test "new" do
    assert %ChromeHtmlToPdfRequest{
             html: "html",
             inline: true,
             useCustomStorage: false
           } = ChromeHtmlToPdfRequest.new("html")
  end
end
