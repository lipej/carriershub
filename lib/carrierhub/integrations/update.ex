defmodule Carrierhub.Integrations.Update do
  alias Carrierhub.{Repo, Integrations}

  def call(params) do
    case Repo.get(Integrations, params["id"]) do
      nil ->
        {:error, %{result: "integration not found", status: :not_found}}

      integration ->
        case Integrations.changeset(integration, params) |> Repo.update() do
          {:ok, integration} ->
            {:ok, integration}

          {:error, error} ->
            {:error, %{result: error, status: :not_found}}
        end
    end
  end
end
