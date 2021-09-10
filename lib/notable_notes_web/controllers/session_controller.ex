defmodule NotableNotesWeb.SessionController do
  use NotableNotesWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(_conn, _params) do
  end

  def delete(_conn, _params) do
  end
end
