defmodule Carriershub.Integration.Create do
  import Carriershub.Integration

  def call(params) do
    case create(params) do
      {:ok, integration} -> {:ok, integration}
    end
  end
end
