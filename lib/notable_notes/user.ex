defmodule NotableNotes.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias NotableNotes.User

  schema "users" do
    field :email, :string
    field :password, :binary
    field :username, :string
    has_many :notes, NotableNotes.Note

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password, :username])
    |> validate_required([:email, :password, :username])
  end
end
