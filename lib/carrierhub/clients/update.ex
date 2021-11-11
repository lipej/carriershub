defmodule Carriershub.Client.Update do
  import Carriershub.Client

  def call(params) do
    if client = get(params["id"]) do
      case update(client, params) do
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
