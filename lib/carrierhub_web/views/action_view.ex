defmodule CarriershubWeb.ActionView do
  use CarriershubWeb, :view

  def render("action.json", %{response: response}) do
    %{
      success: true,
      data: response
    }
  end
end
