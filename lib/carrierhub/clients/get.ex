defmodule Carriershub.Client.Get do
  import Carriershub.Client

  def call(uuid) do
    case get(uuid) do
      nil -> {:error, %{result: "client not found", status: :not_found}}
      client -> {:ok, preload(client)}
    end
  end
end
