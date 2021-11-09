defmodule Carrierhub do
  alias Carrierhub.Clients.Create, as: ClientCreate
  alias Carrierhub.Clients.Get, as: ClientGet
  alias Carrierhub.Clients.Update, as: ClientUpdate
  alias Carrierhub.Clients.Delete, as: ClientDelete

  defdelegate create_client(params), to: ClientCreate, as: :call
  defdelegate get_client(params), to: ClientGet, as: :call
  defdelegate update_client(params), to: ClientUpdate, as: :call
  defdelegate delete_client(params), to: ClientDelete, as: :call
end
