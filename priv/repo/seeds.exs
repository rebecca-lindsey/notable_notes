# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     NotableNotes.Repo.insert!(%NotableNotes.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias NotableNotes.Repo
alias NotableNotes.User

Repo.insert!(%User{
  email: "test@test.com",
  password: <<0, 255, 42>>,
  username: "Test User"
})
