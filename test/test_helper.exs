# change client to ClientMock for testing.
Mox.defmock(ClientMock, for: Api2pdf.ClientBehaviour)
Application.put_env(:api2pdf, :client, ClientMock)

ExUnit.start()
