defmodule CarriershubWeb.ClientsController do
  use CarriershubWeb, :controller

  alias CarriershubWeb.FallbackController

  action_fallback FallbackController

  def show(conn, params) do
    with {:ok, client} <- Carriershub.get_client(params["id"]) do
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
    with {:ok, client} <- Carriershub.update_client(params) do
      conn
      |> render("index.json", client: client)
    end
  end

  def delete(conn, params) do
    with {:ok, client} <- Carriershub.delete_client(params["id"]) do
      conn
      |> render("index.json", client: client)
    end
  end
end
