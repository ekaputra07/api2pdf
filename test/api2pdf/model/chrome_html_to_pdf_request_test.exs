defmodule Api2pdf.Model.ChromeHtmlToPdfRequestTest do
  use ExUnit.Case
  alias Api2pdf.Model.ChromeHtmlToPdfRequest

  doctest ChromeHtmlToPdfRequest

  test "new" do
    assert ChromeHtmlToPdfRequest.new("html") == %ChromeHtmlToPdfRequest{
             html: "html",
             inline: true,
             useCustomStorage: false
           }
  end
end
