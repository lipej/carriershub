defmodule Carrierhub.Carriers.Plugins.Transp do
  def tracking(data, fields) do
    IO.inspect(data)
    IO.inspect(fields)
    IO.inspect("performing tracking action from Transp")
  end

  def solicitation(data, fields) do
    IO.inspect(data)
    IO.inspect(fields)
    IO.inspect("performing solicitation action from Transp")
  end
end
