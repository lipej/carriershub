defmodule CarriershubWeb.AuthControllerTest do
  use CarriershubWeb.ConnCase
  use ExUnit.Case, async: true
  alias Carriershub.Repo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "it should get error with wrong integration key" do
    conn =
      post(
        build_conn(),
        "/api/auth",
        key: "unknownkey"
      )

    assert json_response(conn, 404)
  end
end
