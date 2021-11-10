defmodule CarrierhubWeb.ActionController do
  use CarrierhubWeb, :controller

  import Carrierhub.Carriers.{Loader, Manager}

  alias CarrierhubWeb.FallbackController

  action_fallback FallbackController

  def action(conn, _params) do
    with {:ok, fields} <-
           check_integrations(conn.body_params["uuid"], conn.body_params["carrier"]),
         {:ok, plugin} <- plugin_loader(conn.body_params["carrier"]),
         {:ok, action} <- can_perform_action(plugin, conn.body_params["action"]),
         txt <- do_action(plugin, action, fields, conn.body_params["data"]) do
      conn
      |> render("action.json", response: txt)
    end
  end
end
