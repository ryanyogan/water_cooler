import Config

config :water_cooler, WaterCoolerWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn

import_config "test.secret.exs"
