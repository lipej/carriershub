defmodule Carriershub.Integration do
  use Ecto.Schema
  alias Carriershub.{Client, Repo, Integration}
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

  def preload(integration) do
    Repo.preload(integration, :clients)
  end

  def get_integration_by_client(uuid, carrier) do
    Repo.get_by(Carriershub.Integration, client_id: uuid, name: carrier)
  end

  def get(id) do
    Integration
    |> Repo.get(id)
  end

  def create(params) do
    %Integration{}
    |> changeset(params)
    |> Repo.insert()
  end

  def delete(integration) do
    Repo.delete(integration)
  end

  def update(integration, params) do
    integration
    |> changeset(params)
    |> Repo.update()
  end
end
