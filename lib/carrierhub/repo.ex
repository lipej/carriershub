defmodule Carriershub.Repo do
  use Ecto.Repo,
    otp_app: :carriershub,
    adapter: Ecto.Adapters.Postgres
end
