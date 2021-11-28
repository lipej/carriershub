defmodule CarriershubWeb.Router do
  use CarriershubWeb, :router

  pipeline :api do
    plug :accepts, ["json"]

    plug Plug.Parsers,
      parsers: [:json],
      json_decoder: Jason
  end

  pipeline :auth do
    plug CarriershubWeb.Pipes.Auth
  end

  scope "/api", CarriershubWeb do
    pipe_through :api

    get "/health", HealthController, :index
    post "/auth", AuthController, :index
    resources "/clients", ClientsController, only: [:create]
  end

  scope "/api", CarriershubWeb do
    pipe_through [:api, :auth]

    post "/action", ActionController, :index
    get "/clients", ClientsController, :show
    delete "/clients", ClientsController, :delete
    patch "/clients", ClientsController, :update
    resources "/integrations", IntegrationsController, only: [:show, :create, :update, :delete]
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: CarriershubWeb.Telemetry
    end
  end
end
