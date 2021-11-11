defmodule Carriershub.Integration.Get do
  import Carriershub.Integration

  def call(uuid) do
    case get(uuid) do
      nil -> {:error, %{result: "integration not found", status: :not_found}}
      integration -> {:ok, integration}
    end
  end
end
