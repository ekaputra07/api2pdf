defmodule Api2pdfTest do
  use ExUnit.Case
  import Mox
  setup :verify_on_exit!

  doctest Api2pdf

  describe "make_request" do
    test "it success" do
      expect(ClientMock, :make_request, fn url, payload, opts ->
        assert url == "/test"
        assert payload == %{}
        assert opts == [tag: "test"]
        {:ok, :success}
      end)

      assert {:ok, :success} = Api2pdf.make_request("/test", %{}, tag: "test")
    end

    test "it failed (connection error)" do
      expect(ClientMock, :make_request, fn _, _, _ ->
        {:error, :timeout}
      end)

      assert {:error, :timeout} = Api2pdf.make_request("/test", %{}, tag: "test")
    end

    test "it failed (validation error)" do
      expect(ClientMock, :make_request, fn _, _, _ ->
        {:error, "Api key TEST invalid"}
      end)

      assert {:error, "Api key TEST invalid"} = Api2pdf.make_request("/test", %{}, tag: "test")
    end
  end
end
