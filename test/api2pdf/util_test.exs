defmodule Api2pdf.UtilTest do
  use ExUnit.Case

  alias Api2pdf.Util
  alias Api2pdf.Model.{ChromeUrlToPdfRequest, FileStorageOptions}

  test "prune_nils/1 with map" do
    inner = %{"d" => 1, "e" => nil}
    outer = %{"a" => 1, "b" => nil, "c" => inner}

    assert %{"a" => 1, "c" => %{"d" => 1}} = Util.prune_nils(outer)
  end

  test "prune_nils/1 with struct" do
    request = %ChromeUrlToPdfRequest{url: "test", storage: %FileStorageOptions{method: "put"}}

    assert %{
             storage: %{method: "put"},
             url: "test",
             inline: true,
             useCustomStorage: false
           } = Util.prune_nils(request)
  end
end
