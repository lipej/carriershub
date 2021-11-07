defmodule Carrierhub.Carriers.Manager do

  def perform({:ok, module}) do
    IO.inspect(module)
  end

end