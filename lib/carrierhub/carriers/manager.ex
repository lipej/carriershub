defmodule Carrierhub.Carriers.Manager do
  alias Carrierhub.{Repo, Clients}

  def do_action(plugin, action, fields, data) do
    apply(plugin, action, [data, fields])
  end

  def can_perform_action(plugin, action) do
    if Keyword.has_key?(plugin.__info__(:functions), String.to_atom(action)),
      do: {:ok, String.to_atom(action)},
      else: {:error, %{result: "Can't perform action: #{action}", status: :bad_request}}
  end

  def check_integrations(uuid, carrier) do
    with {:ok, client} <- find_client(uuid) do
      extract_fields({:ok, client}, carrier)
    end
  end

  defp find_client(uuid) do
    with client <- Repo.get(Clients, uuid) do
      case Repo.preload(client, :integrations) do
        nil -> {:error, %{result: "client not found with UUID #{uuid}", status: :bad_request}}
        client -> client
      end
    end
  end

  defp extract_fields({:ok, client}, carrier) do
    case client do
      client ->
        case Enum.filter(client.integrations, fn
               %{name: ^carrier} -> true
               _ -> false
             end) do
          element ->
            case List.first(element) do
              nil ->
                {:error, %{result: "integration not found for #{carrier}", status: :bad_request}}

              integration ->
                {:ok, integration.fields}
            end
        end
    end
  end
end
