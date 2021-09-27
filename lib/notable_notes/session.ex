defmodule NotableNotes.Session do
  alias NotableNotes.User
  alias NotableNotes.Repo

  def authenticate(%{"email" => email, "password" => given_password}) do
    IO.inspect(email, label: "email")
    IO.inspect(given_password, label: "password")
    user = Repo.get_by(User, email: email)
    IO.inspect(user, label: "user")

    Bcrypt.check_pass(user, given_password, hash_key: :password)
  end
end
