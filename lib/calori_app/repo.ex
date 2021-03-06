defmodule CaloriApp.Repo do
  use Ecto.Repo,
    otp_app: :calori_app,
    adapter: Ecto.Adapters.Postgres
end
