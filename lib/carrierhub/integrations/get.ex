defmodule Carrierhub.Integration.Get do
  alias Carrierhub.{Repo, Integration}

  def call(uuid) do
    case Repo.get(Integration, uuid) do
      nil -> {:error, %{result: "integration not found", status: :not_found}}
      integration -> {:ok, integration}
    end
  end
end
