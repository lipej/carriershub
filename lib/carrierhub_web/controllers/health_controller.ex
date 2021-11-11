defmodule CarriershubWeb.HealthController do
  use CarriershubWeb, :controller

  def index(conn, _params) do
    conn
    |> json(%{message: "Running..."})
  end
end
