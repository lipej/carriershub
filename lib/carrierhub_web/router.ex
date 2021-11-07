defmodule CarrierhubWeb.Router do
  use CarrierhubWeb, :router
  use Plug.ErrorHandler

  pipeline :api do
    plug :accepts, ["json"]
    plug Plug.Parsers,
      parsers: [:json],
      json_decoder: Jason
  end

  scope "/api", CarrierhubWeb do
    pipe_through :api

    get "/health", HealthController, :index

    post "/action", AppController, :action

  end


  defmodule NoRouteError do
    defexception plug_status: 404, message: "no route found", conn: nil, router: nil
  
    def exception(opts) do
      conn   = Keyword.fetch!(opts, :conn)
      router = Keyword.fetch!(opts, :router)
      path   = "/" <> Enum.join(conn.path_info, "/")
  
      %NoRouteError{message: "no route found for #{conn.method} #{path} (#{inspect router})",
      conn: conn, router: router}
    end
  end

  def handle_errors(conn, %{kind: _kind, reason: %{message: message}, stack: _stack}) do
    conn
    |> put_status(conn.status)
    |> json( %{success: false, message: message})
  end
  
  def handle_errors(conn, %{kind: _kind, reason:  %Phoenix.Router.NoRouteError{message: message}, stack: _stack}) do
    conn
    |> put_status(conn.status)
    |> json( %{success: false, message: message})
  end

  def handle_errors(conn, %{kind: _kind, reason: _reason, stack: stack}) do
    conn
    |> put_status(conn.status)
    |> json( %{success: false, message: "Something went wrong", data: inspect stack})
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: CarrierhubWeb.Telemetry
    end
  end
end
