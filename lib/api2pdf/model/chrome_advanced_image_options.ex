defmodule Api2pdf.Model.ChromeAdvancedImageOptions do
  @moduledoc """
  Advanced Headless Chrome options like margins, headers, and footers.
  """
  alias Api2pdf.Model.ViewPortOptions

  defstruct [
    :delay,
    :puppeteerWaitForMethod,
    :puppeteerWaitForValue,
    :fullPage,
    :viewPortOptions
  ]

  @typedoc false
  @type t :: %__MODULE__{
          delay: number(),
          puppeteerWaitForMethod: String.t(),
          puppeteerWaitForValue: String.t(),
          fullPage: boolean(),
          viewPortOptions: ViewPortOptions.t()
        }
end
