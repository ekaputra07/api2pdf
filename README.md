# Api2pdf

API client for PDF generator/converter service https://www.api2pdf.com.

At this point only features that are related to PDF generation and conversion that are supported as those are the ones that I'm currently using.

Contribution are welcomed to add/fix features or simply open a ticket for feature requests or bug report. If you're looking for API clients in other languages please check their [official repository](https://github.com/Api2Pdf).

Below are lists of features that are supported and those that are not, grouped by their engine:

### Headless Chrome
- [x] html_to_image (`Api2pdf.Chrome.html_to_image/2`)
- [x] html_to_pdf (`Api2pdf.Chrome.html_to_pdf/2`)
- [x] url_to_image (`Api2pdf.Chrome.url_to_image/2`)
- [x] url_to_pdf(`Api2pdf.Chrome.url_to_pdf/2`) 

### Wkhtml
- [x] html_to_pdf (`Api2pdf.Wkhtml.html_to_pdf/2`)
- [x] url_to_pdf (`Api2pdf.Wkhtml.url_to_pdf/2`)

### Libre Office
- [x] any_to_pdf (`Api2pdf.LibreOffice.any_to_pdf/2`)
- [x] any_to_image (`Api2pdf.LibreOffice.any_to_image/2`)
- [x] pdf_to_html (`Api2pdf.LibreOffice.pdf_to_html/2`)
- [x] html_to_docx (`Api2pdf.LibreOffice.html_to_docx/2`)
- [x] html_to_xlsx (`Api2pdf.LibreOffice.html_to_xlsx/2`)

### PdfSharp
- [ ] merge_pdfs
- [ ] bookmark_pdf
- [ ] password_pdf
- [ ] extract_pdf
- [ ] compress_pdf

### ZXING (Bar codes generator)
- [ ] generate_barcode

### Utility Commands
- [x] check_balance (`Api2pdf.balance/1`)
- [x] delete_file (`Api2pdf.delete_file/2`)
- [x] zip_files (`Api2pdf.zip_files/2`)
- [x] api_status (`Api2pdf.status/1`)

## Installation

Add `api2pdf` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:api2pdf, "~> 0.3"}
  ]
end
```

## API Key

Api2pdf service requires API key to be able to access their endpoints which you can get by creating an account on their [membership portal site](https://portal.api2pdf.com).

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