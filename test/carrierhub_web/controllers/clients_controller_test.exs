defmodule CarriershubWeb.ClientsControllerTest do
  use CarriershubWeb.ConnCase
  use ExUnit.Case, async: true
  alias Carriershub.Repo

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "it should create a client" do
    conn =
      post(build_conn(), "/api/clients", name: "test one", key: "testkey", cnpj: "00000000000006")

    assert data = json_response(conn, 201)["data"]

    assert %{
             "name" => "test one",
             "key" => "testkey",
             "cnpj" => "00000000000006",
             "integrations" => []
           } = data
  end

  test "it should get errot when create two clients with same cnpj" do
    post(build_conn(), "/api/clients", name: "test two", key: "testkey2", cnpj: "00000000000013")

    conn =
      post(build_conn(), "/api/clients", name: "test two", key: "testkey2", cnpj: "00000000000013")

    assert json_response(conn, 404)
  end
end
