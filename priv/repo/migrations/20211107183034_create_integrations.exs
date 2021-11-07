defmodule Carrierhub.Repo.Migrations.CreateIntegrations do
  use Ecto.Migration

  def change do
    create table(:integrations , primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :fields, :json
      add :clients_id, references(:clients, type: :binary_id)
      timestamps()
    end
  
  end
end
