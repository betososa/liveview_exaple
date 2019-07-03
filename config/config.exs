# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_view_talk,
  ecto_repos: [LiveViewTalk.Repo]

# Configures the endpoint
config :live_view_talk, LiveViewTalkWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CIHOrH9QrYLJruWEb927StKtUvihpIhKSqw+3ZLmvlyKgFyTGFg/PDt90rp4jefX",
  render_errors: [view: LiveViewTalkWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveViewTalk.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "9uaSB/UfKh60i0AwwH/yP2WNziFU5tVu"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
