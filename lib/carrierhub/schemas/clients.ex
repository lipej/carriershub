defmodule Carrierhub.Schema.Clients do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "clients" do
   field :name, :string
   field :key, :string
   has_many :integrations, Carrierhub.Schema.Integrations
   timestamps()
  end

  
end