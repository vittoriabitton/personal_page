defmodule PersonalPageWeb.Router do
  use PersonalPageWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PersonalPageWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", PersonalPageWeb do
    pipe_through :browser

    live "/", HomeLive
    live "/til", TilLive
    live "/til/:slug", TilLive.Show
    live "/projects", ProjectsLive
  end

  if Application.compile_env(:personal_page, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PersonalPageWeb.Telemetry
    end
  end
end
