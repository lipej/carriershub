defmodule Carrierhub.Carriers.Loader do
  alias Carrierhub.Carriers.Plugins

  def pluginLoader(name) do
      plugin_name = Module.concat(Plugins, String.capitalize(name))

      if canHandler(Code.ensure_loaded(plugin_name)),
        do: {:ok, plugin_name},
        else: raise NotImplementedError,
          message: "#{name} plugin was not implemeted"

  end

  defp canHandler({:module, module}), do: true
  defp canHandler({:error, message}), do: false
  
end


defmodule NotImplementedError do
  defexception [:message, code: :bad_request]
end