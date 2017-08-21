defmodule ExampleWeb.PageController do
  use ExampleWeb, :controller

  def index(conn, _params) do
    token = case get_req_header(conn, "authorization") do
      [token] -> token
      _ -> "unknown"
    end

    text conn, "Authorization token is #{token}"
  end
end
