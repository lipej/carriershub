defmodule Carrierhub do
  alias Carrierhub.Client.Create, as: ClientCreate
  alias Carrierhub.Client.Get, as: ClientGet
  alias Carrierhub.Client.Update, as: ClientUpdate
  alias Carrierhub.Client.Delete, as: ClientDelete

  defdelegate create_client(params), to: ClientCreate, as: :call
  defdelegate get_client(params), to: ClientGet, as: :call
  defdelegate update_client(params), to: ClientUpdate, as: :call
  defdelegate delete_client(params), to: ClientDelete, as: :call

  alias Carrierhub.Integration.Create, as: IntegrationCreate
  alias Carrierhub.Integration.Get, as: IntegrationGet
  alias Carrierhub.Integration.Update, as: IntegrationUpdate
  alias Carrierhub.Integration.Delete, as: IntegrationDelete

  defdelegate create_integration(params), to: IntegrationCreate, as: :call
  defdelegate get_integration(params), to: IntegrationGet, as: :call
  defdelegate update_integration(params), to: IntegrationUpdate, as: :call
  defdelegate delete_integration(params), to: IntegrationDelete, as: :call
end
