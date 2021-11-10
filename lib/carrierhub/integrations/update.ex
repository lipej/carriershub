defmodule Carrierhub.Integration.Update do
  alias Carrierhub.{Repo, Integration}

  def call(params) do
    case Repo.get(Integration, params["id"]) do
      nil ->
        {:error, %{result: "integration not found", status: :not_found}}

      integration ->
        case Integration.changeset(integration, params) |> Repo.update() do
          {:ok, integration} ->
            {:ok, integration}

          {:error, error} ->
            {:error, %{result: error, status: :not_found}}
        end
    end
  end
end
