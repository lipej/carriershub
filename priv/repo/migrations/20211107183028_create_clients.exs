defmodule Carrierhub.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients , primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :key, :string
      add :cnpj, :string
      timestamps()
    end

    create unique_index(:clients, [:cnpj])
  end
end
