defmodule ExampleWeb.PageControllerTest do
  use ExampleWeb.ConnCase

  describe "single request" do
    test "single request has the auth token", %{conn: conn} do
      conn = conn
      |> put_req_header("authorization", "secret")
      |> get("/")

      assert text_response(conn, 200) =~ "Authorization token is secret"
    end
  end

  describe "two requests" do
    test "only the first request has the auth token", %{conn: conn} do
      conn = conn
      |> put_req_header("authorization", "secret")
      |> get("/")

      assert text_response(conn, 200) =~ "Authorization token is secret"

      conn = conn
      |> get("/")

      assert text_response(conn, 200) =~ "Authorization token is unknown"
    end

    test "can't set req headers on second request conn", %{conn: conn} do
      conn = conn
      |> put_req_header("authorization", "secret")
      |> get("/")

      assert text_response(conn, 200) =~ "Authorization token is secret"

      assert_raise Plug.Conn.AlreadySentError, fn ->
        conn
        |> put_req_header("authorization", "secret")
        |> get("/")
      end
    end
  end
end
