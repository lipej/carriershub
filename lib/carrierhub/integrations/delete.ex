defmodule Carriershub.Integration.Delete do
  import Carriershub.Integration

  def call(uuid) do
    if integration = get(uuid) do
      case delete(integration) do
        {:ok, integration} ->
          {:ok, integration}
      end
    end
  end
end
