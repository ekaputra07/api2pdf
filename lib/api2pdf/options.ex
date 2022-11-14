defmodule Api2pdf.ViewPortOptions do
  defstruct [
    :width,
    :height
  ]
end

defmodule Api2pdf.FileStorageOptions do
  defstruct [
    :method,
    :url,
    :extraHTTPHeaders
  ]
end

# WKTML options
defmodule Api2pdf.WkhtmlAdvancedOptions do
  defstruct [
    :orientation,
    :pageSize
  ]
end

defmodule Api2pdf.WkhtmlTocOptions do
  defstruct [
    :tocHeaderText,
    :tocLevelIndentation
  ]
end

# Chrome options
defmodule Api2pdf.ChromeAdvancedPdfOptions do
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
end

defmodule Api2pdf.ChromeAdvancedImagefOptions do
  defstruct [
    :delay,
    :puppeteerWaitForMethod,
    :puppeteerWaitForValue,
    :fullPage,
    :viewPortOptions
  ]
end
