defmodule CarriershubWeb.AuthController do
  use CarriershubWeb, :controller

  import Carriershub.{Client}

  alias CarriershubWeb.FallbackController

  action_fallback FallbackController

  def index(conn, %{"key" => key}) do
    with {:ok, client} <- find_by_key(key),
         token <-
           Phoenix.Token.sign(CarriershubWeb.Endpoint, "suuuuuuper_secret", %{
             id: client.id,
             name: client.name
           }) do
      conn
      |> put_status(200)
      |> json(%{token: token})
    else
      {:error, message} ->
        conn
        |> put_status(404)
        |> json(%{error: message})
    end
  end
end
