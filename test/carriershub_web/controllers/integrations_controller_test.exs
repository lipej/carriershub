defmodule CarriershubWeb.IntegrationsControllerTest do
  use CarriershubWeb.ConnCase
  use ExUnit.Case, async: false
  alias Carriershub.Repo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  post(build_conn(), "/api/clients",
    name: "test",
    key: "key",
    cnpj: "00000000000000"
  )

  @fake_uuid "eeb6804d-b32a-4f9a-ba23-6fd5ebefe343"

  @token json_response(post(build_conn(), "/api/auth", key: "key"), 200)["token"]

  test "it should create a integration" do
    conn =
      post(
        build_conn() |> put_req_header("authorization", "Bearer " <> @token),
        "/api/integrations",
        name: "Test Carrier",
        fields: %{key: "93018912nrlknfi1c"}
      )

    assert data = json_response(conn, 201)["data"]

    assert %{
             "name" => "Test Carrier",
             "fields" => %{"key" => "93018912nrlknfi1c"}
           } = data
  end

  test "it should get a integration" do
    assert %{"id" => id} =
             json_response(
               post(
                 build_conn() |> put_req_header("authorization", "Bearer " <> @token),
                 "/api/integrations",
                 name: "Test Carrier",
                 fields: %{key: "93018912nrlknfi1c"}
               ),
               201
             )["data"]

    assert data =
             json_response(
               get(
                 build_conn() |> put_req_header("authorization", "Bearer " <> @token),
                 "/api/integrations/" <> id
               ),
               200
             )["data"]

    assert %{
             "name" => "Test Carrier",
             "fields" => %{"key" => "93018912nrlknfi1c"}
           } = data
  end

  test "it should update a integration" do
    assert %{"id" => id} =
             json_response(
               post(
                 build_conn() |> put_req_header("authorization", "Bearer " <> @token),
                 "/api/integrations",
                 name: "Test Carrier",
                 fields: %{key: "93018912nrlknfi1c"}
               ),
               201
             )["data"]

    conn =
      put(
        build_conn() |> put_req_header("authorization", "Bearer " <> @token),
        "/api/integrations/" <> id,
        name: "Test Carrier",
        fields: %{key: "93018912nrlknfi1c", key2: "1s65df65sf655454F54D"}
      )

    assert data = json_response(conn, 200)["data"]

    assert %{
             "name" => "Test Carrier",
             "fields" => %{"key" => "93018912nrlknfi1c", "key2" => "1s65df65sf655454F54D"}
           } = data
  end

  test "it should delete a integration" do
    assert %{"id" => id} =
             json_response(
               post(
                 build_conn() |> put_req_header("authorization", "Bearer " <> @token),
                 "/api/integrations",
                 name: "Test Carrier",
                 fields: %{key: "93018912nrlknfi1c"}
               ),
               201
             )["data"]

    conn =
      delete(
        build_conn() |> put_req_header("authorization", "Bearer " <> @token),
        "/api/integrations/" <> id
      )

    assert json_response(conn, 200)
  end

  test "it should get error with invalid integration uuid" do
    conn =
      delete(
        build_conn() |> put_req_header("authorization", "Bearer " <> @token),
        "/api/integrations/" <> @fake_uuid
      )

    assert json_response(conn, 404)
  end
end
