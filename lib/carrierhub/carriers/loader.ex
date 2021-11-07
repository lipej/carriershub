defmodule Carrierhub.Carriers.Loader do
  alias Carrierhub.Carriers.Plugins

  def pluginLoader(name) do
      plugin_name = Module.concat(Plugins, String.capitalize(name))

      if canHandler(Code.ensure_loaded(plugin_name)),
        do: {:ok, plugin_name},
        else: {:error, "#{plugin_name} this plugin was not implemented."}
  end

  defp canHandler({:module, module}), do: true
  defp canHandler({:error, message}), do: false
  
end