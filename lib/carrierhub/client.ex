defmodule Carrierhub.Clients do
  use Ecto.Schema
  alias Carrierhub.{Integrations}
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @fields [:name, :key, :cnpj]
  @derive {Jason.Encoder, only: [:id, :name, :key, :cnpj, :integrations]}

  schema "clients" do
    field(:name, :string)
    field(:key, :string)
    field(:cnpj, :string)
    has_many(:integrations, Integrations)
    timestamps()
  end

  def changeset(model, params) do
    model
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:cnpj, is: 14)
    |> unique_constraint(:cnpj)
  end
end
