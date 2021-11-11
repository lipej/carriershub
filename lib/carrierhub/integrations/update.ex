defmodule Carriershub.Integration.Update do
  import Carriershub.Integration

  def call(params) do
    if integration = get(params["id"]) do
      case update(integration, params) do
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
