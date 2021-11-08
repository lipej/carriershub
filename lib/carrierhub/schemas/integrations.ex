defmodule Carrierhub.Schema.Integrations do
  use Ecto.Schema
  alias Carrierhub.Schema.{Clients}
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @fields [:name, :fields, :clients_id]

  schema "integrations" do
   field :name, :string
   field :fields, :map
   belongs_to :clients, Clients
   timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
  end

end