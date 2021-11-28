defmodule Carriershub.Client do
  use Ecto.Schema
  alias Carriershub.{Integration, Repo, Client}
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @fields [:name, :key, :cnpj]
  @derive {Jason.Encoder, only: [:id, :name, :key, :cnpj, :integrations]}

  schema "clients" do
    field(:name, :string)
    field(:key, :string)
    field(:cnpj, :string)
    has_many(:integrations, Integration)
    timestamps()
  end

  def changeset(model, params) do
    model
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:cnpj, is: 14)
    |> unique_constraint(:cnpj)
  end

  def preload(client) do
    Repo.preload(client, :integrations)
  end

  def find_by_key(key) do
    case Repo.get_by(Client, key: key) do
      nil -> {:error, "Client not found"}
      client -> {:ok, client}
    end
  end

  def create(params) do
    %Client{}
    |> changeset(params)
    |> Repo.insert()
  end

  def get(id) do
    Client
    |> Repo.get(id)
  end

  def delete(client) do
    Repo.delete(client)
  end

  def update(client, params) do
    client
    |> changeset(params)
    |> Repo.update()
  end
end
