defmodule Carrierhub.Schema.Integrations do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "integrations" do
   field :name, :string
   field :fields, :map
   belongs_to :clients, Carrierhub.Schema.Clients
   timestamps()
  end
end