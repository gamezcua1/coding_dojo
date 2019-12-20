defmodule Swim.Node do
  alias Swim.NodeList
  alias Swim.Node
  alias Swim.Bucket
  
  defstruct node_list: %NodeList{}, pid: nil, name: ""

  @k 4     # failure detection group
  @t 5000 # protocol period of time

  def create(name), do: spawn(fn -> start(name) end)

  def start(name) do
    new_node_pid = spawn(fn -> run(%Node{pid: self(), name: name}) end)
    Bucket.created(name, new_node_pid)
    start_pinging(new_node_pid)
  end

  def start_pinging(node_pid) do
    send(node_pid, :DO_PING)
    :timer.sleep(@t)
    start_pinging(node_pid)
  end

  def run(%Node{} = node) do
    IO.inspect "🏃 #{ inspect node }"
    node =
      receive do
        :DO_PING -> do_ping(node)
        {:ACK, pid} -> IO.inspect "ACK #{pid}"
        {:PING, pid} -> ping(node, pid)
        {:NEW_NODE, name, pid} -> new_node(node, name, pid)
      end
    run(node)
  end

  def ping(node, pid) do
    send(pid, {:ACK, pid})
  end

  defp do_ping(%Node{node_list: node_list} = node) do    
    Enum.each(1..2, fn _x -> 
      with {name, pid} <- Enum.random(node_list.nodes) do
          IO.inspect "#{inspect name}"
          IO.inspect "#{inspect pid}"
      end
    end)
    
    node
  end

  defp new_node(node, name, pid) do
    NodeList.add(node, name, pid)
  end

end
