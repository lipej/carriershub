import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :carriershub, CarriershubWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "OgDmbStIM7hxSSSa1uA9QpIfPxbkeMwhtqbOhH4/xi9gZjejwSndnSOegf42K4dj",
  server: false

config :carriershub, Carriershub.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  database: "carriershub_for_test"

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
