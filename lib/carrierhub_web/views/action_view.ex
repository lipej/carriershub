defmodule CarrierhubWeb.ActionView do
  use CarrierhubWeb, :view

  def render("action.json", %{response: response}) do
    %{
      success: true,
      data: response
    }
  end
end
