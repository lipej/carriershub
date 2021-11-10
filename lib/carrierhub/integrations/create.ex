defmodule Carrierhub.Integration.Create do
  alias Carrierhub.{Repo, Integration}

  def call(params) do
    case Integration.changeset(%Integration{}, params) |> Repo.insert() do
      {:error, result} -> {:error, %{result: result, status: :not_found}}
      {:ok, integration} -> {:ok, integration}
    end
  end
end
