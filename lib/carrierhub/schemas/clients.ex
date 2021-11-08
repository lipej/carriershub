defmodule Carrierhub.Schema.Clients do
  use Ecto.Schema
  alias Carrierhub.Schema.{Integrations}
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @fields [:name, :key, :cnpj]

  schema "clients" do
   field :name, :string
   field :key, :string
   field :cnpj, :string
   has_many :integrations, Integrations
   timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:cnpj, is: 14)
    |> unique_constraint(:cnpj)
  end
    
end