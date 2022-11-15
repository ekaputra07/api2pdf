defmodule Api2pdf.Model.ChromeAdvancedPdfOptions do
  @moduledoc """
  Advanced Headless Chrome options like margins, headers, and footers
  """

  defstruct [
    :delay,
    :puppeteerWaitForMethod,
    :puppeteerWaitForValue,
    :usePrintCss,
    :landscape,
    :printBackground,
    :displayHeaderFooter,
    :headerTemplate,
    :footerTemplate,
    :width,
    :height,
    :marginTop,
    :marginBottom,
    :marginLeft,
    :marginRight,
    :pageRanges,
    :scale,
    :omitBackground
  ]

  @type t :: %__MODULE__{
          delay: number,
          puppeteerWaitForMethod: String.t(),
          puppeteerWaitForValue: String.t(),
          usePrintCss: boolean,
          landscape: boolean,
          printBackground: boolean,
          displayHeaderFooter: boolean,
          headerTemplate: String.t(),
          footerTemplate: String.t(),
          width: String.t(),
          height: String.t(),
          marginTop: String.t(),
          marginBottom: String.t(),
          marginLeft: String.t(),
          marginRight: String.t(),
          pageRanges: String.t(),
          scale: number,
          omitBackground: boolean
        }
end
