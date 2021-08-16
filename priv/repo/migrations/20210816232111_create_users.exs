defmodule NotableNotes.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password, :binary
      add :username, :string

      timestamps()
    end

  end
end
