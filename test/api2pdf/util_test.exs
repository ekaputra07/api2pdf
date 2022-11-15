defmodule Api2pdf.UtilTest do
  use ExUnit.Case

  alias Api2pdf.Util
  alias Api2pdf.Model.{ChromeUrlToPdfRequest, FileStorageOptions}

  test "prune_nils(map)" do
    inner = %{"d" => 1, "e" => nil}
    outer = %{"a" => 1, "b" => nil, "c" => inner}

    assert Util.prune_nils(outer) == %{"a" => 1, "c" => %{"d" => 1}}
  end

  test "prune_nils(struct)" do
    request = %ChromeUrlToPdfRequest{url: "test", storage: %FileStorageOptions{method: "put"}}

    assert Util.prune_nils(request) == %{
             storage: %{method: "put"},
             url: "test",
             inline: true,
             useCustomStorage: false
           }
  end
end
