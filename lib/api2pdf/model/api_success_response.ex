defmodule Api2pdf.Model.ApiSuccessResponse do
  @moduledoc """
  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/ApiResponseSuccess
  """
  defstruct [
    :FileUrl,
    :MbOut,
    :Cost,
    :Success,
    :ResponseId,
    :Seconds,
    :Error
  ]

  @type t :: %__MODULE__{
          FileUrl: String.t(),
          MbOut: number,
          Cost: number,
          Success: boolean,
          ResponseId: String.t(),
          Seconds: number,
          Error: String.t()
        }

  @doc """
  Convert body from map to `Api2pdf.Model.ApiSuccessResponse` struct.
  """
  @spec from_body(map) :: __MODULE__.t()
  def from_body(body) do
    # remove atom :__struct__ from keys
    keys = Map.keys(%__MODULE__{}) |> Enum.reject(fn i -> i == :__struct__ end)
    # read values from map and assign it to the struct
    Enum.reduce(keys, %__MODULE__{}, fn field, acc ->
      case Map.fetch(body, Atom.to_string(field)) do
        {:ok, value} -> Map.put(acc, field, value)
        _ -> acc
      end
    end)
  end
end
