defmodule Api2pdf.Model.ChromeHtmlToPdfRequest do
  @moduledoc """
  A request to convert HTML to a PDF using Headless Chrome w/ Puppeteer.
  """

  alias Api2pdf.Model.{ChromeAdvancedPdfOptions, FileStorageOptions}

  @enforce_keys [:html]
  defstruct [
    :html,
    :fileName,
    :options,
    :storage,
    inline: true,
    useCustomStorage: false
  ]

  @type t :: %__MODULE__{
          html: String.t(),
          fileName: String.t(),
          options: ChromeAdvancedPdfOptions.t(),
          storage: FileStorageOptions.t(),
          inline: boolean(),
          useCustomStorage: boolean()
        }

  @spec new(String.t()) :: __MODULE__.t()
  @doc """
  Create new instance of `Api2pdf.Model.ChromeHtmlToPdfRequest` with `html`
  as a parameter.
  """
  def new(html), do: %__MODULE__{html: html}
end
