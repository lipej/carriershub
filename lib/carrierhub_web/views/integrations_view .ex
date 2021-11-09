defmodule CarrierhubWeb.IntegrationsView do
  use CarrierhubWeb, :view

  def render("index.json", %{integration: integration}) do
    %{
      success: true,
      data: integration
    }
  end
end
