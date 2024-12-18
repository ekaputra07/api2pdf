defmodule Api2pdfTest do
  use ExUnit.Case
  import Mox
  alias Api2pdf.Model.ZipFilesRequest

  setup :verify_on_exit!

  doctest Api2pdf

  describe "status/1" do
    test "it success" do
      expect(ClientMock, :get, fn url, opts ->
        assert url == "/status"
        assert opts == []
        %{body: "OK"}
      end)

      assert :ok = Api2pdf.status()
    end

    test "it failed (connection error)" do
      expect(ClientMock, :get, fn url, opts ->
        assert url == "/status"
        assert opts == []
        {:error, :timeout}
      end)

      assert :error = Api2pdf.status()
    end

    test "it failed (api error)" do
      expect(ClientMock, :get, fn url, opts ->
        assert url == "/status"
        assert opts == []
        %{body: "Invalid ApiKey"}
      end)

      assert :error = Api2pdf.status()
    end
  end

  describe "balance/1" do
    test "it success" do
      expect(ClientMock, :get, fn url, opts ->
        assert url == "/balance"
        assert opts == []
        %{body: %{"UserBalance" => 10.2}}
      end)

      assert {:ok, 10.2} = Api2pdf.balance()
    end

    test "it failed (connection error)" do
      expect(ClientMock, :get, fn url, opts ->
        assert url == "/balance"
        assert opts == []
        {:error, :timeout}
      end)

      assert {:error, :timeout} = Api2pdf.balance()
    end

    test "it failed (api error)" do
      expect(ClientMock, :get, fn url, opts ->
        assert url == "/balance"
        assert opts == []
        %{body: "Invalid ApiKey"}
      end)

      assert {:error, "Invalid ApiKey"} = Api2pdf.balance()
    end
  end

  describe "delete_file/2" do
    @response_id "test-id"

    test "it success" do
      expect(ClientMock, :delete, fn url, opts ->
        assert url == "/file/#{@response_id}"
        assert opts == []
        %{body: %{"Success" => true}}
      end)

      assert {:ok, _} = Api2pdf.delete_file(@response_id)
    end

    test "it failed (connection error)" do
      expect(ClientMock, :delete, fn url, opts ->
        assert url == "/file/#{@response_id}"
        assert opts == []
        {:error, :timeout}
      end)

      assert {:error, :timeout} = Api2pdf.delete_file(@response_id)
    end

    test "it failed (api error)" do
      expect(ClientMock, :delete, fn url, opts ->
        assert url == "/file/#{@response_id}"
        assert opts == []
        %{body: "Invalid ApiKey"}
      end)

      assert {:error, "Invalid ApiKey"} = Api2pdf.delete_file(@response_id)
    end
  end

  describe "zip_files/2" do
    @files ZipFilesRequest.new() |> ZipFilesRequest.add("https://example.com/halo.png")

    test "it success" do
      expect(ClientMock, :post, fn url, payload, opts ->
        assert url == "/zip?outputBinary=false"
        assert payload == @files
        assert opts == []
        %{body: %{"Success" => true}}
      end)

      assert {:ok, _} = Api2pdf.zip_files(@files)
    end

    test "it failed (connection error)" do
      expect(ClientMock, :post, fn url, _payload, opts ->
        assert url == "/zip?outputBinary=false"
        assert opts == []
        {:error, :timeout}
      end)

      assert {:error, :timeout} = Api2pdf.zip_files(@files)
    end

    test "it failed (api error)" do
      expect(ClientMock, :post, fn url, _payload, opts ->
        assert url == "/zip?outputBinary=false"
        assert opts == []
        %{body: "Invalid ApiKey"}
      end)

      assert {:error, "Invalid ApiKey"} = Api2pdf.zip_files(@files)
    end
  end

  describe "gen_barcode/2" do
    @format "QR_CODE"
    @value "test"
    @expected_url "/zebra?value=test&format=QR_CODE&width=0&height=0&showlabel=false&outputBinary=false"

    test "it success" do
      expect(ClientMock, :get, fn url, opts ->
        assert url == @expected_url
        assert opts == []
        %{body: %{"Success" => true}}
      end)

      assert {:ok, _} = Api2pdf.gen_barcode(@format, @value)
    end

    test "it failed (connection error)" do
      expect(ClientMock, :get, fn url, opts ->
        assert url == @expected_url
        assert opts == []
        {:error, :timeout}
      end)

      assert {:error, :timeout} = Api2pdf.gen_barcode(@format, @value)
    end

    test "it failed (api error)" do
      expect(ClientMock, :get, fn url, opts ->
        assert url == @expected_url
        assert opts == []
        %{body: "Invalid ApiKey"}
      end)

      assert {:error, "Invalid ApiKey"} = Api2pdf.gen_barcode(@format, @value)
    end
  end
end
