defmodule Carrierhub.Client.Create do
  alias Carrierhub.{Repo, Client}

  def call(params) do
    case Client.changeset(%Client{}, params) |> Repo.insert() do
      {:error, result} -> {:error, %{result: result, status: :not_found}}
      {:ok, client} -> {:ok, Repo.preload(client, :integrations)}
    end
  end
end
