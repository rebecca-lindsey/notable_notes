defmodule NotableNotesWeb.NoteController do
  use NotableNotesWeb, :controller

  alias NotableNotes.Note
  alias NotableNotes.User
  alias NotableNotes.Repo

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    changeset = Note.changeset(%Note{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"note" => note}) do
    changeset =
      Repo.get(User, 1)
      |> Ecto.build_assoc(:notes)
      |> Note.changeset(note)

    case Repo.insert(changeset) do
      {:ok, _note} ->
        conn =
          conn
          |> put_flash(:info, "Note Created")

        redirect(conn, to: Routes.note_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
