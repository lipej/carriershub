defmodule Carrierhub.Application do

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CarrierhubWeb.Telemetry,
      {Phoenix.PubSub, name: Carrierhub.PubSub},
      CarrierhubWeb.Endpoint,
      {Mongo, [name: :mongo, url: "mongodb://localhost:27017/carrierhub_local", pool_size: 10]}

    ]

    opts = [strategy: :one_for_one, name: Carrierhub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    CarrierhubWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
