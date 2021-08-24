defmodule NotableNotesWeb.NoteController do
  use NotableNotesWeb, :controller

  alias NotableNotes.Note

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    changeset = Note.changeset(%Note{})
    render(conn, "new.html", changeset: changeset)
  end
end
