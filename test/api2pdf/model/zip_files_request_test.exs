defmodule Api2pdf.Model.ZipFilesRequestTest do
  use ExUnit.Case

  alias Api2pdf.Model.ZipFilesRequest

  describe "ZipFilesRequest" do
    test "new/0" do
      assert %ZipFilesRequest{files: []} = ZipFilesRequest.new()
    end

    test "add/2" do
      files =
        ZipFilesRequest.new()
        |> ZipFilesRequest.add("https://example.com/halo.png")
        |> ZipFilesRequest.add("https://example.com/hola.png", "new-name.png")

      assert %ZipFilesRequest{
               files: [
                 %{
                   url: "https://example.com/hola.png",
                   fileName: "new-name.png"
                 },
                 %{
                   url: "https://example.com/halo.png",
                   fileName: "halo.png"
                 }
               ]
             } = files
    end
  end
end
