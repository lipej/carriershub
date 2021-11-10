defmodule Carrierhub.Carriers.Loader do
  alias Carrierhub.Carriers.Plugins

  def plugin_loader(name) do
    name = String.capitalize(String.downcase(name))
    plugin_name = Module.concat(Plugins, name)

    if canHandler(Code.ensure_loaded(plugin_name)),
      do: {:ok, plugin_name},
      else: {:error, %{result: "#{name} plugin was not implemeted", status: :bad_request}}
  end

  defp canHandler({:module, _module}), do: true
  defp canHandler({:error, _message}), do: false
end
