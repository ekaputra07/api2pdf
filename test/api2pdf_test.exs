defmodule Api2pdfTest do
  use ExUnit.Case
  import Mox
  setup :verify_on_exit!

  doctest Api2pdf

  describe "make_post_request" do
    test "it success" do
      expect(ClientMock, :post_request, fn url, payload, opts ->
        assert url == "/test"
        assert payload == %{}
        assert opts == [tag: "test"]
        %{body: %{"Error" => nil}}
      end)

      assert {:ok, _} = Api2pdf.make_post_request("/test", %{}, tag: "test")
    end

    test "it failed (connection error)" do
      expect(ClientMock, :post_request, fn _, _, _ ->
        {:error, :timeout}
      end)

      assert {:error, :timeout} = Api2pdf.make_post_request("/test", %{}, tag: "test")
    end

    test "it failed (validation error)" do
      expect(ClientMock, :post_request, fn _, _, _ ->
        {:error, "Api key TEST invalid"}
      end)

      assert {:error, "Api key TEST invalid"} =
               Api2pdf.make_post_request("/test", %{}, tag: "test")
    end
  end

  describe "check_balance" do
    test "it success" do
      expect(ClientMock, :get_request, fn url, opts ->
        assert url == "/balance"
        assert opts == []
        %{body: %{"UserBalance" => 10.2}}
      end)

      assert {:ok, %{UserBalance: 10.2}} = Api2pdf.check_balance()
    end

    test "it failed (connection error)" do
      expect(ClientMock, :get_request, fn url, opts ->
        assert url == "/balance"
        assert opts == []
        {:error, :timeout}
      end)

      assert {:error, :timeout} = Api2pdf.check_balance()
    end

    test "it failed (api error)" do
      expect(ClientMock, :get_request, fn url, opts ->
        assert url == "/balance"
        assert opts == []
        %{body: "Invalid ApiKey"}
      end)

      assert {:error, "Invalid ApiKey"} = Api2pdf.check_balance()
    end
  end
end
