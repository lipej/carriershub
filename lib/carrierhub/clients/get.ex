defmodule Carrierhub.Client.Get do
  alias Carrierhub.{Repo, Client}

  def call(uuid) do
    case Repo.get(Client, uuid) do
      nil -> {:error, %{result: "client not found", status: :not_found}}
      client -> {:ok, Repo.preload(client, :integrations)}
    end
  end
end
