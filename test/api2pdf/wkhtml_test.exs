defmodule Api2pdf.WkhtmlTest do
  use ExUnit.Case

  import Mox
  setup :verify_on_exit!

  alias Api2pdf.Wkhtml

  alias Api2pdf.Model.{
    WkhtmlHtmlToPdfRequest,
    WkhtmlUrlToPdfRequest,
    ApiSuccessResponse
  }

  test "html_to_pdf/2" do
    expect(ClientMock, :post, fn url, payload, options ->
      assert url == "/wkhtml/pdf/html"
      assert options == [tag: "tag"]
      assert %WkhtmlHtmlToPdfRequest{html: "html"} = payload
      %{body: %{"Error" => nil}}
    end)

    assert {:ok, %ApiSuccessResponse{}} = Wkhtml.html_to_pdf("html", tag: "tag")
  end

  test "url_to_pdf/2" do
    expect(ClientMock, :post, fn url, payload, options ->
      assert url == "/wkhtml/pdf/url"
      assert options == [tag: "tag"]
      assert %WkhtmlUrlToPdfRequest{url: "url"} = payload
      %{body: %{"Error" => nil}}
    end)

    assert {:ok, %ApiSuccessResponse{}} = Wkhtml.url_to_pdf("url", tag: "tag")
  end
end
