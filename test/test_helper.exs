# change client to ClientMock for testing.
Mox.defmock(ClientMock, for: Api2pdf.HTTP)
Application.put_env(:api2pdf, :http_impl, ClientMock)

ExUnit.start()
