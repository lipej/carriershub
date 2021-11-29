defmodule CarriershubWeb.ClientsControllerTest do
  use CarriershubWeb.ConnCase
  use ExUnit.Case, async: true
  alias Carriershub.Repo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  @hack_token Phoenix.Token.sign(CarriershubWeb.Endpoint, "suuuuuuper_secret", %{
                id: "bf945ca6-b8d6-41d5-a656-e42826db7bd2",
                name: "test"
              })

  test "it should create a client" do
    conn =
      post(build_conn(), "/api/clients", name: "test", key: "testkey", cnpj: "00000000000001")

    assert data = json_response(conn, 201)["data"]

    assert %{
             "name" => "test",
             "key" => "testkey",
             "cnpj" => "00000000000001",
             "integrations" => []
           } = data
  end

  test "it should get errot when create two clients with same cnpj" do
    post(build_conn(), "/api/clients", name: "test", key: "testkey", cnpj: "00000000000001")

    conn =
      post(build_conn(), "/api/clients", name: "test", key: "testkey", cnpj: "00000000000001")

    assert json_response(conn, 404)
  end

  test "it should get client by token" do
    post(build_conn(), "/api/clients", name: "test", key: "testkey", cnpj: "00000000000001")

    token = json_response(post(build_conn(), "/api/auth", key: "testkey"), 200)["token"]

    conn =
      get(build_conn() |> put_req_header("authorization", "Bearer " <> token), "/api/clients")

    assert data = json_response(conn, 200)["data"]

    assert %{
             "name" => "test",
             "key" => "testkey",
             "cnpj" => "00000000000001",
             "integrations" => []
           } = data
  end

  test "it should get 401 with invalid token" do
    conn =
      get(build_conn() |> put_req_header("authorization", "Bearer invalid_token"), "/api/clients")

    assert json_response(conn, 401)
  end

  test "it should update client name" do
    post(build_conn(), "/api/clients", name: "test", key: "testkey", cnpj: "00000000000001")
    token = json_response(post(build_conn(), "/api/auth", key: "testkey"), 200)["token"]

    conn =
      patch(build_conn() |> put_req_header("authorization", "Bearer " <> token), "/api/clients",
        name: "new client name"
      )

    assert data = json_response(conn, 200)["data"]

    assert %{
             "name" => "new client name"
           } = data
  end

  test "it should delete it self" do
    post(build_conn(), "/api/clients", name: "test", key: "testkey", cnpj: "00000000000001")
    token = json_response(post(build_conn(), "/api/auth", key: "testkey"), 200)["token"]

    conn =
      delete(build_conn() |> put_req_header("authorization", "Bearer " <> token), "/api/clients")

    assert json_response(conn, 200)
  end

  test "DELETE it should get error when token has unknown uuid" do
    conn =
      delete(
        build_conn() |> put_req_header("authorization", "Bearer " <> @hack_token),
        "/api/clients"
      )

    assert json_response(conn, 404)
  end

  test "GET it should get error when token has unknown uuid" do
    conn =
      get(
        build_conn() |> put_req_header("authorization", "Bearer " <> @hack_token),
        "/api/clients"
      )

    assert json_response(conn, 404)
  end

  test "PATCH it should get error when token has unknown uuid" do
    conn =
      patch(
        build_conn() |> put_req_header("authorization", "Bearer " <> @hack_token),
        "/api/clients"
      )

    assert json_response(conn, 404)
  end
end
