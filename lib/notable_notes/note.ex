defmodule NotableNotes.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :body, :string
    field :color, :string
    field :title, :string
    belongs_to :user, NotableNotes.User

    timestamps()
  end

  @doc false
  def changeset(note, attrs \\ %{}) do
    note
    |> cast(attrs, [:title, :body, :color, :user_id])
    |> validate_required([:title, :body, :color, :user_id])
  end
end
