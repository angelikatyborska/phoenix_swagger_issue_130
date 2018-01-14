defmodule MyWebApp.Router do
  use MyWebApp, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/swagger" do
    forward "/", PhoenixSwagger.Plug.SwaggerUI,
            otp_app: :my_web_app,
            swagger_file: "swagger.json",
            disable_validator: true
  end

  scope "/", MyWebApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  def swagger_info do
    %{
      info: %{
        version: "1.0",
        title: "My Web App"
      }
    }
  end


  # Other scopes may use custom stacks.
  # scope "/api", MyWebApp do
  #   pipe_through :api
  # end
end
