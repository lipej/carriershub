defmodule Carrierhub.Schema.Integrations do
  use Ecto.Schema
  alias Carrierhub.Schema.{Clients}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "integrations" do
   field :name, :string
   field :fields, :map
   belongs_to :clients, Clients
   timestamps()
  end
end