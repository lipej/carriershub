defmodule Carriershub.Integration.Update do
  import Carriershub.Integration

  def call(params) do
    if integration = get(params["id"]) do
      case update(integration, params) do
        {:ok, integration} ->
          {:ok, integration}
      end
    end
  end
end
