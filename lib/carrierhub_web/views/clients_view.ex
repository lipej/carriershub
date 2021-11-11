defmodule CarriershubWeb.ClientsView do
  use CarriershubWeb, :view

  def render("index.json", %{client: client}) do
    %{
      success: true,
      data: client
    }
  end
end
