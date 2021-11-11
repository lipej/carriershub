defmodule Carriershub.Client.Delete do
  import Carriershub.Client

  def call(uuid) do
    if client = get(uuid) do
      case delete(client) do
        {:ok, client} ->
          {:ok, preload(client)}

        {_, error} ->
          {:error, %{result: error, status: :not_found}}
      end
    else
      {:error, %{result: "client not found", status: :not_found}}
    end
  end
end
