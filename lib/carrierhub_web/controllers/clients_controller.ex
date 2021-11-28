defmodule CarriershubWeb.ClientsController do
  use CarriershubWeb, :controller

  alias CarriershubWeb.FallbackController

  action_fallback FallbackController

  def show(conn, _params) do
    with {:ok, client} <- Carriershub.get_client(conn.assigns[:client]) do
      conn
      |> render("index.json", client: client)
    end
  end

  def create(conn, params) do
    with {:ok, client} <- Carriershub.create_client(params) do
      conn
      |> put_status(:created)
      |> render("index.json", client: client)
    end
  end

  def update(conn, params) do
    client_to_persist = Map.put(params, "id", conn.assigns[:client])

    with {:ok, client} <- Carriershub.update_client(client_to_persist) do
      conn
      |> render("index.json", client: client)
    end
  end

  def delete(conn, _params) do
    with {:ok, client} <- Carriershub.delete_client(conn.assigns[:client]) do
      conn
      |> render("index.json", client: client)
    end
  end
end
