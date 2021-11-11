defmodule CarriershubWeb.ActionController do
  use CarriershubWeb, :controller

  import Carriershub.Carriers.{Loader, Manager}

  alias CarriershubWeb.FallbackController

  action_fallback FallbackController

  def index(conn, %{"integration" => integration, "action" => action, "data" => data}) do
    uuid = conn.assigns[:client]

    with {:ok, fields} <- get_fields(uuid, integration),
         {:ok, plugin} <- can_loader(integration),
         {:ok, action} <- can_perform_action(plugin, action),
         txt <- do_action(plugin, action, fields, data) do
      conn
      |> render("action.json", response: txt)
    end
  end
end
