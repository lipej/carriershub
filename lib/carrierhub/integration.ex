defmodule Carrierhub.Integration do
  use Ecto.Schema
  alias Carrierhub.{Client}
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @fields [:name, :fields, :client_id]
  @derive {Jason.Encoder, only: [:name, :fields, :id]}

  schema "integrations" do
    field(:name, :string)
    field(:fields, :map)
    belongs_to(:client, Client)
    timestamps()
  end

  def changeset(model, params) do
    model
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
