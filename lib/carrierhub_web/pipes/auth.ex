defmodule CarriershubWeb.Pipes.Auth do
  import Plug.Conn

  def init(p), do: p

  def call(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, client} <- get_uuid(token) do
      check_rights(client.id, conn)
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

  defp check_rights(client, conn) do
    case {String.contains?(conn.request_path, "integration"),
          String.contains?(conn.method, "POST")} do
      {true, false} ->
        {:ok, integration} = Carriershub.get_integration(conn.params["id"])

        if integration.client_id == client do
          conn
        else
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(403, Jason.encode!(%{sucess: false, message: "Forbidden"}))
          |> halt()
        end

      _ ->
        conn
    end
  end
end
