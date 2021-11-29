defmodule CarriershubWeb.ActionControllerTest do
  use CarriershubWeb.ConnCase
  use ExUnit.Case, async: true
  alias Carriershub.Repo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  post(build_conn(), "/api/clients",
    name: "test",
    key: "testaction",
    cnpj: "00000000000002"
  )

  @token json_response(post(build_conn(), "/api/auth", key: "testaction"), 200)["token"]

  test "it should perform action tracking/solicitation in Faker" do
    post(
      build_conn() |> put_req_header("authorization", "Bearer " <> @token),
      "/api/integrations",
      name: "Faker",
      fields: %{key: "93018912nrlknfi1c"}
    )

    tracking =
      post(
        build_conn() |> put_req_header("authorization", "Bearer " <> @token),
        "/api/action",
        integration: "faker",
        data: %{codes: ["AE0123456789BR"]},
        action: "tracking"
      )

    assert json_response(tracking, 200)

    solicitation =
      post(
        build_conn() |> put_req_header("authorization", "Bearer " <> @token),
        "/api/action",
        integration: "faker",
        data: %{size: "S", weight: "1", value: "1"},
        action: "solicitation"
      )

    assert json_response(solicitation, 200)
  end

  test "it should get errot when try to perform a action in plugin not implemented" do
    post(
      build_conn() |> put_req_header("authorization", "Bearer " <> @token),
      "/api/integrations",
      name: "Correios",
      fields: %{key: "93018912nrlknfi1c"}
    )

    conn =
      post(
        build_conn() |> put_req_header("authorization", "Bearer " <> @token),
        "/api/action",
        integration: "correios",
        data: %{codes: ["AE0123456789BR"]},
        action: "tracking"
      )

    assert json_response(conn, 400) == %{
             "message" => "Correios plugin was not implemeted",
             "success" => false
           }
  end

  test "it should get errot when client don't have integration" do
    conn =
      post(
        build_conn() |> put_req_header("authorization", "Bearer " <> @token),
        "/api/action",
        integration: "any",
        data: %{codes: ["AE0123456789BR"]},
        action: "tracking"
      )

    assert json_response(conn, 400) == %{
             "message" => "no integration fields for any.",
             "success" => false
           }
  end

  test "it should get errot when try to perform a action in not implemented" do
    post(
      build_conn() |> put_req_header("authorization", "Bearer " <> @token),
      "/api/integrations",
      name: "Test",
      fields: %{key: "93018912nrlknfi1c"}
    )

    conn =
      post(
        build_conn() |> put_req_header("authorization", "Bearer " <> @token),
        "/api/action",
        integration: "test",
        data: %{codes: ["AE0123456789BR"]},
        action: "cancel"
      )

    assert json_response(conn, 400) == %{
             "message" => "can't perform action: cancel",
             "success" => false
           }
  end
end
