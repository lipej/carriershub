defmodule Carriershub.Carriers.Loader do
  alias Carriershub.Carriers.Plugins

  def can_loader(integration) do
    integration = String.capitalize(String.downcase(integration))

    case Code.ensure_loaded(Module.concat(Plugins, integration)) do
      {:module, module} ->
        {:ok, module}

      _ ->
        {:error, %{result: "#{integration} plugin was not implemeted", status: :bad_request}}
    end
  end
end
