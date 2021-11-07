defmodule Carrierhub.Carriers.Plugins.Transp do
  
  def tracking(data, fields) do
    IO.inspect("performing tracking action from Transp")
    IO.inspect({data, fields})
  end

  def solicitation(data, fields) do
    IO.inspect("performing solicitation action from Transp")
    IO.inspect({data, fields})
  end 

end