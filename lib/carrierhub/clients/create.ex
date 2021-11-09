defmodule Carrierhub.Clients.Create do
  alias Carrierhub.{Repo, Clients}

  def call(params) do
    case Clients.changeset(%Clients{}, params) |> Repo.insert() do
      {:error, result} -> {:error, %{result: result, status: :not_found}}
      {:ok, client} -> {:ok, Repo.preload(client, :integrations)}
    end
  end
end
