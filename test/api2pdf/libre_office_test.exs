defmodule Api2pdf.LibreOfficeTest do
  use ExUnit.Case
  import Mox
  setup :verify_on_exit!

  alias Api2pdf.Model.{
    LibreOfficeRequest,
    ApiSuccessResponse
  }

  alias Api2pdf.LibreOffice

  test "any_to_pdf" do
    expect(ClientMock, :post_request, fn url, payload, _ ->
      assert url == "/libreoffice/any-to-pdf"
      assert %LibreOfficeRequest{url: "test_url"} = payload
      %{body: %{"Error" => nil}}
    end)

    assert {:ok, %ApiSuccessResponse{}} =
             LibreOffice.any_to_pdf(%LibreOfficeRequest{url: "test_url"})
  end

  test "any_to_image" do
    expect(ClientMock, :post_request, fn url, payload, _ ->
      assert url == "/libreoffice/thumbnail"
      assert %LibreOfficeRequest{url: "test_url"} = payload
      %{body: %{"Error" => nil}}
    end)

    assert {:ok, %ApiSuccessResponse{}} =
             LibreOffice.any_to_image(%LibreOfficeRequest{url: "test_url"})
  end

  test "pdf_to_html" do
    expect(ClientMock, :post_request, fn url, payload, _ ->
      assert url == "/libreoffice/pdf-to-html"
      assert %LibreOfficeRequest{url: "test_url"} = payload
      %{body: %{"Error" => nil}}
    end)

    assert {:ok, %ApiSuccessResponse{}} =
             LibreOffice.pdf_to_html(%LibreOfficeRequest{url: "test_url"})
  end

  test "html_to_docx" do
    expect(ClientMock, :post_request, fn url, payload, _ ->
      assert url == "/libreoffice/html-to-docx"
      assert %LibreOfficeRequest{url: "test_url"} = payload
      %{body: %{"Error" => nil}}
    end)

    assert {:ok, %ApiSuccessResponse{}} =
             LibreOffice.html_to_docx(%LibreOfficeRequest{url: "test_url"})
  end

  test "html_to_xlsx" do
    expect(ClientMock, :post_request, fn url, payload, _ ->
      assert url == "/libreoffice/html-to-xlsx"
      assert %LibreOfficeRequest{url: "test_url"} = payload
      %{body: %{"Error" => nil}}
    end)

    assert {:ok, %ApiSuccessResponse{}} =
             LibreOffice.html_to_xlsx(%LibreOfficeRequest{url: "test_url"})
  end
end
