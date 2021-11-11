defmodule CarriershubWeb.IntegrationsController do
  use CarriershubWeb, :controller

  alias CarriershubWeb.FallbackController

  action_fallback FallbackController

  def show(conn, params) do
    with {:ok, integration} <- Carriershub.get_integration(params["id"]) do
      conn
      |> render("index.json", integration: integration)
    end
  end

  def create(conn, params) do
    with {:ok, integration} <- Carriershub.create_integration(params) do
      conn
      |> put_status(:created)
      |> render("index.json", integration: integration)
    end
  end

  def update(conn, params) do
    with {:ok, integration} <- Carriershub.update_integration(params) do
      conn
      |> render("index.json", integration: integration)
    end
  end

  def delete(conn, params) do
    with {:ok, integration} <- Carriershub.delete_integration(params["id"]) do
      conn
      |> render("index.json", integration: integration)
    end
  end
end
