defmodule Carrierhub.Carriers.Loader do
  alias Carrierhub.Carriers.Plugins

  def pluginLoader(name) do
      plugin_name = Module.concat(Plugins, String.capitalize(name))

      if canHandler(Code.ensure_loaded(plugin_name)),
        do: {:ok, plugin_name},
        else: {:error, %{result: "#{name} plugin was not implemeted", status: :bad_request} }
  end

  def canPerformAction(plugin, action) do
    if Keyword.has_key?(plugin.__info__(:functions), String.to_atom(action) ),
      do: {:ok, {String.to_atom(action)}},
      else: {:error, %{result: "Can't perform action: #{action}", status: :bad_request} } 
  end

  defp canHandler({:module, _module}), do: true
  defp canHandler({:error, _message}), do: false
  
end
