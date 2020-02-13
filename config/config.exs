import Config

config :water_cooler,
  ecto_repos: [WaterCooler.Repo]

config :water_cooler, WaterCoolerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q1ncB59hdppsLh1EFWL57fhDgHJFJpfuEHaH3KbAnuXGf5eGju6bFs52vKrSVroT",
  render_errors: [view: WaterCoolerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WaterCooler.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
