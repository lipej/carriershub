defmodule Carriershub.Integration.Create do
  import Carriershub.Integration

  def call(params) do
    case create(params) do
      {:error, result} -> {:error, %{result: result, status: :not_found}}
      {:ok, integration} -> {:ok, integration}
    end
  end
end
