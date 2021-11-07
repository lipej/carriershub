defmodule Carrierhub.Repo do
  use Ecto.Repo,
    otp_app: :carrierhub,
    adapter: Ecto.Adapters.Postgres
end
