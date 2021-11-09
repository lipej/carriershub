defmodule CarrierhubWeb.AppController do
  use CarrierhubWeb, :controller

  import Carrierhub.Carriers.{Loader, Manager}

  alias Carrierhub.{Clients, Integrations}
  alias Carrierhub.{Repo}
  alias CarrierhubWeb.FallbackController

  action_fallback FallbackController

  def action(conn, _params) do
    with {:ok, plugin} <- pluginLoader(conn.body_params["carrier"]),
         {:ok, fun} <- canPerformAction(plugin, conn.body_params["action"]) do
      handle_response({:ok, fun}, conn)
    end

    # conn.body_params["carrier"]
    # |>Loader.pluginLoader
    # |>Loader.canPerformAction(conn.body_params["action"])
    # |>handle_response(conn)
  end

  defp handle_response({:ok, return_action}, conn) do
    conn
    |> json(%{message: inspect(return_action)})
  end
end
