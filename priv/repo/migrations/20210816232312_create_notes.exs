defmodule NotableNotes.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :title, :string
      add :body, :text
      add :color, :string
      add :user_id, references(:users), null: false

      timestamps()
    end

  end
end
