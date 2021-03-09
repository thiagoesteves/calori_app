# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :calori_app,
  ecto_repos: [CaloriApp.Repo]

# Configures the endpoint
config :calori_app, CaloriAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OkhFE7LZwf26KuKgiztihgjdom03hhg/dHtC5PVnKtSWn69c6dB7Z9D9EI+Df7a3",
  render_errors: [view: CaloriAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CaloriApp.PubSub,
  live_view: [signing_salt: "ycWpVqV/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :calori_app, :pow,
  user: CaloriApp.Users.User,
  repo: CaloriApp.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
