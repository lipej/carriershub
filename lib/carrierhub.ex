defmodule Carriershub do
  alias Carriershub.Client.Create, as: ClientCreate
  alias Carriershub.Client.Get, as: ClientGet
  alias Carriershub.Client.Update, as: ClientUpdate
  alias Carriershub.Client.Delete, as: ClientDelete

  defdelegate create_client(params), to: ClientCreate, as: :call
  defdelegate get_client(params), to: ClientGet, as: :call
  defdelegate update_client(params), to: ClientUpdate, as: :call
  defdelegate delete_client(params), to: ClientDelete, as: :call

  alias Carriershub.Integration.Create, as: IntegrationCreate
  alias Carriershub.Integration.Get, as: IntegrationGet
  alias Carriershub.Integration.Update, as: IntegrationUpdate
  alias Carriershub.Integration.Delete, as: IntegrationDelete

  defdelegate create_integration(params), to: IntegrationCreate, as: :call
  defdelegate get_integration(params), to: IntegrationGet, as: :call
  defdelegate update_integration(params), to: IntegrationUpdate, as: :call
  defdelegate delete_integration(params), to: IntegrationDelete, as: :call
end
