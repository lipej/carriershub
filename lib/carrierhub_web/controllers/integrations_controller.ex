defmodule CarrierhubWeb.IntegrationsController do
  use CarrierhubWeb, :controller

  alias CarrierhubWeb.FallbackController

  action_fallback FallbackController

  def show(conn, params) do
    with {:ok, integration} <- Carrierhub.get_integration(params["id"]) do
      conn
      |> render("index.json", integration: integration)
    end
  end

  def create(conn, params) do
    IO.inspect(params)

    with {:ok, integration} <- Carrierhub.create_integration(params) do
      conn
      |> put_status(:created)
      |> render("index.json", integration: integration)
    end
  end

  def update(conn, params) do
    with {:ok, integration} <- Carrierhub.update_integration(params) do
      IO.inspect(integration)

      conn
      |> render("index.json", integration: integration)
    end
  end

  def delete(conn, params) do
    with {:ok, integration} <- Carrierhub.delete_integration(params["id"]) do
      conn
      |> render("index.json", integration: integration)
    end
  end
end
