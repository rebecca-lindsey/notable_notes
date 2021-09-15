defmodule NotableNotesWeb.UserController do
  use NotableNotesWeb, :controller

  alias NotableNotes.User
  alias NotableNotes.Repo

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user}) do
    changeset = User.changeset(%User{}, user)

    case Repo.insert(changeset) do
      {:ok, _changeset} ->
        conn =
          conn
          |> put_flash(:info, "New User created")

        redirect(conn, to: Routes.note_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
