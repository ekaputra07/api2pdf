defmodule Api2pdf.Model.ChromeAdvancedImageOptions do
  @moduledoc """
  https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/2.0.0#/ChromeAdvancedImageOptions
  """
  alias Api2pdf.Model.ViewPortOptions

  defstruct [
    :delay,
    :puppeteerWaitForMethod,
    :puppeteerWaitForValue,
    :fullPage,
    :viewPortOptions
  ]

  @type t :: %__MODULE__{
          delay: number(),
          puppeteerWaitForMethod: String.t(),
          puppeteerWaitForValue: String.t(),
          fullPage: boolean(),
          viewPortOptions: ViewPortOptions.t()
        }
end
