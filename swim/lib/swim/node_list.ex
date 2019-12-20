defmodule Swim.NodeList do
  defstruct nodes: %{}
  
  alias Swim.NodeList
  alias Swim.Node

  def add(%Node{node_list: node_list} = node, name, pid) do
    %Node{node | node_list: add(node_list, name, pid)}
  end

  def remove(%Node{node_list: node_list} = node, name) do
    %Node{node | node_list: remove(node_list, name)}
  end

  def add(%NodeList{nodes: nodes} = list, name, node) do
    new_nodes = nodes |> Map.put(name, node)
    %NodeList{list | nodes: new_nodes }
  end

  def remove(%NodeList{nodes: nodes} = list, name) do
    new_nodes = nodes |> Map.pop(name)
    %NodeList{list | nodes: new_nodes }
  end

end
