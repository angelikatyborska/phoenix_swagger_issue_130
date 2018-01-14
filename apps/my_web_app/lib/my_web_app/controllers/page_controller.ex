defmodule MyWebApp.PageController do
  use MyWebApp, :controller
  use PhoenixSwagger

  swagger_path :index do
    get "/"
    description "Phoenix Welcome Page"
    produces "text/html"
    response 200, "Success"
  end

  def index(conn, _params) do
    render conn, "index.html"
  end
end
