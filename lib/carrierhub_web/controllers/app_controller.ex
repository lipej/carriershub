defmodule CarrierhubWeb.AppController do
  use CarrierhubWeb, :controller
  alias Carrierhub.Carriers.Loader

  def action(conn, _params) do
      plugin = Loader.pluginLoader(conn.body_params["carrier"])

      handle_response(plugin, conn)

  end

  defp handle_response({:ok, return_action}, conn) do
    conn
    |>json(%{message: "#{return_action}"})
  end
  


end