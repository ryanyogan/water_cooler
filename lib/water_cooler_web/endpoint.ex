defmodule WaterCoolerWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :water_cooler

  @session_options [
    store: :cookie,
    key: "_water_cooler_key",
    signing_salt: "zkqXoYqY"
  ]

  socket "/socket", WaterCoolerWeb.UserSocket,
    websocket: true,
    longpoll: false

  socket "/live",
         Phoenix.LiveView.Socket,
         websocket: [connect_info: [session: @session_options]]

  plug Plug.Static,
    at: "/",
    from: :water_cooler,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
       @session_options

  plug WaterCoolerWeb.Router
end
