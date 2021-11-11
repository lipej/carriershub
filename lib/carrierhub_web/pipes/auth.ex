defmodule CarriershubWeb.Pipes.Auth do
  import Plug.Conn

  def init(p), do: p

  def call(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, client} <- get_uuid(token) do
      conn
      |> assign(:client, client.id)
    else
      _ ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(401, Jason.encode!(%{sucess: false, message: "Unauthorized"}))
        |> halt()
    end
  end

  defp get_uuid(token) do
    Phoenix.Token.verify(CarriershubWeb.Endpoint, "suuuuuuper_secret", token, max_age: 31_536_000)
  end
end
