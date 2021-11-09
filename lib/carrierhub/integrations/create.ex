defmodule Carrierhub.Integrations.Create do
  alias Carrierhub.{Repo, Integrations}

  def call(params) do
    case Integrations.changeset(%Integrations{}, params) |> Repo.insert() do
      {:error, result} -> {:error, %{result: result, status: :not_found}}
      {:ok, integration} -> {:ok, integration}
    end
  end
end
