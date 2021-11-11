defmodule Carriershub.Repo.Migrations.CreateIntegrations do
  use Ecto.Migration

  def change do
    create table(:integrations , primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :fields, :json
      add :client_id, references(:clients, [type: :binary_id, on_delete: :delete_all])
      timestamps()
    end

  end
end
