defmodule NotableNotesWeb.NoteController do
  use NotableNotesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end