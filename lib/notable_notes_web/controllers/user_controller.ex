defmodule NotableNotesWeb.UserController do
  use NotableNotesWeb, :controller

  alias NotableNotes.User
  alias NotableNotes.Repo

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => %{"password" => password} = user}) do
    user = Map.merge(user, %{"password" => Bcrypt.hash_pwd_salt(password)})

    case Repo.insert(User.register_changeset(user)) do
      {:ok, _changeset} ->
        conn =
          conn
          |> put_flash(:info, "New User created")

        redirect(conn, to: Routes.note_path(conn, :index))

      {:error, changeset} ->
        conn =
          conn
          |> put_flash(:error, "Please fill out all fields")

        render(conn, "new.html", changeset: changeset)
    end
  end
end
