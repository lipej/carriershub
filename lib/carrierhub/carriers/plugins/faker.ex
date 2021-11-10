defmodule Carrierhub.Carriers.Plugins.Faker do
  def tracking(data, fields) do
    IO.inspect(data)
    IO.inspect(fields)
    IO.inspect("performing trackings action from Faker")
  end

  def solicitation(data, fields) do
    IO.inspect(data)
    IO.inspect(fields)
    IO.inspect("performing solicitation action from Faker")
  end
end
