defmodule CarrierhubWeb.HealthController do
  use CarrierhubWeb, :controller

  def index(conn, _params) do
    conn
    |>json(%{message: "Running..."})
  end
end