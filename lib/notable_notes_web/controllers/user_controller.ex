defmodule NotableNotesWeb.UserController do
  use NotableNotesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
