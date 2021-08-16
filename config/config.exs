# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :notable_notes,
  ecto_repos: [NotableNotes.Repo]

# Configures the endpoint
config :notable_notes, NotableNotesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rvZTUqKAjDRrwNHMQlM6xY3hIox6ds0He1a6s18PWj1Hivx+goVL8F3qfpNj3j6X",
  render_errors: [view: NotableNotesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: NotableNotes.PubSub,
  live_view: [signing_salt: "gCikULCk"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
