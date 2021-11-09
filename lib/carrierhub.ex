defmodule Carrierhub do
  alias Carrierhub.Clients.Create, as: ClientCreate
  alias Carrierhub.Clients.Get, as: ClientGet
  alias Carrierhub.Clients.Update, as: ClientUpdate
  alias Carrierhub.Clients.Delete, as: ClientDelete

  defdelegate create_client(params), to: ClientCreate, as: :call
  defdelegate get_client(params), to: ClientGet, as: :call
  defdelegate update_client(params), to: ClientUpdate, as: :call
  defdelegate delete_client(params), to: ClientDelete, as: :call

  alias Carrierhub.Integrations.Create, as: IntegrationCreate
  alias Carrierhub.Integrations.Get, as: IntegrationGet
  alias Carrierhub.Integrations.Update, as: IntegrationUpdate
  alias Carrierhub.Integrations.Delete, as: IntegrationDelete

  defdelegate create_integration(params), to: IntegrationCreate, as: :call
  defdelegate get_integration(params), to: IntegrationGet, as: :call
  defdelegate update_integration(params), to: IntegrationUpdate, as: :call
  defdelegate delete_integration(params), to: IntegrationDelete, as: :call
end
