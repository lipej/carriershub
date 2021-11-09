defmodule CarrierhubWeb.ClientsView do
  use CarrierhubWeb, :view

  def render("index.json", %{client: client}) do
    %{
      success: true,
      data: client
    }
  end
end
