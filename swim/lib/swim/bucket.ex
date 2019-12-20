defmodule Swim.Bucket do
  use Agent

  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def created(name, pid) do
    Agent.update(__MODULE__, & Map.put(&1, name, pid))
    notify(name, pid)
  end

  defp notify(name, pid) do
    {notify_name, node_to_notify} = Enum.random(value)
    with notify_name != name do
      send(node_to_notify, {:NEW_NODE, name, pid})
    end
  end
end
