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

  def register_changeset(attrs \\ %{}) do
    %User{}
    |> cast(attrs, [:email, :username, :password])
    |> validate_required([:email, :username, :password])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> validate_format(:email, ~r/@/)
    |> validate_format(:username, ~r/^[a-zA-Z0-9]*$/)
    |> validate_length(:password, min: 4)
  end
end
