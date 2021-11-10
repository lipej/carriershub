defmodule Carrierhub.Client.Delete do
  alias Carrierhub.{Repo, Client}

  def call(uuid) do
    case Repo.get(Client, uuid) do
      nil ->
        {:error, %{result: "client not found", status: :not_found}}

      client ->
        case Repo.delete(client) do
          {:ok, client} ->
            {:ok, Repo.preload(client, :Integration)}

          {:error, error} ->
            {:error, %{result: error, status: :not_found}}
        end
    end
  end
end
