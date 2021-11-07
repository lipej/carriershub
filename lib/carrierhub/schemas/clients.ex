defmodule Carrierhub.Schema.Clients do
  use Ecto.Schema
  alias Carrierhub.Schema.{Integrations}

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "clients" do
   field :name, :string
   field :key, :string
   has_many :integrations, Integrations
   timestamps()
  end

  
end