defmodule Carriershub.Carriers.Plugins.Test do
  def tracking(data, fields) do
    IO.inspect(data)
    IO.inspect(fields)
    IO.inspect("performing trackings action from Test")
  end

  def solicitation(data, fields) do
    IO.inspect(data)
    IO.inspect(fields)
    IO.inspect("performing solicitation action from Test")
  end
end
