# Api2pdf

An unofficial API client for PDF generator/converter service https://www.api2pdf.com.

At this point only features that are related to PDF generation and conversion are supported as those are the ones that I'm currently using personally.

Contribution are welcomed to add missing features or simply open a ticket for feature requests. If you're looking for API clients in other languages please check their [official repository](https://github.com/Api2Pdf).

Below are lists of features that are supported (✓) and those that are not (x), grouped by their engine:

### Headless Chrome
- [✓] html_to_image (`Api2pdf.Chrome.html_to_image/2`)
- [✓] html_to_pdf (`Api2pdf.Chrome.html_to_pdf/2`)
- [✓] url_to_image (`Api2pdf.Chrome.url_to_image/2`)
- [✓] url_to_pdf(`Api2pdf.Chrome.url_to_pdf/2`) 

### Wkhtml
- [✓] html_to_pdf (`Api2pdf.Wkhtml.html_to_pdf/2`)
- [✓] url_to_pdf (`Api2pdf.Wkhtml.url_to_pdf/2`)

### Libre Office
- [✓] any_to_pdf (`Api2pdf.LibreOffice.any_to_pdf/2`)
- [✓] any_to_image (`Api2pdf.LibreOffice.any_to_image/2`)
- [✓] pdf_to_html (`Api2pdf.LibreOffice.pdf_to_html/2`)
- [✓] html_to_docx (`Api2pdf.LibreOffice.html_to_docx/2`)
- [✓] html_to_xlsx (`Api2pdf.LibreOffice.html_to_xlsx/2`)

### PdfSharp
- [x] merge_pdfs
- [x] bookmark_pdf
- [x] password_pdf
- [x] extract_pdf
- [x] compress_pdf

### ZXING (Bar codes generator)
- [x] generate_barcode

### Utility Commands
- [✓] check_balance (`Api2pdf.check_balance/1`)
- [x] delete_file
- [x] zip_files
- [x] api_status 

## Installation

Add `api2pdf` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:api2pdf, "~> 0.1.0"}
  ]
end
```

## API Key

api2pdf.com service requires API key to be able to access their endpoints which you can get by creating an account on their [membership portal site](https://portal.api2pdf.com).

Once you have API key, you can pass it to this `Api2pdf` client in two ways.

### Via application config

```elixir
# file: config.exs

config :api2pdf,
  api_key: "YOUR-API-KEY"
```

### Via options

All functions accept optional `Keyword` list where you can pass the `api_key` and some other configuration.

```elixir
Api2pdf.Chrome.url_to_pdf("https://example.com", api_key: "YOUR-API-KEY")
```

## Engines

Api2pdf service uses multiple engines to generate PDF and doing document conversions that you can choose from. Which one to use? It's up to your preference.

You can switch between those engines by using separate modules, they are:

- `Api2pdf.Chrome`
- `Api2pdf.Wkhtml`
- `Api2pdf.LibreOffice`