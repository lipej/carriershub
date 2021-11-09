defmodule Carrierhub.Clients.Delete do
  alias Carrierhub.{Repo, Clients}

  def call(uuid) do
    case Repo.get(Clients, uuid) do
      nil ->
        {:error, %{result: "client not found", status: :not_found}}

      client ->
        case Repo.delete(client) do
          {:ok, client} ->
            {:ok, Repo.preload(client, :integrations)}

          {:error, error} ->
            {:error, %{result: error, status: :not_found}}
        end
    end
  end
end
