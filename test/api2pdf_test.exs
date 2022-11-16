defmodule Api2pdfTest do
  use ExUnit.Case
  import Mox
  setup :verify_on_exit!

  doctest Api2pdf

  test "make_request" do
    expect(ClientMock, :make_request, fn url, payload, opts ->
      assert url == "/test"
      assert payload == %{}
      assert opts == [tag: "test"]
      {:ok, :success}
    end)

    assert {:ok, :success} = Api2pdf.make_request("/test", %{}, tag: "test")
  end
end
