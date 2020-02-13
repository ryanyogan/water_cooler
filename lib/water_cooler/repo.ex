defmodule WaterCooler.Repo do
  use Ecto.Repo,
    otp_app: :water_cooler,
    adapter: Ecto.Adapters.Postgres
end
