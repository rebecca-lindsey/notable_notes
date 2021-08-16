defmodule NotableNotes.Repo do
  use Ecto.Repo,
    otp_app: :notable_notes,
    adapter: Ecto.Adapters.Postgres
end
