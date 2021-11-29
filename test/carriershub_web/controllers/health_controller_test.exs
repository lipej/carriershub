defmodule CarriershubWeb.HealthControllerTest do
  use CarriershubWeb.ConnCase
  use ExUnit.Case, async: true
  alias Carriershub.Repo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "should get health" do
    conn = get(build_conn(), "/api/health")

    assert json_response(conn, 200) == %{"message" => "Running..."}
  end
end
