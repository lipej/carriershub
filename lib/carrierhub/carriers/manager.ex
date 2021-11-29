defmodule Carriershub.Carriers.Manager do
  import Carriershub.Integration

  def do_action(plugin, action, fields, data) do
    apply(plugin, action, [data, fields])
  end

  def can_perform_action(plugin, action) do
    action = String.downcase(action)

    case Keyword.has_key?(plugin.__info__(:functions), String.to_atom(action)) do
      true -> {:ok, String.to_atom(action)}
      false -> {:error, %{result: "can't perform action: #{action}", status: :bad_request}}
    end
  end

  @spec get_fields(any, binary) ::
          {:error, %{result: <<_::64, _::_*8>>, status: :bad_request}} | {:ok, any}
  def get_fields(uuid, integration) do
    case get_integration_by_client(uuid, String.capitalize(integration)) do
      nil ->
        {:error,
         %{
           result: "no integration fields for #{integration}.",
           status: :bad_request
         }}

      client ->
        {:ok, client.fields}
    end
  end
end
