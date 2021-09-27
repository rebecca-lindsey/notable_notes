defmodule NotableNotesWeb.SessionController do
  use NotableNotesWeb, :controller

  alias NotableNotes.Session
  alias NotableNotes.Auth.Guardian

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, params) do
    case Session.authenticate(params) do
      {:ok, %{username: username} = user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> put_flash(:info, "Logged in as #{username}!")
        |> render("new.html")

      {:error, message} ->
        conn
        |> put_flash(:error, message)
        |> render("new.html")
    end

    conn
    |> put_flash(:error, "Unable to login!")
    |> render("new.html")
  end

  def delete(_conn, _params) do
  end
end
