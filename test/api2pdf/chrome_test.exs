defmodule Api2pdf.ChromeTest do
  use ExUnit.Case

  import Mox
  setup :verify_on_exit!

  alias Api2pdf.Chrome

  alias Api2pdf.Model.{
    ChromeHtmlToImageRequest,
    ChromeHtmlToPdfRequest,
    ChromeUrlToImageRequest,
    ChromeUrlToPdfRequest,
    ApiSuccessResponse
  }

  test "html_to_image" do
    expect(ClientMock, :post_request, fn url, payload, options ->
      assert url == "/chrome/image/html"
      assert options == [tag: "tag"]
      assert %ChromeHtmlToImageRequest{html: "html"} = payload
      %{body: %{"Error" => nil}}
    end)

    assert {:ok, %ApiSuccessResponse{}} = Chrome.html_to_image("html", tag: "tag")
  end

  test "html_to_pdf" do
    expect(ClientMock, :post_request, fn url, payload, options ->
      assert url == "/chrome/pdf/html"
      assert options == [tag: "tag"]
      assert %ChromeHtmlToPdfRequest{html: "html"} = payload
      %{body: %{"Error" => nil}}
    end)

    assert {:ok, %ApiSuccessResponse{}} = Chrome.html_to_pdf("html", tag: "tag")
  end

  test "url_to_image" do
    expect(ClientMock, :post_request, fn url, payload, options ->
      assert url == "/chrome/image/url"
      assert options == [tag: "tag"]
      assert %ChromeUrlToImageRequest{url: "url"} = payload
      %{body: %{"Error" => nil}}
    end)

    assert {:ok, %ApiSuccessResponse{}} = Chrome.url_to_image("url", tag: "tag")
  end

  test "url_to_pdf" do
    expect(ClientMock, :post_request, fn url, payload, options ->
      assert url == "/chrome/pdf/url"
      assert options == [tag: "tag"]
      assert %ChromeUrlToPdfRequest{url: "url"} = payload
      %{body: %{"Error" => nil}}
    end)

    assert {:ok, %ApiSuccessResponse{}} = Chrome.url_to_pdf("url", tag: "tag")
  end
end
