defmodule Api2pdf.ChromeUrlToPdfRequest do
  alias __MODULE__

  @enforce_keys [:url]
  @derive Jason.Encoder
  defstruct [
    :url,
    :fileName,
    :extraHTTPHeaders,
    :options,
    :storage,
    inline: false,
    useCustomStorage: false
  ]

  def new(url) when is_binary(url), do: %ChromeUrlToPdfRequest{url: url}
end
