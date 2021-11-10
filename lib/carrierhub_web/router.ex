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

    post "/action", ActionController, :action

    resources "/clients", ClientsController, only: [:show, :create, :update, :delete]

    resources "/integrations", IntegrationsController, only: [:show, :update, :delete]

    post "/clients/:client_id/integrations", IntegrationsController, :create
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: CarrierhubWeb.Telemetry
    end
  end
end
