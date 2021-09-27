defmodule NotableNotes.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :notable_notes, module: NotableNotes.Auth.Guardian

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.LoadResource, allow_blank: true
end
