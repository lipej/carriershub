defmodule Carrierhub.Clients.Get do
  alias Carrierhub.{Repo, Clients}

  def call(uuid) do
    case Repo.get(Clients, uuid) do
      nil -> {:error, %{result: "client not found", status: :not_found}}
      client -> {:ok, Repo.preload(client, :integrations)}
    end
  end
end
