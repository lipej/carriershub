defmodule CarriershubWeb.IntegrationsView do
  use CarriershubWeb, :view

  def render("index.json", %{integration: integration}) do
    %{
      success: true,
      data: integration
    }
  end
end
