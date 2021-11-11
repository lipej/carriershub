# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :carriershub, Carriershub.Repo,
  database: "carriershub",
  username: "postgres",
  password: "pass",
  hostname: "localhost"

config :carriershub,
  ecto_repos: [Carriershub.Repo]

config :carriershub,
  generators: [binary_id: false]

# Configures the endpoint
config :carriershub, CarriershubWeb.Endpoint,
  url: [host: "localhost"],
  pubsub_server: Carriershub.PubSub,
  live_view: [signing_salt: "sd/LMMbD"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
