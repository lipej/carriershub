defmodule CarrierhubWeb.ClientsController do
  use CarrierhubWeb, :controller

  alias CarrierhubWeb.FallbackController

  action_fallback FallbackController

  def show(conn, params) do
    with {:ok, client} <- Carrierhub.get_client(params["id"]) do
      conn
      |> render("index.json", client: client)
    end
  end

  def create(conn, params) do
    with {:ok, client} <- Carrierhub.create_client(params) do
      conn
      |> put_status(:created)
      |> render("index.json", client: client)
    end
  end

  def update(conn, params) do
    with {:ok, client} <- Carrierhub.update_client(params) do
      IO.inspect(client)

      conn
      |> render("index.json", client: client)
    end
  end

  def delete(conn, params) do
    with {:ok, client} <- Carrierhub.delete_client(params["id"]) do
      conn
      |> render("index.json", client: client)
    end
  end
end
