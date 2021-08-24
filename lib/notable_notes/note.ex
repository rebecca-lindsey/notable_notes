defmodule NotableNotes.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :body, :string
    field :color, :string
    field :title, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(note, attrs \\ %{}) do
    note
    |> cast(attrs, [:title, :body, :color, :user_id])
    |> validate_required([:title, :body, :color, :user_id])
  end
end
