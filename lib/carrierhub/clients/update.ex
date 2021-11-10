defmodule Carrierhub.Client.Update do
  alias Carrierhub.{Repo, Client}

  def call(params) do
    case Repo.get(Client, params["id"]) do
      nil ->
        {:error, %{result: "Client not found", status: :not_found}}

      client ->
        case Client.changeset(client, params) |> Repo.update() do
          {:ok, client} ->
            {:ok, Repo.preload(client, :integrations)}

          {:error, error} ->
            {:error, %{result: error, status: :not_found}}
        end
    end
  end
end
