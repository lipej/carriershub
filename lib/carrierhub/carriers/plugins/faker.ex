defmodule Carrierhub.Carriers.Plugins.Faker do


  def tracking(data, fields) do
    IO.inspect("performing tracking action from Faker")
    IO.inspect({data, fields})
  end

  def solicitation(data, fields) do
    IO.inspect("performing solicitation action from Faker")
    IO.inspect({data, fields})
  end 

end