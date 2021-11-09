defmodule CarrierhubWeb.Router do
  use CarrierhubWeb, :router

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

    resources "/clients", ClientsController, only: [:show, :create, :update, :delete]
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: CarrierhubWeb.Telemetry
    end
  end
end
