defmodule Api2pdf.Model.ChromeHtmlToImageRequest do
  @moduledoc """
  A request to convert HTML to a Image using Headless Chrome w/ Puppeteer.
  """

  alias Api2pdf.Model.FileStorageOptions

  @enforce_keys [:html]
  defstruct [
    :html,
    :fileName,
    :storage,
    inline: true,
    useCustomStorage: false
  ]

  @typedoc false
  @type t :: %__MODULE__{
          html: String.t(),
          fileName: String.t(),
          storage: FileStorageOptions.t(),
          inline: boolean(),
          useCustomStorage: boolean()
        }

  @spec new(String.t()) :: __MODULE__.t()
  def new(html), do: %__MODULE__{html: html}
end
