defmodule Api2pdf.Model.ApiSuccessResponseTest do
  use ExUnit.Case

  alias Api2pdf.Model.ApiSuccessResponse

  test "from_body(body)" do
    body = %{
      "FileUrl" => "url",
      "MbOut" => 1,
      "Cost" => 2,
      "Success" => true,
      "ResponseId" => "id",
      "Seconds" => 3,
      "Error" => "error",
      # this should be skipped
      "UnknownField" => "unknown"
    }

    assert %ApiSuccessResponse{
             FileUrl: "url",
             MbOut: 1,
             Cost: 2,
             Success: true,
             ResponseId: "id",
             Seconds: 3,
             Error: "error"
           } = ApiSuccessResponse.from_body(body)
  end
end
