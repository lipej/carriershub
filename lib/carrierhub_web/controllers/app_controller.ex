defmodule CarrierhubWeb.AppController do
  use CarrierhubWeb, :controller
  alias Carrierhub.Carriers.Loader


  def action(conn, _params) do
    conn.body_params["carrier"]
    |>Loader.pluginLoader
    |>Loader.canPerformAction(conn.body_params["action"])
    |>handle_response(conn)
  end

  defp handle_response({:ok, return_action}, conn) do
    conn
    |>json(%{message: inspect return_action})
  end
  
end