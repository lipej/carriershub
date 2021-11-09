defmodule Carrierhub.Integrations.Get do
  alias Carrierhub.{Repo, Integrations}

  def call(uuid) do
    case Repo.get(Integrations, uuid) do
      nil -> {:error, %{result: "integration not found", status: :not_found}}
      integration -> {:ok, integration}
    end
  end
end
