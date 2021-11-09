defmodule Carrierhub.Integrations.Delete do
  alias Carrierhub.{Repo, Integrations}

  def call(uuid) do
    case Repo.get(Integrations, uuid) do
      nil ->
        {:error, %{result: "integration not found", status: :not_found}}

      integration ->
        case Repo.delete(integration) do
          {:ok, integration} ->
            {:ok, integration}

          {:error, error} ->
            {:error, %{result: error, status: :not_found}}
        end
    end
  end
end
