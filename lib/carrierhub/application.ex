defmodule Carriershub.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CarriershubWeb.Telemetry,
      {Phoenix.PubSub, name: Carriershub.PubSub},
      CarriershubWeb.Endpoint,
      Carriershub.Repo
    ]

    opts = [strategy: :one_for_one, name: Carriershub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    CarriershubWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
