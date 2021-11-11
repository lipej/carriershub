defmodule Carriershub.Client.Create do
  import Carriershub.Client

  def call(params) do
    case create(params) do
      {:ok, client} -> {:ok, preload(client)}
      {_, result} -> {:error, %{result: result, status: :not_found}}
    end
  end
end
