defmodule Api2pdf.Model.ZipFilesRequest do
  @moduledoc """
  Compose payload for zipping multiple files into a single archive.

  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/UtilityZipAllFiles

  ## Examples
  ```elixir
  files = ZipFilesRequest.new()
    |> ZipFilesRequest.add("https://example.com/halo.png")
    |> ZipFilesRequest.add("https://example.com/hola.png", "new-name.png")
  ```
  """
  alias Api2pdf.Model.ZipFilesRequest
  @enforce_keys [:files]

  defstruct [:files]

  @type file :: %{
          url: String.t(),
          fileName: String.t()
        }
  @type t :: %__MODULE__{
          files: [file]
        }

  def new(), do: %__MODULE__{files: []}

  def add(%ZipFilesRequest{files: files} = zipfiles, url, name \\ nil) when is_binary(url) do
    name = name || Path.basename(url)
    %{zipfiles | files: [%{url: url, fileName: name} | files]}
  end
end
