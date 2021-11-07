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

  def handle_errors(conn, %{kind: _kind, reason: %{code: code, message: message}, stack: _stack}) do
    conn
    |> put_status(code)
    |> json( %{success: false, message: message})
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: CarrierhubWeb.Telemetry
    end
  end
end
