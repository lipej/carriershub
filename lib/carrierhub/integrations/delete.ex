defmodule Carriershub.Integration.Delete do
  import Carriershub.Integration

  def call(uuid) do
    if integration = get(uuid) do
      case delete(integration) do
        {:ok, integration} ->
          {:ok, integration}

        {:error, error} ->
          {:error, %{result: error, status: :not_found}}
      end
    else
      {:error, %{result: "integration not found", status: :not_found}}
    end
  end
end
